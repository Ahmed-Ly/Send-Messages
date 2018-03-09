local messages =  { }
local sx, sy = guiGetScreenSize ( )
function outputmsgs (text,r,g,b)
table.insert ( messages, {text, true, getTickCount ( ) + 5000,tonumber(r),tonumber(g),tonumber(b),180} )
return "Done" 
end 


function outputmsg (text,r,g,b)
table.insert ( messages, {text, true, getTickCount ( ) + 5000,r,g,b,180} )
end 

addCommandHandler("send",function(cmd,arg)

outputmsg(""..arg.."",255,0,0)

 end 
)


addEventHandler ( "onClientRender", root, function () 
	local tick = getTickCount ( )


	
	if ( #messages > 7 ) then
		table.remove ( messages, 1 )
	end
	
	for index, data in ipairs ( messages ) do
		local v1 = data[1]
		local v2 = data[2]
		local v3 = data[3]
		local v4 = data[4]
		local v5 = data[5]
		local v6 = data[6]
		local v7 = data[7]

		dxDrawRectangle ( sx - 220, (sy-20)-(index*25), 200, 20, tocolor ( v4, v5, v6, v7 ) )
		
		if ( v2 ) then
			dxDrawText ( ""..v1.."", sx - 200, (sy-18)-(index*25), 50, 20, tocolor ( 0, 255, 0, v7+75 ), 1, 'default-bold')
		if ( tick >= v3 ) then
			messages[index][7] = v7-2
			if ( v7 <= 25 ) then
				table.remove ( messages, index )
			end
		end
	 end
  end 
end 
)
