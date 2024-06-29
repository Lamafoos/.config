-----------------------------------------------------------
-- Functions
-----------------------------------------------------------

function IsWindows()
  if vim.loop.os_uname().sysname == "Windows_NT" then
    return true
  else 
    return false
  end
end 

function toggle_inlay_hints()
  vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
end
