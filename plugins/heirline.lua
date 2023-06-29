local conditions = require "heirline.conditions"
local utils = require "heirline.utils"
local Space = { provider = " " }
local bg = "#3a3657"
local foam = "#9ccfd8"
local gold = "#f6c177"

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
  hl = function(self) return { fg = self.icon_color, bg = bg } end,
}

local FileName = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "[No Name]" end
    if not conditions.width_percent_below(#filename, 0.25) then filename = vim.fn.pathshorten(filename) end
    return filename
  end,
  hl = { fg = foam, bg = bg },
}

local FileFlags = {
  {
    condition = function() return vim.bo.modified end,
    provider = " [+]",
    hl = { fg = "green", bg = bg },
  },
  {
    condition = function() return not vim.bo.modifiable or vim.bo.readonly end,
    provider = " ",
    hl = { fg = "orange", bg = bg },
  },
}

local FileNameModifer = {
  hl = function()
    if vim.bo.modified then return { fg = gold, bold = true, force = true } end
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
local WinBars = {
  fallthrough = false,
  {
    -- A special winbar for terminals
    condition = function() return conditions.buffer_matches { buftype = { "terminal" } } end,
    utils.surround({ "", "" }, bg, {
      FileType,
      Space,
      TerminalName,
    }),
  },
  {
    -- An inactive winbar for regular files
    condition = function() return not conditions.is_active() end,
    utils.surround({ "", "" }, bg, { hl = { fg = "gray", force = true }, FileNameBlock }),
  },
  -- A winbar for regular files
  utils.surround({ "", "" }, bg, FileNameBlock),
}

return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    opts.winbar = WinBars
    return opts
  end,
}
