Josh's vimrc
------------

Just my vimrc, I try to keep it relatively lightweight.

Plugins
-------
- [Pathogen](https://github.com/tpope/vim-pathogen) (for loading plugins)
- [NerdCommenter](https://github.com/scrooloose/nerdcommenter)
- [Fugitive](https://github.com/tpope/vim-fugitive)
- [SuperTab](https://github.com/ervandew/supertab)

Colorschemes
------------
- evening.vim, with a few tweaks (default)
- [smyck.vim](http://color.smyck.org/)

Additional Syntax Files
-----------------------
- [javascript](https://github.com/jelera/vim-javascript-syntax)

Curious things
--------------
- I've mapped `shift+[h/j/k/l]` to `[home/pgdown/pgup/end]`, since I find it useful.

Using
-----
- Feel free to use this, if you like it, I'd love some feedback!

Setup
-----
Of course, you need to set it up.
Do these things:

1. Clone the repo
> git clone git@github.com:hypersonic/.vim.git ~/.vim

2. Source the repo from a `.vimrc` in your `$HOME` dir
> echo "source ~/.vim/vimrc" > ~/.vimrc

3. Get the plugins as submodules
> cd ~/.vim
> git submodule update --init

4. Enjoy
