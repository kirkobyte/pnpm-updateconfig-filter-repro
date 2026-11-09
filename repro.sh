#!/bin/sh
set -x
pnpm --version
# Works: the hook's filter selects "app".
pnpm -r run hello
# Fails: the same filter now selects nothing.
pnpm --dir packages/other -r run hello
(cd packages/other && pnpm -r run hello)
