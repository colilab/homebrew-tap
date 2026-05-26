# colilab/homebrew-tap

Homebrew tap for [colilab](https://github.com/colilab) applications.

## Install

```bash
brew install --cask colilab/tap/hostflow
```

…or, equivalently:

```bash
brew tap colilab/tap
brew install --cask hostflow
```

## Available casks

| Cask | Description |
| ---- | ----------- |
| [`hostflow`](./Casks/hostflow.rb) | macOS app to manage `/etc/hosts` entries via toggleable profiles. Source: [colilab/hosts-flow](https://github.com/colilab/hosts-flow) |

## Why a custom tap?

Host Flow ships with an ad-hoc code signature (no Apple Developer Team ID) and is **not notarized**, by design — its privileged helper relies on a binary-hash manifest that Apple's notarization service would invalidate. The official `homebrew/cask` tap rejects unsigned/un-notarized apps, so distribution goes through this dedicated tap.

Updates after the first install are delivered in-app via Sparkle (`auto_updates true` on the cask).
