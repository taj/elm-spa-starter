import "./assets/scss/app.scss";

var { Elm } = require("./src/Main.elm");

Elm.Main.init({
  node: document.getElementById("root")
});
