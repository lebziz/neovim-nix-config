{ pkgs, ... }:
{
    imports = [
        ./basic.nix

        # Plugins
        ./plugins/completion.nix
        ./plugins/indent.nix
        ./plugins/latex.nix
        ./plugins/lualine.nix
        ./plugins/nvim-autopairs.nix
        ./plugins/telescope.nix
        ./plugins/treesitter.nix
        ./plugins/typst.nix

        # LSP Plugins
        ./plugins/lsp/basedpyright.nix
        ./plugins/lsp/clangd.nix
        ./plugins/lsp/fortls.nix
        ./plugins/lsp/lua_ls.nix
        ./plugins/lsp/rust_analyzer.nix
        ./plugins/lsp/texlab.nix
        ./plugins/lsp/tinymist.nix
        ./plugins/lsp/ts_ls.nix
    ];

    opts = {
        number = true;
        relativenumber = true;
        statuscolumn = "%s%=%{v:virtnum > 0 ? '' : v:lnum} %{v:virtnum > 0 ? '' : v:relnum} ";
    };

    globals = {
        indentLine_setConceal = 0;
    };

    plugins = {
        luasnip.enable = true;
        blink-cmp.enable = true;
        vimtex.enable = true;
        lualine.enable = true;
        nvim-autopairs.enable = true;
        telescope.enable = true;
        treesitter.enable = true;
        treesitter-textobjects.enable = true;
        typst-vim.enable = true;

        lsp = {
            enable = true;
            servers = {
                lua_ls.enable = true;
                clangd.enable = true;
                texlab.enable = true;
                tinymist.enable = true;
                basedpyright.enable = true;
                rust_analyzer.enable = true;
                fortls.enable = true;
                ts_ls.enable = true;
                html.enable = true;
                cssls.enable = true;
                jsonls.enable = true;
            };
        };
    };

    extraPlugins = [
        pkgs.vimPlugins.indentLine
    ];

    autoCmd = [
        # Inverse selection from PDF in tex files
        {
            event = [ "FileType" ];
            pattern = [ "tex" ];
            callback = {
                __raw = ''
                    function()
                        local project = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                        local socket = "/tmp/nvim-" .. project .. "-" .. vim.fn.getpid()
                        if vim.v.servername == "" then
                            vim.fn.serverstart(socket)
                            print("Neovim server started at: " .. socket)
                        end
                        vim.g.vimtex_nvr_socket = vim.v.servername ~= "" and vim.v.servername or socket
                        vim.keymap.set("n", "<C-l>", "<cmd>VimtexCompile<CR>", { buffer = true, silent = true })
                        vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { buffer = true, silent = true })
                    end
                '';
            };
        }

        # Preamble of my tex files - inserts at the top when new file is opened (that does't exist)
        {
            event = [ "BufNewFile" ];
            pattern = [ "*.tex" ];
            command = "0r $HOME/Templates/Latex_preamble.txt";
        }
    ];

    diagnostic.settings = {
        virtual_text = false;
        signs = {
            text = {
                __raw = ''
                    {
                        [vim.diagnostic.severity.ERROR] = "❤",
                        [vim.diagnostic.severity.WARN]  = "",
                        [vim.diagnostic.severity.INFO]  = "",
                        [vim.diagnostic.severity.HINT]  = "",
                    }
                '';
            };
        };
        update_in_insert = true;
        underline = true;
        severity_sort = false;
        float = {
            border = "rounded";
            source = "always";
            header = "";
            prefix = "";
        };
    };

    keymaps = [
        # Toggle diagnostic window 
        {
            mode = [ "n" "v" "i" ];
            key = "<c-d>";
            action = {
                __raw = ''
                    function()
                        local found_float = false
                        for _, win in ipairs(vim.api.nvim_list_wins()) do
                            if vim.api.nvim_win_get_config(win).relative ~= "" then
                                vim.api.nvim_win_close(win, true)
                                found_float = true
                            end
                        end

                        if found_float then
                            return
                        end

                        vim.diagnostic.open_float(nil, { focusable = false })
                        end, { desc = 'Toggle Diagnostics' }
                '';
            };
        }
    ];

    colorschemes.nightfox = {
        enable = true;
        flavor = "carbonfox";
    };
}
