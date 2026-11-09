# pnpm updateConfig filter repro

An `updateConfig` hook in `.pnpmfile.mjs` sets a path filter, `./packages/app`.
pnpm resolves that path against the directory the command runs in, not against the workspace root.
The same hook selects different projects depending on `--dir` or the current directory.

## Steps

Run `./repro.sh` with pnpm 12.18.0.

```sh
pnpm -r run hello                         # prints "hello from app"
pnpm --dir packages/other -r run hello    # No projects matched the filters
cd packages/other && pnpm -r run hello    # No projects matched the filters
```

## Expected

All three commands run the `hello` script of `app` only.

The hook cannot work around this. A hook does not receive the `--dir` directory, and pnpm joins even an absolute path selector to that directory.
