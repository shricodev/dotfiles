return {
  -- Command and arguments to start the server.
  cmd = { 'rust-analyzer' },
  -- Filetypes to automatically attach to.
  filetypes = { 'rust' },
  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a "rust-project.json" file or
  -- a "Cargo.toml" file. Files that share a root directory will reuse
  -- the connection to the same LSP server.
  root_markers = { 'rust-project.json', 'Cargo.toml' },
}
