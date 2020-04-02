--[[----------------------------------------------------------------------------
--- @file create.lua
--- @brief Task's create command.
----------------------------------------------------------------------------]]--

local Core = require "standby.task.core"

local _M = {}

--- Creates new task
-- @param name Short descriptive name of task.
-- @retval true, string - on success, where string is the uuid of new card.
-- @retval nil, string - on error, where string contains detailed description.
function _M.create(name)
    if not name or "string" ~= type(name) then
        return nil, "Invalid argument."
    end

    if not Core.getRootPath() then
        return nil, "Can't get Task's root directory."
    end

    local task = {}

    task.name = name
    task.id = Core.uuid.new()
    if not task.id then
        return nil, "Can't generate uuid for task."
    end

    local templateErr, template = Core.getTemplate("md.lua")
    if not templateErr then
        return nil, "Can't read none of template files for task."
    end
    template.value = template.value:gsub("${NAME}", name)

    task.time = os.time()

    local prefix, body = Core.splitId(task.id)
    local markdown, markdownErr
        = Core.createCardFile("tasks", prefix, body, ".md", template.value)
    if not markdown then
        return nil, markdownErr
    end

    --- @warning Platform (linux specific) dependent code.
    --- @todo Either replace with something more cross platform
    ---       or check OS before.
    --- os.execute("$EDITOR " .. markdown.name)

    local meta, metaErr
        = Core.createCardFile("meta", prefix, body, nil, Core.serializeMeta(task))
    if not meta then
        return nil, metaErr
    end

    local marker, markerErr
        = Core.createCardFile("assists", "backlog", card.id, nil, tostring(task.time))
    if not marker then
        return nil, markerErr
    end

    return true, task.id
end

return _M
