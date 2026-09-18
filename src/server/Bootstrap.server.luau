--!strict
-- Runs on the server. Confirms the Rojo sync reached ServerScriptService.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Playground = require(ReplicatedStorage.Shared.Playground)

Playground.log("server", "Server scripts synced and running.")
