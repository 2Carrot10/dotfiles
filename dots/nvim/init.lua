require("twocarrot10.core")
require("twocarrot10.lazy")
vim.cmd [[
    augroup glsl
        autocmd!
        autocmd BufRead,BufNewFile *.glsl,*.frag,*.vert,*.geom set filetype=glsl
    augroup END
]]
