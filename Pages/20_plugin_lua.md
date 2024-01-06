
# Programmation LUA

## Boucle
boucle de 226 à 221 tous les 1
```lua
local function main()
	for i = 226,221,-1 
	do 
	   Cmd("Fixture " .. i) 
	end
    
end

return main;
```
## Ecrire
```lua
local function main()
    Printf("Hello World!")
end

return main;
```

## variable qui fonctionne avec la ligne de commande grandma
Attention, les tableau ne sont pas acceptés, il faut passer par une sérialisation du tableau en texte

```lua
local function main()

    -- Stores a local Lua variable with the handle for the global variables.
    local variableSection = GlobalVars()

    -- Sets a global variable with an integer value using the SetVar function.
    SetVar(variableSection, "myGlobalVar", 42)

    -- Prints the global variable using the GetVar function.
    Printf("The value  of myGlobalVar is: " .. GetVar(variableSection, "myGlobalVar"))
    Printf("The value  of myGlobalVar is: " .. GetVar(variableSection, "FadeTime"))

    -- Deletes the global variable using the DelVar function.
    DelVar(variableSection, "myGlobalVar")
    Cmd('GetGlobalVar *')  -- lire toutes les variables
end

return main
```
## ecrire dans la ligne de cmd
```lua
Cmd("ClearAll")
```
## Popup
```lua
local function main(displayHandle)
    local descTable = {
        title = "Demo",
        caller = displayHandle,
        items = {"Select","Some","Value","Please"},
        selectedValue = "Some",
        add_args = {FilterSupport="Yes"},
    }
    local a,b = PopupInput(descTable)
    Printf("a = %s",tostring(a))
    Printf("b = %s",tostring(b))
end

return main
```
## formulaire de texte
```lua
local function main()
    local input = TextInput(" This is the title","Please provide your input here")
    Printf("You entered this message: %s",tostring(input))
end

return main
```
## Tableau
```lua
local function main()
    local myObjects = ObjectList("Fixture 1 Thru 10")

    Printf("Name of Fixture 1 = " .. myObjects[1].name)
end

return main
```
## dernier bouton dispo?
```lua
local function main()

	local der=0
	for i=1,100,1
    do
 	   if DataPool().Timecodes[i] then
			der=i
	    end
    end
    	    Printf((der+1))
end

return main
```
## est ce que le bouton existe?
```lua
return function()
  local mname = "Test"
  local handle = DataPool().Macros[mname]
  if handle then 
    Printf(mname.." exist")
  else
    Printf(mname.." doesn't exist")
  end
end
```
```lua
return function()
  if DataPool().Timecodes[1] then 
    Printf(" exist")
    end
end
```
```lua
local function main()


    local listtimecode = ObjectList("timecode 1 Thru 10")
    for i=1,100,1
    do
 	   if DataPool().Timecodes[i] then
	    Printf(listtimecode[i].index)
	    end
    end
    
end

return main
```
## Dump un objet
```lua
local function main()
    local mySeqHandle = DataPool().timecodes[1]      --Stores the handle for the selected sequence in a local variable 
    mySeqHandle:Dump()                          --Dump() is called on the variable
end

return main
```
```lua

    local mySeqHandle = DataPool().timecodes[1][2] --second trackgroup  

local function main()
    local mySeqHandle = DataPool().timecodes[6][4][5]     --tiemcode6, 4eme trackgroup, 4eme track 
    mySeqHandle:Dump()                          --Dump() is called on the variable
end

return main
```
## creer une track dans le timecode 6, Trackgroup 1
```lua

local function main()
	local timecodeHandle = ObjectList("Timecode 6")[1][4]

	timecodeHandle:Append("Track")
	
	
end

return main

```
## Assigner une sequence sur une track de timecode
```lua

local function main()
    local mySeqHandle = DataPool().timecodes[6][4][5]     --Stores the handle for the selected sequence in a local variable 
    mySeqHandle.target=DataPool().Sequences[1]
end

return main

```

## gérer les fonctions
```lua
local function test(motcle)
Printf(motcle)
end


local function main()
test("coucou")
end

return main
```
## table
```lua
function dump(tbl, indent)
    indent = indent or ""

    for k, v in pairs(tbl) do
        if type(v) == "table" then
            Printf("%s%s:", indent, tostring(k))
            dump(v, indent .. "  ")
        else
            Printf("%s%s = %s", indent, tostring(k), tostring(v))
        end
    end
end


local function main()
t={}
table.insert(t,{ ["apple"]="green", ["orange"]="orange", ["banana"]="yellow" })
table.insert(t,{ ["apple"]="vert", ["orange"]="zerzer", ["banana"]="zerzer" })

 Printf( t[1]["apple"] )--green
 dump(t)
end

return main
```

