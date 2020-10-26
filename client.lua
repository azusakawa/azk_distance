Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        local pedCoords = GetEntityCoords(GetPlayerPed(-1))

        for _, pos in ipairs(Config.Position) do
            if Vdist(pos, pedCoords) < Config.Distance then
                local Angle = GetAngleByPos(pos, GetEntityCoords(GetPlayerPed(-1)))

                DrawMarker(2, pedCoords.x, pedCoords.y, pedCoords.z + 0.8, 0.0, 0.0, 0.0, Angle, -90.0, 90.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, Config.Color.a, false, false, 2, nil, nil, false)
            end
        end
	end
end)

-- 根據兩點求夾角
function GetAngleByPos(Coords1, Coords12)
	local heading = {};
	heading.x = Coords12.x - Coords1.x;
	heading.y = Coords12.y - Coords1.y;
	local pos = math.atan2( heading.y, heading.x ) * 180 / math.pi;
	return pos  
end