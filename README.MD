# How to start
- install node.js and pnpm `npm i -g pnpm`
- install development dependencies `pnpm i`
- run `pnpm start`
- navigate to localhost:8080
- enjoy !

## Advanced setup
- [important] install this vscode extension for elm: [elm-ls-vscode](https://marketplace.visualstudio.com/items?itemName=Elmtooling.elm-ls-vscode) (the one supported by the elm community), the other elm extensions seems to loose support. If you have any other elm language support Extension, you should uninstall it because they interfere.
- [important] create a vscode workspace and set the following in the *.code-workspace file:
```
"settings": {
		"elm.compiler": "node_modules/.bin/elm",
	}
```
- _optional_: install postcss language support extension for vscode when working with css files. This is because this repository works with postcss syntax, which is not supported out of the box by vscode
- _optional_: install tailwind CSS IntelliSense for autocompleting Tailwinds css classes [Tailwind CSS IntelliSense](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss)
- _optional_: install tailwind docs for quick access to the docs [Tailwind Docs](https://marketplace.visualstudio.com/items?itemName=austenc.tailwind-docs)
- _optional_: install elmstatic globally if you want to generate boilerplate or use the cli directly `pnpm i -g elmstatic@latest`
- _optional_: install postcss-cli globally if you want to use the cli directly `pnpm i -g postcss-cli`

## How to build for production
- pnpm run build
- release folder is generated: `_site`
- deploy: @todo Consider githubpages, netlify

## Install packages
- [elm] How to install elm packages:
  - if you have the correct elm version (currently fixed 0.19.0 for this project) installed in $PATH: `elm install <author/package>`
  - if not, or you just want the project binary, then use the command to execute npm package binaries (pnpx instead of npx, since we us pnpm): `pnpx elm install <author/package>`
- [node] `pnpm i --save-dev <package>`

## Run local binary packages
- `pnpx <package>` example: `pnpx elmstatic` or `pnpx elm`