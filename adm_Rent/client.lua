vRPTabako = {}
Tunnel.bindInterface("admTabaco",vRPTabako)
Proxy.addInterface("admTabaco",vRPTabako)
vRP = Proxy.getInterface("vRP")
vRPrent = Tunnel.getInterface("admTabaco","admTabaco")


local SpawnFaggio = 'faggio' -- aicea se pune cod-ul de spawnat
local SpawnDacia = 'police' -- aicea se pune cod-ul de spawnat
local SpawnBMW = 'm2' -- aicea se pune cod-ul de spawnat


local takerent = vector3(-516.9857788086,-260.41275024414,35.521682739258)
local spawnlocation = vector3(-516.0912475586,-294.33581542968,35.223014831542)
CreateThread(function() while true do _GPED = PlayerPedId() _PLAYERCOORDS = GetEntityCoords(_GPED) Wait(600)end end)
RegisterNetEvent("adam:remtFaggio")
AddEventHandler("adam:remtFaggio", function(k, v, plate) RequestModel(SpawnFaggio) while not HasModelLoaded(SpawnFaggio) do Wait(1000) end
local vehicle = CreateVehicle(SpawnFaggio, spawnlocation[1],  spawnlocation[2], spawnlocation[3],true, false)Vehicle = vehicle SetVehicleOnGroundProperly(vehicle) SetEntityInvincible(vehicle, false)  SetPedIntoVehicle(_GPED,vehicle,-1) SetVehicleHasBeenOwnedByPlayer(_GPED,true) end)

RegisterNetEvent("adam:rentdacia")
AddEventHandler("adam:rentdacia", function(k, v, plate) RequestModel(SpawnDacia) while not HasModelLoaded(SpawnDacia) do Wait(1000) end
local vehicle = CreateVehicle(SpawnDacia, spawnlocation[1],  spawnlocation[2], spawnlocation[3],true, false)Vehicle = vehicle SetVehicleOnGroundProperly(vehicle) SetEntityInvincible(vehicle, false)  SetPedIntoVehicle(_GPED,vehicle,-1) SetVehicleHasBeenOwnedByPlayer(_GPED,true) end)

RegisterNetEvent("adam:rentbmw")
AddEventHandler("adam:rentbmw", function(k, v, plate) RequestModel(SpawnBMW) while not HasModelLoaded(SpawnBMW) do Wait(1000) end
local vehicle = CreateVehicle(SpawnBMW, spawnlocation[1],  spawnlocation[2], spawnlocation[3],true, false)Vehicle = vehicle SetVehicleOnGroundProperly(vehicle) SetEntityInvincible(vehicle, false)  SetPedIntoVehicle(_GPED,vehicle,-1) SetVehicleHasBeenOwnedByPlayer(_GPED,true) end)



RegisterNUICallback('spawnfaggio',function (source)
ExecuteCommand('e clipboard')
SetNuiFocus(false,false)
Wait(5000)
ExecuteCommand('e c')
TriggerServerEvent('adm:spawnFaggio')
end)


RegisterNUICallback('daciaspown',function (source)
    ExecuteCommand('e clipboard')
    SetNuiFocus(false,false)
    Wait(5000)
    ExecuteCommand('e c')
    TriggerServerEvent('adm:spawnDacia')
    end)
    

    
    
RegisterNUICallback('bmwspawn',function (source)
    ExecuteCommand('e clipboard')
    SetNuiFocus(false,false)
    Wait(5000)
    ExecuteCommand('e c')
    TriggerServerEvent('adm:spawnBMW')
    end)
    
    

local coordonate = {
    {-516.9418334961,-261.09008789062,34.518096923828,"",5.77,0x9760192E,"cs_bankman"}
}

Citizen.CreateThread(function()
    for _,v in pairs(coordonate) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1000)
      end
  
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1000)
      end
      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"amb@world_human_aa_smoke@male@idle_a","idle_c", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
      
    end
end)


Citizen.CreateThread(function()
    while true do

        Citizen.Wait(1500)
            while # (_PLAYERCOORDS - takerent) <= 2.0 do
                Citizen.Wait(1)
                SetTextFont(4)
                SetTextProportional(0)
                SetTextScale(0.6, 0.6)
                SetTextColour(255, 255, 255, 255)
                SetTextDropShadow(0, 0, 0, 0, 255)
                SetTextEdge(1, 0, 0, 0, 255)
                SetTextDropShadow()
                SetTextOutline()
                SetTextCentre(1)
                SetTextEntry("STRING")
                AddTextComponentString('~w~APASA ~r~E~w~ PENTRU A VORBI CU MIRCEA')
                DrawText(0.5, 0.87)
                if IsControlJustPressed(0,38) then 
                    SendNuiMessage(json.encode({adam = true}))
                    SetNuiFocus(true, true)
                end
            end
        end
end)