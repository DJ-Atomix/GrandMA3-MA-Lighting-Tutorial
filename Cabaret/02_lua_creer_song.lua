function getTableSize(t)
    local count = 0
    for _, __ in pairs(t) do
        count = count + 1
    end
    return count + 1
end

local function main()
    local input = TextInput("Quel est le nom de la chanson")
    local layerchataigne = TextInput("Quel est le numero de layer dans chataigne?")
    local pagebase = 2
    local pagetravail = 8
    local dertimecode=0
	    -- Vérifier si TabSong existe déjà
    if not TabSong then
        TabSong = {}
    end

	for i=1,100,1
    do
 	   if DataPool().Timecodes[i] then
			dertimecode=i
	    end
    end
    local TimecodeActif=(dertimecode+1)

	Cmd("copy timecode 1 at timecode "..TimecodeActif.." "..tostring(input))
    SetVar(GlobalVars(), "TimecodeActif", TimecodeActif)

    local dersequence=0
	for i=41,1000,1
    do
 	   if DataPool().Sequences[i] then
			dersequence=i
            
	    end
    end
	
	table.insert(TabSong, { ["index"] = getTableSize(TabSong), ["name"] = tostring(input), ["timecode"] = TimecodeActif, ["sequence"] = (dersequence+1), ["layerchataigne"] = layerchataigne })

   	Cmd('copy sequence 1 at sequence '..(dersequence+1)..' \"MOOVER '..tostring(input)..'\"')
   	Cmd('copy sequence 2 at sequence '..(dersequence+2)..' \"BIRDY '..tostring(input)..'\"')
   	Cmd('copy sequence 3 at sequence '..(dersequence+3)..' \"IRLED '..tostring(input)..'\"')
   	Cmd('copy sequence 4 at sequence '..(dersequence+4)..' \"BARRES '..tostring(input)..'\"')
   	Cmd('copy sequence 5 at sequence '..(dersequence+5)..' \"LED '..tostring(input)..'\"')
   	Cmd('copy sequence 6 at sequence '..(dersequence+6)..' \"QSPOT '..tostring(input)..'\"')
   	Cmd('copy sequence 7 at sequence '..(dersequence+7)..' \"MULTIFORM '..tostring(input)..'\"')
   	Cmd('copy sequence 8 at sequence '..(dersequence+8)..' \"PARCOB '..tostring(input)..'\"')

--[[ selectionner le show créé]]	
    Printf("selectionner le show créé")
	Cmd("delete page "..pagetravail)
	Cmd("copy page "..pagebase.." at "..pagetravail)

	Cmd("assign sequence "..(dersequence+1).." at page "..pagetravail..".101")
	Cmd("assign sequence "..(dersequence+2).." at page "..pagetravail..".102")
	Cmd("assign sequence "..(dersequence+3).." at page "..pagetravail..".103")
	Cmd("assign sequence "..(dersequence+4).." at page "..pagetravail..".104")
	Cmd("assign sequence "..(dersequence+5).." at page "..pagetravail..".105")
	Cmd("assign sequence "..(dersequence+6).." at page "..pagetravail..".106")
	Cmd("assign sequence "..(dersequence+7).." at page "..pagetravail..".109")
	Cmd("assign sequence "..(dersequence+8).." at page "..pagetravail..".110")
	Cmd('label page '..pagetravail..' \"'..tostring(input)..'\"');
	Cmd('select page '..pagetravail);
	
    for i=1,100,1
    do
 	   if DataPool().Timecodes[i] then
        Cmd("Set Timecode "..i.."  AutoStart=No")
        Cmd("Set Timecode "..i.."  AutoStop=No")
			Cmd('Record off Timecode '..i)
	    end
    end
	Printf("TimecodeActif")
	Cmd("Set Timecode "..TimecodeActif.."  AutoStart=Yes")
	Cmd("Set Timecode "..TimecodeActif.."  AutoStop=Yes")
	Cmd("select Timecode "..TimecodeActif)
	Cmd('SendOSC 3 "/layerchataigne,i,'..layerchataigne..'"')

	local mySeqHandle = DataPool().timecodes[TimecodeActif][1][2]
    mySeqHandle.target=DataPool().Sequences[(dersequence+1)]
    local mySeqHandle = DataPool().timecodes[TimecodeActif][1][3]
    mySeqHandle.target=DataPool().Sequences[(dersequence+2)]
    local mySeqHandle = DataPool().timecodes[TimecodeActif][1][4]
    mySeqHandle.target=DataPool().Sequences[(dersequence+3)]
    local mySeqHandle = DataPool().timecodes[TimecodeActif][1][5]
    mySeqHandle.target=DataPool().Sequences[(dersequence+4)]
    local mySeqHandle = DataPool().timecodes[TimecodeActif][1][6]
    mySeqHandle.target=DataPool().Sequences[(dersequence+5)]
    local mySeqHandle = DataPool().timecodes[TimecodeActif][1][7]
    mySeqHandle.target=DataPool().Sequences[(dersequence+6)]
    local mySeqHandle = DataPool().timecodes[TimecodeActif][4][3]
    mySeqHandle.target=DataPool().Sequences[(dersequence+7)]
    local mySeqHandle = DataPool().timecodes[TimecodeActif][4][4]
    mySeqHandle.target=DataPool().Sequences[(dersequence+8)]
    
    Cmd("Plugin 8")
	
	
end


return main