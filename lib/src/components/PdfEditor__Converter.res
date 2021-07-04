open PdfEditor.Types
open Json

exception ExDecodeError(string)
exception ExUnknownVariableType(string)

let decodeError = (field, jsonStr) => ExDecodeError(
  "Error when decoding " ++ (field ++ (": " ++ jsonStr)),
)

let oneOf2 = (f1, f2, x) => f1(x) || f2(x)
let oneOf4 = (f1, f2, f3, f4, x) => f1(x) || (f2(x) || (f3(x) || f4(x)))

module Utils = {
  let getFileExtensionByLink = fileUrl => {
    let fileParts = fileUrl |> String.split_on_char('.')

    let rec aux = (count, ls) =>
      switch (ls, count) {
      | (list{}, _) => None
      | (list{head}, x) if x > 0 => Some(head)
      | (list{_head, ...tail}, count) => aux(count + 1, tail)
      }

    aux(0, fileParts)
  }

  let isBased64Image = (ext, fileUrl) =>
    Js.String.startsWith("data:image/" ++ (ext ++ ";base64"), fileUrl)

  let isImageUrlExtension = (ext, fileUrl) =>
    switch getFileExtensionByLink(fileUrl) {
    | None => false
    | Some(extension) => Js.String.startsWith(ext, extension)
    }

  let isPng = oneOf2(isBased64Image("png"), isImageUrlExtension("png"))

  let isJpg = oneOf4(
    isBased64Image("jpg"),
    isImageUrlExtension("jpg"),
    isBased64Image("jpeg"),
    isImageUrlExtension("jpeg"),
  )

  let getFileExtension = x =>
    switch x {
    | fileUrl if isPng(fileUrl) => Some("png")
    | fileUrl if isJpg(fileUrl) => Some("jpg")
    | _ => None
    }

  let parseFileUrl = fileUrl => {
    let extension =
      fileUrl->Some->Belt.Option.flatMap(getFileExtension)->Belt.Option.flatMap(FileType.tFromJs)
    switch extension {
    | None => raise(decodeError("fileType", fileUrl))
    | Some(ext) => (fileUrl, ext)
    }
  }
}

module Decoder: {
  let variable: Js.Json.t => Variable.t
  let variableValue: Js.Json.t => VariableValue.t
} = {
  let area = json => {
    let res: Area.t = {
      open Decode
      {
        width: json |> field("width", int),
        height: json |> field("height", int),
      }
    }
    res
  }

  let color = json => {
    let str = json |> Decode.string
    switch str |> Color.tFromJs {
    | None => raise(decodeError("color", str))
    | Some(c) => c
    }
  }

  let selectOption = json => {
    let res: SelectOption.t = {
      open Decode
      {
        value: json |> field("value", string),
        displayText: json |> field("displayText", string),
      }
    }
    res
  }

  let dateFormat = json => {
    let str = json |> Decode.string
    switch str |> DateFormat.tFromJs {
    | None => PdfEditor__Config.Settings.defaultDateFormat
    | Some(c) => c
    }
  }

  let validatedInputValue = (~isExampleInput, ~json, ~dateFormatStr) => {
    let res: ValidatedInputValue.t = {
      open Decode

      let variableType = json |> field("variable_type", string)
      let options = json |> field("options", array(selectOption))
      let value = json |> field(isExampleInput ? "example" : "value", string)
      let dateFormat = switch dateFormatStr |> DateFormat.tFromJs {
      | None => PdfEditor__Config.Settings.defaultDateFormat
      | Some(c) => c
      }

      switch variableType {
      | "Image" =>
        let (url, fileType) = Utils.parseFileUrl(value)
        ValidatedInputValue.Image({
          open Image
          {url: url, fileType: fileType}
        })
      | "Signature Pad" =>
        let (url, fileType) = Utils.parseFileUrl(value)
        ValidatedInputValue.SignaturePad({
          open Image
          {url: url, fileType: fileType}
        })
      | "Select" =>
        let lsOptions = options |> Array.to_list
        let selected: SelectOption.t =
          lsOptions |> List.find((opt: SelectOption.t) => opt.value == value)
        ValidatedInputValue.Select(selected, options |> Array.to_list)
      | "String" => ValidatedInputValue.String(value)
      | "Date" =>
        let validDateFormat = PdfEditor__Config.Settings.supportedDateFormats |> List.find(format =>
          switch PdfEditor__Utils.parseDate(format, value) |> Js.Date.toString {
          | _ => true
          | exception _e => false
          }
        )
        let validDate = PdfEditor__Utils.parseDate(validDateFormat, value)
        let validDateString = validDate |> PdfEditor__Utils.formatDate(dateFormat)

        ValidatedInputValue.Date(validDateString |> PdfEditor.Utils.parseDate(dateFormat))
      | s => ExUnknownVariableType(s) |> raise
      }
    }
    res
  }

  let unvalidatedInputValue = json => {
    let res: UnvalidatedInputValue.t = {
      open Decode

      let variableType = json |> field("variable_type", string)
      let options = json |> field("options", array(selectOption))

      switch variableType {
      | "Image" => UnvalidatedInputValue.Image(None)
      | "Signature Pad" => UnvalidatedInputValue.SignaturePad(None)
      | "Select" => UnvalidatedInputValue.Select(None, options |> Array.to_list)
      | "String" => UnvalidatedInputValue.String(None)
      | "Date" => UnvalidatedInputValue.Date(None)
      | s => ExUnknownVariableType(s) |> raise
      }
    }
    res
  }

  let variable = json => {
    let res: Variable.t = {
      open Decode
      {
        id: json |> field("id", string),
        name: json |> field("name", string),
        exampleInputValue: json |> field("example_input_value", json =>
          validatedInputValue(
            ~isExampleInput=true,
            ~json,
            ~dateFormatStr=PdfEditor__Config.Settings.defaultDateFormatStr,
          )
        ),
        placeholder: json |> field("placeholder", string),
      }
    }
    res
  }

  let location = json => {
    let res: Location.t = {
      open Decode
      {
        top: json |> field("top", int),
        left: json |> field("left", int),
        page: json |> field("page", int),
      }
    }
    res
  }

  let fontSize = json => {
    let str = json |> Decode.string
    switch str |> FontSize.tFromJs {
    | None => raise(decodeError("fontSize", str))
    | Some(c) => c
    }
  }

  let fontFamily = json => {
    let str = json |> Decode.string
    switch str |> FontFamily.tFromJs {
    | None => raise(decodeError("fontFamily", str))
    | Some(c) => c
    }
  }

  let markup = json => {
    let res: Markup.t = {
      open Decode
      {
        bold: json |> field("bold", bool),
        italic: json |> field("italic", bool),
        underline: json |> field("underline", bool),
      }
    }
    res
  }

  let formatting = json => {
    let res: Formatting.t = {
      open Decode
      {
        fontSize: json |> field("font_size", fontSize),
        fontFamily: json |> field("font_family", fontFamily),
        dateFormat: json |> field("date_format", dateFormat)->optional,
        color: json |> field("color", color),
        markup: json |> field("markup", markup),
      }
    }
    res
  }

  let inputValue = (json, formatting: Formatting.t) => {
    let dateFormatStr = switch formatting.dateFormat {
    | Some(format) => format |> DateFormat.tToJs
    | None => PdfEditor__Config.Settings.defaultDateFormatStr
    }
    switch json |> {
      open Decode
      field("value", string)->optional
    } {
    | None => unvalidatedInputValue(json)->InputValue.Unvalidated
    | Some(_) =>
      validatedInputValue(~isExampleInput=false, ~json, ~dateFormatStr)->InputValue.Validated
    }
  }

  let variableValue = json => {
    let formatting: Formatting.t = {
      open Decode
      json |> field("formatting", formatting)
    }
    let inputValue = {
      open Decode
      json |> field("input_value", json => inputValue(json, formatting))
    }
    let res: VariableValue.t = {
      open Decode
      {
        id: json |> field("id", string),
        variableId: json |> field("variable_id", string),
        variableName: json |> field("variable_name", string),
        location: json |> field("location", location),
        area: json |> field("area", area)->optional,
        formatting: formatting,
        inputValue: inputValue,
        placeholder: json |> field("placeholder", string),
      }
    }
    res
  }
}
