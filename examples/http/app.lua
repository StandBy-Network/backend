-- setup path to find the project source files of Standby

-- package.path = os.getenv("LUA_PATH")
-- package.cpath = os.getenv("LUA_CPATH")

package.path = '/home/gabor/programs/lua/lua5.3.5/share/lua/5.3/?.lua;/home/gabor/programs/lua/lua5.3.5/share/lua/5.3/?/init.lua'
package.path = "./core/?.lua;./core/?/init.lua;"..package.path


local Http = require 'standby.http'
local Compress = require 'standby.http.compress'

local server = Http:new({
  port='9090',
  location='/test/www/',
  plugins = { Compress:new() }
})

server:start(function(req, rep)
end)
