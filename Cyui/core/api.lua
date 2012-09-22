local T, C, L, G = unpack(Tukui)

local function CreateBorder(f)
	local frame = CreateFrame("Frame", nil, f)
	frame:Point("TOPLEFT", f, "TOPLEFT", -2, 2)
	frame:Point("BOTTOMRIGHT", f, "BOTTOMRIGHT", 2, -2)
	frame:SetTemplate("Default")
	frame:SetFrameLevel(f:GetFrameLevel())
	f.border = frame
end

T.CyPostCreateAura = function(self, button)
	button:SetTemplate("Default")
	
	button.remaining = T.SetFontString(button, C["media"].font, C["unitframes"].auratextscale, "THINOUTLINE")
	button.remaining:Point("CENTER", 1, 0)
	
	button.cd.noOCC = true -- hide OmniCC CDs, because we  create our own cd with CreateAuraTimer()
	button.cd.noCooldownCount = true -- hide CDC CDs, because we create our own cd with CreateAuraTimer()
	
	button.cd:SetReverse()
	button.icon:Point("TOPLEFT", 2, -2)
	button.icon:Point("BOTTOMRIGHT", -2, 2)
	button.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	button.icon:SetDrawLayer('ARTWORK')
	
	button.count:Point("BOTTOMRIGHT", 3, 3)
	button.count:SetJustifyH("RIGHT")
	button.count:SetFont(C["media"].font, 9, "THICKOUTLINE")
	button.count:SetTextColor(0.84, 0.75, 0.65)
	
	button.overlayFrame = CreateFrame("frame", nil, button, nil)
	button.cd:SetFrameLevel(button:GetFrameLevel() + 1)
	button.cd:ClearAllPoints()
	button.cd:Point("TOPLEFT", button, "TOPLEFT", 2, -2)
	button.cd:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", -2, 2)
	button.overlayFrame:SetFrameLevel(button.cd:GetFrameLevel() + 1)	   
	button.overlay:SetParent(button.overlayFrame)
	button.count:SetParent(button.overlayFrame)
	button.remaining:SetParent(button.overlayFrame)
			
	-- button.Glow = CreateFrame("Frame", nil, button)
	-- button.Glow:Point("TOPLEFT", button, "TOPLEFT", -3, 3)
	-- button.Glow:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", 3, -3)
	-- button.Glow:SetFrameStrata("BACKGROUND")	
	-- button.Glow:SetBackdrop{edgeFile = C["media"].glowTex, edgeSize = 3, insets = {left = 0, right = 0, top = 0, bottom = 0}}
	-- button.Glow:SetBackdropColor(0, 0, 0, 0)
	-- button.Glow:SetBackdropBorderColor(0, 0, 0)
	
	local Animation = button:CreateAnimationGroup()
	Animation:SetLooping("BOUNCE")

	local FadeOut = Animation:CreateAnimation("Alpha")
	FadeOut:SetChange(-.9)
	FadeOut:SetDuration(.6)
	FadeOut:SetSmoothing("IN_OUT")

	button.Animation = Animation
end

local function FadeIn(frame)
	UIFrameFadeIn(frame, .2, frame:GetAlpha(), 1)
end

local function FadeOut(frame)
	UIFrameFadeOut(frame, .5, frame:GetAlpha(), 0)
end

local function addapi(object)
	local mt = getmetatable(object).__index
	
	if not object.CreateBorder then mt.CreateBorder = CreateBorder end
	if not object.SetBorder then mt.SetBorder = SetBorder end
	if not object.FadeIn then mt.FadeIn = FadeIn end
	if not object.FadeOut then mt.FadeOut = FadeOut end
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