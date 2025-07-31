-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-30 20:34:50
-- Luau version 6, Types version 3
-- Time taken: 0.130225 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local var21_upvw
local var22_upvw = "All"
local var23_upvw = false
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CategoryList = require(ReplicatedStorage.Data.CategoryList)
local InventoryServiceEnums_upvr = require(ReplicatedStorage.Data.EnumRegistry.InventoryServiceEnums)
local ItemTypeEnums_upvr = require(ReplicatedStorage.Data.EnumRegistry.ItemTypeEnums)
local InventorySortingController_upvr = require(ReplicatedStorage.Modules.InventorySortingController)
local var29_upvw
if not game:GetService("GuiService"):IsTenFootInterface() then
end
for _, v in CategoryList do
	({})[v.Name] = v
	local var31_upvr
end
local function IsOfCategory_upvr(arg1) -- Line 38, Named "IsOfCategory"
	--[[ Upvalues[4]:
		[1]: var22_upvw (read and write)
		[2]: var31_upvr (readonly)
		[3]: InventoryServiceEnums_upvr (readonly)
		[4]: ItemTypeEnums_upvr (readonly)
	]]
	if not arg1 then
		return false
	end
	if var22_upvw == "All" then
		return true
	end
	local var34 = var31_upvr[var22_upvw]
	if not var34 then
		return false
	end
	for _, v_2 in var34.Tags do
		if arg1:GetAttribute(InventoryServiceEnums_upvr.ITEM_TYPE) == ItemTypeEnums_upvr[v_2] or arg1:GetAttribute("ItemType") == v_2 then
			return true
		end
	end
	return false
end
local function _(arg1) -- Line 68, Named "GetCategory"
	--[[ Upvalues[3]:
		[1]: var31_upvr (readonly)
		[2]: InventoryServiceEnums_upvr (readonly)
		[3]: ItemTypeEnums_upvr (readonly)
	]]
	for i_3, v_3 in var31_upvr do
		for _, v_4 in v_3 do
			if arg1:GetAttribute(InventoryServiceEnums_upvr.ITEM_TYPE) == ItemTypeEnums_upvr[i_3] or arg1:GetAttribute("ItemType") == v_4 then
				return i_3
			end
		end
	end
	return "All"
end
local module_upvr_2 = {
	OpenClose = nil;
	IsOpen = false;
	StateChanged = Instance.new("BindableEvent");
	ModuleName = "Backpack";
	KeepVRTopbarOpen = true;
	VRIsExclusive = true;
	VRClosesNonExclusive = true;
}
local BackgroundColor_upvr = script:GetAttribute("BackgroundColor")
local tbl_6 = {Enum.KeyCode.Backquote}
local Api = script:WaitForChild("Api")
Api.Parent = game.ReplicatedStorage
local Favorite_Item_upvr = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Favorite_Item")
local var44_upvw
local var45_upvw = true
local Value_upvr = Enum.KeyCode.Backspace.Value
local tbl_2_upvr = {
	[Enum.UserInputType.Gamepad1] = true;
	[Enum.UserInputType.Gamepad2] = true;
	[Enum.UserInputType.Gamepad3] = true;
	[Enum.UserInputType.Gamepad4] = true;
	[Enum.UserInputType.Gamepad5] = true;
	[Enum.UserInputType.Gamepad6] = true;
	[Enum.UserInputType.Gamepad7] = true;
	[Enum.UserInputType.Gamepad8] = true;
}
local UserInputService_upvr = game:GetService("UserInputService")
local Players = game:GetService("Players")
local StarterGui_upvr = game:GetService("StarterGui")
local GuiService_upvr = game:GetService("GuiService")
local ScreenGui = Instance.new("ScreenGui", Players.LocalPlayer.PlayerGui)
ScreenGui.DisplayOrder = 120
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "BackpackGui"
local ContextActionService_upvr = game:GetService("ContextActionService")
local VRService_upvr = game:GetService("VRService")
local Utility_upvr = require(script.Utility)
local any_IsTenFootInterface_result1_upvr = GuiService_upvr:IsTenFootInterface()
if any_IsTenFootInterface_result1_upvr then
	local var61_upvw = 100
end
local var62_upvw = false
local TouchEnabled = UserInputService_upvr.TouchEnabled
if TouchEnabled then
	if (function() -- Line 151
		local ScreenGui_2 = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
		local Frame_2 = Instance.new("Frame", ScreenGui_2)
		Frame_2.BackgroundTransparency = 1
		Frame_2.Size = UDim2.new(1, 0, 1, 0)
		ScreenGui_2:Destroy()
		return Frame_2.AbsoluteSize
	end)().X >= 1024 then
		TouchEnabled = false
	else
		TouchEnabled = true
	end
end
local LocalPlayer_upvr = Players.LocalPlayer
local var65_upvw
local var66_upvw
local var67_upvw
local var68_upvw
local var69_upvw
local var70_upvw
var29_upvw = LocalPlayer_upvr.Character
if not var29_upvw then
	var29_upvw = LocalPlayer_upvr.CharacterAdded:Wait()
end
local class_Humanoid_upvw = var29_upvw:FindFirstChildOfClass("Humanoid")
local Backpack_upvw = LocalPlayer_upvr:WaitForChild("Backpack")
local any_new_result1_upvr = require(game:GetService("ReplicatedStorage").Modules.Icon).new()
any_new_result1_upvr:setImage("rbxasset://textures/ui/TopBar/inventoryOff.png", "deselected")
any_new_result1_upvr:setImage("rbxasset://textures/ui/TopBar/inventoryOn.png", "selected")
any_new_result1_upvr:bindToggleKey(tbl_6[1], tbl_6[2])
any_new_result1_upvr:setName("InventoryIcon")
any_new_result1_upvr:setImageScale(1.12)
any_new_result1_upvr:setOrder(-5)
any_new_result1_upvr:setCaption("Toggle the backpack.")
any_new_result1_upvr.deselectWhenOtherIconSelected = false
local tbl_8_upvr = {}
local var75_upvw
local tbl_10_upvr = {}
local tbl_upvr_2 = {}
local tbl_9_upvr = {}
local var79_upvw = 0
local var80_upvw = false
local var81_upvw = false
local var82_upvw = false
local var83_upvw = false
local var84_upvw = 0
local VREnabled_upvr = VRService_upvr.VREnabled
if not VREnabled_upvr or not script:GetAttribute("EmptySlots") then
	if TouchEnabled then
		local _ = 5
	else
	end
end
if VREnabled_upvr then
elseif TouchEnabled then
else
end
local var87_upvw
local function _(arg1) -- Line 255, Named "EvaluateBackpackPanelVisibility"
	--[[ Upvalues[3]:
		[1]: any_new_result1_upvr (readonly)
		[2]: var45_upvw (read and write)
		[3]: VRService_upvr (readonly)
	]]
	local var90 = arg1
	if var90 then
		var90 = any_new_result1_upvr.enabled
		if var90 then
			var90 = var45_upvw
			if var90 then
				var90 = VRService_upvr.VREnabled
			end
		end
	end
	return var90
end
local function _() -- Line 259, Named "ShowVRBackpackPopup"
end
local var91_upvw = 24
local function NewGui_upvr(arg1, arg2) -- Line 265, Named "NewGui"
	--[[ Upvalues[1]:
		[1]: var91_upvw (read and write)
	]]
	local any_3 = Instance.new(arg1)
	any_3.Name = arg2
	any_3.BackgroundColor3 = Color3.new(0, 0, 0)
	any_3.BackgroundTransparency = 1
	any_3.BorderColor3 = Color3.new(0, 0, 0)
	any_3.BorderSizePixel = 0
	any_3.Size = UDim2.new(1, 0, 1, 0)
	if arg1:match("Text") then
		any_3.TextColor3 = Color3.new(1, 1, 1)
		any_3.Text = ""
		any_3.FontFace = script:GetAttribute("LabelFont")
		any_3.TextSize = var91_upvw
		any_3.TextWrapped = true
		if arg1 == "TextButton" then
			any_3.FontFace = script:GetAttribute("SlotFont")
		end
	end
	return any_3
end
local FullSlots_upvr = script:GetAttribute("FullSlots")
local function _() -- Line 286, Named "FindLowestEmpty"
	--[[ Upvalues[2]:
		[1]: FullSlots_upvr (readonly)
		[2]: tbl_8_upvr (readonly)
	]]
	for i_5 = 1, FullSlots_upvr do
		local var96 = tbl_8_upvr[i_5]
		if not var96.Tool then
			return var96
		end
	end
	return nil
end
local function _() -- Line 296, Named "isInventoryEmpty"
	--[[ Upvalues[2]:
		[1]: FullSlots_upvr (readonly)
		[2]: tbl_8_upvr (readonly)
	]]
	for i_6 = FullSlots_upvr + 1, #tbl_8_upvr do
		local var98 = tbl_8_upvr[i_6]
		if var98 and var98.Tool then
			return false
		end
	end
	return true
end
local function _() -- Line 306, Named "UseGazeSelection"
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	return UserInputService_upvr.VREnabled
end
local function AdjustHotbarFrames_upvr() -- Line 310, Named "AdjustHotbarFrames"
	--[[ Upvalues[4]:
		[1]: var67_upvw (read and write)
		[2]: FullSlots_upvr (readonly)
		[3]: var79_upvw (read and write)
		[4]: tbl_8_upvr (readonly)
	]]
	local Visible = var67_upvw.Visible
	local var102
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var102 = FullSlots_upvr
		return var102
	end
	if not Visible or not INLINED() then
		var102 = var79_upvw
	end
	if 1 > var102 then
	else
	end
	for i_7 = 1, FullSlots_upvr do
		local var103 = tbl_8_upvr[i_7]
		if var103 and (var103.Tool or Visible) then
			var103:Readjust(0 + 1, var102)
			var103.Frame.Visible = true
		elseif var103 then
			var103.Frame.Visible = false
		end
	end
end
local function UpdateScrollingFrameCanvasSize_upvr() -- Line 328, Named "UpdateScrollingFrameCanvasSize"
	--[[ Upvalues[3]:
		[1]: var69_upvw (read and write)
		[2]: var61_upvw (read and write)
		[3]: var70_upvw (read and write)
	]]
	var69_upvw.CanvasSize = UDim2.new(0, 0, 0, math.ceil((#var70_upvw:GetChildren() - 1) / math.floor(var69_upvw.AbsoluteSize.X / (var61_upvw + 5))) * (var61_upvw + 5) + 5)
end
local function AdjustInventoryFrames_upvr() -- Line 335, Named "AdjustInventoryFrames"
	--[[ Upvalues[3]:
		[1]: FullSlots_upvr (readonly)
		[2]: tbl_8_upvr (readonly)
		[3]: UpdateScrollingFrameCanvasSize_upvr (readonly)
	]]
	for i_8 = FullSlots_upvr + 1, #tbl_8_upvr do
		local var106 = tbl_8_upvr[i_8]
		if var106 then
			local Index_4 = var106.Index
			var106.Frame.LayoutOrder = Index_4
			if var106.Tool == nil then
				Index_4 = false
			else
				Index_4 = true
			end
			var106.Frame.Visible = Index_4
		end
	end
	UpdateScrollingFrameCanvasSize_upvr()
end
local const_number_upvr = 4
local function _(arg1, arg2, arg3) -- Line 380, Named "Clamp"
	return math.min(arg2, math.max(arg1, arg3))
end
local function _(arg1, arg2, arg3) -- Line 384, Named "CheckBounds"
	local AbsolutePosition_4 = arg1.AbsolutePosition
	local AbsoluteSize_2 = arg1.AbsoluteSize
	local var115 = false
	if AbsolutePosition_4.X < arg2 then
		var115 = false
		if arg2 <= AbsolutePosition_4.X + AbsoluteSize_2.X then
			var115 = false
			if AbsolutePosition_4.Y < arg3 then
				if arg3 > AbsolutePosition_4.Y + AbsoluteSize_2.Y then
					var115 = false
				else
					var115 = true
				end
			end
		end
	end
	return var115
end
local function _(arg1, arg2) -- Line 390, Named "GetOffset"
	return (arg1.AbsolutePosition + arg1.AbsoluteSize / 2 - arg2).magnitude
end
local function _() -- Line 395, Named "UnequipAllTools"
	--[[ Upvalues[1]:
		[1]: class_Humanoid_upvw (read and write)
	]]
	if class_Humanoid_upvw then
		class_Humanoid_upvw:UnequipTools()
	end
end
local function _(arg1) -- Line 401, Named "EquipNewTool"
	--[[ Upvalues[2]:
		[1]: class_Humanoid_upvw (read and write)
		[2]: var29_upvw (read and write)
	]]
	if class_Humanoid_upvw then
		class_Humanoid_upvw:UnequipTools()
	end
	arg1.Parent = var29_upvw
end
local function _(arg1) -- Line 406, Named "ToggleFavoriteTool"
	--[[ Upvalues[1]:
		[1]: Favorite_Item_upvr (readonly)
	]]
	local Tool_21 = arg1.Tool
	if not Tool_21 then
	else
		if workspace:GetAttribute("InTutorial") then return end
		Favorite_Item_upvr:FireServer(Tool_21)
	end
end
local function IsEquipped(arg1) -- Line 419
	--[[ Upvalues[1]:
		[1]: var29_upvw (read and write)
	]]
	local var117 = arg1
	if var117 then
		if arg1.Parent ~= var29_upvw then
			var117 = false
		else
			var117 = true
		end
	end
	return var117
end
local any_IsStudio_result1_upvr = game:GetService("RunService"):IsStudio()
local SlotLockedTransparency_upvr = script:GetAttribute("SlotLockedTransparency")
local DraggableColor_upvr = script:GetAttribute("DraggableColor")
local EquippedColor_upvr = script:GetAttribute("EquippedColor")
local var122_upvw
local BorderColor_upvr = script:GetAttribute("BorderColor")
local Value_upvr_2 = Enum.KeyCode.Zero.Value
local var125_upvw
local function MakeSlot_upvr(arg1, arg2) -- Line 425, Named "MakeSlot"
	--[[ Upvalues[41]:
		[1]: tbl_8_upvr (readonly)
		[2]: any_IsStudio_result1_upvr (readonly)
		[3]: VRService_upvr (readonly)
		[4]: SlotLockedTransparency_upvr (readonly)
		[5]: DraggableColor_upvr (readonly)
		[6]: BackgroundColor_upvr (readonly)
		[7]: var66_upvw (read and write)
		[8]: var61_upvw (read and write)
		[9]: InventoryServiceEnums_upvr (readonly)
		[10]: FullSlots_upvr (readonly)
		[11]: var67_upvw (read and write)
		[12]: UserInputService_upvr (readonly)
		[13]: var79_upvw (read and write)
		[14]: var80_upvw (read and write)
		[15]: var62_upvw (read and write)
		[16]: ContextActionService_upvr (readonly)
		[17]: tbl_10_upvr (readonly)
		[18]: var75_upvw (read and write)
		[19]: var29_upvw (read and write)
		[20]: var87_upvw (read and write)
		[21]: NewGui_upvr (readonly)
		[22]: EquippedColor_upvr (readonly)
		[23]: tbl_9_upvr (readonly)
		[24]: any_new_result1_upvr (readonly)
		[25]: var122_upvw (read and write)
		[26]: UpdateScrollingFrameCanvasSize_upvr (readonly)
		[27]: var44_upvw (read and write)
		[28]: class_Humanoid_upvw (read and write)
		[29]: Backpack_upvw (read and write)
		[30]: BorderColor_upvr (readonly)
		[31]: Favorite_Item_upvr (readonly)
		[32]: MakeSlot_upvr (readonly)
		[33]: var70_upvw (read and write)
		[34]: var82_upvw (read and write)
		[35]: tbl_upvr_2 (readonly)
		[36]: Value_upvr_2 (readonly)
		[37]: LocalPlayer_upvr (readonly)
		[38]: InventorySortingController_upvr (readonly)
		[39]: var125_upvw (read and write)
		[40]: var21_upvw (read and write)
		[41]: var69_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var411 = arg2
	if not var411 then
		var411 = #tbl_8_upvr + 1
	end
	local var412 = var411
	local module_upvr_3 = {
		Tool = nil;
		Index = var412;
		Frame = nil;
	}
	local var414_upvw
	local var415_upvw
	local var416_upvw
	local var417_upvw
	local var418_upvw
	local var419_upvw
	local var420_upvw
	local var421_upvw
	local function _() -- Line 451, Named "IsDraggable"
		--[[ Upvalues[2]:
			[1]: any_IsStudio_result1_upvr (copied, readonly)
			[2]: var414_upvw (read and write)
		]]
		if any_IsStudio_result1_upvr then
			return var414_upvw:GetAttribute("Draggable")
		end
		return var414_upvw.Draggable
	end
	local function UpdateSlotFading_upvr() -- Line 461, Named "UpdateSlotFading"
		--[[ Upvalues[6]:
			[1]: VRService_upvr (copied, readonly)
			[2]: var414_upvw (read and write)
			[3]: any_IsStudio_result1_upvr (copied, readonly)
			[4]: SlotLockedTransparency_upvr (copied, readonly)
			[5]: DraggableColor_upvr (copied, readonly)
			[6]: BackgroundColor_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		-- KONSTANTERROR: [0] 1. Error Block 26 start (CF ANALYSIS FAILED)
		var414_upvw.SelectionImageObject = nil
		local var422
		if any_IsStudio_result1_upvr then
			var422 = var414_upvw:GetAttribute("Draggable")
		else
			var422 = var414_upvw.Draggable
		end
		if var422 then
		else
		end
		var414_upvw.BackgroundTransparency = SlotLockedTransparency_upvr
		if any_IsStudio_result1_upvr then
			var422 = var414_upvw:GetAttribute("Draggable")
		else
			var422 = var414_upvw.Draggable
		end
		-- KONSTANTERROR: [0] 1. Error Block 26 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [38] 32. Error Block 19 start (CF ANALYSIS FAILED)
		if not DraggableColor_upvr then
			-- KONSTANTERROR: [40] 34. Error Block 15 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [40] 34. Error Block 15 end (CF ANALYSIS FAILED)
		end
		var414_upvw.BackgroundColor3 = BackgroundColor_upvr
		-- KONSTANTERROR: [38] 32. Error Block 19 end (CF ANALYSIS FAILED)
	end
	function module_upvr_3.Readjust(arg1_27, arg2_14, arg3) -- Line 487
		--[[ Upvalues[3]:
			[1]: var66_upvw (copied, read and write)
			[2]: var61_upvw (copied, read and write)
			[3]: var414_upvw (read and write)
		]]
		var414_upvw.Position = UDim2.new(0, var66_upvw.Size.X.Offset / 2 - var61_upvw / 2 + (var61_upvw + 5) * ((arg2_14) - (arg3 / 2 + 0.5)), 0, 5)
	end
	function module_upvr_3.Fill(arg1_28, arg2_15) -- Line 495
		--[[ Upvalues[19]:
			[1]: var419_upvw (read and write)
			[2]: InventoryServiceEnums_upvr (copied, readonly)
			[3]: module_upvr_3 (readonly)
			[4]: var416_upvw (read and write)
			[5]: var417_upvw (read and write)
			[6]: var421_upvw (read and write)
			[7]: var418_upvw (read and write)
			[8]: FullSlots_upvr (copied, readonly)
			[9]: var67_upvw (copied, read and write)
			[10]: UserInputService_upvr (copied, readonly)
			[11]: any_IsStudio_result1_upvr (copied, readonly)
			[12]: var414_upvw (read and write)
			[13]: var79_upvw (copied, read and write)
			[14]: var80_upvw (copied, read and write)
			[15]: var62_upvw (copied, read and write)
			[16]: ContextActionService_upvr (copied, readonly)
			[17]: tbl_10_upvr (copied, readonly)
			[18]: var75_upvw (copied, read and write)
			[19]: tbl_8_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 45 start (CF ANALYSIS FAILED)
		if var419_upvw then
			var419_upvw:Disconnect()
			var419_upvw = nil
		end
		if not arg2_15 then
			return arg1_28:Clear()
		end
		arg1_28.Tool = arg2_15
		var419_upvw = arg2_15:GetAttributeChangedSignal(InventoryServiceEnums_upvr.Favorite):Connect(function() -- Line 507
			--[[ Upvalues[3]:
				[1]: module_upvr_3 (copied, readonly)
				[2]: arg2_15 (readonly)
				[3]: InventoryServiceEnums_upvr (copied, readonly)
			]]
			module_upvr_3.Frame.FavIcon.Visible = arg2_15:GetAttribute(InventoryServiceEnums_upvr.Favorite)
		end)
		xpcall(function() -- Line 511
			--[[ Upvalues[3]:
				[1]: module_upvr_3 (copied, readonly)
				[2]: arg2_15 (readonly)
				[3]: InventoryServiceEnums_upvr (copied, readonly)
			]]
			module_upvr_3.Frame.FavIcon.Visible = arg2_15:GetAttribute(InventoryServiceEnums_upvr.Favorite)
		end, warn)
		local function assignToolData_upvr() -- Line 515, Named "assignToolData"
			--[[ Upvalues[4]:
				[1]: arg2_15 (readonly)
				[2]: var416_upvw (copied, read and write)
				[3]: var417_upvw (copied, read and write)
				[4]: var421_upvw (copied, read and write)
			]]
			local TextureId_3 = arg2_15.TextureId
			var416_upvw.Image = TextureId_3
			if TextureId_3 ~= "" then
				var417_upvw.Visible = false
			end
			if string.find(arg2_15.Name, "Strawberry") then
				var417_upvw.TextSize = 12
			end
			var417_upvw.Text = arg2_15.Name
			if var421_upvw and arg2_15:IsA("Tool") then
				var421_upvw.Text = arg2_15.ToolTip
				local var426 = var421_upvw.TextBounds.X + 24
				var421_upvw.Size = UDim2.new(0, var426, 0, 24)
				var421_upvw.Position = UDim2.new(0.5, -var426 / 2, 0, -28)
			end
		end
		assignToolData_upvr()
		if var418_upvw then
			var418_upvw:disconnect()
			var418_upvw = nil
		end
		local any_connect_result1_2 = arg2_15.Changed:connect(function(arg1_29) -- Line 565
			--[[ Upvalues[1]:
				[1]: assignToolData_upvr (readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [2] 2. Error Block 2 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [2] 2. Error Block 2 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [6] 4. Error Block 7 start (CF ANALYSIS FAILED)
			assignToolData_upvr()
			-- KONSTANTERROR: [6] 4. Error Block 7 end (CF ANALYSIS FAILED)
		end)
		var418_upvw = any_connect_result1_2
		if arg1_28.Index > FullSlots_upvr then
			any_connect_result1_2 = false
		else
			any_connect_result1_2 = true
		end
		if not any_connect_result1_2 or var67_upvw.Visible or not UserInputService_upvr.VREnabled then
			if any_IsStudio_result1_upvr then
				var414_upvw:SetAttribute("Draggable", true)
			else
				var414_upvw.Draggable = true
			end
		end
		arg1_28:UpdateEquipView()
		if any_connect_result1_2 then
			var79_upvw += 1
			if var80_upvw and 1 <= var79_upvw and not var62_upvw then
				var62_upvw = true
				ContextActionService_upvr:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			end
		end
		tbl_10_upvr[arg2_15] = arg1_28
		local _ = 1
		-- KONSTANTERROR: [0] 1. Error Block 45 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [132] 109. Error Block 27 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [132] 109. Error Block 27 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [125] 103. Error Block 36 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if not Enum.KeyCode.ButtonL1 then
			-- KONSTANTWARNING: GOTO [134] #111
		end
		-- KONSTANTERROR: [125] 103. Error Block 36 end (CF ANALYSIS FAILED)
	end
	function module_upvr_3.UpdateIndex(arg1_30, arg2_16) -- Line 606
		arg1_30.Index = arg2_16
		arg1_30.Frame.Name = tostring(arg2_16)
		arg1_30.Frame.LayoutOrder = arg2_16
	end
	function module_upvr_3.Clear(arg1_31) -- Line 612
		--[[ Upvalues[14]:
			[1]: var418_upvw (read and write)
			[2]: var419_upvw (read and write)
			[3]: var416_upvw (read and write)
			[4]: var417_upvw (read and write)
			[5]: var421_upvw (read and write)
			[6]: any_IsStudio_result1_upvr (copied, readonly)
			[7]: var414_upvw (read and write)
			[8]: FullSlots_upvr (copied, readonly)
			[9]: var79_upvw (copied, read and write)
			[10]: var62_upvw (copied, read and write)
			[11]: ContextActionService_upvr (copied, readonly)
			[12]: tbl_10_upvr (copied, readonly)
			[13]: var75_upvw (copied, read and write)
			[14]: tbl_8_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 32 start (CF ANALYSIS FAILED)
		if not arg1_31.Tool then return end
		if var418_upvw then
			var418_upvw:disconnect()
			var418_upvw = nil
		end
		if var419_upvw then
			var419_upvw:disconnect()
			var419_upvw = nil
		end
		var416_upvw.Image = ""
		var417_upvw.Text = ""
		if var421_upvw then
			var421_upvw.Text = ""
			var421_upvw.Visible = false
		end
		if any_IsStudio_result1_upvr then
			var414_upvw:SetAttribute("Draggable", false)
		else
			var414_upvw.Draggable = false
		end
		var414_upvw.FavIcon.Visible = false
		arg1_31:UpdateEquipView(true)
		if arg1_31.Index <= FullSlots_upvr then
			var79_upvw -= 1
			if var79_upvw < 1 then
				var62_upvw = false
				ContextActionService_upvr:UnbindAction("RBXHotbarEquip")
			end
		end
		tbl_10_upvr[arg1_31.Tool] = nil
		arg1_31.Tool = nil
		local _ = 1
		-- KONSTANTERROR: [0] 1. Error Block 32 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [99] 81. Error Block 19 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [99] 81. Error Block 19 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [92] 75. Error Block 26 start (CF ANALYSIS FAILED)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [99.6]
		if not nil then
			-- KONSTANTWARNING: GOTO [101] #83
		end
		-- KONSTANTERROR: [92] 75. Error Block 26 end (CF ANALYSIS FAILED)
	end
	function module_upvr_3.UpdateEquipView(arg1_32, arg2_17) -- Line 659
		--[[ Upvalues[8]:
			[1]: var29_upvw (copied, read and write)
			[2]: var87_upvw (copied, read and write)
			[3]: module_upvr_3 (readonly)
			[4]: var420_upvw (read and write)
			[5]: NewGui_upvr (copied, readonly)
			[6]: var414_upvw (read and write)
			[7]: EquippedColor_upvr (copied, readonly)
			[8]: UpdateSlotFading_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [1] 2. Error Block 22 start (CF ANALYSIS FAILED)
		local Tool_6 = arg1_32.Tool
		local var432 = Tool_6
		if var432 then
			if Tool_6.Parent ~= var29_upvw then
				var432 = false
			else
				var432 = true
			end
		end
		if var432 then
			var87_upvw = module_upvr_3
			if not var420_upvw then
				var420_upvw = NewGui_upvr("Frame", "Equipped")
				var420_upvw.ZIndex = var414_upvw.ZIndex
				local UICorner_3 = Instance.new("UICorner")
				UICorner_3.CornerRadius = script:GetAttribute("CornerRadius")
				UICorner_3.Parent = var420_upvw
				local UIStroke_2 = Instance.new("UIStroke")
				UIStroke_2.Color = EquippedColor_upvr
				UIStroke_2.Thickness = 3
				UIStroke_2.Parent = var420_upvw
			end
			var420_upvw.Parent = var414_upvw
		else
			-- KONSTANTERROR: [61] 47. Error Block 17 start (CF ANALYSIS FAILED)
			if var420_upvw then
				var420_upvw.Parent = nil
			end
			-- KONSTANTERROR: [61] 47. Error Block 17 end (CF ANALYSIS FAILED)
		end
		UpdateSlotFading_upvr()
		-- KONSTANTERROR: [1] 2. Error Block 22 end (CF ANALYSIS FAILED)
	end
	function module_upvr_3.IsEquipped(arg1_33) -- Line 685
		--[[ Upvalues[1]:
			[1]: var29_upvw (copied, read and write)
		]]
		local Tool_28 = arg1_33.Tool
		local var436 = Tool_28
		if var436 then
			if Tool_28.Parent ~= var29_upvw then
				var436 = false
			else
				var436 = true
			end
		end
		return var436
	end
	function module_upvr_3.Delete(arg1_34) -- Line 689
		--[[ Upvalues[6]:
			[1]: tbl_9_upvr (copied, readonly)
			[2]: var414_upvw (read and write)
			[3]: any_new_result1_upvr (copied, readonly)
			[4]: var122_upvw (copied, read and write)
			[5]: tbl_8_upvr (copied, readonly)
			[6]: UpdateScrollingFrameCanvasSize_upvr (copied, readonly)
		]]
		if tbl_9_upvr[var414_upvw] then
			tbl_9_upvr[var414_upvw] = nil
			any_new_result1_upvr:unlock()
			if var122_upvw then
				var122_upvw:Destroy()
				var122_upvw = nil
			end
		end
		local Index = arg1_34.Index
		var414_upvw:Destroy()
		table.remove(tbl_8_upvr, Index)
		for i_9 = Index, #tbl_8_upvr do
			local var439 = tbl_8_upvr[i_9]
			if var439 then
				var439:UpdateIndex(i_9)
			end
		end
		UpdateScrollingFrameCanvasSize_upvr()
	end
	function module_upvr_3.Swap(arg1_35, arg2_18) -- Line 715
		local Tool_11 = arg1_35.Tool
		local Tool_5 = arg2_18.Tool
		arg1_35:Clear()
		if Tool_5 then
			arg2_18:Clear()
			arg1_35:Fill(Tool_5)
		end
		if Tool_11 then
			arg2_18:Fill(Tool_11)
		else
			arg2_18:Clear()
		end
	end
	local var442_upvw
	function module_upvr_3.TurnNumber(arg1_36, arg2_19) -- Line 729
		--[[ Upvalues[1]:
			[1]: var442_upvw (read and write)
		]]
		if var442_upvw then
			var442_upvw.Visible = arg2_19
		end
	end
	function module_upvr_3.SetClickability(arg1_37, arg2_20) -- Line 735
		--[[ Upvalues[4]:
			[1]: UserInputService_upvr (copied, readonly)
			[2]: any_IsStudio_result1_upvr (copied, readonly)
			[3]: var414_upvw (read and write)
			[4]: UpdateSlotFading_upvr (readonly)
		]]
		if arg1_37.Tool then
			if UserInputService_upvr.VREnabled then
				if any_IsStudio_result1_upvr then
					var414_upvw:SetAttribute("Draggable", false)
				else
					var414_upvw.Draggable = false
				end
			elseif any_IsStudio_result1_upvr then
				var414_upvw:SetAttribute("Draggable", not arg2_20)
			else
				var414_upvw.Draggable = not arg2_20
			end
			UpdateSlotFading_upvr()
		end
	end
	function module_upvr_3.CheckTerms(arg1_38, arg2_21) -- Line 758
		--[[ Upvalues[2]:
			[1]: var417_upvw (read and write)
			[2]: var421_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local var443_upvw = 0
		local function _(arg1_39, arg2_22) -- Line 760, Named "checkEm"
			--[[ Upvalues[1]:
				[1]: var443_upvw (read and write)
			]]
			local _, any_gsub_result2_4 = arg1_39:lower():gsub(arg2_22, "")
			var443_upvw += any_gsub_result2_4
		end
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [46] 37. Error Block 14 start (CF ANALYSIS FAILED)
		do
			return var443_upvw
		end
		-- KONSTANTERROR: [46] 37. Error Block 14 end (CF ANALYSIS FAILED)
	end
	function module_upvr_3.Select(arg1_40) -- Line 784
		--[[ Upvalues[5]:
			[1]: module_upvr_3 (readonly)
			[2]: var44_upvw (copied, read and write)
			[3]: var29_upvw (copied, read and write)
			[4]: class_Humanoid_upvw (copied, read and write)
			[5]: Backpack_upvw (copied, read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local Tool_22 = module_upvr_3.Tool
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [15] 13. Error Block 7 start (CF ANALYSIS FAILED)
		var44_upvw = nil
		-- KONSTANTERROR: [15] 13. Error Block 7 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [24] 21. Error Block 16 start (CF ANALYSIS FAILED)
		if Tool_22.Parent == Backpack_upvw then
			if class_Humanoid_upvw then
				class_Humanoid_upvw:UnequipTools()
			end
			Tool_22.Parent = var29_upvw
		end
		-- KONSTANTERROR: [24] 21. Error Block 16 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [38] 31. Error Block 13 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [38] 31. Error Block 13 end (CF ANALYSIS FAILED)
	end
	var414_upvw = NewGui_upvr("TextButton", var412)
	local var447_upvw = var414_upvw
	local UIStroke_3_upvr = Instance.new("UIStroke")
	UIStroke_3_upvr.Parent = var447_upvw
	local UICorner_6 = Instance.new("UICorner")
	UICorner_6.CornerRadius = script:GetAttribute("CornerRadius")
	UICorner_6.Parent = var447_upvw
	UIStroke_3_upvr.Thickness = 0
	var447_upvw.BackgroundColor3 = BackgroundColor_upvr
	UIStroke_3_upvr.Color = BorderColor_upvr
	var447_upvw.Text = ""
	var447_upvw.AutoButtonColor = false
	var447_upvw.BorderSizePixel = 0
	var447_upvw.Size = UDim2.new(0, var61_upvw, 0, var61_upvw)
	var447_upvw.Active = true
	var447_upvw.Draggable = false
	if any_IsStudio_result1_upvr then
		var447_upvw:SetAttribute("Draggable", false)
	end
	var447_upvw.BackgroundTransparency = SlotLockedTransparency_upvr
	var447_upvw.MouseButton1Click:Connect(function() -- Line 830
		--[[ Upvalues[1]:
			[1]: module_upvr_3 (readonly)
		]]
		changeSlot(module_upvr_3)
	end)
	if UserInputService_upvr.TouchEnabled then
		local var451 = var447_upvw
		local os_clock_result1_upvw_2 = os.clock()
		var451.MouseButton1Click:Connect(function() -- Line 840
			--[[ Upvalues[3]:
				[1]: os_clock_result1_upvw_2 (read and write)
				[2]: module_upvr_3 (readonly)
				[3]: Favorite_Item_upvr (copied, readonly)
			]]
			if os_clock_result1_upvw_2 + 0.25 < os.clock() then
				os_clock_result1_upvw_2 = os.clock()
			else
				local Tool_2 = module_upvr_3.Tool
				if not Tool_2 then return end
				if workspace:GetAttribute("InTutorial") then return end
				Favorite_Item_upvr:FireServer(Tool_2)
			end
		end)
		var451.TouchLongPress:Connect(function(arg1_41, arg2_23, arg3) -- Line 848
			--[[ Upvalues[2]:
				[1]: module_upvr_3 (readonly)
				[2]: Favorite_Item_upvr (copied, readonly)
			]]
			if arg2_23 == Enum.UserInputState.End then
				local Tool_7 = module_upvr_3.Tool
				if not Tool_7 then return end
				if workspace:GetAttribute("InTutorial") then return end
				Favorite_Item_upvr:FireServer(Tool_7)
			end
		end)
	else
		var447_upvw.MouseButton2Click:Connect(function() -- Line 854
			--[[ Upvalues[2]:
				[1]: module_upvr_3 (readonly)
				[2]: Favorite_Item_upvr (copied, readonly)
			]]
			local Tool_3 = module_upvr_3.Tool
			if not Tool_3 then
			else
				if workspace:GetAttribute("InTutorial") then return end
				Favorite_Item_upvr:FireServer(Tool_3)
			end
		end)
	end
	module_upvr_3.Frame = var447_upvw
	local NewGui_result1_10 = NewGui_upvr("Frame", "SelectionObjectClipper")
	NewGui_result1_10.Visible = false
	NewGui_result1_10.Parent = var447_upvw
	local NewGui_result1_8 = NewGui_upvr("ImageLabel", "Selector")
	NewGui_result1_8.Size = UDim2.new(1, 0, 1, 0)
	NewGui_result1_8.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	NewGui_result1_8.ScaleType = Enum.ScaleType.Slice
	NewGui_result1_8.SliceCenter = Rect.new(12, 12, 52, 52)
	NewGui_result1_8.Parent = NewGui_result1_10
	var416_upvw = NewGui_upvr("ImageLabel", "Icon")
	local var461_upvw = var416_upvw
	var461_upvw.Size = UDim2.new(0.8, 0, 0.8, 0)
	var461_upvw.Position = UDim2.new(0.1, 0, 0.1, 0)
	var461_upvw.Parent = var447_upvw
	local NewGui_result1_9 = NewGui_upvr("ImageLabel", "FavIcon")
	NewGui_result1_9.Size = UDim2.new(0.2, 0, 0.2, 0)
	NewGui_result1_9.Position = UDim2.new(0.8, 0, 0.8, 0)
	NewGui_result1_9.Parent = var447_upvw
	NewGui_result1_9.Visible = false
	NewGui_result1_9.Image = "rbxassetid://80131230547874"
	NewGui_result1_9.ImageColor3 = Color3.fromRGB(255, 0, 0)
	NewGui_result1_9.ZIndex = 10
	var417_upvw = NewGui_upvr("TextLabel", "ToolName")
	local var463_upvw = var417_upvw
	var463_upvw.Size = UDim2.new(1, -2, 1, -2)
	var463_upvw.Position = UDim2.new(0, 1, 0, 1)
	var463_upvw.Parent = var447_upvw
	module_upvr_3.Frame.LayoutOrder = module_upvr_3.Index
	local var464
	local function INLINED_7() -- Internal function, doesn't exist in bytecode
		function module_upvr_3.MoveToInventory(arg1_42) -- Line 917
			--[[ Upvalues[8]:
				[1]: module_upvr_3 (readonly)
				[2]: FullSlots_upvr (copied, readonly)
				[3]: MakeSlot_upvr (copied, readonly)
				[4]: var70_upvw (copied, read and write)
				[5]: var29_upvw (copied, read and write)
				[6]: class_Humanoid_upvw (copied, read and write)
				[7]: var82_upvw (copied, read and write)
				[8]: var67_upvw (copied, read and write)
			]]
			if FullSlots_upvr < module_upvr_3.Index then
				return nil
			end
			local Tool_32 = arg1_42.Tool
			arg1_42:Clear()
			local MakeSlot_result1 = MakeSlot_upvr(var70_upvw)
			MakeSlot_result1:Fill(Tool_32)
			local var471 = Tool_32
			if var471 then
				if Tool_32.Parent ~= var29_upvw then
					var471 = false
				else
					var471 = true
				end
			end
			if var471 then
				if class_Humanoid_upvw then
					class_Humanoid_upvw:UnequipTools()
				end
			end
			if var82_upvw then
				MakeSlot_result1.Frame.Visible = false
				MakeSlot_result1.Frame.Parent = var67_upvw
			end
			return MakeSlot_result1
		end
		var447_upvw.MouseLeave:Connect(function() -- Line 913
			--[[ Upvalues[1]:
				[1]: var465_upvw (read and write)
			]]
			var465_upvw.Visible = false
		end)
		var447_upvw.MouseEnter:Connect(function() -- Line 908
			--[[ Upvalues[1]:
				[1]: var465_upvw (read and write)
			]]
			if var465_upvw.Text ~= "" then
				var465_upvw.Visible = true
			end
		end)
		UICorner_9.Parent = var465_upvw
		UICorner_9.CornerRadius = script:GetAttribute("CornerRadius")
		local UICorner_9 = Instance.new("UICorner")
		var465_upvw.Parent = var447_upvw
		var465_upvw.Visible = false
		var465_upvw.BackgroundTransparency = 0
		var465_upvw.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
		var465_upvw.TextYAlignment = Enum.TextYAlignment.Center
		var465_upvw.TextWrapped = false
		var465_upvw.FontFace = script:GetAttribute("ToolTipFont")
		var465_upvw.ZIndex = 2
		local var465_upvw = var421_upvw
		var421_upvw = NewGui_upvr("TextLabel", "ToolTip")
		return var412 < 10
	end
	if var412 <= FullSlots_upvr and (INLINED_7() or var412 == FullSlots_upvr) then
		if var412 >= 10 or not var412 then
			local var472 = 0
		end
		var442_upvw = NewGui_upvr("TextLabel", "Number")
		local var473_upvw = var442_upvw
		var473_upvw.Text = var472
		var473_upvw.Size = UDim2.new(0, 15, 0, 15)
		var473_upvw.Visible = false
		var473_upvw.Parent = var447_upvw
		tbl_upvr_2[Value_upvr_2 + var472] = module_upvr_3.Select
	end
	local Position_upvw_2 = var447_upvw.Position
	local var475_upvw
	local var476_upvw
	local function onDragStart_upvr(arg1_43) -- Line 955, Named "onDragStart"
		--[[ Upvalues[18]:
			[1]: tbl_9_upvr (copied, readonly)
			[2]: var447_upvw (read and write)
			[3]: Position_upvw_2 (read and write)
			[4]: UIStroke_3_upvr (readonly)
			[5]: any_new_result1_upvr (copied, readonly)
			[6]: var476_upvw (read and write)
			[7]: module_upvr_3 (readonly)
			[8]: LocalPlayer_upvr (copied, readonly)
			[9]: var415_upvw (read and write)
			[10]: var461_upvw (read and write)
			[11]: var463_upvw (read and write)
			[12]: var473_upvw (read and write)
			[13]: var420_upvw (read and write)
			[14]: var475_upvw (read and write)
			[15]: var70_upvw (copied, read and write)
			[16]: var67_upvw (copied, read and write)
			[17]: NewGui_upvr (copied, readonly)
			[18]: var122_upvw (copied, read and write)
		]]
		tbl_9_upvr[var447_upvw] = true
		Position_upvw_2 = arg1_43
		UIStroke_3_upvr.Thickness = 2
		any_new_result1_upvr:lock()
		if var476_upvw then
			var476_upvw:Disconnect()
			var476_upvw = nil
		end
		if module_upvr_3.Tool then
			var476_upvw = module_upvr_3.Tool.AncestryChanged:Connect(function(arg1_44, arg2_24) -- Line 968
				--[[ Upvalues[4]:
					[1]: module_upvr_3 (copied, readonly)
					[2]: var476_upvw (copied, read and write)
					[3]: LocalPlayer_upvr (copied, readonly)
					[4]: var415_upvw (copied, read and write)
				]]
				if not module_upvr_3.Tool or arg1_44 ~= module_upvr_3.Tool then
					if var476_upvw then
						var476_upvw:Disconnect()
						var476_upvw = nil
					end
				else
					local Parent = module_upvr_3.Tool.Parent
					if Parent ~= LocalPlayer_upvr.Backpack and Parent ~= LocalPlayer_upvr.Character then
						if var415_upvw then
							var415_upvw:Destroy()
							var415_upvw = nil
						end
						if var476_upvw then
							var476_upvw:Disconnect()
							var476_upvw = nil
						end
					end
				end
			end)
		elseif var476_upvw then
			var476_upvw:Disconnect()
			var476_upvw = nil
		end
		var447_upvw.ZIndex = 2
		var461_upvw.ZIndex = 2
		var463_upvw.ZIndex = 2
		var447_upvw.Parent.ZIndex = 2
		if var473_upvw then
			var473_upvw.ZIndex = 2
		end
		if var420_upvw then
			var420_upvw.ZIndex = 2
			for _, v_5 in var420_upvw:GetChildren(), nil do
				if not v_5:IsA("UICorner") and not v_5:IsA("UIStroke") then
					v_5.ZIndex = 2
				end
			end
		end
		var475_upvw = var447_upvw.Parent
		if var475_upvw == var70_upvw then
			var447_upvw.Parent = var67_upvw
			var447_upvw.Position = UDim2.new(0, var447_upvw.AbsolutePosition.X - var67_upvw.AbsolutePosition.X, 0, var447_upvw.AbsolutePosition.Y - var67_upvw.AbsolutePosition.Y)
			var415_upvw = NewGui_upvr("Frame", "FakeSlot")
			var415_upvw.LayoutOrder = var447_upvw.LayoutOrder
			var415_upvw.Size = var447_upvw.Size
			var415_upvw.BackgroundTransparency = 1
			var415_upvw.Parent = var70_upvw
			var122_upvw = var415_upvw
		end
	end
	local var481_upvw = 0
	local function onDragStop_upvr(arg1_45) -- Line 1037, Named "onDragStop"
		--[[ Upvalues[26]:
			[1]: tbl_9_upvr (copied, readonly)
			[2]: var447_upvw (read and write)
			[3]: var415_upvw (read and write)
			[4]: var476_upvw (read and write)
			[5]: Position_upvw_2 (read and write)
			[6]: var475_upvw (read and write)
			[7]: UIStroke_3_upvr (readonly)
			[8]: any_new_result1_upvr (copied, readonly)
			[9]: var461_upvw (read and write)
			[10]: var463_upvw (read and write)
			[11]: var473_upvw (read and write)
			[12]: var420_upvw (read and write)
			[13]: module_upvr_3 (readonly)
			[14]: var67_upvw (copied, read and write)
			[15]: FullSlots_upvr (copied, readonly)
			[16]: InventoryServiceEnums_upvr (copied, readonly)
			[17]: InventorySortingController_upvr (copied, readonly)
			[18]: var125_upvw (copied, read and write)
			[19]: var21_upvw (copied, read and write)
			[20]: var481_upvw (read and write)
			[21]: var75_upvw (copied, read and write)
			[22]: var66_upvw (copied, read and write)
			[23]: tbl_8_upvr (copied, readonly)
			[24]: var29_upvw (copied, read and write)
			[25]: class_Humanoid_upvw (copied, read and write)
			[26]: var82_upvw (copied, read and write)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		tbl_9_upvr[var447_upvw] = nil
		if var415_upvw then
			var415_upvw:Destroy()
			var415_upvw = nil
		end
		if var476_upvw then
			var476_upvw:Disconnect()
			var476_upvw = nil
		end
		var447_upvw.Position = Position_upvw_2
		local var498
		if var475_upvw and var447_upvw.Parent ~= var475_upvw then
			var447_upvw.Parent = var475_upvw
		end
		UIStroke_3_upvr.Thickness = 0
		any_new_result1_upvr:unlock()
		var447_upvw.ZIndex = 1
		var461_upvw.ZIndex = 1
		var463_upvw.ZIndex = 1
		if var475_upvw then
			var475_upvw.ZIndex = 1
		end
		if var473_upvw then
			var473_upvw.ZIndex = 1
		end
		if var420_upvw then
			var420_upvw.ZIndex = 1
			for _, v_6 in var420_upvw:GetChildren() do
				if not v_6:IsA("UICorner") and not v_6:IsA("UIStroke") then
					v_6.ZIndex = 1
				end
			end
		end
		if not module_upvr_3.Tool then
		else
			local var502 = var67_upvw
			local X_9 = arg1_45.X
			local Y_7 = arg1_45.Y
			local AbsolutePosition_2 = var502.AbsolutePosition
			local AbsoluteSize_10 = var502.AbsoluteSize
			local var507 = false
			if AbsolutePosition_2.X < X_9 then
				var507 = false
				if X_9 <= AbsolutePosition_2.X + AbsoluteSize_10.X then
					var507 = false
					if AbsolutePosition_2.Y < Y_7 then
						if Y_7 > AbsolutePosition_2.Y + AbsoluteSize_10.Y then
							var507 = false
						else
							var507 = true
						end
					end
				end
			end
			if var507 then
				var507 = module_upvr_3.Index
				local var508
				if var507 <= var508 then
					var507 = module_upvr_3:MoveToInventory()
					var508 = var507.Tool
					if var508 then
						var508 = var507.Tool:GetAttribute(InventoryServiceEnums_upvr.ITEM_UUID)
						if not var508 then
							var508 = var507.Tool:GetAttribute("PET_UUID")
							if not var508 then
								var508 = var507.Tool:GetAttribute("UUID")
							end
						end
					end
					if var508 then
						InventorySortingController_upvr:MoveEntry(var508, var507.Index)
					end
					var125_upvw.Text = ""
					if var21_upvw then
						task.delay(0.01, var21_upvw, true)
					end
				end
				var507 = module_upvr_3.Index
				if FullSlots_upvr < var507 then
					var507 = var498 - var481_upvw
					if var507 < 0.5 then
						var507 = var75_upvw
						local var509
						if var507 then
							var509 = module_upvr_3
							var507 = var509.Tool
							var509 = var507:GetAttribute(InventoryServiceEnums_upvr.ITEM_UUID)
							if not var509 then
								var509 = var507:GetAttribute("PET_UUID")
								if not var509 then
									var509 = var507:GetAttribute("UUID")
								end
							end
							module_upvr_3:Clear()
							var75_upvw:Fill(var507)
							module_upvr_3:Delete()
							if var509 then
								InventorySortingController_upvr:MoveEntry(var509, var75_upvw.Index)
							end
						end
						var498 = 0
						-- KONSTANTWARNING: GOTO [536] #390
					end
					-- KONSTANTWARNING: GOTO [536] #390
				end
			else
				local var510 = var66_upvw
				local X_8 = arg1_45.X
				local Y_4 = arg1_45.Y
				local AbsolutePosition_6 = var510.AbsolutePosition
				local AbsoluteSize_4 = var510.AbsoluteSize
				var507 = false
				if AbsolutePosition_6.X < X_8 then
					var507 = false
					if X_8 <= AbsolutePosition_6.X + AbsoluteSize_4.X then
						var507 = false
						if AbsolutePosition_6.Y < Y_4 then
							if Y_4 > AbsolutePosition_6.Y + AbsoluteSize_4.Y then
								var507 = false
							else
								var507 = true
								local var515
							end
						end
					end
				end
				if var507 then
					var507 = {}
					var507.Magnitude = math.huge
					var507.Slot = nil
					var515 = nil
					for i_28, v_11 in tbl_8_upvr, var515 do
						if FullSlots_upvr >= v_11.Index then
							local Frame_6 = v_11.Frame
							local magnitude_2 = (Frame_6.AbsolutePosition + Frame_6.AbsoluteSize / 2 - arg1_45).magnitude
							if magnitude_2 < var507.Magnitude then
								var507.Magnitude = magnitude_2
								var507.Slot = v_11
							end
						end
					end
					local Slot_4 = var507.Slot
					local function INLINED_8() -- Internal function, doesn't exist in bytecode
						var515 = module_upvr_3
						return Slot_4 == var515
					end
					if not Slot_4 or INLINED_8() then return end
					var515 = module_upvr_3.Tool
					if var515 then
						var515 = module_upvr_3.Tool
						v_11 = InventoryServiceEnums_upvr
						i_28 = v_11.ITEM_UUID
						var515 = var515:GetAttribute(i_28)
						if not var515 then
							var515 = module_upvr_3.Tool
							i_28 = "PET_UUID"
							var515 = var515:GetAttribute(i_28)
							if not var515 then
								var515 = module_upvr_3.Tool
								i_28 = "UUID"
								var515 = var515:GetAttribute(i_28)
							end
						end
					end
					local Tool_16 = Slot_4.Tool
					if Tool_16 then
						Tool_16 = Slot_4.Tool
						v_11 = InventoryServiceEnums_upvr.ITEM_UUID
						Tool_16 = Tool_16:GetAttribute(v_11)
						if not Tool_16 then
							Tool_16 = Slot_4.Tool
							v_11 = "PET_UUID"
							Tool_16 = Tool_16:GetAttribute(v_11)
							if not Tool_16 then
								Tool_16 = Slot_4.Tool
								v_11 = "UUID"
								Tool_16 = Tool_16:GetAttribute(v_11)
							end
						end
					end
					module_upvr_3:Swap(Slot_4)
					if var515 then
						InventorySortingController_upvr:MoveEntry(var515, Slot_4.Index)
					end
					if Tool_16 then
						task.wait()
						InventorySortingController_upvr:MoveEntry(Tool_16, module_upvr_3.Index)
					end
					if FullSlots_upvr < module_upvr_3.Index then
						local Tool_18 = module_upvr_3.Tool
						if not Tool_18 then
							module_upvr_3:Delete()
						else
							local var521 = Tool_18
							if var521 then
								if Tool_18.Parent ~= var29_upvw then
								else
								end
							end
							if true and class_Humanoid_upvw then
								class_Humanoid_upvw:UnequipTools()
							end
							if var82_upvw then
								module_upvr_3.Frame.Visible = false
								module_upvr_3.Frame.Parent = var67_upvw
								-- KONSTANTWARNING: GOTO [536] #390
							end
						end
						-- KONSTANTWARNING: GOTO [536] #390
					end
				else
					Slot_4 = module_upvr_3
					local var522
					var507 = var522.Index
					var522 = FullSlots_upvr
					if var507 <= var522 then
						var507 = module_upvr_3:MoveToInventory()
						var522 = var507.Tool
						local var523 = var522
						if var523 then
							var523 = var507.Tool:GetAttribute(InventoryServiceEnums_upvr.ITEM_UUID)
							if not var523 then
								var523 = var507.Tool:GetAttribute("PET_UUID")
								if not var523 then
									var523 = var507.Tool:GetAttribute("UUID")
								end
							end
						end
						if var523 then
							var515 = InventorySortingController_upvr:MoveEntry
							var515(var523, var507.Index)
						end
						var515 = var21_upvw
						if var515 then
							var515 = task.delay
							var515(0.01, var21_upvw, true)
							-- KONSTANTWARNING: GOTO [536] #390
						end
					else
						var507 = module_upvr_3.Tool
						if var507 then
							var507 = module_upvr_3.Tool
							var515 = "Tool"
							var507 = var507:IsA(var515)
							if var507 then
								var515 = module_upvr_3
								var507 = var515.Tool.CanBeDropped
								if var507 then
									var507 = module_upvr_3.Tool
									var507.Parent = workspace
								end
							end
						end
					end
				end
			end
			var481_upvw = var498
			if var21_upvw then
				task.delay(0.01, var21_upvw, true)
			end
		end
	end
	if any_IsStudio_result1_upvr then
		local var524_upvw
		local var525_upvw
		local function _(arg1_46) -- Line 1233, Named "updatePosition"
			--[[ Upvalues[3]:
				[1]: var525_upvw (read and write)
				[2]: var524_upvw (read and write)
				[3]: var447_upvw (read and write)
			]]
			local var526 = var525_upvw
			if var526 then
				var526 = var524_upvw
			end
			assert(var526)
			local var527 = arg1_46 - var524_upvw
			var447_upvw.Position = UDim2.new(var525_upvw.X.Scale, var525_upvw.X.Offset + var527.X, var525_upvw.Y.Scale, var525_upvw.Y.Offset + var527.Y)
		end
		local var529_upvw
		local var530_upvw
		local var531_upvw
		var447_upvw.InputBegan:Connect(function(arg1_47) -- Line 1245
			--[[ Upvalues[9]:
				[1]: var447_upvw (read and write)
				[2]: var529_upvw (read and write)
				[3]: UserInputService_upvr (copied, readonly)
				[4]: onDragStart_upvr (readonly)
				[5]: var530_upvw (read and write)
				[6]: var524_upvw (read and write)
				[7]: var525_upvw (read and write)
				[8]: var531_upvw (read and write)
				[9]: onDragStop_upvr (readonly)
			]]
			if not var447_upvw:GetAttribute("Draggable") then
			elseif arg1_47.UserInputType == Enum.UserInputType.MouseButton1 or arg1_47.UserInputType == Enum.UserInputType.Touch or arg1_47.KeyCode == Enum.KeyCode.ButtonA then
				var529_upvw = true
				local var536_upvw
				local any_Connect_result1_upvr = UserInputService_upvr.InputChanged:Connect(function(arg1_48) -- Line 1257
					--[[ Upvalues[7]:
						[1]: var529_upvw (copied, read and write)
						[2]: onDragStart_upvr (copied, readonly)
						[3]: var447_upvw (copied, read and write)
						[4]: var530_upvw (copied, read and write)
						[5]: var524_upvw (copied, read and write)
						[6]: UserInputService_upvr (copied, readonly)
						[7]: var525_upvw (copied, read and write)
					]]
					if var529_upvw then
						var529_upvw = false
						onDragStart_upvr(var447_upvw.Position)
						var530_upvw = true
						var524_upvw = UserInputService_upvr:GetMouseLocation()
						var525_upvw = var447_upvw.Position
					end
					if var530_upvw and (arg1_48.UserInputType == Enum.UserInputType.MouseMovement or arg1_48.UserInputType == Enum.UserInputType.Touch or string.find(arg1_48.UserInputType.Name, "Gamepad")) then
						local var533 = var525_upvw
						if var533 then
							var533 = var524_upvw
						end
						assert(var533)
						local var534 = UserInputService_upvr:GetMouseLocation() - var524_upvw
						var447_upvw.Position = UDim2.new(var525_upvw.X.Scale, var525_upvw.X.Offset + var534.X, var525_upvw.Y.Scale, var525_upvw.Y.Offset + var534.Y)
					end
				end)
				var536_upvw = arg1_47:GetPropertyChangedSignal("UserInputState"):Connect(function() -- Line 1281
					--[[ Upvalues[8]:
						[1]: var530_upvw (copied, read and write)
						[2]: var529_upvw (copied, read and write)
						[3]: var536_upvw (read and write)
						[4]: arg1_47 (readonly)
						[5]: any_Connect_result1_upvr (readonly)
						[6]: var531_upvw (copied, read and write)
						[7]: var525_upvw (copied, read and write)
						[8]: onDragStop_upvr (copied, readonly)
					]]
					if not var530_upvw then
						if not var529_upvw then
							if var536_upvw then
								var536_upvw:Disconnect()
								var536_upvw = nil
							end
							return
						end
					end
					if arg1_47.UserInputState == Enum.UserInputState.End then
						any_Connect_result1_upvr:Disconnect()
						var529_upvw = nil
						var530_upvw = nil
						var531_upvw = nil
						var525_upvw = nil
						if var536_upvw then
							var536_upvw:Disconnect()
							var536_upvw = nil
						end
						if var530_upvw then
							onDragStop_upvr(Vector2.new(arg1_47.Position.X, arg1_47.Position.Y))
						end
					end
				end)
			end
		end)
	else
		var447_upvw.DragBegin:Connect(function(arg1_49) -- Line 1314
			--[[ Upvalues[1]:
				[1]: onDragStart_upvr (readonly)
			]]
			onDragStart_upvr(arg1_49)
		end)
		var447_upvw.DragStopped:Connect(function(arg1_50, arg2_25) -- Line 1318
			--[[ Upvalues[1]:
				[1]: onDragStop_upvr (readonly)
			]]
			onDragStop_upvr(Vector2.new(arg1_50, arg2_25))
		end)
	end
	var447_upvw.Parent = arg1
	tbl_8_upvr[var412] = module_upvr_3
	if FullSlots_upvr < var412 then
		UpdateScrollingFrameCanvasSize_upvr()
		if var67_upvw.Visible and not var82_upvw then
			var69_upvw.CanvasPosition = Vector2.new(0, math.max(0, var69_upvw.CanvasSize.Y.Offset - var69_upvw.AbsoluteSize.Y))
		end
	end
	return module_upvr_3
end
local var540_upvw = false
local function OnChildAdded_upvr(arg1) -- Line 1338, Named "OnChildAdded"
	--[[ Upvalues[16]:
		[1]: var29_upvw (read and write)
		[2]: class_Humanoid_upvw (read and write)
		[3]: var84_upvw (read and write)
		[4]: var69_upvw (read and write)
		[5]: var540_upvw (read and write)
		[6]: tbl_10_upvr (readonly)
		[7]: LocalPlayer_upvr (readonly)
		[8]: var75_upvw (read and write)
		[9]: MakeSlot_upvr (readonly)
		[10]: var70_upvw (read and write)
		[11]: tbl_8_upvr (readonly)
		[12]: Backpack_upvw (read and write)
		[13]: AdjustHotbarFrames_upvr (readonly)
		[14]: var21_upvw (read and write)
		[15]: FullSlots_upvr (readonly)
		[16]: var67_upvw (read and write)
	]]
	if not arg1:IsA("Tool") then
		if arg1:IsA("Humanoid") and arg1.Parent == var29_upvw then
			class_Humanoid_upvw = arg1
		end
	else
		if arg1.Parent == var29_upvw then
			var84_upvw = tick()
		end
		if not var540_upvw and arg1.Parent == var29_upvw and not tbl_10_upvr[arg1] then
			local StarterGear_2 = LocalPlayer_upvr:FindFirstChild("StarterGear")
			if StarterGear_2 and StarterGear_2:FindFirstChild(arg1.Name) then
				var540_upvw = true
				local var563 = var75_upvw
				if not var563 then
					var563 = MakeSlot_upvr(var70_upvw)
				end
				for i_29 = var563.Index, 1, -1 do
					local var564 = i_29 - 1
					if 0 < var564 then
						tbl_8_upvr[var564]:Swap(tbl_8_upvr[i_29])
					else
						tbl_8_upvr[i_29]:Fill(arg1)
					end
				end
				for _, v_12 in pairs(var29_upvw:GetChildren()) do
					if v_12:IsA("Tool") and v_12 ~= arg1 then
						v_12.Parent = Backpack_upvw
					end
				end
				AdjustHotbarFrames_upvr()
				var69_upvw.CanvasPosition = var69_upvw.CanvasPosition
				if var21_upvw then
					var21_upvw(true)
				end
				return
			end
		end
		local var568
		if tbl_10_upvr[arg1] then
			var568 = tbl_10_upvr[arg1]:UpdateEquipView
			var568()
		else
			var568 = var75_upvw
			if not var568 then
				var568 = MakeSlot_upvr(var70_upvw)
			end
			local var569 = var568
			var568 = var569:Fill
			var568(arg1)
			var568 = var569.Index
			if var568 <= FullSlots_upvr then
				var568 = var67_upvw.Visible
				if not var568 then
					var568 = AdjustHotbarFrames_upvr
					var568()
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
					var69_upvw.CanvasPosition = var69_upvw.CanvasPosition
				end
			end
		end
		task.delay(0.05, function() -- Line 1402
			--[[ Upvalues[1]:
				[1]: var21_upvw (copied, read and write)
			]]
			if var21_upvw then
				var21_upvw(true)
			end
		end)
	end
end
local function OnChildRemoved_upvr(arg1) -- Line 1409, Named "OnChildRemoved"
	--[[ Upvalues[7]:
		[1]: var84_upvw (read and write)
		[2]: var29_upvw (read and write)
		[3]: Backpack_upvw (read and write)
		[4]: tbl_10_upvr (readonly)
		[5]: FullSlots_upvr (readonly)
		[6]: var67_upvw (read and write)
		[7]: AdjustHotbarFrames_upvr (readonly)
	]]
	if not arg1:IsA("Tool") then
	else
		var84_upvw = tick()
		local Parent_2 = arg1.Parent
		if Parent_2 == var29_upvw or Parent_2 == Backpack_upvw then return end
		local var572_upvr = tbl_10_upvr[arg1]
		if var572_upvr then
			task.defer(function() -- Line 1425
				--[[ Upvalues[6]:
					[1]: tbl_10_upvr (copied, readonly)
					[2]: arg1 (readonly)
					[3]: var572_upvr (readonly)
					[4]: FullSlots_upvr (copied, readonly)
					[5]: var67_upvw (copied, read and write)
					[6]: AdjustHotbarFrames_upvr (copied, readonly)
				]]
				if tbl_10_upvr[arg1] == var572_upvr then
					var572_upvr:Clear()
					if FullSlots_upvr < var572_upvr.Index then
						var572_upvr:Delete()
						return
					end
					if not var67_upvw.Visible then
						AdjustHotbarFrames_upvr()
					end
				end
			end)
		end
	end
end
local tbl_7_upvr = {}
local function OnCharacterAdded(arg1) -- Line 1438
	--[[ Upvalues[16]:
		[1]: tbl_8_upvr (readonly)
		[2]: FullSlots_upvr (readonly)
		[3]: var75_upvw (read and write)
		[4]: var79_upvw (read and write)
		[5]: tbl_7_upvr (readonly)
		[6]: var29_upvw (read and write)
		[7]: Backpack_upvw (read and write)
		[8]: LocalPlayer_upvr (readonly)
		[9]: InventorySortingController_upvr (readonly)
		[10]: InventoryServiceEnums_upvr (readonly)
		[11]: MakeSlot_upvr (readonly)
		[12]: var70_upvw (read and write)
		[13]: OnChildRemoved_upvr (readonly)
		[14]: OnChildAdded_upvr (readonly)
		[15]: AdjustHotbarFrames_upvr (readonly)
		[16]: AdjustInventoryFrames_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 93 start (CF ANALYSIS FAILED)
	for i_12 = #tbl_8_upvr, FullSlots_upvr + 1, -1 do
		if tbl_8_upvr[i_12] then
			tbl_8_upvr[i_12]:Delete()
		end
	end
	for i_13 = 1, FullSlots_upvr do
		if tbl_8_upvr[i_13] and tbl_8_upvr[i_13].Tool then
			tbl_8_upvr[i_13]:Clear()
		end
	end
	local _ = 1
	-- KONSTANTERROR: [0] 1. Error Block 93 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [44] 41. Error Block 13 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [44] 41. Error Block 13 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [37] 35. Error Block 102 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if not tbl_8_upvr then
		-- KONSTANTWARNING: GOTO [46] #43
	end
	-- KONSTANTERROR: [37] 35. Error Block 102 end (CF ANALYSIS FAILED)
end
local PlayerGui_upvr = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local function FindFirstNamedAtMouse_upvr(arg1) -- Line 1532, Named "FindFirstNamedAtMouse"
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: PlayerGui_upvr (readonly)
	]]
	local any_GetMouseLocation_result1 = UserInputService_upvr:GetMouseLocation()
	for _, v_7 in PlayerGui_upvr:GetGuiObjectsAtPosition(any_GetMouseLocation_result1.X, any_GetMouseLocation_result1.Y), nil do
		if v_7.Name:find(arg1) then
			return v_7
		end
	end
end
local function OnUISChanged(arg1) -- Line 1569
	--[[ Upvalues[3]:
		[1]: UserInputService_upvr (readonly)
		[2]: FullSlots_upvr (readonly)
		[3]: tbl_8_upvr (readonly)
	]]
	if arg1 == "KeyboardEnabled" or arg1 == "VREnabled" then
		if UserInputService_upvr.KeyboardEnabled then
		end
		for i_15 = 1, FullSlots_upvr do
			if tbl_8_upvr[i_15] then
				tbl_8_upvr[i_15]:TurnNumber(not UserInputService_upvr.VREnabled)
			end
		end
	end
end
local function var586_upvr() -- Line 1583
end
function unbindAllGamepadEquipActions() -- Line 1587
	--[[ Upvalues[1]:
		[1]: ContextActionService_upvr (readonly)
	]]
	ContextActionService_upvr:UnbindAction("RBXBackpackHasGamepadFocus")
	ContextActionService_upvr:UnbindAction("RBXCloseInventory")
end
local function _(arg1, arg2) -- Line 1592, Named "setHotbarVisibility"
	--[[ Upvalues[2]:
		[1]: FullSlots_upvr (readonly)
		[2]: tbl_8_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local _ = 1
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [18] 15. Error Block 8 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [18] 15. Error Block 8 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 5. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [18.5]
	-- KONSTANTERROR: [4] 5. Error Block 2 end (CF ANALYSIS FAILED)
end
local vector2_upvw = Vector2.new(0, 0)
local function getInputDirection_upvr(arg1) -- Line 1601, Named "getInputDirection"
	--[[ Upvalues[1]:
		[1]: vector2_upvw (read and write)
	]]
	local var589
	if arg1.UserInputState == Enum.UserInputState.End then
		var589 = -1
	end
	if arg1.KeyCode == Enum.KeyCode.Thumbstick1 then
		local magnitude_5 = arg1.Position.magnitude
		if 0.98 < magnitude_5 then
			vector2_upvw = Vector2.new(arg1.Position.x / magnitude_5, -arg1.Position.y / magnitude_5)
		else
			vector2_upvw = Vector2.new(0, 0)
		end
	elseif arg1.KeyCode == Enum.KeyCode.DPadLeft then
		vector2_upvw = Vector2.new(vector2_upvw.x - var589 * 1, vector2_upvw.y)
	elseif arg1.KeyCode == Enum.KeyCode.DPadRight then
		vector2_upvw = Vector2.new(vector2_upvw.x + var589 * 1, vector2_upvw.y)
	elseif arg1.KeyCode == Enum.KeyCode.DPadUp then
		vector2_upvw = Vector2.new(vector2_upvw.x, vector2_upvw.y - var589 * 1)
	elseif arg1.KeyCode == Enum.KeyCode.DPadDown then
		vector2_upvw = Vector2.new(vector2_upvw.x, vector2_upvw.y + var589 * 1)
	else
		vector2_upvw = Vector2.new(0, 0)
	end
	return vector2_upvw
end
local function _(arg1, arg2, arg3) -- Line 1632
	--[[ Upvalues[4]:
		[1]: getInputDirection_upvr (readonly)
		[2]: FullSlots_upvr (readonly)
		[3]: tbl_8_upvr (readonly)
		[4]: class_Humanoid_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local getInputDirection_upvr_result1 = getInputDirection_upvr(arg3)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [10] 9. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [11] 10. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [11] 10. Error Block 3 end (CF ANALYSIS FAILED)
end
local var594_upvw
local var595_upvw
function changeToolFunc(arg1, arg2, arg3) -- Line 1662
	--[[ Upvalues[8]:
		[1]: var594_upvw (read and write)
		[2]: var595_upvw (read and write)
		[3]: class_Humanoid_upvw (read and write)
		[4]: var29_upvw (read and write)
		[5]: tbl_10_upvr (readonly)
		[6]: FullSlots_upvr (readonly)
		[7]: tbl_8_upvr (readonly)
		[8]: var87_upvw (read and write)
	]]
	if arg2 ~= Enum.UserInputState.Begin then
	else
		if var594_upvw then
			if var594_upvw.KeyCode == Enum.KeyCode.ButtonR1 and arg3.KeyCode == Enum.KeyCode.ButtonL1 or var594_upvw.KeyCode == Enum.KeyCode.ButtonL1 and arg3.KeyCode == Enum.KeyCode.ButtonR1 or tick() - var595_upvw <= 0.06 then
				if class_Humanoid_upvw then
					class_Humanoid_upvw:UnequipTools()
				end
				var594_upvw = arg3
				var595_upvw = tick()
				return
			end
		end
		var594_upvw = arg3
		var595_upvw = tick()
		delay(0.06, function() -- Line 1690
			--[[ Upvalues[8]:
				[1]: var594_upvw (copied, read and write)
				[2]: arg3 (readonly)
				[3]: var29_upvw (copied, read and write)
				[4]: class_Humanoid_upvw (copied, read and write)
				[5]: tbl_10_upvr (copied, readonly)
				[6]: FullSlots_upvr (copied, readonly)
				[7]: tbl_8_upvr (copied, readonly)
				[8]: var87_upvw (copied, read and write)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 142 start (CF ANALYSIS FAILED)
			if var594_upvw ~= arg3 then return end
			if arg3.KeyCode == Enum.KeyCode.ButtonL1 then
			else
			end
			-- KONSTANTERROR: [0] 1. Error Block 142 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [19] 16. Error Block 8 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [19] 16. Error Block 8 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [38] 31. Error Block 119 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [38] 31. Error Block 119 end (CF ANALYSIS FAILED)
		end)
	end
end
function getGamepadSwapSlot() -- Line 1829
	--[[ Upvalues[1]:
		[1]: tbl_8_upvr (readonly)
	]]
	for i_16 = 1, #tbl_8_upvr do
		if tbl_8_upvr[i_16] and tbl_8_upvr[i_16].Frame:IsA("GuiButton") and tbl_8_upvr[i_16].Frame:FindFirstChild("UIStroke") and 0 < tbl_8_upvr[i_16].Frame.UIStroke.Thickness then
			return tbl_8_upvr[i_16]
		end
	end
end
function changeSlot(arg1) -- Line 1842
	--[[ Upvalues[5]:
		[1]: VRService_upvr (readonly)
		[2]: var67_upvw (read and write)
		[3]: GuiService_upvr (readonly)
		[4]: var68_upvw (read and write)
		[5]: FullSlots_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 end (CF ANALYSIS FAILED)
end
function vrMoveSlotToInventory() -- Line 1899
	--[[ Upvalues[2]:
		[1]: VRService_upvr (readonly)
		[2]: var68_upvw (read and write)
	]]
	if not VRService_upvr.VREnabled then
	else
		local getGamepadSwapSlot_result1 = getGamepadSwapSlot()
		if getGamepadSwapSlot_result1 and getGamepadSwapSlot_result1.Tool then
			getGamepadSwapSlot_result1:WaitForChild("UIStroke").Thickness = 0
			getGamepadSwapSlot_result1:MoveToInventory()
			var68_upvw.SelectionImageObject.Visible = false
		end
	end
end
function enableGamepadInventoryControl() -- Line 1912
	--[[ Upvalues[7]:
		[1]: var67_upvw (read and write)
		[2]: any_new_result1_upvr (readonly)
		[3]: ContextActionService_upvr (readonly)
		[4]: var586_upvr (readonly)
		[5]: UserInputService_upvr (readonly)
		[6]: GuiService_upvr (readonly)
		[7]: var66_upvw (read and write)
	]]
	ContextActionService_upvr:BindAction("RBXBackpackHasGamepadFocus", var586_upvr, false, Enum.UserInputType.Gamepad1)
	ContextActionService_upvr:BindAction("RBXCloseInventory", function(arg1, arg2, arg3) -- Line 1913
		--[[ Upvalues[2]:
			[1]: var67_upvw (copied, read and write)
			[2]: any_new_result1_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [4] 3. Error Block 2 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [4] 3. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [5] 4. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [5] 4. Error Block 3 end (CF ANALYSIS FAILED)
	end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
	if not UserInputService_upvr.VREnabled then
		GuiService_upvr.SelectedObject = var66_upvw:FindFirstChild('1')
	end
end
function disableGamepadInventoryControl() -- Line 1944
	--[[ Upvalues[4]:
		[1]: FullSlots_upvr (readonly)
		[2]: tbl_8_upvr (readonly)
		[3]: GuiService_upvr (readonly)
		[4]: var65_upvw (read and write)
	]]
	unbindAllGamepadEquipActions()
	for i_17 = 1, FullSlots_upvr do
		local var603 = tbl_8_upvr[i_17]
		if var603 and var603.Frame then
			var603.Frame:WaitForChild("UIStroke").Thickness = 0
		end
	end
	if GuiService_upvr.SelectedObject then
		i_17 = var65_upvw
		if GuiService_upvr.SelectedObject:IsDescendantOf(i_17) then
			GuiService_upvr.SelectedObject = nil
		end
	end
end
local function _() -- Line 1959, Named "bindBackpackHotbarAction"
	--[[ Upvalues[3]:
		[1]: var80_upvw (read and write)
		[2]: var62_upvw (read and write)
		[3]: ContextActionService_upvr (readonly)
	]]
	if var80_upvw then
		if not var62_upvw then
			var62_upvw = true
			ContextActionService_upvr:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		end
	end
end
local function _() -- Line 1972, Named "unbindBackpackHotbarAction"
	--[[ Upvalues[2]:
		[1]: var62_upvw (read and write)
		[2]: ContextActionService_upvr (readonly)
	]]
	disableGamepadInventoryControl()
	var62_upvw = false
	ContextActionService_upvr:UnbindAction("RBXHotbarEquip")
end
function gamepadDisconnected() -- Line 1978
	--[[ Upvalues[1]:
		[1]: var83_upvw (read and write)
	]]
	var83_upvw = false
	disableGamepadInventoryControl()
end
function gamepadConnected() -- Line 1983
	--[[ Upvalues[8]:
		[1]: var83_upvw (read and write)
		[2]: GuiService_upvr (readonly)
		[3]: var65_upvw (read and write)
		[4]: var79_upvw (read and write)
		[5]: var80_upvw (read and write)
		[6]: var62_upvw (read and write)
		[7]: ContextActionService_upvr (readonly)
		[8]: var67_upvw (read and write)
	]]
	var83_upvw = true
	GuiService_upvr:AddSelectionParent("RBXBackpackSelection", var65_upvw)
	if 1 <= var79_upvw then
		if var80_upvw and not var62_upvw then
			var62_upvw = true
			ContextActionService_upvr:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		end
	end
	if var67_upvw.Visible then
		enableGamepadInventoryControl()
	end
end
local tbl_upvr = {}
local function OnIconChanged_upvr(arg1) -- Line 1996, Named "OnIconChanged"
	--[[ Upvalues[9]:
		[1]: StarterGui_upvr (readonly)
		[2]: any_new_result1_upvr (readonly)
		[3]: GuiService_upvr (readonly)
		[4]: var80_upvw (read and write)
		[5]: var65_upvw (read and write)
		[6]: tbl_upvr (readonly)
		[7]: var79_upvw (read and write)
		[8]: var62_upvw (read and write)
		[9]: ContextActionService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 19 start (CF ANALYSIS FAILED)
	local var609 = arg1
	if var609 then
		var609 = StarterGui_upvr:GetCore("TopbarEnabled")
	end
	local var610 = var609
	local var611 = var610
	if var611 then
		var611 = not GuiService_upvr.MenuIsOpen
	end
	any_new_result1_upvr:setEnabled(var611)
	var80_upvw = var610
	var65_upvw.Visible = var610
	for _, _ in pairs(tbl_upvr) do
		if var610 then
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 19 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [40] 34. Error Block 13 start (CF ANALYSIS FAILED)
	var62_upvw = true
	ContextActionService_upvr:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
	do
		return
	end
	-- KONSTANTERROR: [40] 34. Error Block 13 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [55] 45. Error Block 14 start (CF ANALYSIS FAILED)
	disableGamepadInventoryControl()
	var62_upvw = false
	ContextActionService_upvr:UnbindAction("RBXHotbarEquip")
	-- KONSTANTERROR: [55] 45. Error Block 14 end (CF ANALYSIS FAILED)
end
local function MakeVRRoundButton(arg1, arg2) -- Line 2017
	--[[ Upvalues[1]:
		[1]: NewGui_upvr (readonly)
	]]
	local NewGui_result1_4 = NewGui_upvr("ImageButton", arg1)
	NewGui_result1_4.Size = UDim2.new(0, 40, 0, 40)
	NewGui_result1_4.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png"
	local NewGui_upvr_result1 = NewGui_upvr("ImageLabel", "Icon")
	NewGui_upvr_result1.Size = UDim2.new(0.5, 0, 0.5, 0)
	NewGui_upvr_result1.Position = UDim2.new(0.25, 0, 0.25, 0)
	NewGui_upvr_result1.Image = arg2
	NewGui_upvr_result1.Parent = NewGui_result1_4
	local NewGui_result1_7 = NewGui_upvr("ImageLabel", "Selection")
	NewGui_result1_7.Size = UDim2.new(0.9, 0, 0.9, 0)
	NewGui_result1_7.Position = UDim2.new(0.05, 0, 0.05, 0)
	NewGui_result1_7.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
	NewGui_result1_4.SelectionImageObject = NewGui_result1_7
	return NewGui_result1_4, NewGui_upvr_result1, NewGui_result1_7
end
var65_upvw = NewGui_upvr("Frame", "Backpack")
local var618 = var65_upvw
var618.Visible = false
var618.Parent = ScreenGui
var66_upvw = NewGui_upvr("Frame", "Hotbar")
local var619_upvw = var66_upvw
var619_upvw.Parent = var618
for i_19 = 1, FullSlots_upvr do
	local MakeSlot_upvr_result1_2 = MakeSlot_upvr(var619_upvw, i_19)
	MakeSlot_upvr_result1_2.Frame.Visible = false
	if not var75_upvw then
		var75_upvw = MakeSlot_upvr_result1_2
	end
end
any_new_result1_upvr.selected:Connect(function() -- Line 2052
	--[[ Upvalues[2]:
		[1]: GuiService_upvr (readonly)
		[2]: module_upvr_2 (readonly)
	]]
	if not GuiService_upvr.MenuIsOpen then
		module_upvr_2.OpenClose()
	end
end)
any_new_result1_upvr.deselected:Connect(function() -- Line 2057
	--[[ Upvalues[2]:
		[1]: var67_upvw (read and write)
		[2]: module_upvr_2 (readonly)
	]]
	if var67_upvw.Visible then
		module_upvr_2.OpenClose()
	end
end)
LeftBumperButton = NewGui_upvr("ImageLabel", "LeftBumper") -- Setting global
LeftBumperButton.Size = UDim2.new(0, 40, 0, 40)
LeftBumperButton.Position = UDim2.new(0, -LeftBumperButton.Size.X.Offset, 0.5, -LeftBumperButton.Size.Y.Offset / 2)
RightBumperButton = NewGui_upvr("ImageLabel", "RightBumper") -- Setting global
RightBumperButton.Size = UDim2.new(0, 40, 0, 40)
RightBumperButton.Position = UDim2.new(1, 0, 0.5, -RightBumperButton.Size.Y.Offset / 2)
var67_upvw = NewGui_upvr("Frame", "Inventory")
local var623_upvw = var67_upvw
local UICorner_4 = Instance.new("UICorner")
UICorner_4.CornerRadius = script:GetAttribute("CornerRadius")
UICorner_4.Parent = var623_upvw
var623_upvw.BackgroundTransparency = script:GetAttribute("BackgroundTransparency")
var623_upvw.BackgroundColor3 = BackgroundColor_upvr
var623_upvw.Active = true
var623_upvw.Visible = false
var623_upvw.Parent = var618
local TweenService_upvr = game:GetService("TweenService")
local clone_2_upvr = script.CategoryTemplate:Clone()
clone_2_upvr.Parent = var623_upvw
local function var627_upvw(arg1) -- Line 2087
	--[[ Upvalues[3]:
		[1]: var22_upvw (read and write)
		[2]: clone_2_upvr (readonly)
		[3]: var21_upvw (read and write)
	]]
	if var22_upvw == arg1 then
	else
		var22_upvw = arg1
		clone_2_upvr.Text = `{arg1} Items`
		var21_upvw()
	end
end
local clone_3 = script.CategoryFrame:Clone()
if not TouchEnabled or not UDim2.fromScale(0.14, 1) then
end
clone_3.Size = clone_3.Size
clone_3.Parent = var623_upvw
for _, v_9 in CategoryList do
	local clone = clone_3.CategoryTemplate:Clone()
	local ImageButton = clone.ImageButton
	local BackgroundColor3 = clone.BackgroundColor3
	local any_Create_result1_3_upvr = TweenService_upvr:Create(clone, TweenInfo.new(0.2), {
		BackgroundColor3 = (function(arg1, arg2) -- Line 2104, Named "BrightenColorHSV"
			local any_ToHSV_result1, any_ToHSV_result2, any_ToHSV_result3 = arg1:ToHSV()
			return Color3.fromHSV(any_ToHSV_result1, any_ToHSV_result2, math.clamp(any_ToHSV_result3 + arg2, 0, 1))
		end)(BackgroundColor3, 0.2);
	})
	local any_Create_result1_2_upvr = TweenService_upvr:Create(clone, TweenInfo.new(0.2), {
		BackgroundColor3 = BackgroundColor3;
	})
	ImageButton.MouseEnter:Connect(function() -- Line 2125
		--[[ Upvalues[1]:
			[1]: any_Create_result1_3_upvr (readonly)
		]]
		any_Create_result1_3_upvr:Play()
	end)
	ImageButton.MouseLeave:Connect(function() -- Line 2128
		--[[ Upvalues[1]:
			[1]: any_Create_result1_2_upvr (readonly)
		]]
		any_Create_result1_2_upvr:Play()
	end)
	ImageButton.MouseButton1Down:Connect(function() -- Line 2132
		--[[ Upvalues[1]:
			[1]: any_Create_result1_2_upvr (readonly)
		]]
		any_Create_result1_2_upvr:Play()
	end)
	local Name_upvr = v_9.Name
	ImageButton.MouseButton1Up:Connect(function() -- Line 2136
		--[[ Upvalues[3]:
			[1]: any_Create_result1_3_upvr (readonly)
			[2]: var627_upvw (read and write)
			[3]: Name_upvr (readonly)
		]]
		any_Create_result1_3_upvr:Play()
		var627_upvw(Name_upvr)
	end)
	ImageButton.Image = v_9.Image
	clone.Visible = true
	clone.Parent = clone_3
	local _
end
var68_upvw = NewGui_upvr("TextButton", "VRInventorySelector")
local var645 = var68_upvw
var645.Position = UDim2.new(0, 0, 0, 0)
var645.Size = UDim2.new(1, 0, 1, 0)
var645.BackgroundTransparency = 1
var645.Text = ""
var645.Parent = var623_upvw
local NewGui_result1_6 = NewGui_upvr("ImageLabel", "Selector")
NewGui_result1_6.Size = UDim2.new(1, 0, 1, 0)
NewGui_result1_6.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
NewGui_result1_6.ScaleType = Enum.ScaleType.Slice
NewGui_result1_6.SliceCenter = Rect.new(12, 12, 52, 52)
NewGui_result1_6.Visible = false
var645.SelectionImageObject = NewGui_result1_6
var645.MouseButton1Click:Connect(function() -- Line 2161
	vrMoveSlotToInventory()
end)
var69_upvw = NewGui_upvr("ScrollingFrame", "ScrollingFrame")
local var648_upvw = var69_upvw
var648_upvw.Selectable = false
var648_upvw.CanvasSize = UDim2.new(0, 0, 0, 0)
var648_upvw.Parent = var623_upvw
var70_upvw = NewGui_upvr("Frame", "UIGridFrame")
local var649_upvw = var70_upvw
var649_upvw.Selectable = false
var649_upvw.Size = UDim2.new(1, -10, 1, 0)
var649_upvw.Position = UDim2.new(0, 5, 0, 0)
var649_upvw.Parent = var648_upvw
local UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, var61_upvw, 0, var61_upvw)
UIGridLayout.CellPadding = UDim2.new(0, 5, 0, 5)
UIGridLayout.Parent = var649_upvw
local MakeVRRoundButton_result1_upvw_2 = MakeVRRoundButton("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
MakeVRRoundButton_result1_upvw_2.Size = UDim2.new(0, 34, 0, 34)
MakeVRRoundButton_result1_upvw_2.Position = UDim2.new(0.5, -MakeVRRoundButton_result1_upvw_2.Size.X.Offset / 2, 0, 43)
Name_upvr = 2
MakeVRRoundButton_result1_upvw_2.Icon.Position = MakeVRRoundButton_result1_upvw_2.Icon.Position - UDim2.new(0, 0, 0, Name_upvr)
MakeVRRoundButton_result1_upvw_2.MouseButton1Click:Connect(function() -- Line 2187
	--[[ Upvalues[2]:
		[1]: var648_upvw (read and write)
		[2]: var61_upvw (read and write)
	]]
	var648_upvw.CanvasPosition = Vector2.new(var648_upvw.CanvasPosition.X, math.min(var648_upvw.CanvasSize.Y.Offset - var648_upvw.AbsoluteWindowSize.Y, math.max(0, (var648_upvw.CanvasPosition.Y) - (var61_upvw + 5))))
end)
local MakeVRRoundButton_result1_upvw = MakeVRRoundButton("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
MakeVRRoundButton_result1_upvw.Rotation = 180
Name_upvr = 2
MakeVRRoundButton_result1_upvw.Icon.Position = MakeVRRoundButton_result1_upvw.Icon.Position - UDim2.new(0, 0, 0, Name_upvr)
MakeVRRoundButton_result1_upvw.Size = UDim2.new(0, 34, 0, 34)
Name_upvr = MakeVRRoundButton_result1_upvw.Size.Y
MakeVRRoundButton_result1_upvw.Position = UDim2.new(0.5, -MakeVRRoundButton_result1_upvw.Size.X.Offset / 2, 1, -Name_upvr.Offset - 3)
MakeVRRoundButton_result1_upvw.MouseButton1Click:Connect(function() -- Line 2204
	--[[ Upvalues[2]:
		[1]: var648_upvw (read and write)
		[2]: var61_upvw (read and write)
	]]
	var648_upvw.CanvasPosition = Vector2.new(var648_upvw.CanvasPosition.X, math.min(var648_upvw.CanvasSize.Y.Offset - var648_upvw.AbsoluteWindowSize.Y, math.max(0, (var648_upvw.CanvasPosition.Y) + (var61_upvw + 5))))
end)
var648_upvw.Changed:Connect(function(arg1) -- Line 2215
	--[[ Upvalues[3]:
		[1]: var648_upvw (read and write)
		[2]: MakeVRRoundButton_result1_upvw_2 (read and write)
		[3]: MakeVRRoundButton_result1_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 2. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 2. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 3. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 3. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 4. Error Block 18 start (CF ANALYSIS FAILED)
	if var648_upvw.CanvasPosition.Y == 0 then
		-- KONSTANTWARNING: GOTO [15] #10
	end
	-- KONSTANTERROR: [6] 4. Error Block 18 end (CF ANALYSIS FAILED)
end)
;(function() -- Line 346, Named "UpdateBackpackLayout"
	--[[ Upvalues[9]:
		[1]: var66_upvw (read and write)
		[2]: FullSlots_upvr (readonly)
		[3]: var61_upvw (read and write)
		[4]: var67_upvw (read and write)
		[5]: const_number_upvr (readonly)
		[6]: VREnabled_upvr (readonly)
		[7]: var69_upvw (read and write)
		[8]: AdjustHotbarFrames_upvr (readonly)
		[9]: AdjustInventoryFrames_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 20 start (CF ANALYSIS FAILED)
	var66_upvw.Size = UDim2.new(0, 5 + FullSlots_upvr * (var61_upvw + 5), 0, var61_upvw + 5 + 5)
	var66_upvw.Position = UDim2.new(0.5, -var66_upvw.Size.X.Offset / 2, 1, -var66_upvw.Size.Y.Offset)
	local var109 = var66_upvw.Size.Y.Offset * const_number_upvr
	if VREnabled_upvr then
		var109 = 80
	else
		var109 = 0
	end
	var67_upvw.Size = UDim2.new(0, var66_upvw.Size.X.Offset, 0, var109 + 40 + var109)
	var109 = var67_upvw.Size
	var109 = var66_upvw.Position.Y
	var109 = var67_upvw.Size.Y.Offset
	var67_upvw.Position = UDim2.new(0.5, -var109.X.Offset / 2, 1, var109.Offset - var109)
	var109 = VREnabled_upvr
	if var109 then
		-- KONSTANTWARNING: GOTO [119] #89
	end
	-- KONSTANTERROR: [0] 1. Error Block 20 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [118] 88. Error Block 22 start (CF ANALYSIS FAILED)
	var69_upvw.Size = UDim2.new(1, var69_upvw.ScrollBarThickness + 1, 1, -40 - 0)
	if VREnabled_upvr then
		var109 = 40
	else
		var109 = 0
	end
	var69_upvw.Position = UDim2.new(0, 0, 0, 40 + var109)
	AdjustHotbarFrames_upvr()
	AdjustInventoryFrames_upvr()
	-- KONSTANTERROR: [118] 88. Error Block 22 end (CF ANALYSIS FAILED)
end)()
local tbl_4 = {
	Name = "GamepadHintsFrame";
}
if any_IsTenFootInterface_result1_upvr then
else
end
tbl_4.Size = UDim2.new(0, var619_upvw.Size.X.Offset, 0, 60)
tbl_4.BackgroundTransparency = 1
tbl_4.Visible = false
tbl_4.Parent = var618
local var657_upvr = Utility_upvr:Create("Frame")(tbl_4)
local function addGamepadHint(arg1, arg2, arg3) -- Line 2236
	--[[ Upvalues[3]:
		[1]: Utility_upvr (readonly)
		[2]: var657_upvr (readonly)
		[3]: any_IsTenFootInterface_result1_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var659 = Utility_upvr:Create("Frame")({
		Name = "HintFrame";
		Size = UDim2.new(1, 0, 1, -5);
		Position = UDim2.new(0, 0, 0, 0);
		BackgroundTransparency = 1;
		Parent = var657_upvr;
	})
	local tbl_3 = {
		Name = "HintImage";
	}
	local var661
	local function INLINED_10() -- Internal function, doesn't exist in bytecode
		var661 = UDim2.new(0, 90, 0, 90)
		return var661
	end
	if not any_IsTenFootInterface_result1_upvr or not INLINED_10() then
		var661 = UDim2.new(0, 60, 0, 60)
	end
	tbl_3.Size = var661
	var661 = 1
	tbl_3.BackgroundTransparency = var661
	local function INLINED_11() -- Internal function, doesn't exist in bytecode
		var661 = arg2
		return var661
	end
	if not any_IsTenFootInterface_result1_upvr or not INLINED_11() then
		var661 = arg1
	end
	tbl_3.Image = var661
	tbl_3.Parent = var659
	var661 = {}
	var661.Name = "HintText"
	if any_IsTenFootInterface_result1_upvr then
	else
	end
	local var662 = 0
	var661.Position = UDim2.new(0, 70, var662, 0)
	if any_IsTenFootInterface_result1_upvr then
	else
	end
	var661.Size = UDim2.new(1, -70, 1, 0)
	var661.Font = Enum.Font.SourceSansBold
	if not any_IsTenFootInterface_result1_upvr or not Enum.FontSize.Size36 then
	end
	var661.FontSize = Enum.FontSize.Size24
	var661.BackgroundTransparency = 1
	var661.Text = arg3
	var661.TextColor3 = Color3.new(1, 1, 1)
	var661.TextXAlignment = Enum.TextXAlignment.Left
	var661.TextWrapped = true
	var661.Parent = var659
	local var663 = Utility_upvr:Create("TextLabel")(var661)
	var661 = Instance.new("UITextSizeConstraint", var663)
	var661.MaxTextSize = var663.TextSize
end
local function resizeGamepadHintsFrame_upvr() -- Line 2270, Named "resizeGamepadHintsFrame"
	--[[ Upvalues[4]:
		[1]: var657_upvr (readonly)
		[2]: var619_upvw (read and write)
		[3]: any_IsTenFootInterface_result1_upvr (readonly)
		[4]: var623_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Size = var619_upvw.Size
	local var673
	if any_IsTenFootInterface_result1_upvr then
		Size = 95
	else
		Size = 60
	end
	var673.Size = UDim2.new(var619_upvw.Size.X.Scale, Size.X.Offset, 0, Size)
	var673 = var657_upvr
	var673.Position = UDim2.new(var619_upvw.Position.X.Scale, var619_upvw.Position.X.Offset, var623_upvw.Position.Y.Scale, var623_upvw.Position.Y.Offset - var657_upvr.Size.Y.Offset)
	var673 = 0
	local children = var657_upvr:GetChildren()
	for i_21 = 1, #children do
		children[i_21].Size = UDim2.new(1, 0, 1, -5)
		children[i_21].Position = UDim2.new(0, 0, 0, 0)
		var673 += children[i_21].HintText.Position.X.Offset + children[i_21].HintText.TextBounds.X
		local var675
	end
	for i_22 = 1, #var675 do
		local var676
		local function INLINED_12() -- Internal function, doesn't exist in bytecode
			var676 = UDim2.new(0, 0, 0, 0)
			return var676
		end
		if i_22 ~= 1 or not INLINED_12() then
			var676 = UDim2.new(0, var675[i_22 - 1].Position.X.Offset + var675[i_22 - 1].Size.X.Offset + (var657_upvr.AbsoluteSize.X - var673) / (#var675 - 1), 0, 0)
		end
		var675[i_22].Position = var676
		var676 = UDim2.new(0, var675[i_22].HintText.Position.X.Offset + var675[i_22].HintText.TextBounds.X, 1, -5)
		var675[i_22].Size = var676
	end
end
addGamepadHint("rbxasset://textures/ui/Settings/Help/XButtonDark.png", "rbxasset://textures/ui/Settings/Help/XButtonDark@2x.png", "Remove From Hotbar ")
addGamepadHint("rbxasset://textures/ui/Settings/Help/AButtonDark.png", "rbxasset://textures/ui/Settings/Help/AButtonDark@2x.png", "Select/Swap")
addGamepadHint("rbxasset://textures/ui/Settings/Help/BButtonDark.png", "rbxasset://textures/ui/Settings/Help/BButtonDark@2x.png", "Close Backpack")
local NewGui_result1_5_upvr = NewGui_upvr("Frame", "Search")
local UICorner_5 = Instance.new("UICorner")
Name_upvr = "CornerRadius"
UICorner_5.CornerRadius = script:GetAttribute(Name_upvr)
UICorner_5.Parent = NewGui_result1_5_upvr
NewGui_result1_5_upvr.BackgroundColor3 = script:GetAttribute("SearchBoxColor")
NewGui_result1_5_upvr.BackgroundTransparency = script:GetAttribute("SearchBoxTransparency")
Name_upvr = 190
NewGui_result1_5_upvr.Size = UDim2.new(0, Name_upvr, 0, 30)
any_Create_result1_3_upvr = NewGui_result1_5_upvr.Size
Name_upvr = -any_Create_result1_3_upvr.X.Offset - 5
NewGui_result1_5_upvr.Position = UDim2.new(1, Name_upvr, 0, 5)
NewGui_result1_5_upvr.Parent = var623_upvw
Name_upvr = "TextBox"
local NewGui_result1_2_upvr = NewGui_upvr("TextBox", Name_upvr)
NewGui_result1_2_upvr.PlaceholderText = "search"
NewGui_result1_2_upvr.ClearTextOnFocus = false
NewGui_result1_2_upvr.FontSize = Enum.FontSize.Size24
NewGui_result1_2_upvr.TextXAlignment = Enum.TextXAlignment.Left
Name_upvr = "UIPadding"
local any = Instance.new(Name_upvr)
any.Parent = NewGui_result1_2_upvr
Name_upvr = UDim.new(0, 8)
any.PaddingLeft = Name_upvr
any_Create_result1_3_upvr = 0
Name_upvr = NewGui_result1_5_upvr.Size - UDim2.fromOffset(0, any_Create_result1_3_upvr)
NewGui_result1_2_upvr.Size = Name_upvr
Name_upvr = UDim2.new
any_Create_result1_3_upvr = 0
Name_upvr = Name_upvr(0, 0, 0, any_Create_result1_3_upvr)
NewGui_result1_2_upvr.Position = Name_upvr
NewGui_result1_2_upvr.Parent = NewGui_result1_5_upvr
Name_upvr = script.StrokeTemplate:Clone()
local var681_upvr = Name_upvr
var681_upvr.Enabled = false
var681_upvr.Parent = NewGui_result1_5_upvr
task.spawn(function() -- Line 2348
	--[[ Upvalues[2]:
		[1]: var681_upvr (readonly)
		[2]: TweenService_upvr (readonly)
	]]
	while true do
		task.wait()
		if var681_upvr.Enabled then
			local any_Create_result1 = TweenService_upvr:Create(var681_upvr.UIGradient, TweenInfo.new(0.05), {
				Rotation = var681_upvr.UIGradient.Rotation + 1;
			})
			any_Create_result1:Play()
			any_Create_result1.Completed:Wait()
		end
	end
end)
var125_upvw = NewGui_result1_2_upvr
local NewGui_result1_3_upvr = NewGui_upvr("TextButton", 'X')
local UICorner_2 = Instance.new("UICorner")
any_Create_result1_2_upvr = "CornerRadius"
UICorner_2.CornerRadius = script:GetAttribute(any_Create_result1_2_upvr)
UICorner_2.Parent = NewGui_result1_3_upvr
NewGui_result1_3_upvr.Text = 'X'
NewGui_result1_3_upvr.ZIndex = 10
any_Create_result1_3_upvr = 1
any_Create_result1_2_upvr = 1
NewGui_result1_3_upvr.TextColor3 = Color3.new(any_Create_result1_3_upvr, any_Create_result1_2_upvr, 1)
NewGui_result1_3_upvr.FontSize = Enum.FontSize.Size24
NewGui_result1_3_upvr.TextYAlignment = Enum.TextYAlignment.Bottom
NewGui_result1_3_upvr.BackgroundTransparency = 1
any_Create_result1_3_upvr = 0
any_Create_result1_2_upvr = NewGui_result1_5_upvr.Size.Y.Offset - 10
NewGui_result1_3_upvr.Size = UDim2.new(any_Create_result1_3_upvr, any_Create_result1_2_upvr, 0, NewGui_result1_5_upvr.Size.Y.Offset - 10)
any_Create_result1_3_upvr = 1
any_Create_result1_2_upvr = -NewGui_result1_3_upvr.Size.X.Offset - 10
NewGui_result1_3_upvr.Position = UDim2.new(any_Create_result1_3_upvr, any_Create_result1_2_upvr, 0.5, -NewGui_result1_3_upvr.Size.Y.Offset / 2)
NewGui_result1_3_upvr.Visible = false
NewGui_result1_3_upvr.BorderSizePixel = 0
NewGui_result1_3_upvr.Parent = NewGui_result1_5_upvr
local function search_upvr(arg1) -- Line 2386, Named "search"
	--[[ Upvalues[11]:
		[1]: NewGui_result1_2_upvr (readonly)
		[2]: FullSlots_upvr (readonly)
		[3]: tbl_8_upvr (readonly)
		[4]: var623_upvw (read and write)
		[5]: var82_upvw (read and write)
		[6]: IsOfCategory_upvr (readonly)
		[7]: var23_upvw (read and write)
		[8]: InventoryServiceEnums_upvr (readonly)
		[9]: var649_upvw (read and write)
		[10]: UpdateScrollingFrameCanvasSize_upvr (readonly)
		[11]: NewGui_result1_3_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local tbl = {}
	for i_23 in NewGui_result1_2_upvr.Text:gmatch("%S+"), nil do
		tbl[i_23:lower()] = true
	end
	for i_24 = FullSlots_upvr + 1, #tbl_8_upvr do
		local var705_upvr = tbl_8_upvr[i_24]
		table.insert({}, {var705_upvr, var705_upvr:CheckTerms(tbl)})
		var705_upvr.Frame.Visible = false
		pcall(function() -- Line 2401
			--[[ Upvalues[2]:
				[1]: var705_upvr (readonly)
				[2]: var623_upvw (copied, read and write)
			]]
			var705_upvr.Frame.Parent = var623_upvw
		end)
		local var708
	end
	table.sort(var708, function(arg1_51, arg2) -- Line 2406
		local var710
		if arg2[2] >= arg1_51[2] then
			var710 = false
		else
			var710 = true
		end
		return var710
	end)
	var82_upvw = true
	var705_upvr = nil
	for _, v_10 in var708, nil, var705_upvr do
		local _1 = v_10[1]
		local Tool_31 = _1.Tool
		if 0 < v_10[2] or NewGui_result1_2_upvr.Text == "" or IsOfCategory_upvr(Tool_31) then
			if var23_upvw and not Tool_31:GetAttribute(InventoryServiceEnums_upvr.Favorite) then
				_1.Frame.Visible = false
			else
				_1.Frame.Visible = true
				_1.Frame.Parent = var649_upvw
				_1.Frame.LayoutOrder = FullSlots_upvr + 0
			end
		else
			_1.Frame.Visible = false
		end
	end
	UpdateScrollingFrameCanvasSize_upvr()
	NewGui_result1_3_upvr.ZIndex = 3
end
var21_upvw = search_upvr
function any_Create_result1_3_upvr() -- Line 2439, Named "clearResults"
	--[[ Upvalues[8]:
		[1]: var82_upvw (read and write)
		[2]: FullSlots_upvr (readonly)
		[3]: tbl_8_upvr (readonly)
		[4]: var22_upvw (read and write)
		[5]: var649_upvw (read and write)
		[6]: IsOfCategory_upvr (readonly)
		[7]: NewGui_result1_3_upvr (readonly)
		[8]: UpdateScrollingFrameCanvasSize_upvr (readonly)
	]]
	var82_upvw = false
	for i_26 = FullSlots_upvr + 1, #tbl_8_upvr do
		local var716 = tbl_8_upvr[i_26]
		if var716 and var716.Tool then
			if var22_upvw == "All" then
				var716.Frame.LayoutOrder = var716.Index
				var716.Frame.Parent = var649_upvw
				var716.Frame.Visible = true
			elseif var22_upvw ~= "All" then
				if IsOfCategory_upvr(var716.Tool) then
					var716.Frame.Visible = true
				else
					var716.Frame.Visible = false
				end
			end
		end
	end
	NewGui_result1_3_upvr.ZIndex = 0
	UpdateScrollingFrameCanvasSize_upvr()
end
local var714_upvw = any_Create_result1_3_upvr
function any_Create_result1_2_upvr() -- Line 2466, Named "reset"
	--[[ Upvalues[2]:
		[1]: var714_upvw (readonly)
		[2]: NewGui_result1_2_upvr (readonly)
	]]
	var714_upvw()
	NewGui_result1_2_upvr.Text = ""
end
NewGui_result1_3_upvr.MouseButton1Click:Connect(any_Create_result1_2_upvr)
NewGui_result1_2_upvr.Changed:Connect(function(arg1) -- Line 2471, Named "onChanged"
	--[[ Upvalues[5]:
		[1]: var627_upvw (read and write)
		[2]: NewGui_result1_2_upvr (readonly)
		[3]: search_upvr (readonly)
		[4]: NewGui_result1_3_upvr (readonly)
		[5]: var681_upvr (readonly)
	]]
	if arg1 == "Text" then
		var627_upvw("All")
		local Text = NewGui_result1_2_upvr.Text
		search_upvr()
		local var718 = false
		if Text ~= "" then
			if Text == "" then
				var718 = false
			else
				var718 = true
			end
		end
		NewGui_result1_3_upvr.Visible = var718
		if Text ~= "" then
			if Text == "" then
			else
			end
		end
		var681_upvr.Enabled = true
	end
end)
NewGui_result1_2_upvr.FocusLost:Connect(function(arg1) -- Line 2481, Named "focusLost"
	--[[ Upvalues[1]:
		[1]: search_upvr (readonly)
	]]
	if arg1 then
		search_upvr()
	end
end)
local FavoriteOnly_upvr = script:WaitForChild("FavoriteOnly")
NewGui_result1_2_upvr.Size = NewGui_result1_5_upvr.Size - UDim2.fromOffset(0, 0)
NewGui_result1_2_upvr.Position = UDim2.new(0, 0, 0, 0)
FavoriteOnly_upvr.Position = NewGui_result1_2_upvr.Parent.Position - UDim2.fromOffset(NewGui_result1_2_upvr.Size.Y.Offset * 1.25, 0)
FavoriteOnly_upvr.Size = UDim2.fromOffset(NewGui_result1_2_upvr.Size.Y.Offset, NewGui_result1_2_upvr.Size.Y.Offset)
FavoriteOnly_upvr.ImageButton.Activated:Connect(function() -- Line 2500
	--[[ Upvalues[3]:
		[1]: var23_upvw (read and write)
		[2]: FavoriteOnly_upvr (readonly)
		[3]: var21_upvw (read and write)
	]]
	var23_upvw = not var23_upvw
	local var721 = FavoriteOnly_upvr
	if var23_upvw then
		var721 = "rbxassetid://83373307650705"
	else
		var721 = "rbxassetid://90084965933996"
	end
	var721.ImageButton.Image = var721
	var21_upvw()
end)
FavoriteOnly_upvr.Parent = NewGui_result1_2_upvr.Parent.Parent
module_upvr_2.StateChanged.Event:Connect(function(arg1) -- Line 2509
	--[[ Upvalues[2]:
		[1]: var623_upvw (read and write)
		[2]: any_new_result1_upvr (readonly)
	]]
	if not arg1 and not var623_upvw.Visible then
		any_new_result1_upvr:deselect()
	end
end)
tbl_upvr_2[Enum.KeyCode.Escape.Value] = function(arg1) -- Line 2517
	--[[ Upvalues[2]:
		[1]: var623_upvw (read and write)
		[2]: any_new_result1_upvr (readonly)
	]]
	if arg1 then
	elseif var623_upvw.Visible then
		any_new_result1_upvr:deselect()
	end
end
tbl_upvr_2[Enum.KeyCode.ButtonL2.Value] = function(arg1) -- Line 2524
	--[[ Upvalues[2]:
		[1]: var44_upvw (read and write)
		[2]: Favorite_Item_upvr (readonly)
	]]
	if not var44_upvw then
	else
		local Tool_9 = var44_upvw.Tool
		if not Tool_9 then return end
		if workspace:GetAttribute("InTutorial") then return end
		Favorite_Item_upvr:FireServer(Tool_9)
	end
end
UserInputService_upvr.LastInputTypeChanged:Connect(function(arg1) -- Line 2532, Named "detectGamepad"
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: NewGui_result1_5_upvr (readonly)
	]]
	if arg1 == Enum.UserInputType.Gamepad1 then
		if not UserInputService_upvr.VREnabled then
			NewGui_result1_5_upvr.Visible = false
			return
		end
	end
	NewGui_result1_5_upvr.Visible = true
end)
NewGui_result1_5_upvr = GuiService_upvr.MenuOpened
function NewGui_result1_2_upvr() -- Line 2542
	--[[ Upvalues[2]:
		[1]: var623_upvw (read and write)
		[2]: any_new_result1_upvr (readonly)
	]]
	if var623_upvw.Visible then
		any_new_result1_upvr:deselect()
	end
end
NewGui_result1_5_upvr = NewGui_result1_5_upvr:Connect
NewGui_result1_5_upvr(NewGui_result1_2_upvr)
function NewGui_result1_5_upvr(arg1, arg2, arg3) -- Line 2549
	--[[ Upvalues[4]:
		[1]: GuiService_upvr (readonly)
		[2]: FullSlots_upvr (readonly)
		[3]: tbl_8_upvr (readonly)
		[4]: var714_upvw (read and write)
	]]
	if arg2 ~= Enum.UserInputState.Begin then
	else
		if not GuiService_upvr.SelectedObject then return end
		for i_31 = 1, FullSlots_upvr do
			if tbl_8_upvr[i_31].Frame == GuiService_upvr.SelectedObject and tbl_8_upvr[i_31].Tool then
				tbl_8_upvr[i_31]:MoveToInventory()
				var714_upvw()
				return
			end
		end
		var714_upvw()
	end
end
var681_upvr = Enum.CoreGuiType.Backpack
NewGui_result1_3_upvr = false
NewGui_result1_2_upvr = StarterGui_upvr:SetCoreGuiEnabled
NewGui_result1_2_upvr(var681_upvr, NewGui_result1_3_upvr)
function module_upvr_2.OpenClose() -- Line 2568, Named "openClose"
	--[[ Upvalues[14]:
		[1]: tbl_9_upvr (readonly)
		[2]: var623_upvw (read and write)
		[3]: AdjustHotbarFrames_upvr (readonly)
		[4]: var619_upvw (read and write)
		[5]: FullSlots_upvr (readonly)
		[6]: tbl_8_upvr (readonly)
		[7]: var83_upvw (read and write)
		[8]: tbl_2_upvr (readonly)
		[9]: UserInputService_upvr (readonly)
		[10]: resizeGamepadHintsFrame_upvr (readonly)
		[11]: var657_upvr (readonly)
		[12]: ContextActionService_upvr (readonly)
		[13]: NewGui_result1_5_upvr (readonly)
		[14]: module_upvr_2 (readonly)
	]]
	if not next(tbl_9_upvr) then
		var623_upvw.Visible = not var623_upvw.Visible
		AdjustHotbarFrames_upvr()
		var619_upvw.Active = not var619_upvw.Active
		for i_27 = 1, FullSlots_upvr do
			if tbl_8_upvr[i_27] then
				tbl_8_upvr[i_27]:SetClickability(not var623_upvw.Visible)
			end
		end
	end
	if var623_upvw.Visible then
		if var83_upvw then
			if tbl_2_upvr[UserInputService_upvr:GetLastInputType()] then
				resizeGamepadHintsFrame_upvr()
				i_27 = UserInputService_upvr
				var657_upvr.Visible = not i_27.VREnabled
			end
			enableGamepadInventoryControl()
			-- KONSTANTWARNING: GOTO [73] #60
		end
	else
		if var83_upvw then
			var657_upvr.Visible = false
		end
		disableGamepadInventoryControl()
	end
	if var623_upvw.Visible then
		ContextActionService_upvr:BindAction("RBXRemoveSlot", NewGui_result1_5_upvr, false, Enum.KeyCode.ButtonX)
	else
		ContextActionService_upvr:UnbindAction("RBXRemoveSlot")
	end
	module_upvr_2.IsOpen = var623_upvw.Visible
	module_upvr_2.StateChanged:Fire(var623_upvw.Visible)
end
NewGui_result1_5_upvr = LocalPlayer_upvr.CharacterAdded
NewGui_result1_2_upvr = OnCharacterAdded
NewGui_result1_5_upvr = NewGui_result1_5_upvr:Connect
NewGui_result1_5_upvr(NewGui_result1_2_upvr)
NewGui_result1_5_upvr = LocalPlayer_upvr.Character
if NewGui_result1_5_upvr then
	NewGui_result1_5_upvr = OnCharacterAdded
	NewGui_result1_5_upvr(LocalPlayer_upvr.Character)
end
NewGui_result1_5_upvr = UserInputService_upvr.InputBegan
function NewGui_result1_2_upvr(arg1, arg2) -- Line 1546, Named "OnInputBegan"
	--[[ Upvalues[7]:
		[1]: var81_upvw (read and write)
		[2]: var80_upvw (read and write)
		[3]: Value_upvr (readonly)
		[4]: tbl_upvr_2 (readonly)
		[5]: var67_upvw (read and write)
		[6]: FindFirstNamedAtMouse_upvr (readonly)
		[7]: any_new_result1_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 5. Error Block 23 start (CF ANALYSIS FAILED)
	local function INLINED_9() -- Internal function, doesn't exist in bytecode
		-- KONSTANTERROR: [25] 16. Error Block 20 end (CF ANALYSIS FAILED)
		local var582 = tbl_upvr_2[arg1.KeyCode.Value]
		-- KONSTANTERROR: [25] 16. Error Block 20 start (CF ANALYSIS FAILED)
		return var582
	end
	if arg1.UserInputType == Enum.UserInputType.Keyboard and not var81_upvw and (var80_upvw or arg1.KeyCode.Value == Value_upvr) or INLINED_9() then
		var582(arg2)
	end
	local UserInputType = arg1.UserInputType
	if UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.Touch then
		if var67_upvw.Visible then
			if not FindFirstNamedAtMouse_upvr("CategoryFrame") then
				any_new_result1_upvr:deselect()
			end
		end
	end
	-- KONSTANTERROR: [8] 5. Error Block 23 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [57] 39. Error Block 16 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [57] 39. Error Block 16 end (CF ANALYSIS FAILED)
end
NewGui_result1_5_upvr = NewGui_result1_5_upvr:Connect
NewGui_result1_5_upvr(NewGui_result1_2_upvr)
NewGui_result1_5_upvr = UserInputService_upvr.TextBoxFocused
function NewGui_result1_2_upvr() -- Line 2622
	--[[ Upvalues[1]:
		[1]: var81_upvw (read and write)
	]]
	var81_upvw = true
end
NewGui_result1_5_upvr = NewGui_result1_5_upvr:Connect
NewGui_result1_5_upvr(NewGui_result1_2_upvr)
NewGui_result1_5_upvr = UserInputService_upvr.TextBoxFocusReleased
function NewGui_result1_2_upvr() -- Line 2625
	--[[ Upvalues[1]:
		[1]: var81_upvw (read and write)
	]]
	var81_upvw = false
end
NewGui_result1_5_upvr = NewGui_result1_5_upvr:Connect
NewGui_result1_5_upvr(NewGui_result1_2_upvr)
function NewGui_result1_5_upvr() -- Line 2629
	--[[ Upvalues[1]:
		[1]: class_Humanoid_upvw (read and write)
	]]
	if class_Humanoid_upvw then
		class_Humanoid_upvw:UnequipTools()
	end
end
tbl_upvr_2[Value_upvr] = NewGui_result1_5_upvr
NewGui_result1_5_upvr = UserInputService_upvr.Changed
NewGui_result1_2_upvr = OnUISChanged
NewGui_result1_5_upvr = NewGui_result1_5_upvr:Connect
NewGui_result1_5_upvr(NewGui_result1_2_upvr)
NewGui_result1_5_upvr = OnUISChanged
NewGui_result1_5_upvr("KeyboardEnabled")
NewGui_result1_2_upvr = Enum.UserInputType.Gamepad1
NewGui_result1_5_upvr = UserInputService_upvr:GetGamepadConnected(NewGui_result1_2_upvr)
if NewGui_result1_5_upvr then
	NewGui_result1_5_upvr = gamepadConnected
	NewGui_result1_5_upvr()
end
NewGui_result1_5_upvr = UserInputService_upvr.GamepadConnected
function NewGui_result1_2_upvr(arg1) -- Line 2639
	if arg1 == Enum.UserInputType.Gamepad1 then
		gamepadConnected()
	end
end
NewGui_result1_5_upvr = NewGui_result1_5_upvr:Connect
NewGui_result1_5_upvr(NewGui_result1_2_upvr)
NewGui_result1_5_upvr = UserInputService_upvr.GamepadDisconnected
function NewGui_result1_2_upvr(arg1) -- Line 2644
	if arg1 == Enum.UserInputType.Gamepad1 then
		gamepadDisconnected()
	end
end
NewGui_result1_5_upvr = NewGui_result1_5_upvr:Connect
NewGui_result1_5_upvr(NewGui_result1_2_upvr)
function NewGui_result1_5_upvr(arg1, arg2) -- Line 2651, Named "SetBackpackEnabled"
	--[[ Upvalues[1]:
		[1]: var45_upvw (read and write)
	]]
	var45_upvw = arg2
end
module_upvr_2.SetBackpackEnabled = NewGui_result1_5_upvr
function NewGui_result1_5_upvr(arg1) -- Line 2655, Named "IsOpened"
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	return module_upvr_2.IsOpen
end
module_upvr_2.IsOpened = NewGui_result1_5_upvr
function NewGui_result1_5_upvr(arg1) -- Line 2659, Named "GetBackpackEnabled"
	--[[ Upvalues[1]:
		[1]: var45_upvw (read and write)
	]]
	return var45_upvw
end
module_upvr_2.GetBackpackEnabled = NewGui_result1_5_upvr
function NewGui_result1_5_upvr(arg1) -- Line 2663, Named "GetStateChangedEvent"
	--[[ Upvalues[1]:
		[1]: Backpack_upvw (read and write)
	]]
	return Backpack_upvw.StateChanged
end
module_upvr_2.GetStateChangedEvent = NewGui_result1_5_upvr
NewGui_result1_5_upvr = game:GetService("RunService").Heartbeat
function NewGui_result1_2_upvr() -- Line 2667
	--[[ Upvalues[2]:
		[1]: OnIconChanged_upvr (readonly)
		[2]: var45_upvw (read and write)
	]]
	OnIconChanged_upvr(var45_upvw)
end
NewGui_result1_5_upvr = NewGui_result1_5_upvr:Connect
NewGui_result1_5_upvr(NewGui_result1_2_upvr)
NewGui_result1_5_upvr = Api.Event
function NewGui_result1_2_upvr(arg1, arg2) -- Line 2670
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 2. Error Block 2 start (CF ANALYSIS FAILED)
	module_upvr_2:SetBackpackEnabled(arg2)
	do
		return
	end
	-- KONSTANTERROR: [2] 2. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 end (CF ANALYSIS FAILED)
end
NewGui_result1_5_upvr = NewGui_result1_5_upvr:Connect
NewGui_result1_5_upvr(NewGui_result1_2_upvr)
return module_upvr_2
