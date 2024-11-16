return {
  {
    "echasnovski/mini.nvim",
  },
  {
<<<<<<< HEAD
||||||| parent of fe076a7 (nvim: Add mini.nvim)
=======
>>>>>>> fe076a7 (nvim: Add mini.nvim)
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },
}
