local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Reko Hub 1.0",
    SubTitle = "by Haruto",
    TabWidth = 260,
    Size = UDim2.fromOffset(680,380),
    Acrylic = true,
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
    Universal = Window:AddTab({ Title = "Universal Feature", Icon = "globe" })
}

local Options = Fluent.Options

do
    -- Main
    Tabs.Main:AddParagraph({
        Title = "Reko Hub",
        Content = "Please wait for update feature"
    })

    -- Universal
    Tabs.Universal:AddButton({
        Title = "Anti AFK",
        Description = "Bypass roblox kick when afk 100%",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TsumugiHaruto/nothing/main/antiafk.lua"))()
                Fluent:Notify({
                    Title = "Reko Hub",
                    Content = "Anti AFK enabled",
                    Theme = "Aqua",
                    Duration = 5
                })
        end
    })

    Tabs.Universal:AddButton({
        Title = "ESP",
        Description = "Fully show player",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TsumugiHaruto/nothing/main/esp.lua"))()
                Fluent:Notify({
                    Title = "Reko Hub",
                    Content = "ESP enabled",
                    Theme = "Aqua",
                    Duration = 5
                })
        end
    })
end
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "Reko Hub",
    Content = "The script has been loaded.",
    Theme = "Aqua",
    Duration = 8
})
SaveManager:LoadAutoloadConfig()
