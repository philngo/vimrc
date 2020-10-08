This is my .vimrc
-----------------

Features:

- `;` maps to `:`
- `,tw` deletes trailing whitespace
- `<C-p>` does fuzzy search for files
- `gcc` comments/uncomments a line of code
- `<tab>` does code completion
- `,v` opens your vim settings, `,sv` sources them
- JS and python files are autoformatted with opinionated formatters (prettier, black)

## Installation

To install, make sure you get gmarik's Vundle, then run the following commands.

    git clone git@github.com:philngo/vimrc.git
    cp vimrc/.vimrc ~
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall

You may also want to get the corresponding solarized theme for your terminal.

### Recommended usage

I recommend opening vim with the raw `vim` command, then using `<C-p>` to open files
from there into new buffers. This will get you in the habit of always opening files
with fuzzy search instead of hopping around between directories and trying to remember
the exact names of files.

Make sure to customize the Ctrl-P wildcard ignores to suit your own usage, and add and
subtract plugins of your own.
