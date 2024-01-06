function stringToTable(str)
	local f = load(str)
	return f()
end

local function main()
    local Tabvalues = {}
    local pagetravail = 8
    local pagebase = 2

	TabSong = stringToTable(GetVar(GlobalVars(), "TabSong"))
    -- Lire les valeurs du tableau TabSong et les ajouter aux sélecteurs
    for i, v in ipairs(TabSong) do
        local musicName = v.name
        Tabvalues[musicName]=v.index
    end
 

    -- create inputs:
    local selectors = {
        {
            name = "toutes les musiques : ",
            selectedValue = 1,
            values = Tabvalues,
            type = 0
        }
    }

    -- open messagebox:
    local resultTable =
        MessageBox(
        {
            title = "Choix de la musique à travailler",
            message = "Choisissez votre musique",
            message_align_h = Enums.AlignmentH.Left,
            message_align_v = Enums.AlignmentV.Top,
            commands = { { value = 1, name = "Ok" }, { value = 0, name = "Cancel" } },
            selectors = selectors,
            backColor = "Global.Default",
            -- timeout = 10000, --milliseconds
            -- timeoutResultCancel = false,
            icon = "logo_small",
            titleTextColor = "Global.AlertText",
            messageTextColor = "Global.Text"
        }
    )
    
	-- print results:
	for k,v in pairs(resultTable.selectors) do
		local variableSection = GlobalVars()
		SetVar(variableSection, "TimecodeActif", TabSong[v]["timecode"])
		local premsequence = TabSong[v]["sequence"]
		local NomTimecodeActif=TabSong[v]["name"]
		Cmd("delete page "..pagetravail)
        Cmd("copy page "..pagebase.." at "..pagetravail)

		Cmd("assign sequence "..premsequence.." at page "..pagetravail..".101")
		Cmd("assign sequence "..(premsequence+1).." at page "..pagetravail..".102")
		Cmd("assign sequence "..(premsequence+2).." at page "..pagetravail..".103")
		Cmd("assign sequence "..(premsequence+3).." at page "..pagetravail..".104")
		Cmd("assign sequence "..(premsequence+4).." at page "..pagetravail..".105")
		Cmd("assign sequence "..(premsequence+5).." at page "..pagetravail..".106")
		Cmd("assign sequence "..(premsequence+6).." at page "..pagetravail..".109")
		Cmd("assign sequence "..(premsequence+7).." at page "..pagetravail..".110")
		Cmd('label page '..pagetravail..' \"'..NomTimecodeActif..'\"')
		Cmd("Select Page "..pagetravail)

			for i=1,100,1
		do
		if DataPool().Timecodes[i] then
			Cmd("Set Timecode "..i.."  AutoStart=No")
			Cmd("Set Timecode "..i.."  AutoStop=No")
				Cmd('Record off Timecode '..i)
			end
		end
		Cmd("Set Timecode "..TabSong[v]["timecode"].."  AutoStart=Yes")
		Cmd("Set Timecode "..TabSong[v]["timecode"].."  AutoStop=Yes")
		Cmd("select Timecode "..TabSong[v]["timecode"])
		Cmd('SendOSC 3 "/layerchataigne,i,'..TabSong[v]["layerchataigne"]..'"')

	end

end

return main