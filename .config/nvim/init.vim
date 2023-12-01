call plug#begin('~/.config/nvim/plugged')

" Essential plugins for TypeScript, JavaScript, and React
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'

" Optional plugins you may like
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
" LSP support
Plug 'neovim/nvim-lspconfig'

" Autocompletion plugins
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" TypeScript
Plug 'ellisonleao/gruvbox.nvim'

" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Syntax highlighting
Plug 'fatih/vim-go'
call plug#end()

syntax enable
set background=dark " or light if you want light mode
colorscheme gruvbox

lua << EOF
require'lspconfig'.gopls.setup{
    on_attach = function(client, bufnr)
        -- Key mappings and other configuration
    end
}
EOF

" Set up nvim-cmp.
lua << EOF
local cmp = require'cmp'

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
EOF

" ALE Configuration for TypeScript and React
let g:ale_fixers = {
\   'typescript': ['eslint'],
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'typescriptreact': ['eslint'],
\}

let g:ale_linters = {
\   'typescript': ['eslint'],
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'typescriptreact': ['eslint'],
\}

" Automatic formatting on file save
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx EslintFixAll


nnoremap <C-t> :NERDTree<CR>
" Open a new file
nnoremap <C-n> :e <Space>

" Save the current file
nnoremap <C-s> :w<CR>

" Save and close the current file
nnoremap <C-x> :x<CR>

" Close the current file without saving
nnoremap <C-q> :q!<CR>

" Close the current buffer
nnoremap <C-w> :bd<CR>
" Open a new file
nnoremap <C-n> :e <Space>

" Save the current file
nnoremap <C-s> :w<CR>

" Save and close the current file
nnoremap <C-x> :x<CR>

" Close the current file without saving
nnoremap <C-q> :q!<CR>

" Close the current buffer
nnoremap <C-w> " Move to the next buffer
nnoremap <C-l> :bnext<CR>

" Move to the previous buffer
nnoremap <C-h> :bprevious<CR>

" List all buffers
nnoremap <C-b> :buffers<CR>
nnoremap <C-w> :bd<CR>
" Move to the next buffer
nnoremap <C-l> :bnext<CR>

" Move to the previous buffer
nnoremap <C-h> :bprevious<CR>

" List all buffers
nnoremap <C-b> :buffers<CR>
" Move to the next buffer
nnoremap <C-l> :bnext<CR>

" Move to the previous buffer
nnoremap <C-h> :bprevious<CR>

" List all buffers
nnoremap <C-b> :buffers<CR>
" Split window horizontally and move to it
nnoremap <C-s> :split<Return><C-w>w

" Split window vertically and move to it
nnoremap <C-v> :vsplit<Return><C-w>w

" Navigate between splits using Ctrl + arrow keys
nnoremap <C-Up> <C-w>k
nnoremap <C-Down> <C-w>j
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l

" Resize splits using Ctrl + Shift + arrow keys
nnoremap <C-S-Up> :resize -2<CR>
nnoremap <C-S-Down> :resize +2<CR>
nnoremap <C-S-Left> :vertical resize -2<CR>
nnoremap <C-S-Right> :vertical resize +2<CR>
" Split window horizontally and move to it
nnoremap <C-s> :split<Return><C-w>w

" Split window vertically and move to it
nnoremap <C-v> :vsplit<Return><C-w>w

" Navigate between splits using Ctrl + arrow keys
nnoremap <C-Up> <C-w>k
nnoremap <C-Down> <C-w>j
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l

" Resize splits using Ctrl + Shift + arrow keys
nnoremap <C-S-Up> :resize -2<CR>
nnoremap <C-S-Down> :resize +2<CR>
nnoremap <C-S-Left> :vertical resize -2<CR>
nnoremap <C-S-Right> :vertical resize +2<CR>

" Open a new tab
nnoremap <C-t> :tabnew<CR>

" Move to the next tab
nnoremap <Tab> :tabnext<CR>

" Move to the previous tab
nnoremap <S-Tab> :tabprevious<CR>

" Close the current tab
nnoremap <C-T> :tabclose<CR>
" Open a new tab
nnoremap <C-t> :tabnew<CR>

" Move to the next tab
nnoremap <Tab> :tabnext<CR>

" Move to the previous tab
nnoremap <S-Tab> :tabprevious<CR>

" Close the current tab
nnoremap <C-T> :tabclose<CR>
" Toggle NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Find the current file in NERDTree
nnoremap <C-f> :NERDTreeFind<CR>
" Toggle NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Find the current file in NERDTree
nnoremap <C-f> :NERDTreeFind<CR>
" Open file finder
nnoremap <C-p> :Telescope find_files<CR>

" Search for text in project
nnoremap <C-f> :Telescope live_grep<CR>
" Open file finder
nnoremap <C-p> :Telescope find_files<CR>

" Search for text in project
nnoremap <C-f> :Telescope live_grep<CR>

