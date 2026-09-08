{
    plugins.lsp.servers.texlab = {
        rootMarkers = [
            "main.tex"
            ".git"
            "latexmkrc"
            ".latexmkrc"
            "index.tex"
        ];

        settings = {
            texlab = {
                build = {
                    onSave = true;
                };
                chktex = {
                    onOpenAndSave = true;
                };
            };
        };
    };
}
