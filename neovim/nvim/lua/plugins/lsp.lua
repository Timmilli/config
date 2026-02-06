return {
	"mason-org/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		---------------------------------------------------------------------------
		-- LSP ATTACH KEYMAPS & UI
		---------------------------------------------------------------------------
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
				map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
				map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
				map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.inlayHintProvider then
					map("<leader>th", function()
						vim.lsp.inlay_hint.toggle({ bufnr = event.buf })
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		---------------------------------------------------------------------------
		-- DIAGNOSTICS
		---------------------------------------------------------------------------
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			virtual_text = {
				source = "if_many",
				spacing = 2,
			},
		})

		---------------------------------------------------------------------------
		-- CAPABILITIES
		---------------------------------------------------------------------------
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		---------------------------------------------------------------------------
		-- MASON
		---------------------------------------------------------------------------
		require("mason").setup()

		require("mason-tool-installer").setup({
			ensure_installed = {
				"clangd",
				"lua-language-server",
				"stylua",
				"ruff",
				"ltex-ls",
			},
		})

		---------------------------------------------------------------------------
		-- LSP SERVERS (NEOVIM 0.12 NATIVE)
		---------------------------------------------------------------------------

		---------------------------------------------------------------------------
		-- ENABLE SERVERS
		---------------------------------------------------------------------------
		vim.lsp.enable({
			"clangd",
			"lua-language-server",
			"stylua",
			"ruff",
			"ltex-ls",
		})
	end,
}
