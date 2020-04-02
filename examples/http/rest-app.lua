package.path = '/home/gabor/programs/lua/lua5.3.5/share/lua/5.3/?.lua;/home/gabor/programs/lua/lua5.3.5/share/lua/5.3/?/init.lua'


local Http = require 'standby.http'
local Router  = require 'standby.http.plugin.router'

local r = Router:new()

local server = Http:new{ plugins = { r } }

-- define routes
r:get('/test/:id', function(	request, response, params)
	response:statusCode(200)
	response.headers = {}
    response:addHeader('Content-Type', 'text/html')
	response:write('params id: ' .. params.id)
end)

r:get('/get/:id', function(params)
  local id = params.id
  print ( id )
end)

r:get('/hello', function(params, response)
  print('someone said hello')
end)

-- route parameters
r:get('/hello/:name', function(params)
  print('hello, ' .. params.name)  
end)

-- extra parameters (i.e. from a query or form)
r:post('/app/:id/comments', function(params)
  print('comment ' .. params.comment .. ' created on app ' .. params.id)
end)


-- r:execute('GET',  '/hello')
-- prints "someone said hello"

-- r:execute('GET',  '/hello/peter')
-- prints "hello peter"

-- r:execute('POST', '/app/4/comments', { comment = 'fascinating'})
-- prints "comment fascinating created on app 4"



server:start(function(request, response)
  -- called only if no route found
	print('No route found!')
end)