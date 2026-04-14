-- =============================================
--         RYZU HUB GUI - v1.0.0 BETA
--      Authors: Ryzu Dev Team
-- =============================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ==================== DESTROY OLD GUI ====================
if PlayerGui:FindFirstChild("RyzuHub") then
    PlayerGui:FindFirstChild("RyzuHub"):Destroy()
end

-- ==================== SCREEN GUI ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RyzuHub"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- ==================== MAIN FRAME ====================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 720, 0, 480)
MainFrame.Position = UDim2.new(0.5, -360, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(60, 60, 80)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- ==================== TOP BAR ====================
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 38)
TopBar.BackgroundColor3 = Color3.fromRGB(13, 13, 20)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 10)
TopBarCorner.Parent = TopBar

local TopBarFix = Instance.new("Frame")
TopBarFix.Size = UDim2.new(1, 0, 0, 10)
TopBarFix.Position = UDim2.new(0, 0, 1, -10)
TopBarFix.BackgroundColor3 = Color3.fromRGB(13, 13, 20)
TopBarFix.BorderSizePixel = 0
TopBarFix.Parent = TopBar

-- Hub Title
local HubTitle = Instance.new("TextLabel")
HubTitle.Name = "HubTitle"
HubTitle.Size = UDim2.new(0, 160, 1, 0)
HubTitle.Position = UDim2.new(0, 12, 0, 0)
HubTitle.BackgroundTransparency = 1
HubTitle.Text = "Ryzu Hub"
HubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextSize = 15
HubTitle.TextXAlignment = Enum.TextXAlignment.Left
HubTitle.Parent = TopBar

-- Version Badge
local VersionBadge = Instance.new("Frame")
VersionBadge.Name = "VersionBadge"
VersionBadge.Size = UDim2.new(0, 90, 0, 20)
VersionBadge.Position = UDim2.new(0, 100, 0.5, -10)
VersionBadge.BackgroundColor3 = Color3.fromRGB(0, 120, 220)
VersionBadge.Parent = TopBar

local VersionCorner = Instance.new("UICorner")
VersionCorner.CornerRadius = UDim.new(0, 5)
VersionCorner.Parent = VersionBadge

local VersionLabel = Instance.new("TextLabel")
VersionLabel.Size = UDim2.new(1, 0, 1, 0)
VersionLabel.BackgroundTransparency = 1
VersionLabel.Text = "v1.0.0 - BETA"
VersionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
VersionLabel.Font = Enum.Font.GothamBold
VersionLabel.TextSize = 10
VersionLabel.Parent = VersionBadge

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -34, 0.5, -14)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 13
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TopBar

local CloseBtnCorner = Instance.new("UICorner")
CloseBtnCorner.CornerRadius = UDim.new(0, 6)
CloseBtnCorner.Parent = CloseBtn

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Name = "MinBtn"
MinBtn.Size = UDim2.new(0, 28, 0, 28)
MinBtn.Position = UDim2.new(1, -68, 0.5, -14)
MinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 16
MinBtn.BorderSizePixel = 0
MinBtn.Parent = TopBar

local MinBtnCorner = Instance.new("UICorner")
MinBtnCorner.CornerRadius = UDim.new(0, 6)
MinBtnCorner.Parent = MinBtn

-- ==================== SIDEBAR ====================
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 170, 1, -38)
Sidebar.Position = UDim2.new(0, 0, 0, 38)
Sidebar.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SidebarDivider = Instance.new("Frame")
SidebarDivider.Size = UDim2.new(0, 1, 1, 0)
SidebarDivider.Position = UDim2.new(1, -1, 0, 0)
SidebarDivider.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
SidebarDivider.BorderSizePixel = 0
SidebarDivider.Parent = Sidebar

local function MakeSectionLabel(text, yPos)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -20, 0, 20)
    lbl.Position = UDim2.new(0, 10, 0, yPos)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(130, 130, 160)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 9
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = Sidebar
    return lbl
end

MakeSectionLabel("GENERAL TAB", 10)

-- ==================== CONTENT PANEL ====================
local ContentPanel = Instance.new("Frame")
ContentPanel.Name = "ContentPanel"
ContentPanel.Size = UDim2.new(1, -170, 1, -38)
ContentPanel.Position = UDim2.new(0, 170, 0, 38)
ContentPanel.BackgroundTransparency = 1
ContentPanel.Parent = MainFrame

-- ==================== TAB SYSTEM ====================
local Pages = {}
local TabButtons = {}

local function SetActiveTab(name)
    for n, page in pairs(Pages) do
        page.Visible = (n == name)
    end
    for n, btn in pairs(TabButtons) do
        if n == name then
            btn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
            btn.BackgroundTransparency = 0
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            btn.BackgroundTransparency = 1
            btn.TextColor3 = Color3.fromRGB(160, 160, 180)
        end
    end
end

local function AddPage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 120)
    page.Visible = false
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.Parent = ContentPanel
    Pages[name] = page

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 6)
    layout.Parent = page

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
    end)

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingLeft = UDim.new(0, 14)
    padding.PaddingRight = UDim.new(0, 14)
    padding.Parent = page

    return page
end

local function AddTabButton(name, yPos, icon)
    local btn = Instance.new("TextButton")
    btn.Name = name .. "Tab"
    btn.Size = UDim2.new(1, -10, 0, 34)
    btn.Position = UDim2.new(0, 5, 0, yPos)
    btn.BackgroundTransparency = 1
    btn.Text = (icon or "") .. "  " .. name
    btn.TextColor3 = Color3.fromRGB(160, 160, 180)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 12
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.BorderSizePixel = 0
    btn.Parent = Sidebar

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn

    local btnPad = Instance.new("UIPadding")
    btnPad.PaddingLeft = UDim.new(0, 10)
    btnPad.Parent = btn

    btn.MouseButton1Click:Connect(function()
        SetActiveTab(name)
    end)

    TabButtons[name] = btn
    return btn
end

-- ==================== CREATE TABS ====================
AddTabButton("Information", 32)
AddTabButton("Teleport", 72)
AddTabButton("Farming", 112)
AddTabButton("Combat", 152)
AddTabButton("Player", 192)

MakeSectionLabel("HOP TAB", 242)
AddTabButton("Sword Legend", 264)
AddTabButton("Cake Prince", 304)
AddTabButton("Elite", 344)
AddTabButton("Castle Raid", 384)
AddTabButton("Rip Indra", 424)

-- ==================== HELPER FUNCTIONS ====================
local function MakeLabel(parent, text, order)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 22)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(200, 200, 230)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.LayoutOrder = order or 1
    lbl.Parent = parent
    return lbl
end

local function MakeButton(parent, text, color, order)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 36)
    btn.BackgroundColor3 = color or Color3.fromRGB(30, 30, 55)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.BorderSizePixel = 0
    btn.LayoutOrder = order or 1
    btn.Parent = parent

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 7)
    c.Parent = btn

    local s = Instance.new("UIStroke")
    s.Color = Color3.fromRGB(60, 60, 100)
    s.Thickness = 1
    s.Parent = btn

    local orig = btn.BackgroundColor3
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.new(orig.R + 0.08, orig.G + 0.08, orig.B + 0.08)
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = orig}):Play()
    end)

    return btn
end

local function MakeToggle(parent, text, order)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 38)
    row.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
    row.BorderSizePixel = 0
    row.LayoutOrder = order or 1
    row.Parent = parent

    local rc = Instance.new("UICorner")
    rc.CornerRadius = UDim.new(0, 7)
    rc.Parent = row

    local rs = Instance.new("UIStroke")
    rs.Color = Color3.fromRGB(50, 50, 80)
    rs.Thickness = 1
    rs.Parent = row

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -60, 1, 0)
    lbl.Position = UDim2.new(0, 12, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(210, 210, 230)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 12
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row

    local toggleBg = Instance.new("Frame")
    toggleBg.Size = UDim2.new(0, 40, 0, 22)
    toggleBg.Position = UDim2.new(1, -52, 0.5, -11)
    toggleBg.BackgroundColor3 = Color3.fromRGB(50, 50, 75)
    toggleBg.BorderSizePixel = 0
    toggleBg.Parent = row

    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(1, 0)
    tCorner.Parent = toggleBg

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 16, 0, 16)
    knob.Position = UDim2.new(0, 3, 0.5, -8)
    knob.BackgroundColor3 = Color3.fromRGB(180, 180, 200)
    knob.BorderSizePixel = 0
    knob.Parent = toggleBg

    local kCorner = Instance.new("UICorner")
    kCorner.CornerRadius = UDim.new(1, 0)
    kCorner.Parent = knob

    local enabled = false
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.Parent = row

    btn.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            TweenService:Create(toggleBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 180, 100)}):Play()
            TweenService:Create(knob, TweenInfo.new(0.2), {Position = UDim2.new(0, 21, 0.5, -8), BackgroundColor3 = Color3.fromRGB(255,255,255)}):Play()
        else
            TweenService:Create(toggleBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 75)}):Play()
            TweenService:Create(knob, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, -8), BackgroundColor3 = Color3.fromRGB(180, 180, 200)}):Play()
        end
    end)

    return row
end

-- ==================== INFORMATION PAGE ====================
local InfoPage = AddPage("Information")

-- Banner
local Banner = Instance.new("Frame")
Banner.Size = UDim2.new(1, 0, 0, 90)
Banner.BackgroundColor3 = Color3.fromRGB(10, 20, 50)
Banner.BorderSizePixel = 0
Banner.LayoutOrder = 1
Banner.Parent = InfoPage

local BannerCorner = Instance.new("UICorner")
BannerCorner.CornerRadius = UDim.new(0, 8)
BannerCorner.Parent = Banner

local BannerGrad = Instance.new("UIGradient")
BannerGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 20, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 10, 50))
})
BannerGrad.Rotation = 45
BannerGrad.Parent = Banner

local BannerText = Instance.new("TextLabel")
BannerText.Size = UDim2.new(1, 0, 1, 0)
BannerText.BackgroundTransparency = 1
BannerText.Text = "* Ryzu Hub *"
BannerText.TextColor3 = Color3.fromRGB(100, 180, 255)
BannerText.Font = Enum.Font.GothamBold
BannerText.TextSize = 26
BannerText.Parent = Banner

-- Hub Info Card
local HubCard = Instance.new("Frame")
HubCard.Size = UDim2.new(1, 0, 0, 52)
HubCard.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
HubCard.BorderSizePixel = 0
HubCard.LayoutOrder = 2
HubCard.Parent = InfoPage

local HubCardCorner = Instance.new("UICorner")
HubCardCorner.CornerRadius = UDim.new(0, 8)
HubCardCorner.Parent = HubCard

local HubCardStroke = Instance.new("UIStroke")
HubCardStroke.Color = Color3.fromRGB(50, 50, 80)
HubCardStroke.Thickness = 1
HubCardStroke.Parent = HubCard

local HubName = Instance.new("TextLabel")
HubName.Size = UDim2.new(0.6, 0, 0.5, 0)
HubName.Position = UDim2.new(0, 12, 0, 6)
HubName.BackgroundTransparency = 1
HubName.Text = "Ryzu Hub"
HubName.TextColor3 = Color3.fromRGB(255, 255, 255)
HubName.Font = Enum.Font.GothamBold
HubName.TextSize = 13
HubName.TextXAlignment = Enum.TextXAlignment.Left
HubName.Parent = HubCard

local HubDesc = Instance.new("TextLabel")
HubDesc.Size = UDim2.new(0.6, 0, 0.4, 0)
HubDesc.Position = UDim2.new(0, 12, 0.52, 0)
HubDesc.BackgroundTransparency = 1
HubDesc.Text = "Script Free, Fast Update, Fast Support..."
HubDesc.TextColor3 = Color3.fromRGB(140, 140, 170)
HubDesc.Font = Enum.Font.Gotham
HubDesc.TextSize = 10
HubDesc.TextXAlignment = Enum.TextXAlignment.Left
HubDesc.Parent = HubCard

local JoinBtn = Instance.new("TextButton")
JoinBtn.Size = UDim2.new(0, 80, 0, 32)
JoinBtn.Position = UDim2.new(1, -92, 0.5, -16)
JoinBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
JoinBtn.Text = "Join"
JoinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
JoinBtn.Font = Enum.Font.GothamBold
JoinBtn.TextSize = 13
JoinBtn.BorderSizePixel = 0
JoinBtn.Parent = HubCard

local JoinCorner = Instance.new("UICorner")
JoinCorner.CornerRadius = UDim.new(0, 6)
JoinCorner.Parent = JoinBtn

-- Script Info
local ScriptInfoLabel = Instance.new("TextLabel")
ScriptInfoLabel.Size = UDim2.new(1, 0, 0, 24)
ScriptInfoLabel.BackgroundTransparency = 1
ScriptInfoLabel.Text = "Script Info"
ScriptInfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptInfoLabel.Font = Enum.Font.GothamBold
ScriptInfoLabel.TextSize = 15
ScriptInfoLabel.TextXAlignment = Enum.TextXAlignment.Left
ScriptInfoLabel.LayoutOrder = 3
ScriptInfoLabel.Parent = InfoPage

-- Info Grid (2 columns using a Frame with UIGridLayout)
local GridHolder = Instance.new("Frame")
GridHolder.Size = UDim2.new(1, 0, 0, 116)
GridHolder.BackgroundTransparency = 1
GridHolder.LayoutOrder = 4
GridHolder.Parent = InfoPage

local GridLayout = Instance.new("UIGridLayout")
GridLayout.CellSize = UDim2.new(0.48, 0, 0, 52)
GridLayout.CellPadding = UDim2.new(0.04, 0, 0, 8)
GridLayout.SortOrder = Enum.SortOrder.LayoutOrder
GridLayout.Parent = GridHolder

local function MakeGridCard(parent, labelText, order)
    local card = Instance.new("Frame")
    card.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
    card.BorderSizePixel = 0
    card.LayoutOrder = order
    card.Parent = parent

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = card

    local s = Instance.new("UIStroke")
    s.Color = Color3.fromRGB(50, 50, 80)
    s.Thickness = 1
    s.Parent = card

    local icon = Instance.new("Frame")
    icon.Size = UDim2.new(0, 28, 0, 28)
    icon.Position = UDim2.new(0, 8, 0.5, -14)
    icon.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    icon.BorderSizePixel = 0
    icon.Parent = card

    local ic = Instance.new("UICorner")
    ic.CornerRadius = UDim.new(0, 6)
    ic.Parent = icon

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -44, 1, 0)
    lbl.Position = UDim2.new(0, 44, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = Color3.fromRGB(200, 200, 220)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 10
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextWrapped = true
    lbl.Parent = card
end

MakeGridCard(GridHolder, "Script: Ryzu Hub", 1)
MakeGridCard(GridHolder, "Version: v1.0.0 - BETA", 2)
MakeGridCard(GridHolder, "Author: Ryzu Dev Team", 3)
MakeGridCard(GridHolder, "Discord: Ryzu Hub", 4)

-- Links label
local LinksLabel = Instance.new("TextLabel")
LinksLabel.Size = UDim2.new(1, 0, 0, 24)
LinksLabel.BackgroundTransparency = 1
LinksLabel.Text = "Links"
LinksLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LinksLabel.Font = Enum.Font.GothamBold
LinksLabel.TextSize = 15
LinksLabel.TextXAlignment = Enum.TextXAlignment.Left
LinksLabel.LayoutOrder = 5
LinksLabel.Parent = InfoPage

MakeButton(InfoPage, "Discord Server", Color3.fromRGB(88, 101, 242), 6)
MakeButton(InfoPage, "Script Pastebin", Color3.fromRGB(30, 30, 55), 7)

-- ==================== TELEPORT PAGE ====================
local TeleportPage = AddPage("Teleport")
MakeLabel(TeleportPage, "Teleport Locations", 1)
MakeButton(TeleportPage, "Spawn", Color3.fromRGB(30, 30, 55), 2)
MakeButton(TeleportPage, "Sword Master", Color3.fromRGB(30, 30, 55), 3)
MakeButton(TeleportPage, "Ocean Area", Color3.fromRGB(30, 30, 55), 4)
MakeButton(TeleportPage, "Mountain Peak", Color3.fromRGB(30, 30, 55), 5)
MakeButton(TeleportPage, "Boss Arena", Color3.fromRGB(55, 20, 20), 6)
MakeButton(TeleportPage, "Hidden Village", Color3.fromRGB(30, 30, 55), 7)

-- ==================== FARMING PAGE ====================
local FarmingPage = AddPage("Farming")
MakeLabel(FarmingPage, "Auto Farm Settings", 1)
MakeToggle(FarmingPage, "Auto Farm Mobs", 2)
MakeToggle(FarmingPage, "Auto Collect Items", 3)
MakeToggle(FarmingPage, "Auto Use Skills", 4)
MakeToggle(FarmingPage, "Anti AFK", 5)
MakeToggle(FarmingPage, "Auto Respawn", 6)
MakeToggle(FarmingPage, "Auto Quest", 7)

-- ==================== COMBAT PAGE ====================
local CombatPage = AddPage("Combat")
MakeLabel(CombatPage, "Combat Settings", 1)
MakeToggle(CombatPage, "Auto Attack", 2)
MakeToggle(CombatPage, "Silent Aim", 3)
MakeToggle(CombatPage, "Infinite Stamina", 4)
MakeToggle(CombatPage, "No Cooldown", 5)
MakeButton(CombatPage, "Kill All Nearby Mobs", Color3.fromRGB(80, 20, 20), 6)

-- ==================== PLAYER PAGE ====================
local PlayerPage = AddPage("Player")
MakeLabel(PlayerPage, "Player Modifications", 1)
MakeToggle(PlayerPage, "Infinite Jump", 2)
MakeToggle(PlayerPage, "Speed Hack", 3)
MakeToggle(PlayerPage, "Noclip", 4)
MakeToggle(PlayerPage, "God Mode", 5)
MakeButton(PlayerPage, "Reset Character", Color3.fromRGB(55, 20, 20), 6)

-- ==================== HOP TAB PAGES ====================
local SwordLegendPage = AddPage("Sword Legend")
MakeLabel(SwordLegendPage, "Sword Legend Features", 1)
MakeToggle(SwordLegendPage, "Auto Quest", 2)
MakeToggle(SwordLegendPage, "Auto Rank Up", 3)
MakeToggle(SwordLegendPage, "Auto Boss", 4)

local CakePrincePage = AddPage("Cake Prince")
MakeLabel(CakePrincePage, "Cake Prince Features", 1)
MakeToggle(CakePrincePage, "Auto Bake", 2)
MakeToggle(CakePrincePage, "Auto Sell", 3)

local ElitePage = AddPage("Elite")
MakeLabel(ElitePage, "Elite Features", 1)
MakeToggle(ElitePage, "Auto Elite Farm", 2)
MakeToggle(ElitePage, "Auto Elite Quest", 3)

local CastlePage = AddPage("Castle Raid")
MakeLabel(CastlePage, "Castle Raid Features", 1)
MakeToggle(CastlePage, "Auto Raid", 2)
MakeToggle(CastlePage, "Auto Defend", 3)

local RipIndraPage = AddPage("Rip Indra")
MakeLabel(RipIndraPage, "Rip Indra Features", 1)
MakeToggle(RipIndraPage, "Auto Boss Fight", 2)
MakeToggle(RipIndraPage, "Auto Loot", 3)

-- ==================== CLOSE / MINIMIZE ====================
CloseBtn.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    task.delay(0.35, function()
        ScreenGui:Destroy()
    end)
end)

local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
            Size = UDim2.new(0, 720, 0, 38)
        }):Play()
    else
        TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
            Size = UDim2.new(0, 720, 0, 480)
        }):Play()
    end
end)

-- ==================== OPEN ANIMATION ====================
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 720, 0, 480),
    Position = UDim2.new(0.5, -360, 0.5, -240)
}):Play()

-- ==================== DEFAULT TAB ====================
SetActiveTab("Information")

print("[Ryzu Hub] GUI Loaded Successfully!")
