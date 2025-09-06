-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.completion.blink-cmp" },
  { import = "astrocommunity.completion.blink-cmp-emoji" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },
  -- import/override with your plugins folder
}
