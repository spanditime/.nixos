{pkgs, colorscheme, lib, ...}:
{
  programs.nixvim = {

    enable = true;
    defaultEditor = true;

    # KEYMAPS
    globals.mapleader = " ";
    keymaps = [
      # ESSENTIALS
      {
        mode = "i";
        key = "kj";
        options.noremap = true;
        action = "<esc>";
      }

      # diagnostic
      {
        mode = "n";
        key = "<leader>D";
        options = {
          noremap = true;
          desc = "Telescope - diagnostics";
        };
        action = "function() require('telescope.builtin').diagnostics() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>d";
        options = {
          noremap = true;
          desc = "Show current diagnostics";
        };
        action = "function() vim.diagnostic.open_float() end";
        lua = true;
      }
      {
        mode = "v";
        key = "<leader>d";
        options = {
          noremap = true;
          desc = "Show current diagnostics";
        };
        action = "function() vim.diagnostic.open_float() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>d[";
        options = {
          silent = true;
          noremap = true;
          desc = "Diagnostic - previous";
        };
        action = "function() vim.diagnostic.goto_prev() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>d]";
        options = {
          silent = true;
          noremap = true;
          desc = "Diagnostic - next";
        };
        action = "function() vim.diagnostic.goto_next() end";
        lua = true;
      }

      # DAP - debugging
      {
        mode = "n";
        key = "<leader>b";
        options = {
          silent = true;
          noremap = true;
          desc = "DAP toggle breakpoint";
        };
        action = "function() require'dap'.toggle_breakpoint() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>B";
        options = {
          silent = true;
          noremap = true;
          desc = "DAP set breakpoint";
        };
        action = "function() require'dap'.set_breakpoint() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>lp";
        options = {
          silent = true;
          noremap = true;
          desc = "DAP log point(breakpoint with log msg)";
        };
        action = "function() require'dap'.set_breakpoint(nil,nil, vim.fn.input('Log point message: ')) end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>C";
        options = {
          silent = true;
          noremap = true;
          desc = "DAP continue or start session";
        };
        action = "function() require'dap'.continue() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>so";
        options = {
          silent = true;
          noremap = true;
          desc = "DAP step over";
        };
        action = "function() require'dap'.step_over() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>si";
        options = {
          silent = true;
          noremap = true;
          desc = "DAP step over";
        };
        action = "function() require'dap'.step_into() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>sO";
        options = {
          silent = true;
          noremap = true;
          desc = "DAP step out";
        };
        action = "function() require'dap'.step_out() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>R";
        options = {
          silent = true;
          noremap = true;
          desc = "DAP repl";
        };
        action = "function() require'dap'.repl.open() end";
        lua = true;
      }

      # LSP 

      # goto def dec impl etc.
      {
        mode = "n";
        key = "<leader>gD";
        options = {
          silent = true;
          noremap = true;
          desc = "LSP goto declaration";
        };
        action = "function() vim.lsp.buf.declaration() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>gd";
        options = {
          silent = true;
          noremap = true;
          desc = "LSP goto definition";
        };
        action = "function() vim.lsp.buf.definition() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>gtd";
        options = {
          silent = true;
          noremap = true;
          desc = "LSP goto type definition";
        };
        action = "function() vim.lsp.buf.type_definition() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>gi";
        options = {
          silent = true;
          noremap = true;
          desc = "LSP goto implementation";
        };
        action = "function() vim.lsp.buf.implementation() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>gr";
        options = {
          silent = true;
          noremap = true;
          desc = "LSP goto references";
        };
        action = "function() require('telescope.builtin').lsp_references() end";
        lua = true;
      }

      # list all declarations definitions implementations etc.
      {
        mode = "n";
        key = "<leader>fd";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - find definitions";
        };
        action = "function() require('telescope.builtin').lsp_definitions() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>ftd";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - find type definitions";
        };
        action = "function() require('telescope.builtin').lsp_type_definitions() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>fD";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - find declarations";
        };
        action = "function() require('telescope.builtin').lsp_declarations() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>fi";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - find declarations";
        };
        action = "function() require('telescope.builtin').lsp_implementations() end";
        lua = true;
      }


      # signature help
      {
        mode = "n";
        key = "<leader>k";
        options = {
          silent = true;
          noremap = true;
          desc = "LSP signature help";
        };
        action = "function() vim.lsp.buf.signature_help() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>K";
        options = {
          silent = true;
          noremap = true;
          desc = "LSP hover";
        };
        action = "function() vim.lsp.buf.hover() end";
        lua = true;
      }

      # code action
      {
        mode = "n";
        key = "<leader>c";
        options = {
          silent = true;
          noremap = true;
          desc = "LSP code action";
        };
        action = "function() vim.lsp.buf.code_action() end";
        lua = true;
      }
      {
        mode = "v";
        key = "<leader>c";
        options = {
          silent = true;
          noremap = true;
          desc = "LSP code actions";
        };
        action = "function() vim.lsp.buf.range_code_action() end";
        lua = true;
      }

      #format 
      {
        mode = "n";
        key = "<leader>=";
        options = {
          silent = true;
          noremap = true;
          desc = "LSP code actions";
        };
        action = "function() vim.lsp.buf.format({ async = true }) end";
        lua = true;
      }
      {
        mode = "v";
        key = "<leader>=";
        options = {
          silent = true;
          noremap = true;
          desc = "LSP code actions";
        };
        action = "function() vim.lsp.buf.format({ async = true }) end";
        lua = true;
      }

      #workspaces
      {
        mode = "n";
        key = "<leader>wa";
        options = {
          silent = true;
          noremap = true;
          desc = "LSP add workspace folder";
        };
        action = "function() vim.lsp.buf.add_workspace_folder() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>wr";
        options = {
          silent = true;
          noremap = true;
          desc = "LSP remove workspace folder";
        };
        action = "function() vim.lsp.buf.remove_workspace_folder() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>rn";
        options = {
          silent = true;
          noremap = true;
          desc = "LSP ";
        };
        action = "function() vim.lsp.buf.rename() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>wl";
        options = {
          noremap = true;
          desc = "LSP list workspaces";
        };
        action = "function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end";
        lua = true;
      }

      # LSP END


      # REFACTORING HELPERS
      {
        mode = "n";
        key = "<C-j>";
        options = {
          noremap = true;
          silent = true;
          desc = "Remove empty line below";
        };
        action = "m`:silent +g/\m^\s*$/d<CR>``:noh<CR>";
      }
      {
        mode = "n";
        key = "<C-k>";
        options = {
          noremap = true;
          silent = true;
          desc = "Remove empty line above";
        };
        action = "m`:silent -g/\m^\s*$/d<CR>``:noh<CR>";
      }
      {
        mode = "n";
        key = "<A-j>";
        options = {
          noremap = true;
          silent = true;
          desc = "Insert empty line below";
        };
        action = ":set paste<CR>m`o<Esc>``:set nopaste<CR>";
      }
      {
        mode = "n";
        key = "<A-k>";
        options = {
          noremap = true;
          silent = true;
          desc = "Insert empty line above";
        };
        action = ":set paste<CR>m`O<Esc>``:set nopaste<CR>";
      }

      # EXPLORE AND FIND
      {
        mode = "n";
        key = "<leader>e";
        options = {
          noremap = true;
          desc = "Explore files in vifm";
        };
        action = "<cmd>Vifm<CR>";
      }
      {
        mode = "n";
        key = "<leader>F";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - resume";
        };
        action = "function() require('telescope.builtin').resume() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>ff";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - find in current buffer";
        };
        action = "function() require('telescope.builtin').current_buffer_fuzzy_find() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>ft";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - find in treesitter";
        };
        action = "function() require('telescope.builtin').treesitter() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>fe";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - find in files";
        };
        action = "function() require('telescope.builtin').find_files() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>fg";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - find in files live grep";
        };
        action = "function() require('telescope.builtin').live_grep() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>fb";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - find in buffers";
        };
        action = ":lua require('telescope.builtin').buffers()<CR><ESC>";
      }
      {
        mode = "n";
        key = "<leader>fm";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - find in marks";
        };
        action = ":lua require('telescope.builtin').marks()<CR><ESC>";
      }
      {
        mode = "n";
        key = "<leader>fs";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - find in snippets";
        };
        action = "function() reqiure('telescope').extensions.luasnip.luasnip{} end";
      }

      # help
      {
        mode = "n";
        key = "<leader>fH";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - find in help tags";
        };
        action = "function() require('telescope.builtin').help_tags() end";
        lua = true;
        
      }
      {
        mode = "n";
        key = "<leader>fhh";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - find in highlight groups";
        };
        action = "function() require('telescope.builtin').highlights() end";
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>fhk";
        options = {
          silent = true;
          noremap = true;
          desc = "Telescope - find in keymaps";
        };
        action = "function() require('telescope.builtin').keymaps() end";
        lua = true;
      }

      # disable hlsearch
      {
        mode = "n";
        key = "<leader>/";
        options = {
          silent = true;
          noremap = true;
          desc = "reset hl search";
        };
        action = "<cmd>nohlsearch<cr>";
      }

    ];

    plugins = {
      project-nvim={
        enable = true;
        enableTelescope = true;
      };

      dap = {
        enable = true;
        adapters = {
          servers = {
            delve = {
              host = "127.0.0.1";
              port = "\${port}";

              executable = {
                command = lib.getExe pkgs.delve;
                args = [ "dap" "-l" "127.0.0.1:\${port}" "--log" "--log-output=dap" ];
              };
            };
          };
        };

        configurations = {
          go = [
            {
              name = "delve";
              type = "delve";
              request = "launch";
              program = "\${file}";
            }
          ];
        };
        luaConfig.post = ''
          local dap, dapui = require("dap"), require("dapui")
          dap.listeners.before.attach.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.launch.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
          end
          dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
          end
          '';
      };
      dap-go.enable = true;
      dap-ui.enable = true;

      # symbols and strucure 
      lsp = {
        enable = true;
        capabilities = ''
          require('cmp_nvim_lsp').default_capabilities()
        '';
        enabledServers= [
          {
            name = "openscad_lsp";
            extraOptions = {

            };
          }
        ];
        servers = {
          # golang
          gopls.enable = true;
          templ.enable = true;
          # c/c++
          clangd.enable = true;
          cmake.enable = true;
          # zig
          zls.enable = true;
          # scala 
          metals.enable = true;

          # other langs
          lua_ls.enable = true;
          sqls.enable = true;
          nixd.enable = true;

          # front-end
          cssls.enable = true;
          htmx.enable = true;
          ts_ls.enable = true;
          html.enable = true;

          # supplementary
          marksman.enable = true;
          jsonls.enable = true;
        };
      };
      lsp-signature ={
        enable = true;
      };
      treesitter = {
        enable = true;
        settings = {
          indent.enable = true;
          folding = true;
          nixvimInjections = true;
          incrementalSelection.enable = true;
        };
      };
      treesitter-context = {
        enable = true;
      };
      

      # extra motions and commands for code editing 
      comment = {
        enable = true;
      };
      treesitter-refactor = {
        enable = true;
      };
      

      # navigation
      telescope = {
        enable = true;
        extensions = {
          fzf-native = {
            enable = true;
            settings = {
              case_mode = "smart_case";
              fuzzy = true;
            };
          };
        };
      };

      # completitions and snippets
      cmp = 
      let
        mapping = {
          "<C-h>" = "cmp.mapping(cmp.mapping.abort(), {'i','s','c'})";
          "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i','s','c'})";
          "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i','s','c'})";
          "<C-l>" = "cmp.mapping(cmp.mapping.confirm({ select = true }), {'i','s','c'})";
        };
        snippet = {
          expand = ''
            function(args) require('luasnip').lsp_expand(args.body) end
          '';
        };
      in {
        enable = true;
        settings = {
          inherit mapping;
          inherit snippet;
          sources = [
            # {
            #   name = "cmp_tabnine";
            # }
            {
              name = "cmp_dap";
            }
            {
              name = "nvim_lsp";
            }
            {
              name = "path";
            }
            {
              name = "buffer";
            }
            {
              name = "luasnip";
            }
          ];
        };
        cmdline = 
        let
          search_settings = {
            inherit mapping;
            inherit snippet;
            sources = [ 
                  { name = "buffer"; }
                  { name = "path"; }
                ];
          };
        in{
          "/" = search_settings;
          "?" = search_settings;
          ":" = {
          inherit mapping;
            sources = [ { name = "buffer";} { name = "path";} { name = "cmdline";} ];
            option = { igonre_cmds = [ "Man" "!" ];};
          };
        };
      };
      # cmp-tabnine.enable = true;
      cmp-dap.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp_luasnip.enable = true;
      luasnip = {
        enable = true;
        fromVscode = [
          {
            lazyLoad = true;
            paths = ../assets/snippets;
          }
        ];
      };

      # visuals and gui
      lualine = {
        enable = true;
      };
      indent-blankline = {
        enable = true;
        settings = {
          indent = {
            char = "¦";
          };
          scope = {
            enabled = true;
            injected_languages = true;
            show_start = true;
          };
        };
      };
      rainbow-delimiters = {
        enable = true;
      };
      gitsigns = {
        enable = true;
        settings = {
          current_line_blame = true;
          linehl = false;
          numhl = true;
        };
      };
      nvim-ufo = {
        enable = true;
      };
      markview = {
        enable = true;
        settings = {
          mode = ["n" "no" "x"];
          hybrid_modes = ["r" "i"];
        };
      };
      web-devicons = {
        enable = true;
      };

    };

    autoCmd = [
      {
        event = ["BufEnter"];
        pattern = [".scad"];
        command = "set commentstring=\"// %s\"";
      }
    ];

    extraPlugins = (with pkgs.vimPlugins; [
      # extra commands and functions for code editing
      nvim-surround

      # navigation 
      vifm-vim
      
      # gui - visuals
    ]) ++ (let
      telescope-luasnip = pkgs.vimUtils.buildVimPlugin {
        name = "telescope-luasnip";
        src = pkgs.fetchFromGitHub {
          owner = "benfowler";
          repo = "telescope-luasnip.nvim";
          rev = "2ef7da3a363890686dbaad18ddbf59177cfe4f78";
          hash = "sha256-oilJP2HG4Q0bgy98Iavjq2xQiD9hxpCCbMqZ43GY2s8=";
        };
      };
    in
    [
      # tabnine-nvim
      telescope-luasnip
    ]);

    extraConfigLua = ''
      require('telescope').load_extension('luasnip');

      require("nvim-surround").setup({
      })
    '';

    opts = {
      list = true;
      listchars = "space:⋅,eol:↴,tab:¦⋅›";

      hlsearch = true;

      tabstop=2;
      shiftwidth=2;
      expandtab=true;
      autoindent = true;

      number=true;
      relativenumber=true;
      cursorline=true;
      cc="80,120";
      scrolloff=10;

      # for ufo - do not change
      foldcolumn="1";
      foldlevel=99;
      foldlevelstart=99;
      foldenable = true;
    };
    colorschemes.base16 = {
      enable = true;
      settings = {
      };
      colorscheme = with colorscheme; {
        inherit base00 base01 base02 base03 base04 base05 base06 base07;
        inherit base08 base09 base0A base0B base0C base0D base0E base0F;
      };
    };
  };
}
