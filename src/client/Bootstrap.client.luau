--!strict
-- Runs on each player's client. Confirms the Rojo sync reached StarterPlayerScripts.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Playground = require(ReplicatedStorage.Shared.Playground)

Playground.log("client", "Client scripts synced and running.")
