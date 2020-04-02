--[[----------------------------------------------------------------------------
--- @file task.lua
--- @brief Entry point of Task module.
----------------------------------------------------------------------------]]--

local Create = require "standby.task.create"
local Init = require "standby.task.init"
local Status = require "standby.task.status"
local Move = require "standby.task.move"
local Show = require "standby.task.show"

local _M = { }

--- Current version.
_M.VERSION = "0.0.1"

--- Official name of Task.
_M.NAME = "Assist Task"

--- @brief Initializes Task.
--
-- Creates fácil's file system layout inside selected directory and all required files.
-- File system layout is:
--      ROOT/                           - Selected root, passed as root param.
--          .cli/                       - Root directory for entire fácil.
--              assists/                - Root directory for boards.
--                  backlog/            - Initial board, all new tasks are sticked here.
--                  progress/           - All task which are in progress are sticked here.
--                  done/               - All finished tasks.
--              tasks/                  - All tasks ever created.
--              meta/                   - Description of tasks.
--              config                  - Local configuration file.
--
-- @param root Path to the root directory, where to initialize fl.
--
-- @retval true - on success
-- @retval nil, string - on error, where string contains detailed description.
_M.init = Init.init

--- @brief Creates new task
--
-- Task consists of three files:
--   1 Task file - text file with markdown content contained description of task.
--   2 Meta data file - text file in lua format with meta data described task itself.
--   3 Status file - empty file in assists pointed to current status of the task.
-- All these files are placed inside .cli directory (by default).
--
-- @param name Short and descriptive name of new card. (string, mandatory)
--
-- @retval true, string - on success, where string is the uuid of new task.
-- @retval nil, string - on error, where string contains detailed description.
_M.create = Create.create

--- Returns current status of the Assist with tasks on it.
-- @return Assist description.
-- @note Here is the example of returned assist:
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
_M.status = Status.status

---
_M.move = Move.move

_M.show = Show.show

return _M
