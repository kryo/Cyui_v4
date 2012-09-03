local T, C, L, G = unpack(Tukui)

-- announce cooldowns to party
if not C.announcement.spells then return end

-- Channel output
local Channel
if GetNumGroupMembers() > 0 then
	Channel = "PARTY"
elseif (GetNumSubgroupMembers() > 0 and not UnitInRaid("player")) then
	Channel = "RAID"
else
	return
end

-- Spell filters
local Spells = T.AnnounceSpells

-- Locals
local Name = UnitName("player")
local GUID = UnitGUID("player")
local format = string.format
local tremove = tremove
local tinsert = tinsert
local unpack = unpack
local select = select
local UnitAura = UnitAura
local SendChatMessage = SendChatMessage
local WaitTable = {}

-- Functions
local OnUpdate = function(self, elapsed)
	local Count = #WaitTable
	local i = 1
	
	while (i <= Count) do
		local Table = tremove(WaitTable, i)
		local Delay = tremove(Table, 1)
		local Func = tremove(Table, 1)
		local Args = tremove(Table, 1)
		
		if (Delay > elapsed) then
			tinsert(WaitTable, i, {Delay - elapsed, Func, Args})
			i = i + 1
		else
			Count = Count - 1
			Func(unpack(Args))
		end
	end
end

local Delay = function(delay, func, ...)
	if (type(delay) ~= "number" or type(func) ~= "function") then
		return false
	end
	
	if (not AutoAnnounceWaitFrame) then
		local WaitFrame = CreateFrame("Frame", "AutoAnnounceWaitFrame", UIParent)
		WaitFrame:SetScript("OnUpdate", OnUpdate)
	end
	
	tinsert(WaitTable, {delay, func, {...}})
	return true
end

local OnEvent = function(self, event, ...)
	local Time, Type, HideCaster, SourceGUID, SourceName, SourceFlags, SourceRaidFlags, DestGUID, DestName, DestFlags, DestRaidFlags, SpellID, SpellName = ...
	
	if (SourceGUID ~= GUID) then return end
	
	if (Spells[SpellID] and Type == "SPELL_CAST_SUCCESS") then
		if (not DestName) then
			DestName = SourceName
		end
		
		local Duration = select(6, UnitAura(DestName, SpellName))
		local SpellString = "\124cff71d5ff\124Hspell:" .. SpellID .. "\124h[" .. SpellName .. "]\124h\124r"
		
		if (DestName ~= Name) then
			if Duration == nil then
				SendChatMessage(SpellString.." up on "..DestName.."!", Channel)
			else
				SendChatMessage(SpellString.." up on "..DestName.." for "..Duration.." seconds!", Channel)
			end
		else
			SendChatMessage(SpellString.." up for "..Duration.." seconds!", Channel)
		end
		
		if C.announcement.down then
			Delay(Duration, SendChatMessage, SpellString .. " is down.", Channel)
		end
	end
end

local AnnounceFrame = CreateFrame("Frame")
AnnounceFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
AnnounceFrame:SetScript("OnEvent", OnEvent) --]]