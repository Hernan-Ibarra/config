-- Cursor has smear effect, makes it easier for people to see what is happening in vim during pair-programming sessions.
return {
  'sphamba/smear-cursor.nvim',
  enabled = false, -- Disable by default, enable during pair-programming
  opts = {
    cursor_color = '#ff8800',
    stiffness = 0.3,
    trailing_stiffness = 0.1,
    trailing_exponent = 5,
    gamma = 1,
  },
}