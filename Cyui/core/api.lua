local T, C, L, G = unpack(Tukui)

local function CreateBorder(f)
	local frame = CreateFrame("Frame", nil, f)
	frame:Point("TOPLEFT", f, "TOPLEFT", -2, 2)
	frame:Point("BOTTOMRIGHT", f, "BOTTOMRIGHT", 2, -2)
	frame:SetTemplate("Default")
	frame:SetFrameLevel(f:GetFrameLevel())
	f.border = frame
end

local function addapi(object)
	local mt = getmetatable(object).__index
	if not object.CreateBorder then mt.CreateBorder = CreateBorder end
	if not object.SetBorder then mt.SetBorder = SetBorder end
end

local handled = {["Frame"] = true}
local object = CreateFrame("Frame")
addapi(object)
addapi(object:CreateTexture())
addapi(object:CreateFontString())

object = EnumerateFrames()
while object do
	if not handled[object:GetObjectType()] then
		addapi(object)
		handled[object:GetObjectType()] = true
	end

	object = EnumerateFrames(object)
end