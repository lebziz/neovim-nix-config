{
    plugins.luasnip = {
        fromLua = [
            { paths = ../LuaSnip; }
        ];

        settings = {
            enable_autosnippets = true;
            store_selection_keys = "<C-y>";
            update_events = "TextChanged,TextChangedI";
        };
    };

    plugins.blink-cmp = {
        settings = {
            keymap = {
                preset = "default";
                "Tab" = false;
            };

            completion = {
                documentation = {
                    auto_show = true;
                    window = {
                        border = "rounded";
                    };
                };

                list = {
                    max_items = 200;
                    selection = {
                        preselect = false;
                        auto_insert = true;
                    };
                };

                menu = {
                    border = "rounded";
                    draw = {
                        columns = {
                            __raw = ''
                                {
                                    {"kind_icon", gap = 1, "kind"}, 
                                    {"label", gap = 1, "label_description"}
                                }
                            '';
                        };
                    };
                };
            };

            fuzzy = {
                implementation = "rust";
            };

            signature = {
                enabled =  true;
            };

            snippets = {
                preset = "luasnip";
            };

            sources = {
                default = [
                    "lsp"
                    "snippets"
                    "path"
                    "buffer"
                ];
            };
        };
    };
}
