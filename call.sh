#!/usr/bin/env bash

function cmd {
    if [[ "${1}" == "reload" ]]; then
        pkg update && pkg upgrade -y
        clear
        echo "======================================================"
        echo "welcome $(whoami) im termux your Android terminal."
        echo "======================================================"
        echo " "
        echo "to reset the screen run the (cmd reload) command."
        echo "to access terminal file editor run the (nvim) command."
        echo " "
        echo "here is the list of your current files:"
        echo "======================================================"
        ls -a /storage/emulated/0/Documents/ddc_docs/codespace/
        echo "======================================================"
        echo "time of reload was: $(date +"%I:%M:%S %p")"
        cd /storage/emulated/0/Documents/ddc_docs/codespace
        
    elif [[ "${1}" == "startup" ]]; then
        pkg i neovim python nodejs git curl make clang -y
        pkg update && pkg upgrade -y 
        mkdir -p ~/.config/nvim
        cat << EOF > ~/.config/nvim/init.lua
-- number line                                        
vim.opt.number = true                                 
vim.opt.relativenumber = false

-- Word Wrapping
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.breakindent = false
              
-- clipboard
vim.opt.clipboard = "unnamedplus"

-- Indentation & tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
EOF
        cmd reload
    fi

}