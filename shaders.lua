local light = game.Lighting
for i, v in pairs(light:GetChildren()) do
	v:Destroy()
end

local ter = workspace.Terrain
local color = Instance.new("ColorCorrectionEffect")
local bloom = Instance.new("BloomEffect")
local sun = Instance.new("SunRaysEffect")
local blur = Instance.new("BlurEffect")

color.Parent = light
bloom.Parent = light
sun.Parent = light
blur.Parent = light


local config = {

	Terrain = true;
	ColorCorrection = true;
	Sun = true;
	Lighting = true;
	BloomEffect = true;
	
}


color.Enabled = true
color.Contrast = 0.15
color.Brightness = 0.1
color.Saturation = 0.2
color.TintColor = Color3.fromRGB(255, 222, 211)

bloom.Enabled = true
bloom.Intensity = 0.3

sun.Enabled = true
sun.Intensity = 1
sun.Spread = 5

bloom.Enabled = true
bloom.Intensity = 0.05
bloom.Size = 32
bloom.Threshold = 1

blur.Enabled = true
blur.Size = 2



if config.ColorCorrection then
	color.Enabled = true
end


if config.Sun then
	sun.Enabled = true
end


if config.Terrain then
	ter.WaterColor = Color3.fromRGB(10, 10, 24)
	ter.WaterWaveSize = 0.1
	ter.WaterWaveSpeed = 22
	ter.WaterTransparency = 0.9
	ter.WaterReflectance = 0.05
end


if config.Lighting then
	light.Ambient = Color3.fromRGB(120, 31, 42)
	light.Brightness = 3.5
	light.ColorShift_Bottom = Color3.fromRGB(12, 31, 42)
	light.ColorShift_Top = Color3.fromRGB(12, 31, 42)
	light.ExposureCompensation = 0
	light.FogColor = Color3.fromRGB(132, 132, 132)
	light.GlobalShadows = true
	light.OutdoorAmbient = Color3.fromRGB(112, 117, 128)
	light.Outlines = true
end
