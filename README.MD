# How to start
- install node.js and pnpm `npm i -g pnpm`
- install development dependencies `pnpm i`
- run `npm start`
- navigate to localhost:8080
- enjoy !

## Advanced setup
- [important] install this vscode extension for elm: [elm-ls-vscode](https://marketplace.visualstudio.com/items?itemName=Elmtooling.elm-ls-vscode) (the one supported by the elm community), the other elm extensions seems to loose support
- [important] create a vscode workspace and set the following in the *.code-workspace file:
```
"settings": {
		"elm.compiler": "node_modules/.bin/elm",
	}
```
- install postcss language support extension for vscode when working with css files. This is because this repository works with postcss syntax, which is not supported out of the box my vscode
- [optional] install elmstatic globally if you want to generate boilerplate or use the cli directly `pnpm i -g elmstatic@latest`
- [optional] install postcss-cli globally if you want to use the cli directly `pnpm i -g postcss-cli`

## Install packages
- [elm] How to install elm packages:
  - if you have the correct elm version installed in $PATH: `elm install <author/package>`
  - if not, or you just want the project binary, then use the command to execute npm package binaries (pnpx instead of npx, snce we us pnpm): `pnpx elm install <author/package>`