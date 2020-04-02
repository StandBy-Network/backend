-- setup path to find the project source files of Pegasus
rocks = "/home/gabor/projects/standby.network/server/backend/lua_modules/share/lua/5.3"
package.path =  rocks .. "/?.lua;" .. rocks .. "/?/init.lua;" -- .. package.path

print(package.path)

local Http = require 'standby.http'

local server = Http:new({
  port='7070',
  location='/test/www/fixtures/'
})

server:start()
