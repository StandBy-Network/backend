
describe('integration', function()
  local port = '7070'
  local url = 'http://localhost:' .. port

  local executeCommand = function(command)
    local handle = io.popen(command .. ' -s ' .. url)
    local result = handle:read('*a')
    handle:close()

    return result
  end

  it('should return correct headers', function()
    local result = executeCommand('curl --head')
	
	-- print (result)

    assert.truthy(string.find(result, 'HTTP/1.1 200 OK'))
    assert.truthy(string.find(result, 'Content%-Type: text/html'))
    assert.truthy(string.find(result, 'Content%-Length: 40'))
  end)

  it('should return correct body', function()
	local result = executeCommand('curl')
	-- print(result)
    assert.truthy(string.find(result, 'Hello, Standby.Http powered by Pegasus!'))
  end)
end)
