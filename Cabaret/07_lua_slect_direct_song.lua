local function main()  

        Cmd("off RunningSequence")
        Cmd("off Sequence 1 t 14")
        Cmd("off Sequence 16 t; ")
        Cmd("off runningmacro;")
        Cmd("off running timecode;")
        Cmd("off runningpreset;")

		local variableSection = GlobalVars()
		local TimecodeActif=GetVar(variableSection, "TimecodeActif")


			for i=1,100,1
		do
		if DataPool().Timecodes[i] then
			Cmd("Set Timecode "..i.."  AutoStart=No")
			Cmd("Set Timecode "..i.."  AutoStop=No")
			Cmd('Record off Timecode '..i)
			end
		end
		Cmd("Set Timecode "..TimecodeActif.."  AutoStart=Yes")
		Cmd("Set Timecode "..TimecodeActif.."  AutoStop=Yes")
		Cmd("select Timecode "..TimecodeActif)
		-- Cmd('SendOSC 3 "/layerchataigne,i,'..TabSong[v]["layerchataigne"]..'"')


end

return main

--[[ SetGlobalVar "TimecodeActif" "3" ]]