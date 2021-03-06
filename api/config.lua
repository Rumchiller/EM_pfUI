-- load pfUI environment
setfenv(1, pfUI:GetEnvironment())

function pfUI:UpdateConfig(group, subgroup, entry, value)
  -- create empty config if not existing
  if not pfUI_config then
    pfUI_config = {}
  end

  -- check for missing config groups
  if not pfUI_config[group] then
    pfUI_config[group] = {}
  end

  -- update config
  if not subgroup and entry and value and not pfUI_config[group][entry] then
    pfUI_config[group][entry] = value
  end

  -- check for missing config subgroups
  if subgroup and not pfUI_config[group][subgroup] then
    pfUI_config[group][subgroup] = {}
  end

  -- update config in subgroup
  if subgroup and entry and value and not pfUI_config[group][subgroup][entry] then
    pfUI_config[group][subgroup][entry] = value
  end
end

function pfUI:LoadConfig()
  --                MODULE        SUBGROUP       ENTRY               VALUE
  pfUI:UpdateConfig("global",     nil,           "language",         GetLocale())
  pfUI:UpdateConfig("global",     nil,           "profile",          "default")
  pfUI:UpdateConfig("global",     nil,           "pixelperfect",     "0")
  pfUI:UpdateConfig("global",     nil,           "offscreen",        "0")

  pfUI:UpdateConfig("global",     nil,           "font_default",     "Interface\\AddOns\\pfUI\\fonts\\Myriad-Pro.ttf")
  pfUI:UpdateConfig("global",     nil,           "font_size",        "12")
  pfUI:UpdateConfig("global",     nil,           "font_unit",        "Interface\\AddOns\\pfUI\\fonts\\BigNoodleTitling.ttf")
  pfUI:UpdateConfig("global",     nil,           "font_unit_size",   "12")
  pfUI:UpdateConfig("global",     nil,           "font_combat",      "Interface\\AddOns\\pfUI\\fonts\\Continuum.ttf")

  pfUI:UpdateConfig("global",     nil,           "force_region",     "1")
  pfUI:UpdateConfig("global",     nil,           "errors_limit",     "1")
  pfUI:UpdateConfig("global",     nil,           "errors_hide",      "0")
  pfUI:UpdateConfig("global",     nil,           "hidebuff",         "0")
  pfUI:UpdateConfig("global",     nil,           "hidewbuff",        "0")
  pfUI:UpdateConfig("global",     nil,           "twentyfour",       "1")
  pfUI:UpdateConfig("global",     nil,           "servertime",       "0")
  pfUI:UpdateConfig("global",     nil,           "autosell",         "0")
  pfUI:UpdateConfig("global",     nil,           "autorepair",       "0")
  pfUI:UpdateConfig("gui",        nil,           "reloadmarker",     "0")

  pfUI:UpdateConfig("buffs",      nil,           "buffs",            "1")
  pfUI:UpdateConfig("buffs",      nil,           "debuffs",          "1")
  pfUI:UpdateConfig("buffs",      nil,           "weapons",          "1")
  pfUI:UpdateConfig("buffs",      nil,           "separateweapons",  "0")
  pfUI:UpdateConfig("buffs",      nil,           "size",             "24")
  pfUI:UpdateConfig("buffs",      nil,           "spacing",          "5")
  pfUI:UpdateConfig("buffs",      nil,           "wepbuffrowsize",   "2")
  pfUI:UpdateConfig("buffs",      nil,           "buffrowsize",      "16")
  pfUI:UpdateConfig("buffs",      nil,           "debuffrowsize",    "16")
  pfUI:UpdateConfig("buffs",      nil,           "textinside",       "0")
  pfUI:UpdateConfig("buffs",      nil,           "fontsize",         "-1")

  pfUI:UpdateConfig("buffbar",    "pbuff",       "enable",           "0")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "use_unitfonts",    "0")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "sort",             "asc")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "color",            ".5,.5,.5,1")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "bordercolor",      "0,0,0,0")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "textcolor",        "1,1,1,1")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "dtypebg",          "1")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "dtypeborder",      "0")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "dtypetext",        "0")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "colorstacks",      "0")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "width",            "-1")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "height",           "20")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "filter",           "blacklist")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "threshold",        "120")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "whitelist",        "")
  pfUI:UpdateConfig("buffbar",    "pbuff",       "blacklist",        "")

  pfUI:UpdateConfig("buffbar",    "pdebuff",     "enable",           "0")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "use_unitfonts",    "0")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "sort",             "asc")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "color",            "8,.4,.4,1")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "bordercolor",      "0,0,0,0")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "textcolor",        "1,1,1,1")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "dtypebg",          "0")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "dtypeborder",      "1")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "dtypetext",        "0")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "colorstacks",      "0")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "width",            "-1")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "height",           "20")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "filter",           "blacklist")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "threshold",        "120")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "whitelist",        "")
  pfUI:UpdateConfig("buffbar",    "pdebuff",     "blacklist",        "")

  pfUI:UpdateConfig("buffbar",    "tdebuff",     "enable",           "0")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "use_unitfonts",    "0")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "sort",             "asc")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "color",            ".8,.4,.4,1")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "bordercolor",      "0,0,0,0")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "textcolor",        "1,1,1,1")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "dtypebg",          "0")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "dtypeborder",      "1")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "dtypetext",        "0")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "colorstacks",      "0")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "width",            "-1")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "height",           "20")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "filter",           "blacklist")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "threshold",        "120")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "whitelist",        "")
  pfUI:UpdateConfig("buffbar",    "tdebuff",     "blacklist",        "")

  pfUI:UpdateConfig("appearance", "border",      "background",       "0,0,0,1")
  pfUI:UpdateConfig("appearance", "border",      "color",            "0.2,0.2,0.2,1")
  pfUI:UpdateConfig("appearance", "border",      "shadow",           "0")
  pfUI:UpdateConfig("appearance", "border",      "shadow_intensity", ".35")
  pfUI:UpdateConfig("appearance", "border",      "default",          "3")
  pfUI:UpdateConfig("appearance", "border",      "actionbars",       "-1")
  pfUI:UpdateConfig("appearance", "border",      "unitframes",       "-1")
  pfUI:UpdateConfig("appearance", "border",      "panels",           "-1")
  pfUI:UpdateConfig("appearance", "border",      "chat",             "-1")
  pfUI:UpdateConfig("appearance", "border",      "bags",             "-1")
  pfUI:UpdateConfig("appearance", "cd",          "lowcolor",         "1,.2,.2,1")
  pfUI:UpdateConfig("appearance", "cd",          "normalcolor",      "1,1,1,1")
  pfUI:UpdateConfig("appearance", "cd",          "minutecolor",      ".2,1,1,1")
  pfUI:UpdateConfig("appearance", "cd",          "hourcolor",        ".2,.5,1,1")
  pfUI:UpdateConfig("appearance", "cd",          "daycolor",         ".2,.2,1,1")
  pfUI:UpdateConfig("appearance", "cd",          "threshold",        "2")
  pfUI:UpdateConfig("appearance", "cd",          "font_size",        "12")
  pfUI:UpdateConfig("appearance", "cd",          "debuffs",          "1")
  pfUI:UpdateConfig("appearance", "cd",          "blizzard",         "1")
  pfUI:UpdateConfig("appearance", "cd",          "foreign",          "0")
  pfUI:UpdateConfig("appearance", "castbar",     "castbarcolor",     ".7,.7,.9,.8")
  pfUI:UpdateConfig("appearance", "castbar",     "channelcolor",     ".9,.9,.7,.8")
  pfUI:UpdateConfig("appearance", "castbar",     "texture",          "Interface\\AddOns\\pfUI\\img\\bar")
  pfUI:UpdateConfig("appearance", "infight",     "screen",           "0")
  pfUI:UpdateConfig("appearance", "bags",        "unusable",         "1")
  pfUI:UpdateConfig("appearance", "bags",        "unusable_color",   ".9,.2,.2,1")
  pfUI:UpdateConfig("appearance", "bags",        "borderlimit",      "1")
  pfUI:UpdateConfig("appearance", "bags",        "borderonlygear",   "0")
  pfUI:UpdateConfig("appearance", "bags",        "movable",          "0")
  pfUI:UpdateConfig("appearance", "bags",        "hidechat",         "0")
  pfUI:UpdateConfig("appearance", "bags",        "icon_size",        "-1")
  pfUI:UpdateConfig("appearance", "bags",        "bagrowlength",     "10")
  pfUI:UpdateConfig("appearance", "bags",        "bankrowlength",    "10")
  pfUI:UpdateConfig("appearance", "minimap",     "mouseoverzone",    "0")
  pfUI:UpdateConfig("appearance", "minimap",     "coordsloc",        "bottomleft")
  pfUI:UpdateConfig("appearance", "minimap",     "tracking_size",    "16")
  pfUI:UpdateConfig("appearance", "minimap",     "tracking_pulse",   "1")
  pfUI:UpdateConfig("appearance", "worldmap",    "mapreveal",        "0")
  pfUI:UpdateConfig("appearance", "worldmap",    "mapreveal_color",  ".4,.4,.4,1")

  pfUI:UpdateConfig("loot",       nil,           "autoresize",       "1")
  pfUI:UpdateConfig("loot",       nil,           "autopickup",       "1")
  pfUI:UpdateConfig("loot",       nil,           "mousecursor",      "1")
  pfUI:UpdateConfig("loot",       nil,           "advancedloot",     "1")
  pfUI:UpdateConfig("loot",       nil,           "rollannouncequal", "3")
  pfUI:UpdateConfig("loot",       nil,           "rollannounce",     "0")
  pfUI:UpdateConfig("loot",       nil,           "raritytimer",      "1")

  pfUI:UpdateConfig("unitframes", nil,           "disable",          "0")
  pfUI:UpdateConfig("unitframes", nil,           "pastel",           "1")
  pfUI:UpdateConfig("unitframes", nil,           "custom",           "0")
  pfUI:UpdateConfig("unitframes", nil,           "customfullhp",     "0")
  pfUI:UpdateConfig("unitframes", nil,           "customcolor",      ".2,.2,.2,1")
  pfUI:UpdateConfig("unitframes", nil,           "custombg",         "0")
  pfUI:UpdateConfig("unitframes", nil,           "custombgcolor",    ".5,.2,.2,1")
  pfUI:UpdateConfig("unitframes", nil,           "manacolor",        ".5,.5,1,1")
  pfUI:UpdateConfig("unitframes", nil,           "energycolor",      "1,1,.5,1")
  pfUI:UpdateConfig("unitframes", nil,           "ragecolor",        "1,.5,.5,1")
  pfUI:UpdateConfig("unitframes", nil,           "focuscolor",       "1,1,.75,1")

  pfUI:UpdateConfig("unitframes", nil,           "animation_speed",  "5")
  pfUI:UpdateConfig("unitframes", nil,           "portraitalpha",    "0.1")
  pfUI:UpdateConfig("unitframes", nil,           "always2dportrait", "0")
  pfUI:UpdateConfig("unitframes", nil,           "portraittexture",  "1")
  pfUI:UpdateConfig("unitframes", nil,           "layout",           "default")
  pfUI:UpdateConfig("unitframes", nil,           "rangecheck",       "0")
  pfUI:UpdateConfig("unitframes", nil,           "rangechecki",      "4")
  pfUI:UpdateConfig("unitframes", nil,           "combosize",        "6")
  pfUI:UpdateConfig("unitframes", nil,           "abbrevnum",        "1")

  pfUI:UpdateConfig("unitframes", nil,           "selfingroup",      "0")
  pfUI:UpdateConfig("unitframes", nil,           "selfinraid",       "0")
  pfUI:UpdateConfig("unitframes", nil,           "raidforgroup",     "0")
  pfUI:UpdateConfig("unitframes", nil,           "show_hots",        "0")
  pfUI:UpdateConfig("unitframes", nil,           "all_hots",         "0")
  pfUI:UpdateConfig("unitframes", nil,           "show_procs",       "0")
  pfUI:UpdateConfig("unitframes", nil,           "show_totems",      "0")
  pfUI:UpdateConfig("unitframes", nil,           "all_procs",        "0")
  pfUI:UpdateConfig("unitframes", nil,           "debuffs_class",    "0")
  pfUI:UpdateConfig("unitframes", nil,           "indicator_size",   "10")

  pfUI:UpdateConfig("unitframes", nil,           "clickcast",        "")
  pfUI:UpdateConfig("unitframes", nil,           "clickcast_shift",  "")
  pfUI:UpdateConfig("unitframes", nil,           "clickcast_alt",    "")
  pfUI:UpdateConfig("unitframes", nil,           "clickcast_ctrl",   "")

  pfUI:UpdateConfig("unitframes", "player",      "showPVPMinimap",   "0")
  pfUI:UpdateConfig("unitframes", "player",      "showRest",         "0")
  pfUI:UpdateConfig("unitframes", "player",      "energy",           "1")

  pfUI:UpdateConfig("unitframes", "player",      "visible",          "1")
  pfUI:UpdateConfig("unitframes", "player",      "showPVP",          "0")
  pfUI:UpdateConfig("unitframes", "player",      "raidicon",         "1")
  pfUI:UpdateConfig("unitframes", "player",      "leadericon",       "1")
  pfUI:UpdateConfig("unitframes", "player",      "looticon",         "1")
  pfUI:UpdateConfig("unitframes", "player",      "raidiconsize",     "24")
  pfUI:UpdateConfig("unitframes", "player",      "portrait",         "bar")
  pfUI:UpdateConfig("unitframes", "player",      "bartexture",       "Interface\\AddOns\\pfUI\\img\\bar")
  pfUI:UpdateConfig("unitframes", "player",      "width",            "200")
  pfUI:UpdateConfig("unitframes", "player",      "height",           "46")
  pfUI:UpdateConfig("unitframes", "player",      "pheight",          "10")
  pfUI:UpdateConfig("unitframes", "player",      "pwidth",           "-1")
  pfUI:UpdateConfig("unitframes", "player",      "panchor",          "TOP")
  pfUI:UpdateConfig("unitframes", "player",      "pspace",           "-3")
  pfUI:UpdateConfig("unitframes", "player",      "buffs",            "TOPLEFT")
  pfUI:UpdateConfig("unitframes", "player",      "buffsize",         "20")
  pfUI:UpdateConfig("unitframes", "player",      "bufflimit",        "32")
  pfUI:UpdateConfig("unitframes", "player",      "buffperrow",       "8")
  pfUI:UpdateConfig("unitframes", "player",      "debuffs",          "TOPLEFT")
  pfUI:UpdateConfig("unitframes", "player",      "debuffsize",       "20")
  pfUI:UpdateConfig("unitframes", "player",      "debufflimit",      "32")
  pfUI:UpdateConfig("unitframes", "player",      "debuffperrow",     "8")
  pfUI:UpdateConfig("unitframes", "player",      "invert_healthbar", "0")
  pfUI:UpdateConfig("unitframes", "player",      "verticalbar",      "0")
  pfUI:UpdateConfig("unitframes", "player",      "buff_indicator",   "0")
  pfUI:UpdateConfig("unitframes", "player",      "debuff_indicator", "0")
  pfUI:UpdateConfig("unitframes", "player",      "debuff_ind_pos",   "CENTER")
  pfUI:UpdateConfig("unitframes", "player",      "debuff_ind_size",  ".65")
  pfUI:UpdateConfig("unitframes", "player",      "clickcast",        "0")
  pfUI:UpdateConfig("unitframes", "player",      "faderange",        "0")
  pfUI:UpdateConfig("unitframes", "player",      "glowaggro",        "1")
  pfUI:UpdateConfig("unitframes", "player",      "glowcombat",       "1")
  pfUI:UpdateConfig("unitframes", "player",      "showtooltip",      "1")
  pfUI:UpdateConfig("unitframes", "player",      "healthcolor",      "1")
  pfUI:UpdateConfig("unitframes", "player",      "powercolor",       "1")
  pfUI:UpdateConfig("unitframes", "player",      "levelcolor",       "1")
  pfUI:UpdateConfig("unitframes", "player",      "classcolor",       "1")
  pfUI:UpdateConfig("unitframes", "player",      "txthpleft",        "unit")
  pfUI:UpdateConfig("unitframes", "player",      "txthpcenter",      "none")
  pfUI:UpdateConfig("unitframes", "player",      "txthpright",       "healthdyn")
  pfUI:UpdateConfig("unitframes", "player",      "txtpowerleft",     "none")
  pfUI:UpdateConfig("unitframes", "player",      "txtpowercenter",   "none")
  pfUI:UpdateConfig("unitframes", "player",      "txtpowerright",    "none")
  pfUI:UpdateConfig("unitframes", "player",      "hitindicator",     "0")
  pfUI:UpdateConfig("unitframes", "player",      "hitindicatorsize", "15")
  pfUI:UpdateConfig("unitframes", "player",      "hitindicatorfont", "Interface\\AddOns\\pfUI\\fonts\\Continuum.ttf")
  pfUI:UpdateConfig("unitframes", "player",      "defcolor",         "1")
  pfUI:UpdateConfig("unitframes", "player",      "custom",           "0")
  pfUI:UpdateConfig("unitframes", "player",      "customfullhp",     "0")
  pfUI:UpdateConfig("unitframes", "player",      "customcolor",      ".2,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "player",      "custombg",         "0")
  pfUI:UpdateConfig("unitframes", "player",      "custombgcolor",    ".5,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "player",      "manacolor",        ".5,.5,1,1")
  pfUI:UpdateConfig("unitframes", "player",      "energycolor",      "1,1,.5,1")
  pfUI:UpdateConfig("unitframes", "player",      "ragecolor",        "1,.5,.5,1")
  pfUI:UpdateConfig("unitframes", "player",      "focuscolor",       "1,1,.75,1")
  pfUI:UpdateConfig("unitframes", "player",      "overhealperc",     "20")

  pfUI:UpdateConfig("unitframes", "target",      "visible",          "1")
  pfUI:UpdateConfig("unitframes", "target",      "showPVP",          "0")
  pfUI:UpdateConfig("unitframes", "target",      "raidicon",         "1")
  pfUI:UpdateConfig("unitframes", "target",      "leadericon",       "1")
  pfUI:UpdateConfig("unitframes", "target",      "looticon",         "1")
  pfUI:UpdateConfig("unitframes", "target",      "raidiconsize",     "24")
  pfUI:UpdateConfig("unitframes", "target",      "portrait",         "bar")
  pfUI:UpdateConfig("unitframes", "target",      "bartexture",       "Interface\\AddOns\\pfUI\\img\\bar")
  pfUI:UpdateConfig("unitframes", "target",      "width",            "200")
  pfUI:UpdateConfig("unitframes", "target",      "height",           "46")
  pfUI:UpdateConfig("unitframes", "target",      "pheight",          "10")
  pfUI:UpdateConfig("unitframes", "target",      "pwidth",           "-1")
  pfUI:UpdateConfig("unitframes", "target",      "panchor",          "TOP")
  pfUI:UpdateConfig("unitframes", "target",      "pspace",           "-3")
  pfUI:UpdateConfig("unitframes", "target",      "buffs",            "TOPLEFT")
  pfUI:UpdateConfig("unitframes", "target",      "buffsize",         "20")
  pfUI:UpdateConfig("unitframes", "target",      "bufflimit",        "32")
  pfUI:UpdateConfig("unitframes", "target",      "buffperrow",       "8")
  pfUI:UpdateConfig("unitframes", "target",      "debuffs",          "TOPLEFT")
  pfUI:UpdateConfig("unitframes", "target",      "debuffsize",       "20")
  pfUI:UpdateConfig("unitframes", "target",      "debufflimit",      "32")
  pfUI:UpdateConfig("unitframes", "target",      "debuffperrow",     "8")
  pfUI:UpdateConfig("unitframes", "target",      "invert_healthbar", "0")
  pfUI:UpdateConfig("unitframes", "target",      "verticalbar",      "0")
  pfUI:UpdateConfig("unitframes", "target",      "buff_indicator",   "0")
  pfUI:UpdateConfig("unitframes", "target",      "debuff_indicator", "0")
  pfUI:UpdateConfig("unitframes", "target",      "debuff_ind_pos",   "CENTER")
  pfUI:UpdateConfig("unitframes", "target",      "debuff_ind_size",  ".65")
  pfUI:UpdateConfig("unitframes", "target",      "clickcast",        "0")
  pfUI:UpdateConfig("unitframes", "target",      "faderange",        "0")
  pfUI:UpdateConfig("unitframes", "target",      "glowaggro",        "1")
  pfUI:UpdateConfig("unitframes", "target",      "glowcombat",       "1")
  pfUI:UpdateConfig("unitframes", "target",      "showtooltip",      "1")
  pfUI:UpdateConfig("unitframes", "target",      "healthcolor",      "1")
  pfUI:UpdateConfig("unitframes", "target",      "powercolor",       "1")
  pfUI:UpdateConfig("unitframes", "target",      "levelcolor",       "1")
  pfUI:UpdateConfig("unitframes", "target",      "classcolor",       "1")
  pfUI:UpdateConfig("unitframes", "target",      "animation",        "0")
  pfUI:UpdateConfig("unitframes", "target",      "txthpleft",        "unit")
  pfUI:UpdateConfig("unitframes", "target",      "txthpcenter",      "none")
  pfUI:UpdateConfig("unitframes", "target",      "txthpright",       "healthdyn")
  pfUI:UpdateConfig("unitframes", "target",      "txtpowerleft",     "none")
  pfUI:UpdateConfig("unitframes", "target",      "txtpowercenter",   "none")
  pfUI:UpdateConfig("unitframes", "target",      "txtpowerright",    "none")
  pfUI:UpdateConfig("unitframes", "target",      "hitindicator",     "0")
  pfUI:UpdateConfig("unitframes", "target",      "hitindicatorsize", "15")
  pfUI:UpdateConfig("unitframes", "target",      "hitindicatorfont", "Interface\\AddOns\\pfUI\\fonts\\Continuum.ttf")
  pfUI:UpdateConfig("unitframes", "target",      "defcolor",         "1")
  pfUI:UpdateConfig("unitframes", "target",      "custom",           "0")
  pfUI:UpdateConfig("unitframes", "target",      "customfullhp",     "0")
  pfUI:UpdateConfig("unitframes", "target",      "customcolor",      ".2,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "target",      "custombg",         "0")
  pfUI:UpdateConfig("unitframes", "target",      "custombgcolor",    ".5,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "target",      "manacolor",        ".5,.5,1,1")
  pfUI:UpdateConfig("unitframes", "target",      "energycolor",      "1,1,.5,1")
  pfUI:UpdateConfig("unitframes", "target",      "ragecolor",        "1,.5,.5,1")
  pfUI:UpdateConfig("unitframes", "target",      "focuscolor",       "1,1,.75,1")
  pfUI:UpdateConfig("unitframes", "target",      "overhealperc",     "20")

  pfUI:UpdateConfig("unitframes", "focus",       "visible",          "1")
  pfUI:UpdateConfig("unitframes", "focus",       "showPVP",          "0")
  pfUI:UpdateConfig("unitframes", "focus",       "raidicon",         "1")
  pfUI:UpdateConfig("unitframes", "focus",       "leadericon",       "1")
  pfUI:UpdateConfig("unitframes", "focus",       "looticon",         "1")
  pfUI:UpdateConfig("unitframes", "focus",       "raidiconsize",     "24")
  pfUI:UpdateConfig("unitframes", "focus",       "portrait",         "bar")
  pfUI:UpdateConfig("unitframes", "focus",       "bartexture",       "Interface\\AddOns\\pfUI\\img\\bar")
  pfUI:UpdateConfig("unitframes", "focus",       "width",            "120")
  pfUI:UpdateConfig("unitframes", "focus",       "height",           "34")
  pfUI:UpdateConfig("unitframes", "focus",       "pheight",          "4")
  pfUI:UpdateConfig("unitframes", "focus",       "pwidth",           "-1")
  pfUI:UpdateConfig("unitframes", "focus",       "panchor",          "TOP")
  pfUI:UpdateConfig("unitframes", "focus",       "pspace",           "-3")
  pfUI:UpdateConfig("unitframes", "focus",       "buffs",            "TOPLEFT")
  pfUI:UpdateConfig("unitframes", "focus",       "buffsize",         "12")
  pfUI:UpdateConfig("unitframes", "focus",       "bufflimit",        "32")
  pfUI:UpdateConfig("unitframes", "focus",       "buffperrow",       "8")
  pfUI:UpdateConfig("unitframes", "focus",       "debuffs",          "TOPLEFT")
  pfUI:UpdateConfig("unitframes", "focus",       "debuffsize",       "12")
  pfUI:UpdateConfig("unitframes", "focus",       "debufflimit",      "32")
  pfUI:UpdateConfig("unitframes", "focus",       "debuffperrow",     "8")
  pfUI:UpdateConfig("unitframes", "focus",       "invert_healthbar", "0")
  pfUI:UpdateConfig("unitframes", "focus",       "verticalbar",      "0")
  pfUI:UpdateConfig("unitframes", "focus",       "buff_indicator",   "0")
  pfUI:UpdateConfig("unitframes", "focus",       "debuff_indicator", "0")
  pfUI:UpdateConfig("unitframes", "focus",       "debuff_ind_pos",   "CENTER")
  pfUI:UpdateConfig("unitframes", "focus",       "debuff_ind_size",  ".65")
  pfUI:UpdateConfig("unitframes", "focus",       "clickcast",        "0")
  pfUI:UpdateConfig("unitframes", "focus",       "faderange",        "0")
  pfUI:UpdateConfig("unitframes", "focus",       "glowaggro",        "1")
  pfUI:UpdateConfig("unitframes", "focus",       "glowcombat",       "1")
  pfUI:UpdateConfig("unitframes", "focus",       "showtooltip",      "1")
  pfUI:UpdateConfig("unitframes", "focus",       "healthcolor",      "1")
  pfUI:UpdateConfig("unitframes", "focus",       "powercolor",       "1")
  pfUI:UpdateConfig("unitframes", "focus",       "levelcolor",       "1")
  pfUI:UpdateConfig("unitframes", "focus",       "classcolor",       "1")
  pfUI:UpdateConfig("unitframes", "focus",       "txthpleft",        "unit")
  pfUI:UpdateConfig("unitframes", "focus",       "txthpcenter",      "none")
  pfUI:UpdateConfig("unitframes", "focus",       "txthpright",       "healthdyn")
  pfUI:UpdateConfig("unitframes", "focus",       "txtpowerleft",     "none")
  pfUI:UpdateConfig("unitframes", "focus",       "txtpowercenter",   "none")
  pfUI:UpdateConfig("unitframes", "focus",       "txtpowerright",    "none")
  pfUI:UpdateConfig("unitframes", "focus",       "hitindicator",     "0")
  pfUI:UpdateConfig("unitframes", "focus",       "hitindicatorsize", "15")
  pfUI:UpdateConfig("unitframes", "focus",       "hitindicatorfont", "Interface\\AddOns\\pfUI\\fonts\\Continuum.ttf")
  pfUI:UpdateConfig("unitframes", "focus",       "defcolor",         "1")
  pfUI:UpdateConfig("unitframes", "focus",       "custom",           "0")
  pfUI:UpdateConfig("unitframes", "focus",       "customfullhp",     "0")
  pfUI:UpdateConfig("unitframes", "focus",       "customcolor",      ".2,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "focus",       "custombg",         "0")
  pfUI:UpdateConfig("unitframes", "focus",       "custombgcolor",    ".5,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "focus",       "manacolor",        ".5,.5,1,1")
  pfUI:UpdateConfig("unitframes", "focus",       "energycolor",      "1,1,.5,1")
  pfUI:UpdateConfig("unitframes", "focus",       "ragecolor",        "1,.5,.5,1")
  pfUI:UpdateConfig("unitframes", "focus",       "focuscolor",       "1,1,.75,1")
  pfUI:UpdateConfig("unitframes", "focus",       "overhealperc",     "20")

  pfUI:UpdateConfig("unitframes", "group",       "visible",          "1")
  pfUI:UpdateConfig("unitframes", "group",       "showPVP",          "0")
  pfUI:UpdateConfig("unitframes", "group",       "raidicon",         "1")
  pfUI:UpdateConfig("unitframes", "group",       "leadericon",       "1")
  pfUI:UpdateConfig("unitframes", "group",       "looticon",         "1")
  pfUI:UpdateConfig("unitframes", "group",       "raidiconsize",     "24")
  pfUI:UpdateConfig("unitframes", "group",       "portrait",         "off")
  pfUI:UpdateConfig("unitframes", "group",       "bartexture",       "Interface\\AddOns\\pfUI\\img\\bar")
  pfUI:UpdateConfig("unitframes", "group",       "width",            "164")
  pfUI:UpdateConfig("unitframes", "group",       "height",           "32")
  pfUI:UpdateConfig("unitframes", "group",       "pheight",          "4")
  pfUI:UpdateConfig("unitframes", "group",       "pwidth",           "-1")
  pfUI:UpdateConfig("unitframes", "group",       "panchor",          "TOP")
  pfUI:UpdateConfig("unitframes", "group",       "pspace",           "-3")
  pfUI:UpdateConfig("unitframes", "group",       "buffs",            "BOTTOMLEFT")
  pfUI:UpdateConfig("unitframes", "group",       "buffsize",         "8")
  pfUI:UpdateConfig("unitframes", "group",       "bufflimit",        "16")
  pfUI:UpdateConfig("unitframes", "group",       "buffperrow",       "8")
  pfUI:UpdateConfig("unitframes", "group",       "debuffs",          "BOTTOMLEFT")
  pfUI:UpdateConfig("unitframes", "group",       "debuffsize",       "8")
  pfUI:UpdateConfig("unitframes", "group",       "debufflimit",      "8")
  pfUI:UpdateConfig("unitframes", "group",       "debuffperrow",     "8")
  pfUI:UpdateConfig("unitframes", "group",       "invert_healthbar", "0")
  pfUI:UpdateConfig("unitframes", "group",       "verticalbar",      "0")
  pfUI:UpdateConfig("unitframes", "group",       "buff_indicator",   "1")
  pfUI:UpdateConfig("unitframes", "group",       "debuff_indicator", "2")
  pfUI:UpdateConfig("unitframes", "group",       "debuff_ind_pos",   "CENTER")
  pfUI:UpdateConfig("unitframes", "group",       "debuff_ind_size",  ".65")
  pfUI:UpdateConfig("unitframes", "group",       "clickcast",        "0")
  pfUI:UpdateConfig("unitframes", "group",       "faderange",        "1")
  pfUI:UpdateConfig("unitframes", "group",       "glowaggro",        "1")
  pfUI:UpdateConfig("unitframes", "group",       "glowcombat",       "0")
  pfUI:UpdateConfig("unitframes", "group",       "showtooltip",      "1")
  pfUI:UpdateConfig("unitframes", "group",       "healthcolor",      "1")
  pfUI:UpdateConfig("unitframes", "group",       "powercolor",       "1")
  pfUI:UpdateConfig("unitframes", "group",       "levelcolor",       "1")
  pfUI:UpdateConfig("unitframes", "group",       "classcolor",       "1")
  pfUI:UpdateConfig("unitframes", "group",       "hide_in_raid",     "0")
  pfUI:UpdateConfig("unitframes", "group",       "txthpleft",        "unit")
  pfUI:UpdateConfig("unitframes", "group",       "txthpcenter",      "none")
  pfUI:UpdateConfig("unitframes", "group",       "txthpright",       "healthmiss")
  pfUI:UpdateConfig("unitframes", "group",       "txtpowerleft",     "none")
  pfUI:UpdateConfig("unitframes", "group",       "txtpowercenter",   "none")
  pfUI:UpdateConfig("unitframes", "group",       "txtpowerright",    "none")
  pfUI:UpdateConfig("unitframes", "group",       "hitindicator",     "0")
  pfUI:UpdateConfig("unitframes", "group",       "hitindicatorsize", "15")
  pfUI:UpdateConfig("unitframes", "group",       "hitindicatorfont", "Interface\\AddOns\\pfUI\\fonts\\Continuum.ttf")
  pfUI:UpdateConfig("unitframes", "group",       "defcolor",         "1")
  pfUI:UpdateConfig("unitframes", "group",       "custom",           "0")
  pfUI:UpdateConfig("unitframes", "group",       "customfullhp",     "0")
  pfUI:UpdateConfig("unitframes", "group",       "customcolor",      ".2,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "group",       "custombg",         "0")
  pfUI:UpdateConfig("unitframes", "group",       "custombgcolor",    ".5,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "group",       "manacolor",        ".5,.5,1,1")
  pfUI:UpdateConfig("unitframes", "group",       "energycolor",      "1,1,.5,1")
  pfUI:UpdateConfig("unitframes", "group",       "ragecolor",        "1,.5,.5,1")
  pfUI:UpdateConfig("unitframes", "group",       "focuscolor",       "1,1,.75,1")
  pfUI:UpdateConfig("unitframes", "group",       "overhealperc",     "20")

  pfUI:UpdateConfig("unitframes", "grouptarget", "visible",          "1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "showPVP",          "0")
  pfUI:UpdateConfig("unitframes", "grouptarget", "raidicon",         "1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "leadericon",       "1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "looticon",         "1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "raidiconsize",     "24")
  pfUI:UpdateConfig("unitframes", "grouptarget", "portrait",         "off")
  pfUI:UpdateConfig("unitframes", "grouptarget", "bartexture",       "Interface\\AddOns\\pfUI\\img\\bar")
  pfUI:UpdateConfig("unitframes", "grouptarget", "width",            "120")
  pfUI:UpdateConfig("unitframes", "grouptarget", "height",           "16")
  pfUI:UpdateConfig("unitframes", "grouptarget", "pheight",          "0")
  pfUI:UpdateConfig("unitframes", "grouptarget", "pwidth",           "-1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "panchor",          "TOP")
  pfUI:UpdateConfig("unitframes", "grouptarget", "pspace",           "-3")
  pfUI:UpdateConfig("unitframes", "grouptarget", "buffs",            "off")
  pfUI:UpdateConfig("unitframes", "grouptarget", "buffsize",         "16")
  pfUI:UpdateConfig("unitframes", "grouptarget", "bufflimit",        "16")
  pfUI:UpdateConfig("unitframes", "grouptarget", "buffperrow",       "8")
  pfUI:UpdateConfig("unitframes", "grouptarget", "debuffs",          "off")
  pfUI:UpdateConfig("unitframes", "grouptarget", "debuffsize",       "16")
  pfUI:UpdateConfig("unitframes", "grouptarget", "debufflimit",      "16")
  pfUI:UpdateConfig("unitframes", "grouptarget", "debuffperrow",     "8")
  pfUI:UpdateConfig("unitframes", "grouptarget", "invert_healthbar", "0")
  pfUI:UpdateConfig("unitframes", "grouptarget", "verticalbar",      "0")
  pfUI:UpdateConfig("unitframes", "grouptarget", "buff_indicator",   "0")
  pfUI:UpdateConfig("unitframes", "grouptarget", "debuff_indicator", "0")
  pfUI:UpdateConfig("unitframes", "grouptarget", "debuff_ind_pos",   "CENTER")
  pfUI:UpdateConfig("unitframes", "grouptarget", "debuff_ind_size",  ".65")
  pfUI:UpdateConfig("unitframes", "grouptarget", "clickcast",        "0")
  pfUI:UpdateConfig("unitframes", "grouptarget", "faderange",        "1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "glowaggro",        "1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "glowcombat",       "0")
  pfUI:UpdateConfig("unitframes", "grouptarget", "showtooltip",      "1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "healthcolor",      "1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "powercolor",       "1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "levelcolor",       "1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "classcolor",       "1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "txthpleft",        "unit")
  pfUI:UpdateConfig("unitframes", "grouptarget", "txthpcenter",      "none")
  pfUI:UpdateConfig("unitframes", "grouptarget", "txthpright",       "healthperc")
  pfUI:UpdateConfig("unitframes", "grouptarget", "txtpowerleft",     "none")
  pfUI:UpdateConfig("unitframes", "grouptarget", "txtpowercenter",   "none")
  pfUI:UpdateConfig("unitframes", "grouptarget", "txtpowerright",    "none")
  pfUI:UpdateConfig("unitframes", "grouptarget", "hitindicator",     "0")
  pfUI:UpdateConfig("unitframes", "grouptarget", "hitindicatorsize", "15")
  pfUI:UpdateConfig("unitframes", "grouptarget", "hitindicatorfont", "Interface\\AddOns\\pfUI\\fonts\\Continuum.ttf")
  pfUI:UpdateConfig("unitframes", "grouptarget", "defcolor",         "1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "custom",           "0")
  pfUI:UpdateConfig("unitframes", "grouptarget", "customfullhp",     "0")
  pfUI:UpdateConfig("unitframes", "grouptarget", "customcolor",      ".2,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "custombg",         "0")
  pfUI:UpdateConfig("unitframes", "grouptarget", "custombgcolor",    ".5,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "manacolor",        ".5,.5,1,1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "energycolor",      "1,1,.5,1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "ragecolor",        "1,.5,.5,1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "focuscolor",       "1,1,.75,1")
  pfUI:UpdateConfig("unitframes", "grouptarget", "overhealperc",     "20")

  pfUI:UpdateConfig("unitframes", "grouppet",    "visible",          "1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "showPVP",          "0")
  pfUI:UpdateConfig("unitframes", "grouppet",    "raidicon",         "1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "leadericon",       "1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "looticon",         "1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "raidiconsize",     "24")
  pfUI:UpdateConfig("unitframes", "grouppet",    "portrait",         "off")
  pfUI:UpdateConfig("unitframes", "grouppet",    "bartexture",       "Interface\\AddOns\\pfUI\\img\\bar")
  pfUI:UpdateConfig("unitframes", "grouppet",    "width",            "100")
  pfUI:UpdateConfig("unitframes", "grouppet",    "height",           "14")
  pfUI:UpdateConfig("unitframes", "grouppet",    "pheight",          "0")
  pfUI:UpdateConfig("unitframes", "grouppet",    "pwidth",           "-1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "panchor",          "TOP")
  pfUI:UpdateConfig("unitframes", "grouppet",    "pspace",           "-3")
  pfUI:UpdateConfig("unitframes", "grouppet",    "buffs",            "off")
  pfUI:UpdateConfig("unitframes", "grouppet",    "buffsize",         "16")
  pfUI:UpdateConfig("unitframes", "grouppet",    "bufflimit",        "16")
  pfUI:UpdateConfig("unitframes", "grouppet",    "buffperrow",       "8")
  pfUI:UpdateConfig("unitframes", "grouppet",    "debuffs",          "off")
  pfUI:UpdateConfig("unitframes", "grouppet",    "debuffsize",       "16")
  pfUI:UpdateConfig("unitframes", "grouppet",    "debufflimit",      "16")
  pfUI:UpdateConfig("unitframes", "grouppet",    "debuffperrow",     "8")
  pfUI:UpdateConfig("unitframes", "grouppet",    "invert_healthbar", "0")
  pfUI:UpdateConfig("unitframes", "grouppet",    "verticalbar",      "0")
  pfUI:UpdateConfig("unitframes", "grouppet",    "buff_indicator",   "0")
  pfUI:UpdateConfig("unitframes", "grouppet",    "debuff_indicator", "0")
  pfUI:UpdateConfig("unitframes", "grouppet",    "debuff_ind_pos",   "CENTER")
  pfUI:UpdateConfig("unitframes", "grouppet",    "debuff_ind_size",  ".65")
  pfUI:UpdateConfig("unitframes", "grouppet",    "clickcast",        "0")
  pfUI:UpdateConfig("unitframes", "grouppet",    "faderange",        "1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "glowaggro",        "1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "glowcombat",       "0")
  pfUI:UpdateConfig("unitframes", "grouppet",    "showtooltip",      "1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "healthcolor",      "1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "powercolor",       "1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "levelcolor",       "1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "classcolor",       "1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "txthpleft",        "unit")
  pfUI:UpdateConfig("unitframes", "grouppet",    "txthpcenter",      "none")
  pfUI:UpdateConfig("unitframes", "grouppet",    "txthpright",       "healthperc")
  pfUI:UpdateConfig("unitframes", "grouppet",    "txtpowerleft",     "none")
  pfUI:UpdateConfig("unitframes", "grouppet",    "txtpowercenter",   "none")
  pfUI:UpdateConfig("unitframes", "grouppet",    "txtpowerright",    "none")
  pfUI:UpdateConfig("unitframes", "grouppet",    "hitindicator",     "0")
  pfUI:UpdateConfig("unitframes", "grouppet",    "hitindicatorsize", "15")
  pfUI:UpdateConfig("unitframes", "grouppet",    "hitindicatorfont", "Interface\\AddOns\\pfUI\\fonts\\Continuum.ttf")
  pfUI:UpdateConfig("unitframes", "grouppet",    "defcolor",         "1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "custom",           "0")
  pfUI:UpdateConfig("unitframes", "grouppet",    "customfullhp",     "0")
  pfUI:UpdateConfig("unitframes", "grouppet",    "customcolor",      ".2,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "custombg",         "0")
  pfUI:UpdateConfig("unitframes", "grouppet",    "custombgcolor",    ".5,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "manacolor",        ".5,.5,1,1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "energycolor",      "1,1,.5,1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "ragecolor",        "1,.5,.5,1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "focuscolor",       "1,1,.75,1")
  pfUI:UpdateConfig("unitframes", "grouppet",    "overhealperc",     "20")

  pfUI:UpdateConfig("unitframes", "raid",        "visible",          "1")
  pfUI:UpdateConfig("unitframes", "raid",        "showPVP",          "0")
  pfUI:UpdateConfig("unitframes", "raid",        "raidicon",         "1")
  pfUI:UpdateConfig("unitframes", "raid",        "leadericon",       "1")
  pfUI:UpdateConfig("unitframes", "raid",        "looticon",         "1")
  pfUI:UpdateConfig("unitframes", "raid",        "raidiconsize",     "24")
  pfUI:UpdateConfig("unitframes", "raid",        "portrait",         "off")
  pfUI:UpdateConfig("unitframes", "raid",        "bartexture",       "Interface\\AddOns\\pfUI\\img\\bar")
  pfUI:UpdateConfig("unitframes", "raid",        "width",            "50")
  pfUI:UpdateConfig("unitframes", "raid",        "height",           "26")
  pfUI:UpdateConfig("unitframes", "raid",        "pheight",          "4")
  pfUI:UpdateConfig("unitframes", "raid",        "pwidth",           "-1")
  pfUI:UpdateConfig("unitframes", "raid",        "panchor",          "TOP")
  pfUI:UpdateConfig("unitframes", "raid",        "pspace",           "-3")
  pfUI:UpdateConfig("unitframes", "raid",        "buffs",            "off")
  pfUI:UpdateConfig("unitframes", "raid",        "buffsize",         "16")
  pfUI:UpdateConfig("unitframes", "raid",        "bufflimit",        "16")
  pfUI:UpdateConfig("unitframes", "raid",        "buffperrow",       "8")
  pfUI:UpdateConfig("unitframes", "raid",        "debuffs",          "off")
  pfUI:UpdateConfig("unitframes", "raid",        "debuffsize",       "16")
  pfUI:UpdateConfig("unitframes", "raid",        "debufflimit",      "16")
  pfUI:UpdateConfig("unitframes", "raid",        "debuffperrow",     "8")
  pfUI:UpdateConfig("unitframes", "raid",        "invert_healthbar", "0")
  pfUI:UpdateConfig("unitframes", "raid",        "verticalbar",      "0")
  pfUI:UpdateConfig("unitframes", "raid",        "buff_indicator",   "1")
  pfUI:UpdateConfig("unitframes", "raid",        "debuff_indicator", "2")
  pfUI:UpdateConfig("unitframes", "raid",        "debuff_ind_pos",   "CENTER")
  pfUI:UpdateConfig("unitframes", "raid",        "debuff_ind_size",  ".65")
  pfUI:UpdateConfig("unitframes", "raid",        "clickcast",        "0")
  pfUI:UpdateConfig("unitframes", "raid",        "faderange",        "1")
  pfUI:UpdateConfig("unitframes", "raid",        "glowaggro",        "1")
  pfUI:UpdateConfig("unitframes", "raid",        "glowcombat",       "0")
  pfUI:UpdateConfig("unitframes", "raid",        "showtooltip",      "1")
  pfUI:UpdateConfig("unitframes", "raid",        "healthcolor",      "1")
  pfUI:UpdateConfig("unitframes", "raid",        "powercolor",       "1")
  pfUI:UpdateConfig("unitframes", "raid",        "levelcolor",       "1")
  pfUI:UpdateConfig("unitframes", "raid",        "classcolor",       "1")
  pfUI:UpdateConfig("unitframes", "raid",        "txthpleft",        "name")
  pfUI:UpdateConfig("unitframes", "raid",        "txthpcenter",      "none")
  pfUI:UpdateConfig("unitframes", "raid",        "txthpright",       "healthmiss")
  pfUI:UpdateConfig("unitframes", "raid",        "txtpowerleft",     "none")
  pfUI:UpdateConfig("unitframes", "raid",        "txtpowercenter",   "none")
  pfUI:UpdateConfig("unitframes", "raid",        "txtpowerright",    "none")
  pfUI:UpdateConfig("unitframes", "raid",        "hitindicator",     "0")
  pfUI:UpdateConfig("unitframes", "raid",        "hitindicatorsize", "15")
  pfUI:UpdateConfig("unitframes", "raid",        "hitindicatorfont", "Interface\\AddOns\\pfUI\\fonts\\Continuum.ttf")
  pfUI:UpdateConfig("unitframes", "raid",        "defcolor",         "1")
  pfUI:UpdateConfig("unitframes", "raid",        "custom",           "0")
  pfUI:UpdateConfig("unitframes", "raid",        "customfullhp",     "0")
  pfUI:UpdateConfig("unitframes", "raid",        "customcolor",      ".2,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "raid",        "custombg",         "0")
  pfUI:UpdateConfig("unitframes", "raid",        "custombgcolor",    ".5,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "raid",        "manacolor",        ".5,.5,1,1")
  pfUI:UpdateConfig("unitframes", "raid",        "energycolor",      "1,1,.5,1")
  pfUI:UpdateConfig("unitframes", "raid",        "ragecolor",        "1,.5,.5,1")
  pfUI:UpdateConfig("unitframes", "raid",        "focuscolor",       "1,1,.75,1")
  pfUI:UpdateConfig("unitframes", "raid",        "overhealperc",     "10")

  pfUI:UpdateConfig("unitframes", "ttarget",     "visible",          "1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "showPVP",          "0")
  pfUI:UpdateConfig("unitframes", "ttarget",     "raidicon",         "1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "leadericon",       "1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "looticon",         "1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "raidiconsize",     "24")
  pfUI:UpdateConfig("unitframes", "ttarget",     "portrait",         "bar")
  pfUI:UpdateConfig("unitframes", "ttarget",     "bartexture",       "Interface\\AddOns\\pfUI\\img\\bar")
  pfUI:UpdateConfig("unitframes", "ttarget",     "width",            "100")
  pfUI:UpdateConfig("unitframes", "ttarget",     "height",           "17")
  pfUI:UpdateConfig("unitframes", "ttarget",     "pheight",          "3")
  pfUI:UpdateConfig("unitframes", "ttarget",     "pwidth",           "-1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "panchor",          "TOP")
  pfUI:UpdateConfig("unitframes", "ttarget",     "pspace",           "-3")
  pfUI:UpdateConfig("unitframes", "ttarget",     "buffs",            "off")
  pfUI:UpdateConfig("unitframes", "ttarget",     "buffsize",         "16")
  pfUI:UpdateConfig("unitframes", "ttarget",     "bufflimit",        "16")
  pfUI:UpdateConfig("unitframes", "ttarget",     "buffperrow",       "8")
  pfUI:UpdateConfig("unitframes", "ttarget",     "debuffs",          "off")
  pfUI:UpdateConfig("unitframes", "ttarget",     "debuffsize",       "16")
  pfUI:UpdateConfig("unitframes", "ttarget",     "debufflimit",      "16")
  pfUI:UpdateConfig("unitframes", "ttarget",     "debuffperrow",     "8")
  pfUI:UpdateConfig("unitframes", "ttarget",     "invert_healthbar", "0")
  pfUI:UpdateConfig("unitframes", "ttarget",     "verticalbar",      "0")
  pfUI:UpdateConfig("unitframes", "ttarget",     "buff_indicator",   "0")
  pfUI:UpdateConfig("unitframes", "ttarget",     "debuff_indicator", "0")
  pfUI:UpdateConfig("unitframes", "ttarget",     "debuff_ind_pos",   "CENTER")
  pfUI:UpdateConfig("unitframes", "ttarget",     "debuff_ind_size", ".65")
  pfUI:UpdateConfig("unitframes", "ttarget",     "clickcast",        "0")
  pfUI:UpdateConfig("unitframes", "ttarget",     "faderange",        "0")
  pfUI:UpdateConfig("unitframes", "ttarget",     "glowaggro",        "1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "glowcombat",       "1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "showtooltip",      "1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "healthcolor",      "1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "powercolor",       "1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "levelcolor",       "1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "classcolor",       "1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "txthpleft",        "none")
  pfUI:UpdateConfig("unitframes", "ttarget",     "txthpcenter",      "name")
  pfUI:UpdateConfig("unitframes", "ttarget",     "txthpright",       "none")
  pfUI:UpdateConfig("unitframes", "ttarget",     "txtpowerleft",     "none")
  pfUI:UpdateConfig("unitframes", "ttarget",     "txtpowercenter",   "none")
  pfUI:UpdateConfig("unitframes", "ttarget",     "txtpowerright",    "none")
  pfUI:UpdateConfig("unitframes", "ttarget",     "hitindicator",     "0")
  pfUI:UpdateConfig("unitframes", "ttarget",     "hitindicatorsize", "15")
  pfUI:UpdateConfig("unitframes", "ttarget",     "hitindicatorfont", "Interface\\AddOns\\pfUI\\fonts\\Continuum.ttf")
  pfUI:UpdateConfig("unitframes", "ttarget",     "defcolor",         "1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "custom",           "0")
  pfUI:UpdateConfig("unitframes", "ttarget",     "customfullhp",     "0")
  pfUI:UpdateConfig("unitframes", "ttarget",     "customcolor",      ".2,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "custombg",         "0")
  pfUI:UpdateConfig("unitframes", "ttarget",     "custombgcolor",    ".5,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "manacolor",        ".5,.5,1,1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "energycolor",      "1,1,.5,1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "ragecolor",        "1,.5,.5,1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "focuscolor",       "1,1,.75,1")
  pfUI:UpdateConfig("unitframes", "ttarget",     "overhealperc",     "10")

  pfUI:UpdateConfig("unitframes", "pet",         "visible",          "1")
  pfUI:UpdateConfig("unitframes", "pet",         "showPVP",          "0")
  pfUI:UpdateConfig("unitframes", "pet",         "raidicon",         "1")
  pfUI:UpdateConfig("unitframes", "pet",         "leadericon",       "1")
  pfUI:UpdateConfig("unitframes", "pet",         "looticon",         "1")
  pfUI:UpdateConfig("unitframes", "pet",         "raidiconsize",     "24")
  pfUI:UpdateConfig("unitframes", "pet",         "portrait",         "bar")
  pfUI:UpdateConfig("unitframes", "pet",         "bartexture",       "Interface\\AddOns\\pfUI\\img\\bar")
  pfUI:UpdateConfig("unitframes", "pet",         "width",            "100")
  pfUI:UpdateConfig("unitframes", "pet",         "height",           "14")
  pfUI:UpdateConfig("unitframes", "pet",         "pheight",          "4")
  pfUI:UpdateConfig("unitframes", "pet",         "pwidth",           "-1")
  pfUI:UpdateConfig("unitframes", "pet",         "panchor",          "TOP")
  pfUI:UpdateConfig("unitframes", "pet",         "pspace",           "-3")
  pfUI:UpdateConfig("unitframes", "pet",         "buffs",            "TOPLEFT")
  pfUI:UpdateConfig("unitframes", "pet",         "buffsize",         "12")
  pfUI:UpdateConfig("unitframes", "pet",         "bufflimit",        "16")
  pfUI:UpdateConfig("unitframes", "pet",         "buffperrow",       "8")
  pfUI:UpdateConfig("unitframes", "pet",         "debuffs",          "TOPLEFT")
  pfUI:UpdateConfig("unitframes", "pet",         "debuffsize",       "12")
  pfUI:UpdateConfig("unitframes", "pet",         "debufflimit",      "16")
  pfUI:UpdateConfig("unitframes", "pet",         "debuffperrow",     "8")
  pfUI:UpdateConfig("unitframes", "pet",         "invert_healthbar", "0")
  pfUI:UpdateConfig("unitframes", "pet",         "verticalbar",      "0")
  pfUI:UpdateConfig("unitframes", "pet",         "buff_indicator",   "0")
  pfUI:UpdateConfig("unitframes", "pet",         "debuff_indicator", "0")
  pfUI:UpdateConfig("unitframes", "pet",         "debuff_ind_pos",   "CENTER")
  pfUI:UpdateConfig("unitframes", "pet",         "debuff_ind_size",  ".65")
  pfUI:UpdateConfig("unitframes", "pet",         "clickcast",        "0")
  pfUI:UpdateConfig("unitframes", "pet",         "faderange",        "0")
  pfUI:UpdateConfig("unitframes", "pet",         "glowaggro",        "1")
  pfUI:UpdateConfig("unitframes", "pet",         "glowcombat",       "1")
  pfUI:UpdateConfig("unitframes", "pet",         "showtooltip",      "1")
  pfUI:UpdateConfig("unitframes", "pet",         "healthcolor",      "1")
  pfUI:UpdateConfig("unitframes", "pet",         "powercolor",       "1")
  pfUI:UpdateConfig("unitframes", "pet",         "levelcolor",       "1")
  pfUI:UpdateConfig("unitframes", "pet",         "classcolor",       "1")
  pfUI:UpdateConfig("unitframes", "pet",         "txthpleft",        "none")
  pfUI:UpdateConfig("unitframes", "pet",         "txthpcenter",      "name")
  pfUI:UpdateConfig("unitframes", "pet",         "txthpright",       "none")
  pfUI:UpdateConfig("unitframes", "pet",         "txtpowerleft",     "none")
  pfUI:UpdateConfig("unitframes", "pet",         "txtpowercenter",   "none")
  pfUI:UpdateConfig("unitframes", "pet",         "txtpowerright",    "none")
  pfUI:UpdateConfig("unitframes", "pet",         "hitindicator",     "0")
  pfUI:UpdateConfig("unitframes", "pet",         "hitindicatorsize", "15")
  pfUI:UpdateConfig("unitframes", "pet",         "hitindicatorfont", "Interface\\AddOns\\pfUI\\fonts\\Continuum.ttf")
  pfUI:UpdateConfig("unitframes", "pet",         "defcolor",         "1")
  pfUI:UpdateConfig("unitframes", "pet",         "custom",           "0")
  pfUI:UpdateConfig("unitframes", "pet",         "customfullhp",     "0")
  pfUI:UpdateConfig("unitframes", "pet",         "customcolor",      ".2,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "pet",         "custombg",         "0")
  pfUI:UpdateConfig("unitframes", "pet",         "custombgcolor",    ".5,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "pet",         "manacolor",        ".5,.5,1,1")
  pfUI:UpdateConfig("unitframes", "pet",         "energycolor",      "1,1,.5,1")
  pfUI:UpdateConfig("unitframes", "pet",         "ragecolor",        "1,.5,.5,1")
  pfUI:UpdateConfig("unitframes", "pet",         "focuscolor",       "1,1,.75,1")
  pfUI:UpdateConfig("unitframes", "pet",         "overhealperc",     "20")

  pfUI:UpdateConfig("unitframes", "ptarget",     "visible",          "0")
  pfUI:UpdateConfig("unitframes", "ptarget",     "showPVP",          "0")
  pfUI:UpdateConfig("unitframes", "ptarget",     "raidicon",         "1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "leadericon",       "1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "looticon",         "1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "raidiconsize",     "24")
  pfUI:UpdateConfig("unitframes", "ptarget",     "portrait",         "bar")
  pfUI:UpdateConfig("unitframes", "ptarget",     "bartexture",       "Interface\\AddOns\\pfUI\\img\\bar")
  pfUI:UpdateConfig("unitframes", "ptarget",     "width",            "100")
  pfUI:UpdateConfig("unitframes", "ptarget",     "height",           "4")
  pfUI:UpdateConfig("unitframes", "ptarget",     "pheight",          "-1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "pwidth",           "-1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "panchor",          "TOP")
  pfUI:UpdateConfig("unitframes", "ptarget",     "pspace",           "-3")
  pfUI:UpdateConfig("unitframes", "ptarget",     "buffs",            "off")
  pfUI:UpdateConfig("unitframes", "ptarget",     "buffsize",         "16")
  pfUI:UpdateConfig("unitframes", "ptarget",     "bufflimit",        "16")
  pfUI:UpdateConfig("unitframes", "ptarget",     "buffperrow",       "8")
  pfUI:UpdateConfig("unitframes", "ptarget",     "debuffs",          "off")
  pfUI:UpdateConfig("unitframes", "ptarget",     "debuffsize",       "16")
  pfUI:UpdateConfig("unitframes", "ptarget",     "debufflimit",      "16")
  pfUI:UpdateConfig("unitframes", "ptarget",     "debuffperrow",     "8")
  pfUI:UpdateConfig("unitframes", "ptarget",     "invert_healthbar", "0")
  pfUI:UpdateConfig("unitframes", "ptarget",     "verticalbar",      "0")
  pfUI:UpdateConfig("unitframes", "ptarget",     "buff_indicator",   "0")
  pfUI:UpdateConfig("unitframes", "ptarget",     "debuff_indicator", "0")
  pfUI:UpdateConfig("unitframes", "ptarget",     "debuff_ind_pos",   "CENTER")
  pfUI:UpdateConfig("unitframes", "ptarget",     "debuff_ind_size",  ".65")
  pfUI:UpdateConfig("unitframes", "ptarget",     "clickcast",        "0")
  pfUI:UpdateConfig("unitframes", "ptarget",     "faderange",        "0")
  pfUI:UpdateConfig("unitframes", "ptarget",     "glowaggro",        "1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "glowcombat",       "1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "showtooltip",      "1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "healthcolor",      "1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "powercolor",       "1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "levelcolor",       "1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "classcolor",       "1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "txthpleft",        "none")
  pfUI:UpdateConfig("unitframes", "ptarget",     "txthpcenter",      "name")
  pfUI:UpdateConfig("unitframes", "ptarget",     "txthpright",       "none")
  pfUI:UpdateConfig("unitframes", "ptarget",     "txtpowerleft",     "none")
  pfUI:UpdateConfig("unitframes", "ptarget",     "txtpowercenter",   "none")
  pfUI:UpdateConfig("unitframes", "ptarget",     "txtpowerright",    "none")
  pfUI:UpdateConfig("unitframes", "ptarget",     "hitindicator",     "0")
  pfUI:UpdateConfig("unitframes", "ptarget",     "hitindicatorsize", "15")
  pfUI:UpdateConfig("unitframes", "ptarget",     "hitindicatorfont", "Interface\\AddOns\\pfUI\\fonts\\Continuum.ttf")
  pfUI:UpdateConfig("unitframes", "ptarget",     "defcolor",         "1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "custom",           "0")
  pfUI:UpdateConfig("unitframes", "ptarget",     "customfullhp",     "0")
  pfUI:UpdateConfig("unitframes", "ptarget",     "customcolor",      ".2,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "custombg",         "0")
  pfUI:UpdateConfig("unitframes", "ptarget",     "custombgcolor",    ".5,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "manacolor",        ".5,.5,1,1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "energycolor",      "1,1,.5,1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "ragecolor",        "1,.5,.5,1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "focuscolor",       "1,1,.75,1")
  pfUI:UpdateConfig("unitframes", "ptarget",     "overhealperc",     "10")

  pfUI:UpdateConfig("unitframes", "fallback",    "visible",          "1")
  pfUI:UpdateConfig("unitframes", "fallback",    "showPVP",          "0")
  pfUI:UpdateConfig("unitframes", "fallback",    "raidicon",         "1")
  pfUI:UpdateConfig("unitframes", "fallback",    "leadericon",       "1")
  pfUI:UpdateConfig("unitframes", "fallback",    "looticon",         "1")
  pfUI:UpdateConfig("unitframes", "fallback",    "raidiconsize",     "24")
  pfUI:UpdateConfig("unitframes", "fallback",    "portrait",         "bar")
  pfUI:UpdateConfig("unitframes", "fallback",    "bartexture",       "Interface\\AddOns\\pfUI\\img\\bar")
  pfUI:UpdateConfig("unitframes", "fallback",    "width",            "200")
  pfUI:UpdateConfig("unitframes", "fallback",    "height",           "50")
  pfUI:UpdateConfig("unitframes", "fallback",    "pheight",          "10")
  pfUI:UpdateConfig("unitframes", "fallback",    "pwidth",           "-1")
  pfUI:UpdateConfig("unitframes", "fallback",    "panchor",          "TOP")
  pfUI:UpdateConfig("unitframes", "fallback",    "pspace",           "-3")
  pfUI:UpdateConfig("unitframes", "fallback",    "buffs",            "TOPLEFT")
  pfUI:UpdateConfig("unitframes", "fallback",    "buffsize",         "20")
  pfUI:UpdateConfig("unitframes", "fallback",    "bufflimit",        "16")
  pfUI:UpdateConfig("unitframes", "fallback",    "buffperrow",       "8")
  pfUI:UpdateConfig("unitframes", "fallback",    "debuffs",          "TOPLEFT")
  pfUI:UpdateConfig("unitframes", "fallback",    "debuffsize",       "20")
  pfUI:UpdateConfig("unitframes", "fallback",    "debufflimit",      "16")
  pfUI:UpdateConfig("unitframes", "fallback",    "debuffperrow",     "8")
  pfUI:UpdateConfig("unitframes", "fallback",    "invert_healthbar", "0")
  pfUI:UpdateConfig("unitframes", "fallback",    "verticalbar",      "0")
  pfUI:UpdateConfig("unitframes", "fallback",    "buff_indicator",   "0")
  pfUI:UpdateConfig("unitframes", "fallback",    "debuff_indicator", "0")
  pfUI:UpdateConfig("unitframes", "fallback",    "debuff_ind_pos",   "CENTER")
  pfUI:UpdateConfig("unitframes", "fallback",    "debuff_ind_size",  ".65")
  pfUI:UpdateConfig("unitframes", "fallback",    "clickcast",        "0")
  pfUI:UpdateConfig("unitframes", "fallback",    "faderange",        "0")
  pfUI:UpdateConfig("unitframes", "fallback",    "glowaggro",        "1")
  pfUI:UpdateConfig("unitframes", "fallback",    "glowcombat",       "1")
  pfUI:UpdateConfig("unitframes", "fallback",    "showtooltip",      "1")
  pfUI:UpdateConfig("unitframes", "fallback",    "healthcolor",      "1")
  pfUI:UpdateConfig("unitframes", "fallback",    "powercolor",       "1")
  pfUI:UpdateConfig("unitframes", "fallback",    "levelcolor",       "1")
  pfUI:UpdateConfig("unitframes", "fallback",    "classcolor",       "1")
  pfUI:UpdateConfig("unitframes", "fallback",    "txthpleft",        "unit")
  pfUI:UpdateConfig("unitframes", "fallback",    "txthpcenter",      "none")
  pfUI:UpdateConfig("unitframes", "fallback",    "txthpright",       "healthdyn")
  pfUI:UpdateConfig("unitframes", "fallback",    "txtpowerleft",     "none")
  pfUI:UpdateConfig("unitframes", "fallback",    "txtpowercenter",   "none")
  pfUI:UpdateConfig("unitframes", "fallback",    "txtpowerright",    "none")
  pfUI:UpdateConfig("unitframes", "fallback",    "hitindicator",     "0")
  pfUI:UpdateConfig("unitframes", "fallback",    "hitindicatorsize", "15")
  pfUI:UpdateConfig("unitframes", "fallback",    "hitindicatorfont", "Interface\\AddOns\\pfUI\\fonts\\Continuum.ttf")
  pfUI:UpdateConfig("unitframes", "fallback",    "defcolor",         "1")
  pfUI:UpdateConfig("unitframes", "fallback",    "custom",           "0")
  pfUI:UpdateConfig("unitframes", "fallback",    "customfullhp",     "0")
  pfUI:UpdateConfig("unitframes", "fallback",    "customcolor",      ".2,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "fallback",    "custombg",         "0")
  pfUI:UpdateConfig("unitframes", "fallback",    "custombgcolor",    ".5,.2,.2,1")
  pfUI:UpdateConfig("unitframes", "fallback",    "manacolor",        ".5,.5,1,1")
  pfUI:UpdateConfig("unitframes", "fallback",    "energycolor",      "1,1,.5,1")
  pfUI:UpdateConfig("unitframes", "fallback",    "ragecolor",        "1,.5,.5,1")
  pfUI:UpdateConfig("unitframes", "fallback",    "focuscolor",       "1,1,.75,1")
  pfUI:UpdateConfig("unitframes", "fallback",    "overhealperc",     "10")

  pfUI:UpdateConfig("bars",       "bar1",        "pageable",         "1")
  pfUI:UpdateConfig("bars",       "bar2",        "pageable",         "1")

  pfUI:UpdateConfig("bars",       "bar1",        "enable",           "1")
  pfUI:UpdateConfig("bars",       "bar3",        "enable",           "1")
  pfUI:UpdateConfig("bars",       "bar4",        "enable",           "1")
  pfUI:UpdateConfig("bars",       "bar5",        "enable",           "1")
  pfUI:UpdateConfig("bars",       "bar6",        "enable",           "1")
  pfUI:UpdateConfig("bars",       "bar11",       "enable",           "1")
  pfUI:UpdateConfig("bars",       "bar12",       "enable",           "1")

  pfUI:UpdateConfig("bars",       "bar3",        "formfactor",       "6 x 2")
  pfUI:UpdateConfig("bars",       "bar5",        "formfactor",       "6 x 2")
  pfUI:UpdateConfig("bars",       "bar4",        "formfactor",       "1 x 12")
  pfUI:UpdateConfig("bars",       "bar11",       "formfactor",       "10 x 1")
  pfUI:UpdateConfig("bars",       "bar12",       "formfactor",       "10 x 1")

  pfUI:UpdateConfig("bars",       "bar11",       "icon_size",        "18")
  pfUI:UpdateConfig("bars",       "bar12",       "icon_size",        "18")

  for i=1,12 do
    pfUI:UpdateConfig("bars",     "bar"..i,      "enable",           "0")
    pfUI:UpdateConfig("bars",     "bar"..i,      "pageable",         "0")
    pfUI:UpdateConfig("bars",     "bar"..i,      "icon_size",        "20")
    pfUI:UpdateConfig("bars",     "bar"..i,      "spacing",          "1")
    pfUI:UpdateConfig("bars",     "bar"..i,      "formfactor",       "12 x 1")
    pfUI:UpdateConfig("bars",     "bar"..i,      "background",       "1")
    pfUI:UpdateConfig("bars",     "bar"..i,      "showempty",        "1")
    pfUI:UpdateConfig("bars",     "bar"..i,      "showmacro",        "1")
    pfUI:UpdateConfig("bars",     "bar"..i,      "showkeybind",      "1")
    pfUI:UpdateConfig("bars",     "bar"..i,      "showcount",        "1")
    pfUI:UpdateConfig("bars",     "bar"..i,      "autohide",         "0")
    pfUI:UpdateConfig("bars",     "bar"..i,      "hide_time",        "3")
    if i ~= 11 and i ~= 12 then
      pfUI:UpdateConfig("bars",     "bar"..i,      "buttons",           "12")
    end
  end

  pfUI:UpdateConfig("bars",       nil,           "keydown",          "0")
  pfUI:UpdateConfig("bars",       nil,           "altself",          "0")
  pfUI:UpdateConfig("bars",       nil,           "animation",        "zoomfade")
  pfUI:UpdateConfig("bars",       nil,           "animalways",       "0")
  pfUI:UpdateConfig("bars",       nil,           "hunterbar",        "0")
  pfUI:UpdateConfig("bars",       nil,           "pagemaster",       "0")
  pfUI:UpdateConfig("bars",       nil,           "showcastable",     "1")
  pfUI:UpdateConfig("bars",       nil,           "glowrange",        "1")
  pfUI:UpdateConfig("bars",       nil,           "rangecolor",       "1,0.1,0.1,1")
  pfUI:UpdateConfig("bars",       nil,           "showoom",          "1")
  pfUI:UpdateConfig("bars",       nil,           "oomcolor",         ".2,.2,1,1")
  pfUI:UpdateConfig("bars",       nil,           "showna",           "1")
  pfUI:UpdateConfig("bars",       nil,           "nacolor",          ".3,.3,.3,1")
  pfUI:UpdateConfig("bars",       nil,           "showequipped",     "1")
  pfUI:UpdateConfig("bars",       nil,           "eqcolor",          ".2,.8,.2,.2")
  pfUI:UpdateConfig("bars",       nil,           "shiftdrag",        "1")

  pfUI:UpdateConfig("bars",       nil,           "font",             "Interface\\AddOns\\pfUI\\fonts\\BigNoodleTitling.ttf")
  pfUI:UpdateConfig("bars",       nil,           "font_offset",      "0")
  pfUI:UpdateConfig("bars",       nil,           "macro_size",       "9")
  pfUI:UpdateConfig("bars",       nil,           "macro_color",      "1,1,1,1")
  pfUI:UpdateConfig("bars",       nil,           "count_size",       "11")
  pfUI:UpdateConfig("bars",       nil,           "count_color",      ".2,1,.8,1")
  pfUI:UpdateConfig("bars",       nil,           "bind_size",        "8")
  pfUI:UpdateConfig("bars",       nil,           "bind_color",       "1,1,0,1")

  pfUI:UpdateConfig("panel",      nil,           "use_unitfonts",    "0")
  pfUI:UpdateConfig("panel",      nil,           "hide_leftchat",    "0")
  pfUI:UpdateConfig("panel",      nil,           "hide_rightchat",   "0")
  pfUI:UpdateConfig("panel",      nil,           "hide_minimap",     "0")
  pfUI:UpdateConfig("panel",      nil,           "hide_microbar",    "0")
  pfUI:UpdateConfig("panel",      "left",        "left",             "guild")
  pfUI:UpdateConfig("panel",      "left",        "center",           "durability")
  pfUI:UpdateConfig("panel",      "left",        "right",            "friends")
  pfUI:UpdateConfig("panel",      "right",       "left",             "fps")
  pfUI:UpdateConfig("panel",      "right",       "center",           "time")
  pfUI:UpdateConfig("panel",      "right",       "right",            "gold")
  pfUI:UpdateConfig("panel",      "other",       "minimap",          "zone")
  pfUI:UpdateConfig("panel",      "micro",       "enable",           "0")
  pfUI:UpdateConfig("panel",      "bag",         "ignorespecial",    "1")
  pfUI:UpdateConfig("panel",      "xp",          "xp_always",        "0")
  pfUI:UpdateConfig("panel",      "xp",          "xp_timeout",       "5")
  pfUI:UpdateConfig("panel",      "xp",          "xp_width",         "5")
  pfUI:UpdateConfig("panel",      "xp",          "xp_height",        "100")
  pfUI:UpdateConfig("panel",      "xp",          "xp_mode",          "VERTICAL")
  pfUI:UpdateConfig("panel",      "xp",          "rep_always",       "0")
  pfUI:UpdateConfig("panel",      "xp",          "rep_timeout",      "5")
  pfUI:UpdateConfig("panel",      "xp",          "rep_width",        "5")
  pfUI:UpdateConfig("panel",      "xp",          "rep_height",       "100")
  pfUI:UpdateConfig("panel",      "xp",          "rep_mode",         "VERTICAL")

  pfUI:UpdateConfig("castbar",    "player",      "hide_blizz",       "1")
  pfUI:UpdateConfig("castbar",    "player",      "hide_pfui",        "0")
  pfUI:UpdateConfig("castbar",    "player",      "width",            "-1")
  pfUI:UpdateConfig("castbar",    "player",      "height",           "-1")
  pfUI:UpdateConfig("castbar",    "player",      "showicon",         "0")
  pfUI:UpdateConfig("castbar",    "player",      "showlag",          "0")
  pfUI:UpdateConfig("castbar",    "target",      "hide_pfui",        "0")
  pfUI:UpdateConfig("castbar",    "target",      "width",            "-1")
  pfUI:UpdateConfig("castbar",    "target",      "height",           "-1")
  pfUI:UpdateConfig("castbar",    "target",      "showicon",         "0")
  pfUI:UpdateConfig("castbar",    "target",      "showlag",          "0")
  pfUI:UpdateConfig("castbar",    "focus",       "hide_pfui",        "0")
  pfUI:UpdateConfig("castbar",    "focus",       "width",            "-1")
  pfUI:UpdateConfig("castbar",    "focus",       "height",           "-1")
  pfUI:UpdateConfig("castbar",    "focus",       "showicon",         "0")
  pfUI:UpdateConfig("castbar",    "focus",       "showlag",          "0")
  pfUI:UpdateConfig("castbar",    nil,           "use_unitfonts",    "0")

  pfUI:UpdateConfig("tooltip",    nil,           "position",         "chat")
  pfUI:UpdateConfig("tooltip",    nil,           "cursoralign",      "native")
  pfUI:UpdateConfig("tooltip",    nil,           "cursoroffset",     "20")
  pfUI:UpdateConfig("tooltip",    nil,           "extguild",         "1")
  pfUI:UpdateConfig("tooltip",    nil,           "alpha",            "0.8")
  pfUI:UpdateConfig("tooltip",    "compare",     "basestats",        "1")
  pfUI:UpdateConfig("tooltip",    "compare",     "showalways",       "0")
  pfUI:UpdateConfig("tooltip",    "vendor",      "showalways",       "0")

  pfUI:UpdateConfig("chat",       "text",        "input_width",      "0")
  pfUI:UpdateConfig("chat",       "text",        "input_height",     "0")
  pfUI:UpdateConfig("chat",       "text",        "outline",          "1")
  pfUI:UpdateConfig("chat",       "text",        "mouseover",        "0")
  pfUI:UpdateConfig("chat",       "text",        "bracket",          "[]")
  pfUI:UpdateConfig("chat",       "text",        "time",             "0")
  pfUI:UpdateConfig("chat",       "text",        "timeformat",       "%H:%M:%S")
  pfUI:UpdateConfig("chat",       "text",        "timebracket",      "[]")
  pfUI:UpdateConfig("chat",       "text",        "timecolor",        ".8,.8,.8,1")
  pfUI:UpdateConfig("chat",       "text",        "tintunknown",      "1")
  pfUI:UpdateConfig("chat",       "text",        "unknowncolor",     ".7,.7,.7,1")
  pfUI:UpdateConfig("chat",       "text",        "channelnumonly",   "1")
  pfUI:UpdateConfig("chat",       "text",        "playerlinks",      "1")
  pfUI:UpdateConfig("chat",       "text",        "detecturl",        "1")
  pfUI:UpdateConfig("chat",       "text",        "classcolor",       "1")
  pfUI:UpdateConfig("chat",       "left",        "width",            "380")
  pfUI:UpdateConfig("chat",       "left",        "height",           "180")
  pfUI:UpdateConfig("chat",       "right",       "enable",           "0")
  pfUI:UpdateConfig("chat",       "right",       "alwaysshow",       "0")
  pfUI:UpdateConfig("chat",       "right",       "width",            "380")
  pfUI:UpdateConfig("chat",       "right",       "height",           "180")
  pfUI:UpdateConfig("chat",       "global",      "hidecombat",       "0")
  pfUI:UpdateConfig("chat",       "global",      "tabdock",          "0")
  pfUI:UpdateConfig("chat",       "global",      "tabmouse",         "0")
  pfUI:UpdateConfig("chat",       "global",      "chatflash",        "1")
  pfUI:UpdateConfig("chat",       "global",      "custombg",         "0")
  pfUI:UpdateConfig("chat",       "global",      "background",       ".2,.2,.2,.5")
  pfUI:UpdateConfig("chat",       "global",      "border",           ".4,.4,.4,.5")
  pfUI:UpdateConfig("chat",       "global",      "whispermod",       "1")
  pfUI:UpdateConfig("chat",       "global",      "whisper",          "1,.7,1,1")
  pfUI:UpdateConfig("chat",       "global",      "sticky",           "1")
  pfUI:UpdateConfig("chat",       "global",      "fadeout",          "0")
  pfUI:UpdateConfig("chat",       "global",      "fadetime",         "300")
  pfUI:UpdateConfig("chat",       "global",      "scrollspeed",      "1")
  pfUI:UpdateConfig("chat",       "bubbles",     "alpha",            ".75")

  pfUI:UpdateConfig("nameplates", nil,           "use_unitfonts",    "0")
  pfUI:UpdateConfig("nameplates", nil,           "legacy",           "0")
  pfUI:UpdateConfig("nameplates", nil,           "overlap",          "0")
  pfUI:UpdateConfig("nameplates", nil,           "showcastbar",      "1")
  pfUI:UpdateConfig("nameplates", nil,           "spellname",        "0")
  pfUI:UpdateConfig("nameplates", nil,           "showdebuffs",      "0")
  pfUI:UpdateConfig("nameplates", nil,           "clickthrough",     "0")
  pfUI:UpdateConfig("nameplates", nil,           "rightclick",       "1")
  pfUI:UpdateConfig("nameplates", nil,           "clickthreshold",   "0.5")
  pfUI:UpdateConfig("nameplates", nil,           "enemyclassc",      "1")
  pfUI:UpdateConfig("nameplates", nil,           "friendclassc",     "1")
  pfUI:UpdateConfig("nameplates", nil,           "raidiconsize",     "16")
  pfUI:UpdateConfig("nameplates", nil,           "players",          "0")
  pfUI:UpdateConfig("nameplates", nil,           "critters",         "0")
  pfUI:UpdateConfig("nameplates", nil,           "totems",           "0")
  pfUI:UpdateConfig("nameplates", nil,           "showhp",           "0")
  pfUI:UpdateConfig("nameplates", nil,           "vpos",             "-10")
  pfUI:UpdateConfig("nameplates", nil,           "width",            "120")
  pfUI:UpdateConfig("nameplates", nil,           "heighthealth",     "8")
  pfUI:UpdateConfig("nameplates", nil,           "heightcast",       "8")
  pfUI:UpdateConfig("nameplates", nil,           "cpdisplay",        "0")
  pfUI:UpdateConfig("nameplates", nil,           "targethighlight",  "0")
  pfUI:UpdateConfig("nameplates", nil,           "targetglow",       "1")
  pfUI:UpdateConfig("nameplates", nil,           "glowcolor",        "1,1,1,1")
  pfUI:UpdateConfig("nameplates", nil,           "targetzoom",       "0")
  pfUI:UpdateConfig("nameplates", nil,           "notargalpha",      ".75")
  pfUI:UpdateConfig("nameplates", nil,           "healthtexture",    "Interface\\AddOns\\pfUI\\img\\bar")

  pfUI:UpdateConfig("abuttons",   nil,           "enable",           "0")
  pfUI:UpdateConfig("abuttons",   nil,           "position",         "bottom")
  pfUI:UpdateConfig("abuttons",   nil,           "showdefault",      "0")
  pfUI:UpdateConfig("abuttons",   nil,           "rowsize",          "6")
  pfUI:UpdateConfig("abuttons",   nil,           "spacing",          "2")
  pfUI:UpdateConfig("abuttons",   nil,           "hideincombat",     "1")

  pfUI:UpdateConfig("screenshot", nil,           "interval",         "0")
  pfUI:UpdateConfig("screenshot", nil,           "levelup",          "1")
  pfUI:UpdateConfig("screenshot", nil,           "pvprank",          "1")
  pfUI:UpdateConfig("screenshot", nil,           "faction",          "1")
  pfUI:UpdateConfig("screenshot", nil,           "battleground",     "0")
  pfUI:UpdateConfig("screenshot", nil,           "hk",               "0")
  pfUI:UpdateConfig("screenshot", nil,           "loot",             "0")
  pfUI:UpdateConfig("screenshot", nil,           "hideui",           "0")
  pfUI:UpdateConfig("screenshot", nil,           "caption",          "0")
  pfUI:UpdateConfig("screenshot", nil,           "caption_font",     "Interface\\AddOns\\pfUI\\fonts\\BigNoodleTitling.ttf")
  pfUI:UpdateConfig("screenshot", nil,           "caption_size",     "22")

  pfUI:UpdateConfig("gm",         nil,           "disable",          "1")
  pfUI:UpdateConfig("gm",         nil,           "server",           "elysium")

  pfUI:UpdateConfig("questlog",   nil,           "showQuestLevels",  "0")
  pfUI:UpdateConfig("thirdparty", nil,           "chatbg",           "1")
  pfUI:UpdateConfig("thirdparty", nil,           "showmeter",        "0")
  pfUI:UpdateConfig("thirdparty", "dpsmate",     "skin",             "1")
  pfUI:UpdateConfig("thirdparty", "dpsmate",     "dock",             "1")
  pfUI:UpdateConfig("thirdparty", "swstats",     "skin",             "1")
  pfUI:UpdateConfig("thirdparty", "swstats",     "dock",             "1")
  pfUI:UpdateConfig("thirdparty", "ktm",         "skin",             "1")
  pfUI:UpdateConfig("thirdparty", "ktm",         "dock",             "1")
  pfUI:UpdateConfig("thirdparty", "wim",         "enable",           "1")
  pfUI:UpdateConfig("thirdparty", "healcomm",    "enable",           "1")
  pfUI:UpdateConfig("thirdparty", "sortbags",    "enable",           "1")
  pfUI:UpdateConfig("thirdparty", "mrplow",      "enable",           "1")
  pfUI:UpdateConfig("thirdparty", "flightmap",   "enable",           "1")
  pfUI:UpdateConfig("thirdparty", "theorycraft", "enable",           "1")
  pfUI:UpdateConfig("thirdparty", "supermacro",  "enable",           "1")
  pfUI:UpdateConfig("thirdparty", "atlasloot",   "enable",           "1")
  pfUI:UpdateConfig("thirdparty", "myroleplay",  "enable",           "1")
  pfUI:UpdateConfig("thirdparty", "druidmana",   "enable",           "1")
  pfUI:UpdateConfig("thirdparty", "noteit",      "enable",           "1")

  pfUI:UpdateConfig("position",   nil,           nil,                nil)
  pfUI:UpdateConfig("disabled",   nil,           nil,                nil)
end

function pfUI:MigrateConfig()
  -- migrating to new fonts (1.5 -> 1.6)
  if checkversion(1, 6, 0) then
    -- migrate font_default
    if pfUI_config.global.font_default == "arial" then
      pfUI_config.global.font_default = "Myriad-Pro"
    elseif pfUI_config.global.font_default == "homespun" then
      pfUI_config.global.font_default = "Homespun"
    elseif pfUI_config.global.font_default == "diediedie" then
      pfUI_config.global.font_default = "DieDieDie"
    end

    -- migrate font_square
    if pfUI_config.global.font_square == "arial" then
      pfUI_config.global.font_square = "Myriad-Pro"
    elseif pfUI_config.global.font_square == "homespun" then
      pfUI_config.global.font_square = "Homespun"
    elseif pfUI_config.global.font_square == "diediedie" then
      pfUI_config.global.font_square = "DieDieDie"
    end

    -- migrate font_combat
    if pfUI_config.global.font_combat == "arial" then
      pfUI_config.global.font_combat = "Myriad-Pro"
    elseif pfUI_config.global.font_combat == "homespun" then
      pfUI_config.global.font_combat = "Homespun"
    elseif pfUI_config.global.font_combat == "diediedie" then
      pfUI_config.global.font_combat = "DieDieDie"
    end
  end

  -- migrating to new loot config section (> 2.0.5)
  if checkversion(2, 0, 5) then
    if pfUI_config.appearance.loot and pfUI_config.appearance.loot.autoresize then
      pfUI_config.loot.autoresize = pfUI_config.appearance.loot.autoresize
      pfUI_config.appearance.loot.autoresize = nil
      pfUI_config.appearance.loot = nil
    end
  end

  -- migrating to new unitframes (> 2.5)
  if checkversion(2, 5, 0) then
    -- migrate clickcast settings
    if pfUI_config.unitframes.raid.clickcast_ctrl then
      pfUI_config.unitframes.clickcast = pfUI_config.unitframes.raid.clickcast
      pfUI_config.unitframes.clickcast_shift = pfUI_config.unitframes.raid.clickcast_shift
      pfUI_config.unitframes.clickcast_alt = pfUI_config.unitframes.raid.clickcast_alt
      pfUI_config.unitframes.clickcast_ctrl = pfUI_config.unitframes.raid.clickcast_ctrl

      pfUI_config.unitframes.raid.clickcast = "0"
      pfUI_config.unitframes.raid.clickcast_shift = nil
      pfUI_config.unitframes.raid.clickcast_alt = nil
      pfUI_config.unitframes.raid.clickcast_ctrl = nil
    end

    -- migrate buffsizes
    if pfUI_config.unitframes.buff_size then
      pfUI_config.unitframes.player.buffsize = pfUI_config.unitframes.buff_size
      pfUI_config.unitframes.target.buffsize = pfUI_config.unitframes.buff_size
      pfUI_config.unitframes.buff_size = nil
    end

    -- migrate debuffsizes
    if pfUI_config.unitframes.debuff_size then
      pfUI_config.unitframes.player.debuffsize = pfUI_config.unitframes.debuff_size
      pfUI_config.unitframes.target.debuffsize = pfUI_config.unitframes.debuff_size
      pfUI_config.unitframes.debuff_size = nil
    end
  end

  -- migrating to new fontnames (> 2.6)
  if checkversion(2, 6, 0) then
    -- migrate font_combat
    if pfUI_config.global.font_square then
      pfUI_config.global.font_unit = pfUI_config.global.font_square
      pfUI_config.global.font_square = nil
    end
  end


  -- migrating old to new font layout (> 3.0.0)
  if checkversion(3, 0, 0) then
    -- migrate font_default
    if not strfind(pfUI_config.global.font_default, "\\") then
      pfUI_config.global.font_default = "Interface\\AddOns\\pfUI\\fonts\\" .. pfUI_config.global.font_default .. ".ttf"
    end

    -- migrate font_unit
    if not strfind(pfUI_config.global.font_unit, "\\") then
      pfUI_config.global.font_unit = "Interface\\AddOns\\pfUI\\fonts\\" .. pfUI_config.global.font_unit .. ".ttf"
    end

    -- migrate font_combat
    if not strfind(pfUI_config.global.font_combat, "\\") then
      pfUI_config.global.font_combat = "Interface\\AddOns\\pfUI\\fonts\\" .. pfUI_config.global.font_combat .. ".ttf"
    end
  end

  -- migrating old to new unitframe texts (> 3.0.0)
  if checkversion(3, 0, 0) then
    local unitframes = { "player", "target", "focus", "group", "grouptarget", "grouppet", "raid", "ttarget", "pet", "ptarget", "fallback" }

    for _, unitframe in pairs(unitframes) do
      if pfUI_config.unitframes[unitframe].txtleft then
        pfUI_config.unitframes[unitframe].txthpleft = pfUI_config.unitframes[unitframe].txtleft
        pfUI_config.unitframes[unitframe].txtleft = nil
      end
      if pfUI_config.unitframes[unitframe].txtcenter then
        pfUI_config.unitframes[unitframe].txthpcenter = pfUI_config.unitframes[unitframe].txtcenter
        pfUI_config.unitframes[unitframe].txtcenter = nil
      end
      if pfUI_config.unitframes[unitframe].txtright then
        pfUI_config.unitframes[unitframe].txthpright = pfUI_config.unitframes[unitframe].txtright
        pfUI_config.unitframes[unitframe].txtright = nil
      end
    end
  end

  -- migrating animation_speed (> 3.1.2)
  if checkversion(3, 1, 2) then
    if tonumber(pfUI_config.unitframes.animation_speed) >= 13 then
      pfUI_config.unitframes.animation_speed = "13"
    elseif tonumber(pfUI_config.unitframes.animation_speed) >= 8 then
      pfUI_config.unitframes.animation_speed = "8"
    elseif tonumber(pfUI_config.unitframes.animation_speed) >= 5 then
      pfUI_config.unitframes.animation_speed = "5"
    elseif tonumber(pfUI_config.unitframes.animation_speed) >= 3 then
      pfUI_config.unitframes.animation_speed = "3"
    elseif tonumber(pfUI_config.unitframes.animation_speed) >= 2 then
      pfUI_config.unitframes.animation_speed = "2"
    elseif tonumber(pfUI_config.unitframes.animation_speed) >= 1 then
      pfUI_config.unitframes.animation_speed = "1"
    else
      pfUI_config.unitframes.animation_speed = "5"
    end
  end

  -- migrating rangecheck interval (> 3.2.2)
  if checkversion(3, 2, 2) then
    if tonumber(pfUI_config.unitframes.rangechecki) <= 1 then
      pfUI_config.unitframes.rangechecki = "2"
    end
  end

  -- migrating legacy buff/debuff naming (> 3.5.0)
  if checkversion(3, 5, 0) then
    local unitframes = { "player", "target", "focus", "group", "grouptarget", "grouppet", "raid", "ttarget", "pet", "ptarget", "fallback" }

    for _, unitframe in pairs(unitframes) do
      local entry = pfUI_config.unitframes[unitframe]
      if entry.buffs and entry.buffs == "hide" then entry.buffs = "off" end
      if entry.debuffs and entry.debuffs == "hide" then entry.debuffs = "off" end
    end
  end

  -- migrating glow settings (> 3.5.1)
  if checkversion(3, 5, 0) then
    local common = { "player", "target", "ttarget", "pet", "ptarget"}
    for _, unitframe in pairs(common) do
      if pfUI_config.appearance.infight.group == "1" then
        pfUI_config.unitframes[unitframe].glowcombat = "1"
        pfUI_config.unitframes[unitframe].glowaggro = "1"
      elseif pfUI_config.appearance.infight.group == "0" then
        pfUI_config.unitframes[unitframe].glowcombat = "0"
        pfUI_config.unitframes[unitframe].glowaggro = "0"
      end
    end

    if pfUI_config.appearance.infight.group == "1" then
      pfUI_config.unitframes["group"].glowcombat = "1"
      pfUI_config.unitframes["group"].glowaggro = "1"
    elseif pfUI_config.appearance.infight.group == "0" then
      pfUI_config.unitframes["group"].glowcombat = "0"
      pfUI_config.unitframes["group"].glowaggro = "0"
    end
  end

  -- migrating old buff settings (> 3.6.1)
  if checkversion(3, 6, 1) then
    pfUI_config.buffs.weapons =  pfUI_config.global.hidewbuff == "1" and "0" or "1"
    pfUI_config.buffs.buffs   =  pfUI_config.global.hidebuff  == "1" and "0" or "1"
    pfUI_config.buffs.debuffs =  pfUI_config.global.hidebuff  == "1" and "0" or "1"
  end

  -- migrating default debuffbar color settings (> 3.16)
  if checkversion(3, 16, 0) then

    if pfUI_config.buffbar.pdebuff.color == ".1,.1,.1,1" then
      pfUI_config.buffbar.pdebuff.color = ".8,.4,.4,1"
    end

    if pfUI_config.buffbar.tdebuff.color == ".1,.1,.1,1" then
      pfUI_config.buffbar.tdebuff.color   =  ".8,.4,.4,1"
    end
  end

  -- migrate buff/debuff position settings (> 3.19)
  if checkversion(3, 19, 0) then
    local unitframes = { "player", "target", "focus", "group", "grouptarget", "grouppet", "raid", "ttarget", "pet", "ptarget", "fallback" }

    for _, unitframe in pairs(unitframes) do
      local entry = pfUI_config.unitframes[unitframe]
      if entry.buffs and entry.buffs == "top" then entry.buffs = "TOPLEFT" end
      if entry.buffs and entry.buffs == "bottom" then entry.buffs = "BOTTOMLEFT" end
      if entry.debuffs and entry.debuffs == "top" then entry.debuffs = "TOPLEFT" end
      if entry.debuffs and entry.debuffs == "bottom" then entry.debuffs = "BOTTOMLEFT" end
    end
  end

  -- migrating actionbar settings (> 3.19)
  if checkversion(3, 19, 0) then

    local migratebars = {
      ["pfBarActionMain"] = "pfActionBarMain",
      ["pfBarBottomLeft"] = "pfActionBarTop",
      ["pfBarBottomRight"] = "pfActionBarLeft",
      ["pfBarTwoRight"] = "pfActionBarVertical",
      ["pfBarRight"] = "pfActionBarRight",
      ["pfBarShapeshift"] = "pfActionBarStances",
      ["pfBarPet"] = "pfActionBarPet",
    }

    -- migrate bar positions and scaling
    for oldname, newname in pairs(migratebars) do
      if pfUI_config.position[oldname] then
        pfUI_config.position[newname] = pfUI.api.CopyTable(pfUI_config.position[oldname])
        pfUI_config.position[oldname] = nil
      end
    end

    -- migrate global settings to bar specifics
    for i=1,12 do
      if pfUI_config.bars.icon_size then
        pfUI_config.bars["bar"..i].icon_size = pfUI_config.bars.icon_size
      end

      if pfUI_config.bars.background then
        pfUI_config.bars["bar"..i].background = pfUI_config.bars.background
      end

      if pfUI_config.bars.showmacro then
        pfUI_config.bars["bar"..i].showmacro = pfUI_config.bars.showmacro
      end

      if pfUI_config.bars.showkeybind then
        pfUI_config.bars["bar"..i].showkeybind = pfUI_config.bars.showkeybind
      end

      if pfUI_config.bars.hide_time then
        pfUI_config.bars["bar"..i].hide_time = pfUI_config.bars.hide_time
      end
    end

    pfUI_config.bars.icon_size = nil
    pfUI_config.bars.background = nil
    pfUI_config.bars.showmacro = nil
    pfUI_config.bars.showkeybind = nil
    pfUI_config.bars.hide_time = nil

    if pfUI_config.bars.hide_actionmain then
      pfUI_config.bars.bar1.autohide = pfUI_config.bars.hide_actionmain
      pfUI_config.bars.hide_actionmain = nil
    end

    if pfUI_config.bars.hide_bottomleft then
      pfUI_config.bars.bar6.autohide = pfUI_config.bars.hide_bottomleft
      pfUI_config.bars.hide_bottomleft = nil
    end

    if pfUI_config.bars.hide_bottomright then
      pfUI_config.bars.bar5.autohide = pfUI_config.bars.hide_bottomright
      pfUI_config.bars.hide_bottomright = nil
    end

    if pfUI_config.bars.hide_right then
      pfUI_config.bars.bar3.autohide = pfUI_config.bars.hide_right
      pfUI_config.bars.hide_right = nil
    end

    if pfUI_config.bars.hide_tworight then
      pfUI_config.bars.bar4.autohide = pfUI_config.bars.hide_tworight
      pfUI_config.bars.hide_tworight = nil
    end

    if pfUI_config.bars.hide_shapeshift then
      pfUI_config.bars.bar11.autohide = pfUI_config.bars.hide_shapeshift
      pfUI_config.bars.hide_shapeshift = nil
    end

    if pfUI_config.bars.hide_pet then
      pfUI_config.bars.bar12.autohide = pfUI_config.bars.hide_pet
      pfUI_config.bars.hide_pet = nil
    end

    if pfUI_config.bars.actionmain and pfUI_config.bars.actionmain.formfactor then
      pfUI_config.bars.bar1.formfactor = pfUI_config.bars.actionmain.formfactor
      pfUI_config.bars.actionmain.formfactor = nil
    end

    if pfUI_config.bars.bottomleft and pfUI_config.bars.bottomleft.formfactor then
      pfUI_config.bars.bar6.formfactor = pfUI_config.bars.bottomleft.formfactor
      pfUI_config.bars.bottomleft.formfactor = nil
    end

    if pfUI_config.bars.bottomright and pfUI_config.bars.bottomright.formfactor then
      pfUI_config.bars.bar5.formfactor = pfUI_config.bars.bottomright.formfactor
      pfUI_config.bars.bottomright.formfactor = nil
    end

    if pfUI_config.bars.right and pfUI_config.bars.right.formfactor then
      pfUI_config.bars.bar3.formfactor = pfUI_config.bars.right.formfactor
      pfUI_config.bars.right.formfactor = nil
    end

    if pfUI_config.bars.tworight and pfUI_config.bars.tworight.formfactor then
      pfUI_config.bars.bar4.formfactor = pfUI_config.bars.tworight.formfactor
      pfUI_config.bars.tworight.formfactor = nil
    end

    if pfUI_config.bars.shapeshift and pfUI_config.bars.shapeshift.formfactor then
      pfUI_config.bars.bar11.formfactor = pfUI_config.bars.shapeshift.formfactor
      pfUI_config.bars.shapeshift.formfactor = nil
    end

    if pfUI_config.bars.pet and pfUI_config.bars.pet.formfactor then
      pfUI_config.bars.bar12.formfactor = pfUI_config.bars.pet.formfactor
      pfUI_config.bars.pet.formfactor = nil
    end
  end

  -- migrate xp-showalways (> 4.0.2)
  if checkversion(4, 0, 2) then
    pfUI_config.panel.xp.xp_always = pfUI_config.panel.xp.showalways
    pfUI_config.panel.xp.rep_always = pfUI_config.panel.xp.showalways
  end

  pfUI_config.version = pfUI.version.string
end
