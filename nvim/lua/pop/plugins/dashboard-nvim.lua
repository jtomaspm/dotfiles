return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            -- config
            theme = 'doom',
            config = {
                header = {
                    [[]],
                    [[]],
                    [[]],
                    [[⡆⣐⢕⢕⢕⢕⢕⢕⢕⢕⠅⢗⢕⢕⢕⢕⢕⢕⢕⠕⠕⢕⢕⢕⢕⢕⢕⢕⢕⢕]],
                    [[⢐⢕⢕⢕⢕⢕⣕⢕⢕⠕⠁⢕⢕⢕⢕⢕⢕⢕⢕⠅⡄⢕⢕⢕⢕⢕⢕⢕⢕⢕]],
                    [[⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕]],
                    [[⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕]],
                    [[⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑]],
                    [[⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐]],
                    [[⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐]],
                    [[⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔]],
                    [[⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕]],
                    [[⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕]],
                    [[⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕]],
                    [[⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕]],
                    [[⣆⢕⠄⢱⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢁⢕⢕⠕⢁]],
                    [[⣿⣦⡀⣿⣿⣷⣶⣬⣍⣛⣛⣛⡛⠿⠿⠿⠛⠛⢛⣛⣉⣭⣤⣂⢜⠕⢑⣡⣴⣿]],
                    [[]],
                    [[  _   _   U _____ u U  ___ u__     __             __  __   ]],
                    [[ | \ |"|  \| ___"|/  \/"_ \/\ \   /"/u  ___     U|' \/ '|u ]],
                    [[<|  \| |>  |  _|"    | | | | \ \ / //  |_"_|    \| |\/| |/ ]],
                    [[U| |\  |u  | |___.-,_| |_| | /\ V /_,-. | |      | |  | |  ]],
                    [[ |_| \_|   |_____|\_)-\___/ U  \_/-(_/U/| |\u    |_|  |_|  ]],
                    [[ ||   \\,-.<<   >>     \\     //   .-,_|___|_,-.<<,-,,-.   ]],
                    [[ (_")  (_/(__) (__)   (__)   (__)   \_)-' '-(_/  (./  \.)  ]],
                    [[]],
                    [[]],
                    [[]],
                }, --your header
                center = {
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'Find File           ',
                        desc_hl = 'String',
                        key = 'f',
                        keymap = 'SPC ff',
                        key_hl = 'Number',
                        action = 'Telescope find_files'
                    },
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'Harpoon             ',
                        desc_hl = 'String',
                        key = 'e',
                        keymap = 'CTRL e',
                        key_hl = 'Number',
                        action = 'lua require("harpoon.ui").toggle_quick_menu()'
                    },
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'Explorer            ',
                        desc_hl = 'String',
                        key = 't',
                        keymap = 'SPC e',
                        key_hl = 'Number',
                        action = 'NvimTreeToggle'
                    },
                },
                footer = {
                    [[]],
                    [[]],
                    [[]],
                    [[]],
                    [[Config by PopAndBoom ]]
                }  --your footer
            }
        }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
