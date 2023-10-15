UKO = {}

function UKO.random(pctChanceInteger)
	local input = 0.0 + pctChanceInteger
	--print ("UKO: Random For "..tostring(input))
	local rand = 1.0 + ZombRand(100) + (ZombRand(1000) / 1000)
	--print("UKO: Rolled "..tostring(rand))
	return rand <= input
end

function UKO.randomDecimal(max)
	local input = 0.0 + max
	--print ("UKO: Random Decimal For "..tostring(input))
	local rand = ZombRand(max) + (ZombRand(1000) / 1000)
	--print ("UKO: Rolled "..tostring(rand))
	return rand
end