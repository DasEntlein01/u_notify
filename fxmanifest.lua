fx_version 'cerulean'
game 'gta5'

author 'DasEntlein'
description 'u_notify'
version '0.5'

client_scripts {
  "client/**"
}

server_script 'version_checker.lua'

ui_page "html/index.html"

files {
  "html/*",
  "html/**/*",
  "html/**/**/*",
}
