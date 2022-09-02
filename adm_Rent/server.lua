local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","admTabaco")
vRPTabako = Tunnel.getInterface("admTabaco","admTabaco")

vRPrent = {}
Tunnel.bindInterface("admTabaco",vRPrent)
Proxy.addInterface("admTabaco",vRPrent)

local faggio = 100
local dacia = 500
local bmw = 96600
RegisterServerEvent('adm:spawnFaggio')
AddEventHandler('adm:spawnFaggio',function(theVehicle)
    local _src = source
    local user_id = vRP.getUserId({_src})
    local plata = vRP.tryFullPayment({user_id,faggio})
            if not plata then return vRPclient.notify(_src,{'Nu ai destui bani pentru a inchiria o masina !'}) end
            local spawn = TriggerClientEvent('adam:remtFaggio',_src,theVehicle)
                if spawn then return vRPclient.notify(_src,{'Succes:Ai inchiriat un bmw cu succes '}) end
end)

RegisterServerEvent('adm:spawnDacia')
AddEventHandler('adm:spawnDacia',function(theVehicle)
    local _src = source
    local user_id = vRP.getUserId({_src})
    local plata = vRP.tryFullPayment({user_id,dacia})
            if not plata then return vRPclient.notify(_src,{'Nu ai destui bani pentru a inchiria o masina !'}) end
            local spawn = TriggerClientEvent('adam:rentdacia',_src,theVehicle)
                if spawn then return vRPclient.notify(_src,{'Succes:Ai inchiriat un bmw cu succes '}) end
end)


RegisterServerEvent('adm:spawnBMW')
AddEventHandler('adm:spawnBMW',function(theVehicle)
local _src = source
local user_id = vRP.getUserId({_src})
local plata = vRP.tryFullPayment({user_id,bmw})
		if not plata then return vRPclient.notify(_src,{'Nu ai destui bani pentru a inchiria o masina !'}) end
        local spawn = TriggerClientEvent('adam:rentbmw',_src,theVehicle)
			if spawn then return vRPclient.notify(_src,{'Succes:Ai inchiriat un bmw cu succes '}) end
end)
