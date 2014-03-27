ntk's dotfiles
==============

Years of accumulated dotfilery collected and cleaned up. I lifted a **lot** 
from [thoughtbot](https://github.com/thoughtbot/dotfiles), especially the zsh
stuff, which I only recently switched to from many years of bash.

Getting started
---------------

Set your shell to zsh:

```zsh
$ chsh -s /bin/zsh
```

Clone the repos into your home directory:

```zsh
$ git clone ...
```

Run the `dotlink` script to create symlinks to the dotfiles. If there are 
existing dotfiles, they'll be backed up first.

```zsh
$ dotfiles/dotlink
```

Resources
---------

I'm using [MacVim](https://code.google.com/p/macvim/).

- [Solarized](http://ethanschoonover.com/solarized)
- [python-mode](https://github.com/klen/python-mode) vim plugin
- [PHP QA Tools for Vim](https://github.com/joonty/vim-phpqa)
