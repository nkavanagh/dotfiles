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
