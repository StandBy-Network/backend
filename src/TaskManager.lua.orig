
TaskManager = {
	tasks = {},					--任务map
		visit_tasks = {},		--npcid 对应task
		kill_tasks = {}	,		--npcid 对应task
}

function TaskManager:RegisterTask(task)
	if task then
	tasks[task.id] = task

	local npc = task.npc

	if not self.visit_tasks[npc] then
	self.visit_tasks[npc] = {}
	end
table.insert(self.visit_tasks[npc], task)

	local npc = task.end_npc
	if not self.visit_tasks[npc] then
	self.visit_tasks[npc] = {}
	end
table.insert(self.visit_tasks[npc], task)

	if task.on_kill then
	for i,v in task.on_kill do
	if not self.kill_tasks[v.npc] then
	self.kill_tasks[v.npc] = {}
	end
table.insert(self.kill_tasks[v.npc], task)
	end
	end

	end
	end

	--获取与npc关联的任务
function TaskManager:GetVisitTasks(npcid)
	return self.visit_tasks[npcid]
	end

function TaskManager:GetTaskByID(id)
	return self.tasks[id]
	end

	function TaskManager:OnVisit(user, npc)
local tasks = self:GetVisitTasks(npc:GetID())
	if tasks then
	for i,v in ipairs(tasks) do
v:OnVisitNpc(user,npc)
	end
	end
	end

function TaskManager:OnKill(user, npc)
	local tasks = self.kill_tasks[npc:GetID()]
	if not tasks or (#tasks == 0) then
	--没有与杀该npc相关的任务
	return
	end
local usertasks = user:GetUserTasks()
	local it = usertasks:GetIter()			--玩家接的或者已经完成的任务
	while it > 0 do

	local const_task = self.tasks[it:GetID()]		--脚本中保存的任务数据,只读
	local find = false
	if const_task then
	for i,v in ipairs(tasks) do
	if v == const_task then
	find = true
	break
	end
	end

	if find then
	local kllstr = "kill_"..npc:GetID()
local curnum = tostring(it:GetVar(killstr))
	if const_task.detail.on_kill[npc:GetID()] >= curnum + 1 then
	it:SetVar(killstr, curnum + 1)		--更新任务变量
	if const_task:CanFinish(user, npc) then					--检查任务是否完成
	user:CompleteTask(it)			--任务完成
	end
	end
	end
	end

it = it:GetNext() 
	end
	end
