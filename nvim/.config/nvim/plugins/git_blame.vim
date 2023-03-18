let g:gitblame_enabled = 0
let g:gitblame_message_template = '<author> | <summary> | <date>'
let g:gitblame_date_format = '%d.%m.%Y %X'

nnoremap <leader>gb :GitBlameToggle<CR>
