return {
  {
    "neovim/nvim-lspconfig",
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "ms-jpq/coq_nvim",
        branch = "coq",
        build = "python3 -m coq deps"
      },
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
    }
  }
}
