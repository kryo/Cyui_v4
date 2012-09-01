local T, C, L, G = unpack(Tukui)

if not C.utilities.screenie then return end

-- delay function from http://www.wowwiki.com/Wait
local function autoscreenshot(delay, func, ...)
	local waitTable = {}
	local waitFrame = CreateFrame("Frame", "WaitFrame", UIParent)
	waitFrame:SetScript("onUpdate", function (self, elapse)
		local count = #waitTable
		local i = 1
		while (i <= count) do
			local waitRecord = tremove(waitTable, i)
			local d = tremove(waitRecord, 1)
			local f = tremove(waitRecord, 1)
			local p = tremove(waitRecord, 1)
			if (d > elapse) then
				tinsert(waitTable, i, {d - elapse, f, p})
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
	autoscreenshot(1, Screenshot)
end

local Screenie = CreateFrame("Frame")
Screenie:RegisterEvent("ACHIEVEMENT_EARNED")
Screenie:SetScript("OnEvent", OnEvent)


























