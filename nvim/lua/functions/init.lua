-----------------------------------------------------------
-- Functions
-----------------------------------------------------------
function toggle_inlay_hints()
	vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
end
