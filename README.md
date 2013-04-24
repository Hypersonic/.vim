Josh's vimrc
------------

Just my vimrc, doesn't have much (by intention, my old one was HUUUUUUGE, so I needed to fix that).

Plugins
-------
- [Pathogen](https://github.com/tpope/vim-pathogen) (for loading plugins)
- [NerdCommenter](https://github.com/scrooloose/nerdcommenter)

Colorschemes
------------
- evening.vim, with a few tweaks (set to default in vimrc)
- smyck.vim

Curious things
--------------
- I've gotten into the odd habit of coding on an ssh'd iPad, but the keyboard doesn't have an escape key. I mapped `'''` to `<esc>` to compensate.
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

2. Source the repo from a `.vimrc` in your $HOME dir
> echo "source ~/.vim/vimrc" > ~/.vimrc

3. Get the plugins as submodules
> git submodule init --update

4. Enjoy
