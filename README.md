# homebrew-tap

Homebrew formulae for [rozdolsky33](https://github.com/rozdolsky33)'s tools.

```sh
brew install rozdolsky33/tap/cui-proxy
```

Homebrew 6+ requires you to trust a non-official tap before it loads formulae
from it. The command above trusts only `cui-proxy`. To tap first and install by
short name:

```sh
brew tap rozdolsky33/tap
brew trust --formula rozdolsky33/tap/cui-proxy    # or: brew trust rozdolsky33/tap
brew install cui-proxy
```

## Formulae

| Formula | What it is |
|---|---|
| [`cui-proxy`](https://github.com/rozdolsky33/cui-proxy) | Fail-closed local proxy that masks sensitive data in Codex CLI traffic. |

The formulae are generated from the published GitHub releases of each project
(`scripts/update-tap.sh` in that project); don't edit them by hand.
