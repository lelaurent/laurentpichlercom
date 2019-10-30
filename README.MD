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
- _optional_: install tailwind CSS IntelliSense for autocompleting Tailwinds css classes [Tailwind CSS IntelliSense](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss). Only works in .html and .css classes for now. I opened a github issue: [vscode-tailwindcss support for elm files](https://github.com/bradlc/vscode-tailwindcss/issues/84)
- _optional_: install tailwind docs for quick access to the docs [Tailwind Docs](https://marketplace.visualstudio.com/items?itemName=austenc.tailwind-docs)
- _optional_: install elmstatic globally if you want to generate boilerplate or use the cli directly `pnpm i -g elmstatic@latest`
- _optional_: install postcss-cli globally if you want to use the cli directly `pnpm i -g postcss-cli`

## Css and html design mockup
- We have one css file `assets/styles.css`. We use postCss which is configurated by `postcss.config.js`. Until now we use two css postprocessing plugins: (1)tailwind-css and (2) autoprefixer. (1) Is a general purpose css framework. (2) creates vendor prefixes for specific css properties, which vary in different browsers. The `assets/styles.css` gets build by the postcss-cli: `pnpx postcss assets/styles.css -o _site/styles.css`. It will create a compiled css file into the output directory directly.
- to work on the plain html mockups run `pnpm run mockup`. This will create a live-server in the mockup directory and will process the assets/styles.css in its directory. The styles.css is used in production. So it is a great sandbox to try out tailwind css and create reusable css classes / components.

## How to build for production
- pnpm run build
- release folder will be generated: `_site`
- deploy: @todo Consider ~~githubpages~~ (elmstatic does for us what githubpages does, except the 'go-live') , netlify

## Install packages
- [elm] How to install elm packages:
  - if you have the correct elm version (currently fixed 0.19.0 for this project) installed in $PATH: `elm install <author/package>`
  - if not, or you just want the project binary, then use the command to execute npm package binaries (pnpx instead of npx, since we us pnpm): `pnpx elm install <author/package>`
- [node] `pnpm i --save-dev <package>`

## Run local binary packages
- `pnpx <package>` example: `pnpx elmstatic` or `pnpx elm`

## The Elm part
- Basic usage of elmstatic: https://korban.net/elm/elmstatic/
- @todo describe how to extend the current elm application 'build-flow' and create custom pages

## Backlog
[ ] Create a landingpage for the beginning