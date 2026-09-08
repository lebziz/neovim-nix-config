{
    plugins.nvim-autopairs = {
        settings = {
            event = "InsertEnter";
            config = true;
            options = {
                disable_filetype = [ "tex" ];
            };
        };
    };
}
