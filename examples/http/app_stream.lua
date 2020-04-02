-- setup path to find the project source files of Http server
package.path = "./src/?.lua;./src/?/init.lua;"..package.path

local Http = require 'standby.http'
local socket = require 'socket'

local server = Http:new({
  port='9090'
})
function sleep(sec)
  socket.select(nil, nil, sec)
end

server:start(function(req, resp)
   resp:write('a', true)
   sleep(3)
   resp:write('b', true)
   sleep(3)
   resp:write('c', true)
   resp:close()
end)
