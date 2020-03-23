-- setup path to find the project source files of Pegasus
rocks = "/home/gabor/programs/lua/lua5.3.5/share/lua/5.3/"
package.path =  rocks .. "?.lua;" .. rocks .. "/?/?.lua;" .. "./src/?.lua;./src/?/init.lua;" .. package.path

local Http = require 'standby.http'

local server = Http:new({
  port='7070',
  location='/test/www/fixtures/'
})

server:start()
