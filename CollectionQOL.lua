-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-30 19:20:22
-- Luau version 6, Types version 3
-- Time taken: 0.001191 seconds

local UserInputService = game:GetService("UserInputService")
local var2_upvw = false
local var3_upvw = false
local var5_upvw
local var6_upvw = true
game:GetService("ProximityPromptService").PromptShown:Connect(function(arg1) -- Line 12
	--[[ Upvalues[3]:
		[1]: var5_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: var6_upvw (read and write)
	]]
	if not arg1:HasTag("CollectPrompt") then
	else
		var5_upvw = arg1
		if var3_upvw and var6_upvw then
			var6_upvw = false
			task.delay(0.25, function() -- Line 18
				--[[ Upvalues[1]:
					[1]: var6_upvw (copied, read and write)
				]]
				var6_upvw = true
			end)
			arg1:InputHoldBegin()
			return
		end
		task.wait(0.28)
		if var3_upvw and var5_upvw == arg1 then
			arg1:InputHoldBegin()
		end
	end
end)
UserInputService.InputBegan:Connect(function(arg1, arg2) -- Line 34
	--[[ Upvalues[2]:
		[1]: var2_upvw (read and write)
		[2]: var3_upvw (read and write)
	]]
	if arg1.UserInputType == Enum.UserInputType.Keyboard or arg1.UserInputType == Enum.UserInputType.Gamepad1 or arg1.KeyCode == Enum.KeyCode.F or arg1.KeyCode == Enum.KeyCode.ButtonX then
		var2_upvw = true
		task.wait(0.1)
		if var2_upvw then
			var3_upvw = true
		end
	end
end)
UserInputService.InputEnded:Connect(function(arg1, arg2) -- Line 50
	--[[ Upvalues[2]:
		[1]: var2_upvw (read and write)
		[2]: var3_upvw (read and write)
	]]
	if arg1.UserInputType == Enum.UserInputType.Keyboard or arg1.UserInputType == Enum.UserInputType.Gamepad1 or arg1.KeyCode == Enum.KeyCode.F or arg1.KeyCode == Enum.KeyCode.ButtonX then
		var2_upvw = false
		var3_upvw = false
	end
end)
