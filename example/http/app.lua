-- setup path to find the project source files of Standby
package.path = "./src/?.lua;./src/?/init.lua;"..package.path

local Http = require 'http'
local Compress = require 'http.compress'

local server = Http:new({
  port='9090',
  location='/test/www/',
  plugins = { Compress:new() }
})

server:start(function(req, rep)
end)
