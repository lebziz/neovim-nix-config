{
    globals = {
        mapleader = " ";
        maplocalleader = "\\";
    };

    opts = {
        autochdir = true;
        showmatch = true;
        ignorecase = true;
        hlsearch = true;
        incsearch = true;
        tabstop = 4;
        softtabstop = 4;
        expandtab = true;
        shiftwidth = 4;
        autoindent = true;
        mouse = "a";
        clipboard = "unnamedplus";
        swapfile = false;
        backupdir = "~/.cache/vim";
        signcolumn = "yes:1";
        updatetime = 4000;
    };

    autoCmd = [
        {
            event = [ "TextYankPost" ];
            pattern = [ "*" ];
            callback = {
                __raw = "function() vim.highlight.on_yank({higroup='IncSearch', timeout=150}) end";
            };
        }
    ];

    extraConfigVim = ''
        set path+=**
    '';
}
