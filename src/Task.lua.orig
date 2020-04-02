TASK_STATE_NOT_DO = 0
TASK_STATE_CAN_START = 2
TASK_STATE_DOING = 3
TASK_STATE_FINISHED = 4
TASK_STATE_FINISHED_SAVE = 5

Task = {
	id=0,
	name="",
	begin_npc = 0, --接任务npc
	end_npc = 0,	--交任务npc
	is_main = true,	--主线任务

}

Task.detail = 
{
	on_kill = {{npc=1,num=10},{npc=2,num=10}},
	on_get={{obj=1,num=2}, {obj=2, num=3}},
	on_use={{obj=1,num=1}},
	on_visit = {{npc=1}},

	--on_kill_by_level={},
	--on_kill_by_self = {},
	--on_kill_by_type = {},
	--on_drop={},

	--on_enter={},
	--on_quit = {},
}

Task.start_menu = [[
function TaskDialog()
	this:AddTaskItemCmd("接受任务","visit",1,1)
end
]]

Task.end_menu = [[
function TaskDialog()
	this:AddTaskItemCmd("完成任务","visit",1,2)
end
]]


function Task:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

	--访问npc
function Task::OnVisitNpc(user, npc)
	--任务可完成
	if self:CanFinish(user, npc) then
	user:SetMenu(self.end_menu)
	return true
	end

	--任务可接
	if self:CanAccept(user, npc) then
		user:SetMenu(self.start_menu)
		return true
	end
end

function Task:CanFinish(user, npc)
	if self.detail then
local usertask = user:GetUserTask(self:GetID())
	if not usertask then
	return false
	end

	--检查杀怪任务是否完成
	if self.detail.on_kill then
	for i,v in ipairs(self.detail.on_kill) do
	local num = usertask:GetVar("kill_"..v.npc)
	if num < v.num then
	return false
	end
	end
	end

	--检查获得任务是否完成
	if self.detail.on_get then
	for i,v in ipairs(self.detail.on_get) do
	local num = usertask:GetVar("get_"..v.id)
	if num < v.num then
	return false
	end
	end
	end

	return true
	else
	return false
	end
	end

	--任务是否可接
function Task:CanAccept(user, npc)
	--接任务条件

	--检查前一个任务是否已完成
	if self.base.prev_task_id and self.base.prev_task_id > 0 then
local usertask = user:GetUserTask(self.base.prev_task_id)
	if not (usertask and usertask:GetState() == TASK_STATE_FINISHED_SAVE) then
	return false
	end
	end

	--当前任务是否已经接过
	if self.base.id and self.base.id > 0 then
local usertask = user:GetUserTask(self.base.id)
	if usertask then		--已经接过该任务了
	if self.base.is_main then		--主线任务不允许重复接
	return false
	elseif usertask:GetState() ~= TASK_STATE_FINISHED_SAVE then	--当前任务正在进行中
	return false
	end
	end
	end

	--任务需要人物等级
	if self.base.needlevel > user:GetLevel() then
	return false
	end

	return true
	end



