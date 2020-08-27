local loaded = false

function loadTxd()
	local txd = CreateRuntimeTxd('duiTxd')
	local duiObj = CreateDui(Config.BaseURL .. '/dmc12cp_bonnet.html', 800, 800)
	_G.duiObj = duiObj
	local dui = GetDuiHandle(duiObj)
	local tx = CreateRuntimeTextureFromDuiHandle(txd, 'duiTex', dui)
	AddReplaceTexture('dmc12cp', 'bonnet', 'duiTxd', 'duiTex')

	local txd2 = CreateRuntimeTxd('duiTxd2')
	local duiObj2 = CreateDui(Config.BaseURL .. '/dmc12cp_white.html', 1024, 1024)
	_G.duiObj2 = duiObj2
	local dui2 = GetDuiHandle(duiObj2)
	local tx2 = CreateRuntimeTextureFromDuiHandle(txd2, 'duiTex2', dui2)
	AddReplaceTexture('dmc12cp', 'gunlights', 'duiTxd2', 'duiTex2')

	local txd3 = CreateRuntimeTxd('duiTxd3')
	local duiObj3 = CreateDui(Config.BaseURL .. '/hud/', 1920, 1080)
	_G.duiObj3 = duiObj3
	local dui3 = GetDuiHandle(duiObj3)
	local tx3 = CreateRuntimeTextureFromDuiHandle(txd3, 'duiTex3', dui3)
	AddReplaceTexture('dmc12cp', 'front_window', 'duiTxd3', 'duiTex3')
end

Citizen.CreateThread(function()
	while loaded == false do
		Wait(0)
		local playerCar = GetVehiclePedIsIn(GetPlayerPed(-1))
		if playerCar ~= 0 then
			if GetEntityModel(playerCar) == GetHashKey('dmc12cp') then
				loadTxd()
				loaded = true
			end
		end
		if not loaded then
			local veh = nil
			for veh in EnumerateVehicles() do
				if GetEntityModel(playerCar) == GetHashKey('dmc12cp') then
					loadTxd()
					loaded = true
					break
				end
			end
		end
	end
end)