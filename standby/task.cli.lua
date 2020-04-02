--[[----------------------------------------------------------------------------
--- @file Cli.lua
--- @brief Cli application of Task task/card system.
----------------------------------------------------------------------------]]--

local Options = require "cliargs"

local cli = {}
cli.create = require "standby.task.cli.create"
cli.init = require "standby.task.cli.init"
cli.status = require "standby.task.cli.status"
cli.move = require "standby.task.cli.move"
cli.show = require "standby.task.cli.show"
cli.help = require "standby.task.cli.help"
cli.version = require "standby.task.cli.version"

-- @param options Command line parser
local function configureOptions(options)
    Options:set_name("cli")
    Options:argument("COMMAND", "command to execute.")
    Options:splat("ARGS", "command dependent arguments.", "", 2)
end

local Handlers = {}
Handlers.create = cli.create.handler
Handlers.init = cli.init.handler
Handlers.status = cli.status.handler
Handlers.help = cli.help.handler
Handlers.version = cli.version.handler
Handlers.move = cli.move.handler
Handlers.show = cli.show.handler

local Help = {}
Help.create = cli.create.help
Help.init = cli.init.help
Help.status = cli.status.help
Help.help = cli.help.help
Help.version = cli.version.help
Help.move = cli.move.help
Help.show = cli.show.help

--- Entry point.
-- @param ... command line arguments passed to cli application.
local function main(...)
    configureOptions(Options)

    local arguments = Options:parse()

    if arguments then
        if arguments["COMMAND"] then
            local command = arguments["COMMAND"]
            if not Handlers[command] then
                print("Invalid command: " .. command, "\n")
                Handlers.help(Help.help, "", Help)
                return
            end
            local code, description = Handlers[command](arguments.ARGS[1], arguments.ARGS[2], Help)
            if not code then
                print(description, "\n")
                Handlers.help(command, "", Help)
                return -1
            elseif description then
                print(description)
            end
        end
    end

    return 0
end

--------------------------------------------------------------------------------
return main(...)
