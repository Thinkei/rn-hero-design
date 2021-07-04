@module("./pdfEditorApp") external pdfEditorApp: string = "default"

let noop = _ => ()

@react.component
let make = (~file: string, ~variableValues: Js.Json.t) => {
  let html = React.useMemo0(() => {
    let variableValues = variableValues->Json.stringify

    j`
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="utf-8">
          <meta name="viewport" content="width=656">
          <style>
            body {
              margin: 0;
            }
          </style>
        </head>
        <body>
          <div id="root"></div>
          <script>
            window.__pdfEditorData = {
              file: "$file",
              variableValues: $variableValues,
            };
            $pdfEditorApp
          </script>
        </body>
      </html>
      `
  })

  <RNWebView
    originWhitelist=["*"]
    source={RNWebView.Source.html(~html, ())}
    onMessage=noop
    scrollEnabled=true
    allowUniversalAccessFromFileURLs=true
  />
}

let default = make
