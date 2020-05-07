#!/bin/sh

echo "===================================="
echo " vim syntax - fluentd Installation"
echo "===================================="

TMP_PATH=/var/tmp/fluentd-vim
VIM_RC=~/.vimrc
VIM_SYNTAX_PATH=~/.vim/syntax


command_exists() {
    command -v "$@" >/dev/null 2>&1
}

command_exists git || {
    echo "git is not installed."
    exit 1
}

git clone --mirror https://github.com/namioto/fluentd-vim.git $TMP_PATH
mkdir -p $VIM_SYNTAX_PATH
cp -v /var/tmp/fluentd-vim/syntax/fluentd.vim $VIM_SYNTAX_PATH/fluentd.vim

if ! grep -q -A1 -B1 "setfiletype fluentd" vimrc; then
    # NOT FOUNDS - setfiletype fluentd
    {
        echo "augroup filetypedetect"
        echo "     au! BufRead,BufNewFile */td-agent/*.conf,td-agent.conf setfiletype fluentd"
        echo "augroup END"
    } >> $VIM_RC
fi

echo ""
echo "Installation completed. Happy Logging!"
echo ""
