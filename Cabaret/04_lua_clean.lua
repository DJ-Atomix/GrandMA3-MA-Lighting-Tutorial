function stringToTable(str)
	local f = load(str)
	return f()
end

local function main()

    local inputs = {
        {name = "Text Only", value = GetVar(GlobalVars(), "TabSong")}
    }

    
    local resultTable =
        MessageBox(
        {
            title = "Messagebox example 2",
            message = "This is a message",
            message_align_h = Enums.AlignmentH.Left,
            message_align_v = Enums.AlignmentV.Top,
            commands = {{value = 1, name = "Ok"}, {value = 0, name = "Cancel"}},
            inputs = inputs,
            backColor = "Global.Default",
            -- timeout = 10000, --[[milliseconds]]
            -- timeoutResultCancel = false,
            icon = "logo_small",
            titleTextColor = "Global.AlertText",
            messageTextColor = "Global.Text"
        }
    )


    local input = TextInput("Vider le tableau TabSong? Ecrire Yes")
    if input=="Yes" then
        TabSong = {}  -- Vide le tableau TabSong
        --Cmd("delete sequence 122 t")
        --Cmd("delete timecode 5 t")
        Printf("Le tableau TabSong a été vidé.")
--[[ 		table.insert(TabSong, { ["index"] = 1, ["name"] = "Marinière", ["timecode"] = 2, ["sequence"] = 101, ["layerchataigne"] = 1 })
		table.insert(TabSong, { ["index"] = 2, ["name"] = "FatBoySlim", ["timecode"] = 3, ["sequence"] = 108, ["layerchataigne"] = 2  })
		table.insert(TabSong, { ["index"] = 3, ["name"] = "Greatest Show", ["timecode"] = 4, ["sequence"] = 116, ["layerchataigne"] = 3  })
		table.insert(TabSong, { ["index"] = 3, ["name"] = "abba", ["timecode"] = 5, ["sequence"] = 130, ["layerchataigne"] = 4  })
		table.insert(TabSong, { ["index"] = 3, ["name"] = "Chicago", ["timecode"] = 6, ["sequence"] = 138, ["layerchataigne"] = 5  })
		table.insert(TabSong, { ["index"] = 3, ["name"] = "kendji", ["timecode"] = 7, ["sequence"] = 146, ["layerchataigne"] = 11  }) ]]
    local texte=[[
        return{
            [1] = {
             index = 1,
             timecode = 5,
             sequence = 130,
             layerchataigne = 4,
             name = "16 abba",
            },
            [2] = {
             index = 2,
             timecode = 6,
             sequence = 138,
             layerchataigne = 5,
             name = "20 Chicago",
            },
            [3] = {
             index = 3,
             timecode = 7,
             sequence = 146,
             layerchataigne = 11,
             name = "24 kendji",
            },
            [4] = {
             index = 4,
             timecode = 8,
             sequence = 155,
             layerchataigne = 6,
             name = "37 disco",
            },
            [5] = {
             index = 5,
             timecode = 9,
             sequence = 163,
             layerchataigne = 7,
             name = "06 encore un matin",
            },
            [6] = {
             index = 6,
             timecode = 10,
             sequence = 171,
             layerchataigne = 8,
             name = "08 et bam",
            },
            [7] = {
             index = 7,
             timecode = 11,
             sequence = 179,
             layerchataigne = 9,
             name = "41 flashdance",
            },
            [8] = {
             index = 8,
             timecode = 12,
             sequence = 187,
             layerchataigne = 10,
             name = "51 gala",
            },
            [9] = {
             index = 9,
             timecode = 13,
             sequence = 195,
             layerchataigne = 12,
             name = "27 luciani",
            },
            [10] = {
             index = 10,
             timecode = 14,
             sequence = 203,
             layerchataigne = 13,
             name = "33 elton",
            },
            [11] = {
             index = 11,
             timecode = 15,
             sequence = 211,
             layerchataigne = 14,
             name = "02 intro",
            },
            [12] = {
             index = 12,
             timecode = 16,
             sequence = 219,
             layerchataigne = 15,
             name = "45 sardou",
            },
            [13] = {
             index = 13,
             timecode = 17,
             sequence = 227,
             layerchataigne = 16,
             name = "12 dassin",
            },
            [14] = {
             index = 14,
             timecode = 18,
             sequence = 235,
             layerchataigne = 17,
             name = "49 jlo",
            },
            [15] = {
             index = 15,
             timecode = 19,
             sequence = 243,
             layerchataigne = "18",
             name = "31 kiss",
            },
            [16] = {
             index = 16,
             timecode = 20,
             sequence = 251,
             layerchataigne = "19",
             name = "53 final2",
            },
            [17] = {
             index = 17,
             timecode = 21,
             sequence = 259,
             layerchataigne = "20",
             name = "35 soprano",
            },
            [18] = {
             index = 18,
             timecode = 22,
             sequence = 267,
             layerchataigne = "21",
             name = "39 sketch bibize",
            },
            [19] = {
            sequence = 283,
            name = "04 FORT BOYARD Présentation",
            index = 19,
            layerchataigne = "21",
            timecode = 24,
            },
            [20] = {
            sequence = 291,
            name = "10 FB EP Cylindres",
            index = 20,
            layerchataigne = "22",
            timecode = 25,
            },
            [21] = {
            sequence = 299,
            name = "22 FB Vigie",
            index = 21,
            layerchataigne = "23",
            timecode = 26,
            },
            [22] = {
            sequence = 307,
            name = "29 FB Gwen",
            index = 22,
            layerchataigne = "24",
            timecode = 27,
            },
            [23] = {
            sequence = 315,
            name = "43 FB salle trésor",
            index = 23,
            layerchataigne = "25",
            timecode = 28,
            },
            [24] = {
             layerchataigne = "26",
             sequence = 323,
             timecode = 29,
             name = "Animation yeux emilie",
             index = 24,
            },
            [25] = {
            index = 25,
            name = "25 Tombola",
            sequence = 331,
            timecode = 30,
            layerchataigne = "27",
            },
            [26] = {
            name = "00 test",
            layerchataigne = "28",
            index = 26,
            sequence = 339,
            timecode = 31,
            },
           }]];    
       SetVar(GlobalVars(), "TabSong", texte)
       TabSong = stringToTable(GetVar(GlobalVars(), "TabSong"))
       Printf(GetVar(GlobalVars(), "TabSong"))

    end
end

return main