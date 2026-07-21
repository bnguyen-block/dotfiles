return {
  "mfussenegger/nvim-lint",
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters = {
      -- Linting via stdin makes markdownlint-cli2 skip config discovery, so
      -- pass the global config as base; repo-local configs still win over it.
      ["markdownlint-cli2"] = {
        args = { "--config", vim.fn.expand("~/.markdownlint-cli2.yaml"), "-" },
      },
    },
  },
}
