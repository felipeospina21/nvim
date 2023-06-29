local conditions = require "heirline.conditions"
local status = require "astronvim.utils.status"
local utils = require "heirline.utils"
local Space = { provider = " " }
local colors = {
  vi_status = status.hl.mode_bg(),
  foam = "#9ccfd8",
  gold = "#f6c177",
  winbar_bg = "#3a3657",
}

local FileNameBlock = {
  init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end,
}

local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self) return self.icon and (self.icon .. " ") end,
  hl = function(self) return { fg = self.icon_color, bg = colors.winbar_bg } end,
}

local FileName = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "[No Name]" end
    if not conditions.width_percent_below(#filename, 0.25) then filename = vim.fn.pathshorten(filename) end
    return filename
  end,
  hl = { fg = colors.foam, bg = colors.winbar_bg },
}

local FileFlags = {
  {
    condition = function() return vim.bo.modified end,
    provider = " [+]",
    hl = { fg = "green", bg = colors.winbar_bg },
  },
  {
    condition = function() return not vim.bo.modifiable or vim.bo.readonly end,
    provider = " ",
    hl = { fg = "orange", bg = colors.winbar_bg },
  },
}

local FileNameModifer = {
  hl = function()
    if vim.bo.modified then return { fg = colors.gold, bold = true, force = true } end
  end,
}

local FileType = {
  provider = function() return string.upper(vim.bo.filetype) end,
  hl = { fg = utils.get_highlight("Type").fg, bold = true },
}

local TerminalName = {
  provider = function()
    local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
    return " " .. tname
  end,
  hl = { fg = "blue", bold = true },
}

FileNameBlock =
    utils.insert(FileNameBlock, FileIcon, utils.insert(FileNameModifer, FileName), FileFlags, { provider = "%<" })

return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    opts.winbar = {
      fallthrough = false,
      {
        -- A special winbar for terminals
        condition = function() return conditions.buffer_matches { buftype = { "terminal" } } end,
        utils.surround({ "", "" }, colors.winbar_bg, {
          FileType,
          Space,
          TerminalName,
        }),
      },
      {
        -- An inactive winbar for regular files
        condition = function() return not conditions.is_active() end,
        utils.surround({ "", "" }, colors.winbar_bg, { hl = { fg = "gray", force = true }, FileNameBlock }),
      },
      -- A winbar for regular files
      utils.surround({ "", "" }, colors.winbar_bg, FileNameBlock),
    }

    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },
      status.component.mode {
        mode_text = { icon = { kind = "VimIcon", padding = { right = 1, left = 1 } } },
        surround = {
          separator = "left",
          color = function() return { main = status.hl.mode_bg(), right = status.hl.mode_bg() } end,
        },
      },
      status.component.builder {
        { provider = "" },
        surround = {
          separator = "left",
          color = function() return { main = status.hl.mode_bg(), right = "file_info_bg" } end,
        },
      },
      status.component.file_info {
        file_icon = { padding = { left = 0 } },
        filename = { fallback = "Empty" },
        padding = { right = 1 },
        surround = { separator = "left", condition = false },
      },
      status.component.git_branch { surround = { separator = "none" } },
      status.component.git_diff { padding = { left = 1 }, surround = { separator = "none" } },
      status.component.fill(),
      status.component.lsp { lsp_client_names = false, surround = { separator = "none", color = "bg" } },
      status.component.fill(),
      status.component.diagnostics { surround = { separator = "right" } },
      status.component.lsp { lsp_progress = false, surround = { separator = "right" } },
      {
        status.component.builder {
          { provider = require("astronvim.utils").get_icon "FolderClosed" },
          padding = { right = 1 },
          hl = { fg = "bg" },
          surround = { separator = "right", color = "folder_icon_bg" },
        },
        status.component.file_info {
          filename = { fname = function(nr) return vim.fn.getcwd(nr) end, padding = { left = 1 } },
          file_icon = false,
          file_modified = false,
          file_read_only = false,
          surround = { separator = "none", color = "file_info_bg", condition = false },
        },
      },
      {
        status.component.builder {
          { provider = require("astronvim.utils").get_icon "ScrollText" },
          padding = { right = 1 },
          hl = { fg = "bg" },
          surround = { separator = "right", color = { main = "nav_icon_bg", left = "file_info_bg" } },
        },

        status.component.nav {
          percentage = { padding = { right = 1 } },
          ruler = false,
          scrollbar = false,
          surround = { separator = "none", color = "file_info_bg" },
        },
      },
    }
    return opts
  end,
}
