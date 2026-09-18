--!strict
--[[
	Shared helpers available to both the server and the client.
	Synced to ReplicatedStorage.Shared by Rojo.
]]

local Playground = {}

Playground.Name = "roblox-script-playground"

--[[
	Prints a scoped message so output from different experiments stays
	readable when several are running at once.
]]
function Playground.log(scope: string, message: string): ()
	print(`[{Playground.Name}/{scope}] {message}`)
end

return Playground
