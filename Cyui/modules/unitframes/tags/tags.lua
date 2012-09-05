local T, C, L, G = unpack(Tukui)

local oUF = oUFTukui or oUF
if not C.unitframes.enable then return end

local utf8sub = function(string, i, dots)
	if not string then return end
	local bytes = string:len()
	if (bytes <= i) then
		return string
	else
		local len, pos = 0, 1
		while(pos <= bytes) do
			len = len + 1
			local c = string:byte(pos)
			if (c > 0 and c <= 127) then
				pos = pos + 1
			elseif (c >= 192 and c <= 223) then
				pos = pos + 2
			elseif (c >= 224 and c <= 239) then
				pos = pos + 3
			elseif (c >= 240 and c <= 247) then
				pos = pos + 4
			end
			if (len == i) then break end
		end

		if (len == i and pos <= bytes) then
			return string:sub(1, pos - 1)..(dots and '...' or '')
		else
			return string
		end
	end
end

oUF.Tags.Events['Tukui:cynamelong'] = 'UNIT_NAME_UPDATE'
oUF.Tags.Methods['Tukui:cynamelong'] = function(unit)
	local name = UnitName(unit)
	return utf8sub(name, 18, false)
end

oUF.Tags.Events['Tukui:cynamemedium'] = 'UNIT_NAME_UPDATE'
oUF.Tags.Methods['Tukui:cynamemedium'] = function(unit)
	local name = UnitName(unit)
	return utf8sub(name, 14, false)
end

oUF.Tags.Events['Tukui:cynamesmall'] = 'UNIT_NAME_UPDATE'
oUF.Tags.Methods['Tukui:cynamesmall'] = function(unit)
	local name = UnitName(unit)
	return utf8sub(name, 11, false)
end

oUF.Tags.Events['Tukui:cynametiny'] = 'UNIT_NAME_UPDATE'
oUF.Tags.Methods['Tukui:cynametiny'] = function(unit)
	local name = UnitName(unit)
	return utf8sub(name, 7, false)
end

oUF.Tags.Events['Tukui:cynametinyraid'] = 'UNIT_NAME_UPDATE PARTY_LEADER_CHANGED GROUP_ROSTER_UPDATE'
oUF.Tags.Methods['Tukui:cynametinyraid'] = function(unit)
	local name = UnitName(unit)
	local isLeader = UnitIsGroupLeader(unit)
	local isAssistant = UnitIsGroupAssistant(unit) or UnitIsRaidOfficer(unit)
	local assist, lead = "", ""
	if isAssistant then assist = "|A| " elseif isLeader then lead = "|L| " end
	return utf8sub(lead..assist..name, 7, false)
end