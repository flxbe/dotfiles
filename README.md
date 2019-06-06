# Dotfiles

## Structure

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME` when running `script/bootstrap`.

## Installation

```bash
cd ~/repositories
git clone https://github.com/flxbe/dotfiles
cd dotfiles
./script/bootsrap
./script/install
```

## Installed Utilities

- `todo <filename>`: Create an empty file on the desktop.
- `initmacos`: Initialize MacOS.
