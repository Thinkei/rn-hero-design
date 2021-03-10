module App = {
  [@react.component]
  let make = () => <h1> "Hello"->React.string </h1>;
};

ReactDOMRe.renderToElementWithId(
  <HD.ThemeProvider> <HD.CSSPreset /> <App /> </HD.ThemeProvider>,
  "root",
);
