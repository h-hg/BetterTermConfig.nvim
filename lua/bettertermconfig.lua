local M = {}

M.opts = {
  keymap = {
    esc = true,
    cw = true,
  },
  normal = {
    nu = true,
    rnu = true,
  },
}

M.setup = function(opts)
  opts = opts or {}
  M.opts = vim.tbl_extend('force', M.opts, opts)
  -- keymap
  if M.opts.keymap.esc then
    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {silent = true, noremap = true})
  end
  if M.opts.keymap.cw then
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], {
      silent = true,
      noremap = false, -- attention
    })
  end

  -- auto insert
  vim.api.nvim_create_augroup('SmartTerm', {clear=true})
  vim.api.nvim_create_autocmd('TermOpen', {
    group = 'SmartTerm',
    callback = function()
      vim.cmd('startinsert')
    end,
  })
  vim.api.nvim_create_autocmd({'WinEnter', 'FocusGained'}, {
    group = 'SmartTerm',
    callback = function()
      if vim.bo.buftype == 'terminal' then
        vim.cmd('startinsert')
      end
    end,
  })
  -- line number
  if M.opts.normal.nu == false and M.opts.normal.rnu == false then
    vim.api.nvim_create_autocmd('TermOpen', {
      group = 'SmartTerm',
      callback = function()
        vim.wo.rnu = false
        vim.wo.nu = false
      end,
    })
  else
    vim.api.nvim_create_autocmd('TermEnter', {
      group = 'SmartTerm',
      callback = function()
        vim.wo.nu = false
        vim.wo.rnu = false
      end
    })
    vim.api.nvim_create_autocmd('TermLeave', {
      group = 'SmartTerm',
      callback = function()
        vim.wo.nu = M.opts.normal.nu
        vim.wo.rnu = M.opts.normal.rnu
      end
    })
    vim.api.nvim_create_autocmd({'WinLeave', 'FocusLost'}, {
      group = 'SmartTerm',
      callback = function()
        if vim.bo.buftype == 'terminal' then
          vim.wo.nu = false
          vim.wo.rnu = false
        end
      end
    })
  end
end

return M

