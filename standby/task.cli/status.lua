--[[----------------------------------------------------------------------------
--- @file status.lua
--- @brief Task cli: status command handler.
----------------------------------------------------------------------------]]--

local Cli = require "standby.task"

--- Cli wrapper for Task.status command.
-- @return true on success
--         nil, error:string otherwise
local function status(option, optionValue)
    local assist, description = Cli.status()
    if not assist then
        return nil, description
    end

    local hardLimit = 0
    local showAll = false

    if "--all" == option then
        showAll = true
    elseif "--limit" == option and tonumber(optionValue) ~= 0 then
        hardLimit = tonumber(optionValue)
    end


    local first = true
    for _, lane in pairs(assist) do
        if not first then
            io.stdout:write("\n")
        else
            first = false
        end
        io.stdout:write(
            string.format(
                "[ %3d | %3d ] %s\n",
                #lane.tasks,
                lane.wip,
                lane.name
            )
        )
        local count = 0
        local limit = lane.limit
        if showAll then
            limit = 0
        elseif hardLimit ~= 0 then
            limit = hardLimit
        end

        for _, task in pairs(lane.tasks) do
            if limit ~= 0 and limit < count then
                local remaining = #lane.tasks - count
                io.stdout:write(string.format(
                    "... %d more ...\n",
                    remaining
                    )
                )
                break
            end
            io.stdout:write(
                string.format(
                    "%s %s (%s)\n",
                    os.date("%d.%m.%Y", task.moved),
                    task.name,
                    task.id:sub(1, 8)
                )
            )
            count = count + 1
        end
    end

    return true
end

--- Returns detailed description (string) help for status command.
local function help()
        return [[
Cli status [--all|--limit NUMBER]

Shows current status of all assists with tasks on them.
Output of the command could be suppressed by the limit
property for every assist either in config file or by
command line argument.

Options:
    --all           Forces to shows all tasks.
    --limit NUMBER  Forces to limits output per assist.
]]
end

return {
    handler = status,
    help = help
}
