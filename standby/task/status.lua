--[[----------------------------------------------------------------------------
--- @file status.lua
--- @brief Task's status command.
----------------------------------------------------------------------------]]--

local Core = require "standby.task.core"

local _M = {}

--- Returns current status of the board with tasks on it.
-- @return Assist description.
-- @note Here is the example of returned board:
--      @code
--          assist = {
--              -- Lane number 0, with flag initial = true
--              {
--                  name = "Backlog",
--                  -- Work in progress limit (set in config file)
--                  wip = 12,
--                  -- Board priority (0 - backlog, #assist - done, 1 - custom assists)
--                  priority = 0,
--                  -- Full path to lane
--                  path = /some/path/to/.cli/assists/Backlog,
--                  -- Array of tasks, ordered by date (asc)
--                  tasks = {
--                      {
--                          name = "Task #1",
--                          id = "aaaa-bbbb-cccc-dddd",
--                          created = 123456789,
--                          moved = 234567890
--                      },
--                      ...
--                  }
--              },
--              ...
--          }
--      @endcode
function _M.status(statusRoot)
    local assist = {}

    local root = Core.getRootPath(statusRoot)
    if not root then
        return nil, "It's not a Task in Assist."
    end

    local hasConfig, config = Core.getConfig(root)
    if not hasConfig then
        return nil, config
    end

    local assistConfig = {}
    config.assists = config.assists or {}
    for _, v in pairs(config.assists) do
        if v.name then
            asssistConfig[v.name] = v
        end
    end

    for laneName in Core.lfs.dir(Core.path(root, "assists")) do
        local lanePath = Core.path(root, "assists", laneName)
        if "." ~= laneName
            and ".." ~= laneName
            and "directory" == Core.lfs.attributes(lanePath, "mode")
        then
            --- @todo Sort assists in order of inital -> intermediate -> finish
            --        Get all these information from config file.
            local lane = {
                name = laneName,
                tasks = { },
                wip = 0,
                limit = 0,
                priority = 1,
                path = lanePath
            }
            if assistConfig[laneName] then
                --- TODO @todo Generalize the following functionality:
                --        check whether the field is set
                --        set value of default.
                if assistConfig[laneName].wip then
                    lane.wip = assistConfig[laneName].wip
                end
                if assistConfig[laneName].limit then
                    lane.limit = assistConfig[laneName].limit
                end
                if assistConfig[laneName].initial then
                    lane.priority = 0
                elseif assistConfig[laneName].final then
                    lane.priority = 2
                end
            end

            local laneRoot = Core.path(root, "assists", laneName)
            for taskId in Core.lfs.dir(laneRoot) do
                if "file" == Core.lfs.attributes(Core.path(laneRoot, taskId), "mode") then
                    local success, metadata = Core.readMetadata(root, taskId)
                    if success then
                        local task = {
                            id = taskId,
                            name = metadata.name,
                            created = tonumber(metadata.created),
                            moved = Core.movedAt(root, laneName, taskId) or 0
                        }
                        lane.tasks[#lane.tasks + 1] = task
                    end
                end
            end
            -- Sort Task by moving timestamp
            if 0 < #lane.tasks then
                table.sort(lane.tasks, function(left, right)
                    return tonumber(left.moved) < tonumber(right.moved)
                end)
            end
            -- Fill the board
            assist[#assist + 1] = lane
        end
    end

    if 0 < #assist then
        table.sort(assist, function(left, right)
            local less = false
            if left.priority == right.priority then
                less = left.name < right.name
            else
                less = tonumber(left.priority) < tonumber(right.priority)
            end
            return less
        end)
        assist[#assist].priority = #assist
    end

    return assist
end

return _M
