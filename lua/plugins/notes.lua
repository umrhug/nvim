return {
  "local/notes",
  dir = vim.fn.stdpath("config") .. "/lua/plugins",
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    { "<leader>no", "<cmd>NotesOpen<cr>", desc = "Open note" },
    { "<leader>ns", "<cmd>NotesSearch<cr>", desc = "Search past notes" },
    { "<leader>ng", "<cmd>NotesGrep<cr>", desc = "Grep text in notes" }, -- 🌟 新規追加
  },
  config = function()
    vim.opt.fileencoding = "utf-8"
    vim.opt.fileencodings = "utf-8,cp932,euc-jp"
    ----------------------------------------------------
    -- 1. ノートを開くコマンド (:OpenNotes)
    ----------------------------------------------------
    vim.api.nvim_create_user_command('NotesOpen', function()
      local base_dir = vim.fn.expand('~/.notes')
      local sub_dir = os.date('%Y/%m')
      local target_dir = base_dir .. '/' .. sub_dir

      local filename = os.date('%Y%m%d.md')
      local filepath = target_dir .. '/' .. filename

      if vim.fn.isdirectory(target_dir) == 0 then
        vim.fn.mkdir(target_dir, 'p')
      end

      local is_new_file = (vim.fn.filereadable(filepath) == 0)

      vim.cmd.edit(filepath)

      local bufnr = vim.api.nvim_get_current_buf()
      local time_header = os.date('## %H:%M')

      local insert_lines = is_new_file and { time_header, '', '' } or { '---', '', time_header, '', '' }
      vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, insert_lines)

      local cursor_row = is_new_file and 3 or 5
      vim.api.nvim_win_set_cursor(0, { cursor_row, 0 })

      vim.api.nvim_create_autocmd('BufWipeout', {
        buffer = bufnr,
        once = true,
        callback = function()
          if vim.fn.filereadable(filepath) == 0 then return end

          local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
          local block_size = #insert_lines
          
          local has_content = false
          for i = block_size + 1, #lines do
            if lines[i] ~= "" then
              has_content = true
              break
            end
          end

          if not has_content then
            if is_new_file or #lines <= block_size then
              vim.fn.delete(filepath)
            else
              local file = io.open(filepath, "r")
              if file then
                local file_lines = {}
                for line in file:lines() do table.insert(file_lines, line) end
                file:close()

                local new_file = io.open(filepath, "w")
                if new_file then
                  for i = block_size + 1, #file_lines do
                    new_file:write(file_lines[i] .. "\n")
                  end
                  new_file:close()
                end
              end
            end
          end
        end,
      })
    end, { desc = "Open daily note with horizontal rule, and cleanup if empty." })

    ----------------------------------------------------
    -- 2. ノートのファイル名を検索するコマンド (:SearchNotes)
    ----------------------------------------------------
    vim.api.nvim_create_user_command('NotesSearch', function()
      local notes_dir = vim.fn.expand('~/.notes')

      if vim.fn.isdirectory(notes_dir) == 0 then
        print("Notes directory does not exist yet.")
        return
      end

      local has_telescope, telescope = pcall(require, 'telescope.builtin')
      if has_telescope then
        telescope.find_files({
          prompt_title = 'Search Notes',
          cwd = notes_dir,
          hidden = true,
        })
      else
        print("Telescope.nvim is not installed.")
      end
    end, { desc = "Search through past notes using Telescope." })

    ----------------------------------------------------
    -- 3. 🌟 新規追加：ノートの中身を全検索するコマンド (:GrepNotes)
    ----------------------------------------------------
    vim.api.nvim_create_user_command('NotesGrep', function()
      local notes_dir = vim.fn.expand('~/.notes')

      if vim.fn.isdirectory(notes_dir) == 0 then
        print("Notes directory does not exist yet.")
        return
      end

      local has_telescope, telescope = pcall(require, 'telescope.builtin')
      if has_telescope then
        -- live_grep機能を使って、指定したフォルダ内の中身を検索
        telescope.live_grep({
          prompt_title = 'Grep Text in Notes',
          cwd = notes_dir,
        })
      else
        print("Telescope.nvim is not installed.")
      end
    end, { desc = "Grep through past notes using Telescope." })
  end,
}

