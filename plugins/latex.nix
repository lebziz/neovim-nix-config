{
    globals = {
        vimtex_view_method = "general";
        vimtex_view_general_viewer = "okular";
        vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex";
        vimtex_compiler_method = "latexmk";
        vimtex_compiler_latexmk = {
            options = [
                "-pdf"
                "-synctex=1"
                "-interaction=nonstopmode"
                "-file-line-error"
            ];
        };
        vimtex_compiler_continuous = 1;
        vimtex_quickfix_open_on_warning = 0;
        vimtex_syntax_conceal_disable = 1;
    };

    opts = {
        conceallevel = 0;
        concealcursor = "";
    };
}
