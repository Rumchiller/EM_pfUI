pfUI:RegisterModule("hoverbind", function ()
  local default_border = C.appearance.border.default
  local keymap = {
    -- buttons to binding association
    ["pfActionBarMainButton"]     = "ACTIONBUTTON",
    ["pfActionBarTopButton"]      = "MULTIACTIONBAR1BUTTON",
    ["pfActionBarLeftButton"]     = "MULTIACTIONBAR2BUTTON",
    ["pfActionBarRightButton"]    = "MULTIACTIONBAR3BUTTON",
    ["pfActionBarVerticalButton"] = "MULTIACTIONBAR4BUTTON",
    ["pfActionBarStancesButton"]  = "SHAPESHIFTBUTTON",
    ["pfActionBarPetButton"]      = "BONUSACTIONBUTTON",

    -- special buttons
    ["pfActionBarPagingButton"]     = "PFPAGING",
    ["pfActionBarStanceBar1Button"] = "PFSTANCEONE",
    ["pfActionBarStanceBar2Button"] = "PFSTANCETWO",
    ["pfActionBarStanceBar3Button"] = "PFSTANCETHREE",
    ["pfActionBarStanceBar4Button"] = "PFSTANCEFOUR",
  }

  local modifiers = {
    ["ALT"]   = "ALT-",
    ["CTRL"]  = "CTRL-",
    ["SHIFT"] = "SHIFT-"
  }

	local barnames =
	{
		[1] = "Main",
		[2] = "Paging",
		[3] = "Right",
		[4] = "Vertical",
		[5] = "Left",
		[6] = "Top",
		[7] = "StanceBar1",
		[8] = "StanceBar2",
		[9] = "StanceBar3",
		[10] = "StanceBar4",
		[11] = "Stances",
		[12] = "Pet",
	};
	local barsCount				= table.getn(barnames);
	local maxButtons			= 12;
	local actionBarButton		= {};
	local actionBarButtonAction	= {};

  pfUI.hoverbind = CreateFrame("Frame","pfKeyBindingFrame",UIParent)
  pfUI.hoverbind:Hide()
  pfUI.hoverbind:RegisterEvent("PLAYER_REGEN_DISABLED")
  pfUI.hoverbind:EnableMouse(true)
  pfUI.hoverbind.edit = CreateFrame("Button", "pfKeyBindingFrameEdit", pfUI.hoverbind)
  pfUI.hoverbind.edit:SetFrameStrata("BACKGROUND")
  pfUI.hoverbind.edit:SetAllPoints(UIParent)
  pfUI.hoverbind.edit.tex = pfUI.hoverbind.edit:CreateTexture("pfKeyBindShade", "BACKGROUND")
  pfUI.hoverbind.edit.tex:SetAllPoints(pfUI.hoverbind.edit)
  pfUI.hoverbind.edit.tex:SetTexture(0,0,0,.5)
  pfUI.hoverbind.edit:SetScript("OnClick", function()
    pfUI.hoverbind:Hide()
  end)

  pfUI.hoverbind:SetScript("OnMouseUp",function(...)
    pfUI.hoverbind:Hide()
  end)

  pfUI.hoverbind:SetScript("OnShow", function()
    if pfUI.bars then
      pfUI.bars:UpdateGrid(1)
      pfUI.bars:UpdateGrid(1, "PET")
    end
    pfUI.gui:Hide()
    pfUI.hoverbind.edit:Show()

    local txt = T["|cff33ffccKeybind Mode|r\nThis mode allows you to bind keyboard shortcuts to your actionbars.\nBy hovering a button with your cursor and pressing a key, the key will be assigned to that button.\nHit Escape on a button to remove bindings.\n\nPress Escape or click on an empty area to leave the keybind mode."]
    CreateInfoBox(txt, 30,  pfUI.hoverbind.edit)
	
	local barButtonName;
	local i, j;

	for i = 1, barsCount, 1 do
		for j = 1, maxButtons, 1 do

			barButtonName			= "pfActionBar" .. barnames[i] .. "Button" .. j;
			actionBarButton[i * j]	= getglobal(barButtonName);

			if (actionBarButton[i * j]) then

				actionBarButtonAction[i * j] = actionBarButton[i * j]:GetScript("OnMouseUp");

				actionBarButton[i * j]:SetScript("OnMouseUp", function(...)

				    local frame		= GetMouseFocus();
					local button	= arg1;
					local need_save	= false;
					local hovername = (frame and frame.GetName) and (frame:GetName()) or "";
					local binding	= pfUI.hoverbind:GetBinding(hovername);

					if (button == "LeftButton") then
						if (pfUI.hoverbind:GetPrefix() == "") then
							return;
						else
							button = "BUTTON1";
						end
					elseif (button == "RightButton") then
						if (pfUI.hoverbind:GetPrefix() == "") then
							return;
						else
							button = "BUTTON2";
						end
					elseif (button == "MiddleButton") then
						button = "BUTTON3";
					end

					if binding and SetBinding(pfUI.hoverbind:GetPrefix() .. string.upper(button), binding) then
						SaveBindings(GetCurrentBindingSet());
					end

				end)

			end

		end
	end

  end)

  pfUI.hoverbind:SetScript("OnHide",function()
    if pfUI.bars then
      pfUI.bars:UpdateGrid(0)
      pfUI.bars:UpdateGrid(0, "PET")
    end
    pfUI.hoverbind.edit:Hide()
    pfUI.gui:Show()
	
	for i = 1, barsCount, 1 do
		for j = 1, maxButtons, 1 do

			barButtonName			= "pfActionBar" .. barnames[i] .. "Button" .. j;
			actionBarButton[i * j]	= getglobal(barButtonName);

			if (actionBarButton[i * j] ~= nil) then
				actionBarButton[i * j]:SetScript("OnMouseUp", actionBarButtonAction[i * j]);
			end

		end
	end

  end)

  pfUI.hoverbind:EnableKeyboard(true)
  pfUI.hoverbind:SetScript("OnKeyUp",function(...)
    if modifiers[arg1] then return end -- ignore single modifier keyup
    local need_save = false
    local frame = GetMouseFocus()
    local hovername = (frame and frame.GetName) and (frame:GetName()) or ""
    local binding = pfUI.hoverbind:GetBinding(hovername)
    if arg1 == "ESCAPE" and not binding then pfUI.hoverbind:Hide() return end
    if binding then
      if arg1 == "ESCAPE" then
        local key = (GetBindingKey(binding))
        if (key) then
          SetBinding(key)
          need_save = true
        end
      else
        if (SetBinding(pfUI.hoverbind:GetPrefix()..arg1,binding)) then
          need_save = true
        end
      end
    end
    -- if we set or cleared a binding save to the selected set
    if need_save then
      need_save = false
      SaveBindings(GetCurrentBindingSet())
    end
  end)

  function pfUI.hoverbind:GetBinding(button_name)
    local found,_,buttontype,buttonindex = string.find(button_name,"^(.-)(%d+)$")
    if found then
      if keymap[buttontype] then
        return string.format("%s%d",keymap[buttontype],buttonindex)
      elseif buttontype == "ActionButton" then
        return string.format("ACTIONBUTTON%d",buttonindex)
      else
        return nil
      end
    else
      return nil
    end
  end

  function pfUI.hoverbind:GetPrefix()
    return string.format("%s%s%s",
      (IsAltKeyDown() and modifiers.ALT or ""),
      (IsControlKeyDown() and modifiers.CTRL or ""),
      (IsShiftKeyDown() and modifiers.SHIFT or ""))
  end

  pfUI.hoverbind:SetScript("OnEvent",function()
    -- disable hoverbind so player gets back control of their keyboard to fight
    pfUI.hoverbind:Hide()
  end)
end)
