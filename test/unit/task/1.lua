Task1 = Task:new{
	id=1, 
		base = GetTaskBase(id),
}

local T = Task1

T.detail = 
{
	on_kill = {{npc=1,num=10},{npc=2,num=10}},
	on_drop={},

	on_enter={},
	on_quit = {},

	on_get={},
	on_use={},
	on_visit = {},

	on_kill_by_level={},
	on_kill_by_self = {},
	on_kill_by_type = {}
}

T.description = [[
<?xml version="1.0" encoding="GB2312"?>
<body>
<p>
<n>
</n>
</p>
</body>
]]

TaskManager:RegisterTask(T)

	T.start_menu = 
	[[
function TaskDialog()
	this:AddTalk("task1")
	this:AddTaskItemCmd("接受任务", "v123", 1, 1)
	end
	]]

function T:OnVisitNpc(user, npc)
	end



