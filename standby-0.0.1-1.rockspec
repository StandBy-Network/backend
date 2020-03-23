package = "standby"
version = "0.0.1-1"

source = {
    url = 'https://github.com/StandBy-Network/backend',
    tag = 'v0.0.1'
}

description = {
    summary = 'Standby.lua is a http and IRC server to work on mobile phone written in Lua language. The code is originated from http.lua and LunatrisIRCd and some code from MoonIRC ',
    homepage = 'https://github.com/StandBy-Network/backend',
    maintainer = '******',
    license = 'MIT <http://opensource.org/licenses/MIT>'
}

dependencies = {
  "lua >= 5.1",
  "mimetypes >= 1.0.0-1",
  "luasocket >= 0.1.0-0",
  "luafilesystem >= 1.6",
  "lzlib >= 0.4.1.53-1",
}

build = {
  type = "builtin",
  modules = {
    
    ['standby.http']          = "core/http/init.lua",
    ['standby.http.handler']  = 'core/http/handler.lua',
    ['standby.http.request']  = 'core/http/request.lua',
    ['standby.http.response'] = 'core/http/response.lua',
    ['standby.http.compress'] = 'core/http/compress.lua'
  }
}
