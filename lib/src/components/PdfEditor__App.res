open PdfEditor.Types

let noop = _ => ()

let pdfWorkerUrl: string =
  "https://unpkg.com/pdfjs-dist@" ++ (PdfEditor__Reader.Pdfjs.version ++ "/es5/build/pdf.worker.js")

PdfEditor__Reader.Pdfjs.setSrc(PdfEditor__Reader.Pdfjs.globalWorker, pdfWorkerUrl)

module PropsDecoder = {
  let variableValues = json =>
    json |> Json.Decode.array(PdfEditor__Converter.Decoder.variableValue) |> Array.to_list
}

@scope("__pdfEditorData") @val external file: string = "file"
@scope("__pdfEditorData") @val external variableValues: Js.Json.t = "variableValues"

let featureToggle: FeatureToggle.t = {
  dateFormatCustomization: false,
  textColorCustomization: false,
  dropzoneBorder: false,
  pageScrolling: true,
  standardDropdownField: false,
}

module App = {
  @react.component
  let make = () => {
    let variableValues = PropsDecoder.variableValues(variableValues)

    <PdfEditor.Editor
      mode=EditorMode.MobileView
      file
      variables=list{}
      variableValues
      featureToggle
      toolbarItems=list{}
      onChange=noop
    />
  }
}

ReactDOMRe.renderToElementWithId(
  <HD.ThemeProvider> <HD.CSSPreset /> <App /> </HD.ThemeProvider>,
  "root",
)
