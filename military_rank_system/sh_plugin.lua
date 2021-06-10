local PLUGIN = PLUGIN
RankSystem = RankSystem or {}

PLUGIN.name = "Military Rank System"
PLUGIN.author = "Kronax"
PLUGIN.description = "Adds an rank system."

-- ix.util.Include("cl_hooks.lua")
ix.util.Include("sv_hooks.lua")

ix.char.RegisterVar("CharRank", {
    field = "char_rank",
    fieldType = ix.type.string,
    default = "No Rank",
    isLocal = false,
})

RankSystem.Ranks = {

	["Polizei"] = {

		["Ranks"] = {

			{
				name = "Anwärter",
				model = "models/brot/typhon/orpo/mattishutzpolizei/co1.mdl",
				salary = 15	
			},

 			{
				name = "Unterwachtmeiste",
				model = "models/brot/typhon/orpo/mattishutzpolizei/go1.mdl",
				salary = 15
			},

			{
				name = "Unterwachtmeister",
				model = "models/brot/typhon/orpo/mattishutzpolizei/go5.mdl",
				salary = 15
			},

			{
				name = "Rottmeister",
				model = "models/brot/typhon/orpo/mattishutzpolizei/nco6.mdl",
				salary = 15
			}
		}
	},

	["Soldier"] = {

		["Ranks"] = {

			{
				name = "Anwärter",
				model = "models/brot/typhon/orpo/mattishutzpolizei/co1.mdl",
				salary = 15	
			},

 			{
				name = "Schütze",
				model = "models/brot/typhon/orpo/mattishutzpolizei/go1.mdl",
				salary = 15
			}
		}
	},

	["SS"] = {

		["Ranks"] = {
			{
				name = "Bewerber",
				model = "models/brot/typhon/orpo/mattishutzpolizei/co1.mdl",
				salary = 15	
			},

 			{
				name = "Mann",
				model = "models/brot/typhon/orpo/mattishutzpolizei/go1.mdl",
				salary = 15
			}
		}
	}
}


local COMMAND = {}
	COMMAND.description = "Opens the rank menu"

	function COMMAND:OnRun(client)  
        net.Start("openRankMenu")
		net.Send(client)
	end

ix.command.Add("CharRankMenu", COMMAND)




