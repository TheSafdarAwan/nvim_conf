local vim = vim
local M = {}

M.nvim_lsp = require("lspconfig")
-- Add additional capabilities supported by nvim-cmp
local capabilities_l = vim.lsp.protocol.make_client_capabilities()
capabilities_l = require("cmp_nvim_lsp").update_capabilities(capabilities_l)
--Enable (broadcasting) snippet capability for completion
capabilities_l.textDocument.completion.completionItem.snippetSupport = true
capabilities_l.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities_l.textDocument.completion.completionItem.preselectSupport = true
capabilities_l.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities_l.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities_l.textDocument.completion.completionItem.deprecatedSupport = true
capabilities_l.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities_l.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities_l.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

M.capabilities = capabilities_l

--=======================================================
--                      UI
--=======================================================

--     ["bold"] = {
--       {"┏", highlight},
--       {"─", highlight},
--       {"┓", highlight},
--       {"│", highlight},
--       {"┛", highlight},
--       {"─", highlight},
--       {"┗", highlight},
--       {"│", highlight}

--       { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },

--       { "╭", "highlight" },
--       { "─", "highlight" },
--       { "╮", "highlight" },
--       { "│", "highlight" },
--       { "╯", "highlight" },
--       { "─", "highlight" },
--       { "╰", "highlight" },
--       { "│", "highlight" },
local Border = {
	{ "┌", "highlight" },
	{ "─", "highlight" },
	{ "┐", "highlight" },
	{ "│", "highlight" },
	{ "┘", "highlight" },
	{ "─", "highlight" },
	{ "└", "highlight" },
	{ "│", "highlight" },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = Border,
})

local signs = { Error = " ", Warn = " ", Hint = "", Info = " ", other = " " }

for sign, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. sign
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

return M
