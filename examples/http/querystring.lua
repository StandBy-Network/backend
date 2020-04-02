-- setup path to find the project source files of Pegasus
package.path = "./src/?.lua;./src/?/init.lua;"..package.path

local Http = require 'standby.http'

local server = Http:new({port='9090'})

local printTable = function (table)
  for k, v in pairs(table) do
    print(k, '=', v)
  end
end

server:start(function (request, response)
  print("Query string:")
  printTable(request["querystring"])
end)
