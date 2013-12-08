# install Pathogen (https://github.com/tpope/vim-pathogen)
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# echo "\n\" Use pathogen.vim\nexecute pathogen#infect()\n" >> ~/.vimrc

# Install vim-colors-solarized (Pathogen installation)
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git
mv vim-colors-solarized ~/.vim/bundle/
# echo "\nsyntax enable\nset background=dark\nset t_Co=16\nlet g:solarized_termcolors=16\ncolorscheme solarized\n" >> ~/.vimrc

platform='unknown'
#unamestr=`uname`
unamestr = $(uname) # better than the above line
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
#elif [[ "$unamestr" == 'FreeBSD' ]]; then
#   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='macosx'
fi

if [[ $platform == 'linux' ]]; then
    # For Linux only: Solarized colors on Gnome Terminal
    git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
    ./gnome-terminal-colors-solarized/set_dark.sh
    #./gnome-terminal-colors-solarized/set_light.sh
    rm -r gnome-terminal-colors-solarized
fi
