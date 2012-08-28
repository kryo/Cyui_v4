local T, C, L, G = unpack(Tukui)

if not C.utilities.screenie then return end

-- delay function from http://www.wowwiki.com/Wait
local waitTable = {}
local function AchievementScreenshot(delay, func, ...)
	waitFrame = CreateFrame("Frame","WaitFrame", UIParent)
	waitFrame:SetScript("onUpdate",function (self, elapse)
		local count = #waitTable
		local i = 1
		while (i <= count) do
			local waitRecord = tremove(waitTable, i)
			local d = tremove(waitRecord, 1)
			local f = tremove(waitRecord, 1)
			local p = tremove(waitRecord, 1)
			if (d > elapse) then
				tinsert(waitTable, i, {d-elapse, f, p})
				i = i + 1
			else
				count = count - 1
				f(unpack(p))
			end
		end
	end)
	tinsert(waitTable, {delay, func, {...} })
end

local function OnEvent(...)
	AchievementScreenshot(2, Screenshot)
end

local yScreenie = CreateFrame("Frame")
yScreenie:RegisterEvent("ACHIEVEMENT_EARNED")
yScreenie:SetScript("OnEvent", OnEvent)