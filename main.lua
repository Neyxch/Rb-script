---------------------------
-- 🔹1: CLICK TP
---------------------------
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()

-- Уведомление
StarterGui:SetCore("SendNotification", {
    Title = "Script",
    Text = "creator by: neyxch",
    Duration = 3
})
-- End
function GetCharacter()
   return game.Players.LocalPlayer.Character
end

function Teleport(pos)
   local Char = GetCharacter()
   if Char then
       Char:MoveTo(pos)
   end
end

UIS.InputBegan:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
       Teleport(Mouse.Hit.p)
   end
end)
---------------------------
-- 🔹2: REJOIN GUI
---------------------------
local TeleportService = game:GetService("TeleportService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 120, 0, 40)
Button.Position = UDim2.new(0, 10, 0, 10)
Button.Text = "REJOIN"
Button.Parent = ScreenGui

Button.MouseButton1Click:Connect(function()
    TeleportService:Teleport(game.PlaceId, Player)
end)
