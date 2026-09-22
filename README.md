# Home Server Project Homebrew Tap

Homebrew formulae maintained by the [Home Server Project](https://github.com/home-server-project).

## Available formulae

### nm-hsp

[NetworkManager-HSP](https://github.com/home-server-project/nm-hsp) is a modern-friendly, keyboard-driven terminal interface for ordinary Ethernet and Wi-Fi configuration on NetworkManager-based Linux systems.

The formula builds the official `nm-hsp v0.1.0` release from source. It is Linux-only and requires NetworkManager to be installed and running on the host.

## Stable installation

After a formula has been validated on `testing` and promoted to `main`, install it with:

```bash
brew install home-server-project/tap/nm-hsp
```

## Testing branch

Development and validation happen on the `testing` branch before promotion to `main`.

To test the current formula before it is merged:

```bash
brew tap home-server-project/tap
git -C "$(brew --repo home-server-project/tap)" fetch origin testing
git -C "$(brew --repo home-server-project/tap)" switch testing
brew install --build-from-source home-server-project/tap/nm-hsp
```

Then verify the Homebrew installation:

```bash
brew info home-server-project/tap/nm-hsp
brew test home-server-project/tap/nm-hsp
command -v nm-hsp
nm-hsp
```

To return the local tap to the public `main` branch later:

```bash
git -C "$(brew --repo home-server-project/tap)" switch main
git -C "$(brew --repo home-server-project/tap)" pull --ff-only
```

## Runtime model

Homebrew installs the `nm-hsp` binary only. NetworkManager remains a host operating-system service; the formula does not replace or manage NetworkManager.

`nm-hsp` communicates directly with NetworkManager through the system D-Bus API and does not require `nmcli`.

## Development policy

Changes are developed and tested on `testing`. Promotion to `main` happens through a reviewed pull request after CI and real-host testing pass.

## License

This tap is licensed under the Apache License 2.0. Individual formulae retain their upstream licenses.
