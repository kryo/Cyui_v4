local T, C, L, G = unpack(Tukui)

if not C.utilities.buffreminder then return end

T.remindbuffs = {
	PRIEST = {
		588,	-- Inner Fire
		73413,	-- Inner Will
	},
	HUNTER = {
		13165,	-- Hawk
		109260,	-- Iron Hawk
		82661,	-- Fox
		--5118,	-- Cheetah
		--13159,	-- Pack
	},
	MAGE = {
		7302,	-- Frost Armor
		6117,	-- Mage Armor
		30482,	-- Molten Armor
	},
	WARLOCK = {
		28176,	-- Fel Armor
		687,	-- Demon Armor
	},
	SHAMAN = {
		52127,	-- Waterc Shield
		324,	-- Lightning Shield
		974,	-- Earth Shield
	},
	WARRIOR = {
		469,	-- Commanding Shout
		6673,	-- Battle Shout
		93435,	-- Roar of Courage
		57330,	-- Horn of Winter
		21562,	-- Fortitude
	},
	DEATHKNIGHT = {
		469,	-- Commanding Shout
		6673,	-- Battle Shout
		93435,	-- Roar of Courage
		57330,	-- Horn of Winter
	},
}

local buffs = T.remindbuffs[T.myclass]

if not buffs then return end

local sound
local function BuffsOnEvent(self, event)
	if (event == "PLAYER_LOGIN" or event == "LEARNED_SPELL_IN_TAB") then
		for i, buff in pairs(buffs) do
			local name = GetSpellInfo(buff)
			local usable, nomana = IsUsableSpell(name)
			if (usable or nomana) then
				self.icon:SetTexture(select(3, GetSpellInfo(buff)))
				break
			end
		end
		if (not self.icon:GetTexture() and event == "PLAYER_LOGIN") then
			self:UnregisterAllEvents()
			self:RegisterEvent("LEARNED_SPELL_IN_TAB")
			return
		elseif (self.icon:GetTexture() and event == "LEARNED_SPELL_IN_TAB") then
			self:UnregisterAllEvents()
			self:RegisterEvent("UNIT_AURA")
			self:RegisterEvent("PLAYER_LOGIN")
			self:RegisterEvent("PLAYER_REGEN_ENABLED")
			self:RegisterEvent("PLAYER_REGEN_DISABLED")
		end
	end

	if (UnitAffectingCombat("player") and not UnitInVehicle("player")) then
		for i, buff in pairs(buffs) do
			local name = GetSpellInfo(buff)
			if (name and UnitBuff("player", name)) then
				self:Hide()
				sound = true
				return
			end
		end
		self:Show()
		if sound == true then
			PlaySoundFile(C.media.warning)
			sound = false
		end
	else
		self:Hide()
		sound = true
	end
end

local frame = CreateFrame("Frame", "TukuiBuffsWarningFrame", UIParent)
frame.icon = frame:CreateTexture(nil, "OVERLAY")
frame.icon:SetPoint("CENTER")
frame:Size(35)
frame:SetPoint("CENTER", UIParent, "CENTER", 0, 100)
frame:SetTemplate("Default")
frame.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
frame.icon:Size(33)
frame:Hide()

frame:RegisterEvent("UNIT_AURA")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("UNIT_ENTERING_VEHICLE")
frame:RegisterEvent("UNIT_ENTERED_VEHICLE")
frame:RegisterEvent("UNIT_EXITING_VEHICLE")
frame:RegisterEvent("UNIT_EXITED_VEHICLE")

frame:SetScript("OnEvent", BuffsOnEvent)