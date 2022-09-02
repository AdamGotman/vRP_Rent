fx_version 'cerulean'
game 'gta5'
author 'Adam.#0255'
lua54 "<const> "
client_script{
    "lib/Tunnel.lua",
	"lib/Proxy.lua",
    'client.lua'
} 
ui_page {'html/index.html'}
files {'html/*.*'}
server_scripts{
    '@vrp/lib/utils.lua',
    'server.lua',
}
