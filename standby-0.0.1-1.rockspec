package = "standby"
version = "0.0.1-1"

source = {
    url = 'https://github.com/StandBy-Network/backend',
    tag = 'v0.0.1'
}

description = {
    summary = 'Standby is a http and chat and task server to work on mobile phone written in Lua language. The code is originated from http.lua and LunatrisIRCd and some code from MoonIRC and Pegasus and Prototype ',
    detailed = [[
Task is a simple local task tracker. All you need is a console
and a cli command to create, read, move tasks.]],
    homepage = 'https://github.com/StandBy-Network/backend',
    maintainer = '******',
    license = 'MIT <http://opensource.org/licenses/MIT>'
}

dependencies = {
  "lua >= 5.3",
  "mimetypes >= 1.0.0-1",
  "luasocket >= 0.1.0-0",
  "luafilesystem >= 1.6",
  "lzlib >= 0.4.1.53-1",
}

build = {
  type = "builtin",
  modules = {
    ['standby.http']          = "standby/http/init.lua",
    ['standby.http.handler']  = 'standby/http/handler.lua',
    ['standby.http.request']  = 'standby/http/request.lua',
    ['standby.http.response'] = 'standby/http/response.lua',
    ['standby.http.compress'] = 'standby/http/compress.lua',
    ['standby.http.router']   = 'standby/http/router.lua',
    ['standby.http.plugin.router'] = 'standby/plugin/http/router.lua',
    ["standby.task.cli"] = "standby/task.cli.lua",
    ["standby.task.cli.create"] = "standby/task.cli/create.lua",
    ["standby.task.cli.help"] = "standby/task.cli/help.lua",
    ["standby.task.cli.init"] = "standby/task.cli/init.lua",
    ["standby.task.cli.move"] = "standby/task.cli/move.lua",
    ["standby.task.cli.show"] = "standby/task.cli/show.lua",
    ["standby.task.cli.status"] = "standby/task.cli/status.lua",
    ["standby.task.cli.version"] = "standby/task.cli/version.lua",
    ["standby.task.cli.compat"] = "standby/task.cli/compat.lua",
    execute = "standby/plugin/execute.lua",
    interface = "standby/plugin/interface.lua",
    loader = "standby/plugin/loader.lua",
    plugins = "standby/plugin/plugins.lua",
    ["standby.task"] = "standby/task.lua",
    ["standby.task.core"] = "standby/task/core.lua",
    ["standby.task.create"] = "standby/task/create.lua",
    ["standby.task.init"] = "standby/task/init.lua",
    ["standby.task.move"] = "standby/task/move.lua",
    ["standby.task.show"] = "standby/task/show.lua",
    ["standby.task.status"] = "standby/task/status.lua",
    ["standby.task.template.default_config"] = "standby/task/template/default_config.lua",
    ["standby.task.template.md"] = "standby/task/template/md.lua",
    ["examples.chat.simulation"] = "examples/chat/simulation.lua",
    ["standby.chat.channel"] = "standby/chat/channel.lua",
    ["standby.chat.neighbour"] = "standby/chat/neighbour.lua",
    ["standby.chat.node"] = "standby/chat/node.lua",
    ["standby.chat.room"] = "standby/chat/room.lua",
    ["standby.chat.stable_bloom_filter"] = "standby/chat/stable_bloom_filter.lua",
    ["standby.chat.subscription"] = "standby/chat/subscription.lua"
    
  }
}
