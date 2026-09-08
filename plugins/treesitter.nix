{
    plugins.treesitter = {
        highlight = {
            enable = true;
            disable = {
                __raw = ''
                    function(lang, buf)
                        return lang == 'latex'
                    end
                '';
            };
        };

        settings = {
            ensure_installed = [
                "c"
                "lua"
                "vim"
                "vimdoc"
                "query"
                "markdown"
                "markdown_inline"
            ];

            auto_install = true;
        };
    };

    plugins.treesitter-textobjects = {
        settings = {
            select = {
                enable = true;
                lookahead = true;
                
                keymaps = {
                    "aa" = "@parameter.outer";
                    "ia" = "@parameter.inner";
                    "af" = "@function.outer";
                    "if" = "@function.inner";
                    "ac" = "@class.outer";
                    "ic" = "@class.inner";
                    "ai" = "@conditional.outer";
                    "ii" = "@conditional.inner";
                    "al" = "@loop.outer";
                    "il" = "@loop.inner";
                    "ak" = "@block.outer";
                    "ik" = "@block.inner";
                    "is" = "@statement.inner";
                    "as" = "@statement.outer";
                    "ad" = "@comment.outer";
                    "am" = "@call.outer";
                    "im" = "@call.inner";
                };
                
                includeSurroundingWhitespace = true;
            };
        };
    };
}
