# How to start
- install node.js and pnpm `npm i -g pnpm`
- install development dependencies `pnpm i`
- install elmstatic `pnpm -g i elmstatic@latest`
- install browser-sync for live editing `pnpm i -g browser-sync`
- run `npm start` (contains two steps:)

  1. run `elmstatic watch` in the project root directory (this command also creates an inital build into _site, see `elmstatic build` for alternative)

  2. run the following in the output directory (_site) `browser-sync start --server --files "." --no-ui  --reload-delay 500 --reload-debounce 500`

- navigate to localhost:3000
- enjoy !