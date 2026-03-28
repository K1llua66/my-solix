repeat wait() until game:IsLoaded()

local cloneref = cloneref or function(o) return o end
local CoreGui = cloneref(game:GetService("CoreGui"))
local TweenService = cloneref(game:GetService("TweenService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local Players = cloneref(game:GetService("Players"))
local TextService = cloneref(game:GetService("TextService"))
local HttpService = cloneref(game:GetService("HttpService"))
local Lighting = cloneref(game:GetService("Lighting"))
local Workspace = cloneref(game:GetService("Workspace"))
local IsMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled

getgenv().lilix = getgenv().lilix or nil
getgenv().relix = getgenv().relix or nil

if not LPH_OBFUSCATED then
	LPH_JIT_MAX = function(...) return ... end
	LPH_NO_VIRTUALIZE = function(f) return f end
	LPH_NO_UPVALUES = function(...) return ... end
	LPH_CRASH = function(...) return ... end
else
	print = function() end
	warn = function() end
end

local Folder_Configs = {
	Directory = "solixhub",
	Configs = "solixhub/Configs",
	Assets = "solixhub/Assets",
	Themes = "solixhub/Themes"
}

for _, Folder in pairs(Folder_Configs) do
	if not isfolder(Folder) then
		makefolder(Folder)
	end
end

local GameId = tostring(game.GameId)
local GameConfigFolder = Folder_Configs.Configs .. "/" .. GameId

if not isfolder(GameConfigFolder) then
	makefolder(GameConfigFolder)
end

local FontPath = Folder_Configs.Assets .. "/InterSemibold.ttf"

if not isfile(FontPath) then
	local FontData = game:HttpGet("https://github.com/sametexe001/luas/raw/main/fonts/InterSemibold.ttf")

	if FontData and FontData ~= "" then
		writefile(FontPath, FontData)
	end
end

local GameList = {
	["3808223175"] = { id = "4fe2dfc202115670b1813277df916ab2", keyless = true },
	["994732206"]  = { id = "e2718ddebf562c5c4080dfce26b09398", keyless = true },
	["1511883870"] = { id = "fefdf5088c44beb34ef52ed6b520507c", keyless = true },
	["6035872082"] = { id = "3bb7969a9ecb9e317b0a24681327c2e2", keyless = true },
	["245662005"]  = { id = "21ad7f491e4658e9dc9529a60c887c6e", keyless = true },
	["7018190066"] = { id = "98f5c64a0a9ecca29517078597bbcbdb", keyless = true },
	["7326934954"] = { id = "00e140acb477c5ecde501c1d448df6f9", keyless = true },
	["7671049560"] = { id = "c0b41e859f576fb70183206224d4a75f", keyless = true },
	["9363735110"] = { id = "4948419832e0bd4aa588e628c45b6f8d", keyless = true },
	["9509842868"] = { id = "ad4ccd094f8b6f972bff36de80475abe", keyless = true },
	["5130394318"] = { id = "3e7a75a970118d0f0cf629369524dc7d", keyless = true },
	["9186719164"] = { id = "892ccfefdc8834199a2a6e5856a8da67", keyless = true },
}

local Config = {
	File = "solixhub/savedkey.txt",
	Title = "Solix Hub Free 15+ Games",
	Description = "Lifetime key access is available for a one time payment of $15 via solixhub.com",
	Linkvertise = "https://ads.luarmor.net/get_key?for=Solixhub_Free_KeySystem-OWlLHDMCHADk",
	Rinku = "https://ads.luarmor.net/get_key?for=Solix_Free_Keysystems-pqJCGTqnTsng",
	Discord = "https://discord.gg/solixhub",
	Shop = "https://solixhub.com/",
}

local GameConfig = GameList[GameId]

if not GameConfig then
	Players.LocalPlayer:Kick("This game is not supported.")
	return
end

local ScriptId = GameConfig.id
local IsKeyless = GameConfig.keyless

if hookfunction and hookmetamethod then
	getgenv().lilix = true
else
	getgenv().lilix = false
end

if IsMobile then
	getgenv().relix = true
else
	getgenv().relix = false
end

-- Удалена проверка ключей, сразу загружаем скрипт
local LuarmorApi = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
LuarmorApi.script_id = ScriptId

pcall(function()
	LuarmorApi.load_script()
end)

-- Проверка поддержки экзекутора (если нужно)
if not (
	GameId == "3808223175"
		or GameId == "994732206"
		or GameId == "1511883870"
		or GameId == "7018190066"
		or GameId == "7671049560"
		or GameId == "9363735110"
		or GameId == "9509842868"
		or GameId == "5130394318"
	) and not getgenv().lilix then
	Players.LocalPlayer:Kick("This executor is not supported for this game.")
end

-- Остальной код (библиотека GUI) можно удалить, так как она больше не нужна для ввода ключа
-- Но если она используется для других целей, оставьте её