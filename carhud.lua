function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

Citizen.CreateThread(function()
	while true do
	
		Citizen.Wait(1)
		local get_ped = GetPlayerPed(-1) -- current ped
		local get_ped_veh = GetVehiclePedIsIn(GetPlayerPed(-1),false) -- Current Vehicle ped is in
		local veh_stop = IsVehicleStopped(get_ped_veh) -- Parked or not

		if(IsPedInAnyVehicle(GetPlayerPed(-1), false))then
			local kmh = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
			drawRct(0.2, 0.945, 0.05,0.038,0,0,0,150) 	-- UI:panel kmh	
			drawRct(0.186, 0.945, 0.0122, 0.038, 0,0,0,150)        -- UI: 1
			drawTxt(0.702, 1.44, 1.0,1.0,0.6 , "~w~" .. math.ceil(kmh), 255, 255, 255, 255)  -- INT: kmh
			drawTxt(0.717, 1.44, 1.0,1.0,0.6, "~w~ km/h", 255, 255, 255, 255)	-- TXT: kmh	
			if veh_stop then
				drawTxt(0.688, 1.44, 1.0,1.0,0.6, "~r~P", 255, 255, 255, 200)
			else
				drawTxt(0.688, 1.44, 1.0,1.0,0.6, "P", 255, 255, 255, 150)
			end
		end		
	end
end)
