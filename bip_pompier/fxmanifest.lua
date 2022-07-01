fx_version 'adamant'
games { 'gta5' };
lua54 'yes'
author 'Treifa'
description ' bipper sapeur pompier  FiveM'
version '1.0.0'

ui_page "index.html"

files {
    "index.html",
    "style.css",
    "index.js",
    "*.png",
    "*.mp3",

}

client_scripts {
    "client.lua",
    
}


server_scripts {
    "server.lua",

}

shared_scripts {
    "config.lua"
}

