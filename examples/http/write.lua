-- setup path to find the project source files of Pegasus
package.path = "./src/?.lua;./src/?/init.lua;"..package.path

local Http = require 'standby.http'

local server = Http:new()

server:start(function (req, rep)
  --print('method=' .. req.method)
  rep:addHeader('Content-Type', 'text/html'):write('hello pegasus world!')
end)
