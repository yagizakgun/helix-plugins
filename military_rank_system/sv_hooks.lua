util.AddNetworkString("openRankMenu")
util.AddNetworkString("rankData")

net.Receive("rankData", function (len, ply)
    local tableID = net.ReadInt(32)
    local rankTable = RankSystem.Ranks["Polizei"]["Ranks"][tableID]
    local targetPlayer = net.ReadString()
    ply:SetModel(rankTable.model)
    -- PrintTable(rankTable)
end)