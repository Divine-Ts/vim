#!/bin/bash
set -e

self_path=$(realpath "${BASH_SOURCE[0]}")
proj_dir=$(dirname "$self_path")

opt_force=n
opt_group='all'

die() {
    echo "$@"
    exit 255
}

init() {
    [[ $opt_force == y ]] && rm -rf ~/.{bashrc,bash_profile}

    [[ ! -e ~/.bash_profile ]] && cp "$proj_dir/assets/profile" ~/.bash_profile
    [[ ! -e ~/.bashrc ]] && cp "$proj_dir/assets/bashrc" ~/.bashrc
}

install_osh() {
    [[ $opt_force == y ]] && rm -rf ~/.oh-my-zsh ~/.zprofile ~/.zshrc
    [[ -e ~/.oh-my-zsh ]] && return

    git clone https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

    echo '.     ~/.bash_profile' >> ~/.zprofile
    echo '.     ~/.bashrc' >> ~/.zshrc
}

install_nvim() {
    [[ $opt_force == y ]] && rm -rf ~/.config/nvim ~/.local/bin/vim
    [[ -e ~/.local/bin/vim ]] && return

	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod u+x nvim.appimage
	./nvim.appimage --appimage-extract
	sudo mv squashfs-root /
	sudo ln -s /squashfs-root/AppRun /usr/bin/vim

    mkdir -p ~/.config ~/.local/bin
    ln -sf -T "$proj_dir/nvim" ~/.config/nvim
    ln -sf -T "$(which nvim)" ~/.local/bin/vim
}

install_ranger() {
    [[ $opt_force == y ]] && rm -rf ~/.config/ranger ~/.local/bin/ra
    [[ -e ~/.local/bin/ra ]] && return

    mkdir -p ~/.config ~/.local/bin
    ln -sf -T "$proj_dir"/ranger ~/.config/ranger
    ln -sf -T "$(which ranger)" ~/.local/bin/ra
}

install_bspwm() {
    if [[ $opt_force == y ]]; then
        for f in "$proj_dir"/bspwm/*; do
            rm -rf "$HOME/.config/$(basename "$f")"
        done
    fi
    [[ -e ~/.config/bspwm ]] && return

    for f in "$proj_dir"/bspwm/*; do
        ln -sf -T "$f" "$HOME/.config/$(basename "$f")"
    done
}

install_cmake() {
    [[ $opt_force == y ]] && rm -rf ~/.software/cmake-3.26.5-linux-x86_64 && sed -i -E '/add_local.*cmake/d' ~/.bashrc
    [[ -e ~/.software/cmake-3.26.5-linux-x86_64 ]] && return

    mkdir -p ~/.software
    wget -O - https://github.com/Kitware/CMake/releases/download/v3.26.5/cmake-3.26.5-linux-x86_64.tar.gz \
        | tar -C ~/.software -xz
    echo 'add_local "$HOME/.software/cmake-3.26.5-linux-x86_64"' >> ~/.bashrc

}

install_nodejs() {
    [[ $opt_force == y ]] && rm -rf ~/.software/node-v18.17.0-linux-x64 && sed -i -E '/add_local.*node/d' ~/.bashrc
    [[ -e ~/.software/node-v18.17.0-linux-x64 ]] && return

    mkdir -p ~/.software
    wget -O - https://nodejs.org/dist/v18.17.0/node-v18.17.0-linux-x64.tar.xz \
        | tar -C ~/.software -xJ
    echo 'add_local "$HOME/.software/node-v18.17.0-linux-x64"' >> ~/.bashrc
}

install_obsidian() {
    [[ $opt_force == y ]] && rm -rf ~/.local/bin/obsidian{,.config}
    [[ -e ~/.local/bin/obsidian ]] && return

    wget -O ~/.local/bin/obsidian https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.7/Obsidian-1.3.7.AppImage
    chmod +x ~/.local/bin/obsidian
    mkdir -p ~/.local/bin/obsidian.config
}

while getopts 'f' name; do
    case $name in
        f)  opt_force=y;;
        ?)  die "undefine flag: $name";
    esac
done
shift $((OPTIND - 1))

(( $# > 0 )) && opt_group="$*"
[[ $opt_group == "all" ]] && opt_group="init install_osh install_nvim install_ranger install_bspwm install_obsidian install_cmake install_nodejs"

for t in $opt_group; do
    $t
done


sudo apt install clangd