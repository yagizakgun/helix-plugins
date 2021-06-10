local PANEL = {}


local ply = LocalPlayer()
local character = ply:GetCharacter()
local faction = character:GetFaction()

-- Called when the panel is initialized.
function PANEL:Init()
	self:SetSize(ScrW()/1.8, ScrH()/1.7)
	self:ShowCloseButton(true)
	self:MakePopup(true)
	self:Center()
	self:SetText("")

	local function kapatfunc()
		self:Remove()
	end


	self.left = self:Add( "DScrollPanel")
	self.left:Dock( LEFT )
	self.left:SetSize( self:GetWide() / 1.5 , self:GetTall() /3)
	self.left:SetPaintBackground( true )
	self.left:DockMargin( 0, 0, 4, 0 )

	self.playercombo = self.left:Add("DComboBox")
    self.playercombo:SetValue("Oyuncu Seç")
	self.playercombo:SetSize(150,20)
    self.playercombo:Dock( TOP )	
    self.playercombo:DockMargin( 60, 5, 60, 0 )
    for _, ply in pairs(player.GetAll()) do
        -- if ply==LocalPlayer() then continue end;
        self.playercombo:AddChoice(ply:Nick(),ply:SteamID());
    end

	self.factioncombo = self.left:Add("DComboBox")
    self.factioncombo:SetValue("Meslek Seç")
	self.factioncombo:SetSize(150,20)
    self.factioncombo:Dock( TOP )	
    self.factioncombo:DockMargin( 60, 5, 60, 0 )
    for k, factionData in pairs(RankSystem.Ranks) do
        -- if ply==LocalPlayer() then continue end;
        self.factioncombo:AddChoice("factionData[]");
    end

	for k, rankData in pairs(RankSystem.Ranks["Polizei"]["Ranks"]) do
		self.bottom = self.left:Add("DButton")
		self.bottom:Dock( TOP )
		self.bottom:SetSize( 25, 25 )
		self.bottom:SetText( rankData.name )
		self.bottom:SetFont("ixSmallFont")
		self.bottom:DockMargin( 60, 5, 60, 0 )
		self.bottom.DoClick = function ()
			local targetChar = self.playercombo:GetValue()
			-- targetChar:SetModel(rankData.model)
			-- character:SetCharRank(rankData.name)
			net.Start("rankData")
			net.WriteInt(k, 32)
			net.WriteString(targetChar)
			net.SendToServer()

		end
	end
	
end


vgui.Register("ixRankMenu", PANEL, "DFrame")


hook.Add("CreateMenuButtons", "ixRankMenu", function(tabs)
	tabs["rankmenu"] = function(container)
		container:Add("ixRankMenu")
	end
end)



net.Receive("openRankMenu", function (len, ply)
    vgui.Create("ixRankMenu")
end)

PrintTable(RankSystem.Ranks)