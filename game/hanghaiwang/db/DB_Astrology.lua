-- Filename: DB_Astrology.lua
-- Author: auto-created by XmlToScript tool.
-- Function: it`s auto-created by XmlToScript tool.

module("DB_Astrology", package.seeall)

keys = {
	"id", "limited_lv", "star_arr", "reward_arr", "star_max", "target_reward_stars", "randReward1", "randReward2", "randReward3", "randReward4", "randReward5", "randReward6", "randReward7", "randReward8", "randReward9", "randReward10", 
}

Astrology = {
	id_1 = {1, 1, "15,30,40,50,70,80,90,100,115,130", "0|5000,1|10,3|104201,0|10000,1|20,3|440001,0|20000,3|1043014,1|30,3|1044015", 136, "4|20,4|30,4|35,4|40", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, },
	id_2 = {2, 35, "15,30,40,50,65,80,90,100,115,130", "0|5000,1|10,3|104201,0|10000,1|20,3|440001,0|20000,3|1043014,1|30,3|1044015", 136, "4|20,4|30,4|35,4|40", "0|5000|10000,0|10000|15000,0|15000|15000,0|20000|10000,3|440023|10000,3|101201|250,3|102201|250,3|103201|250,3|104201|250,3|101202|250,3|102202|250,3|103202|250,3|104202|250", "1|10|5000,1|12|3000,1|14|2000", "0|10000|50000,0|15000|50000,0|20000|150000,0|25000|100000,0|30000|50000,0|35000|50000,3|1013014|4000,3|1013024|3500,3|1023014|4000,3|1023024|3500,3|1033014|4000,3|1033024|3500,3|1043014|8000,3|1043024|8000,3|410037|3000,3|410038|3000,3|410039|3000,3|410040|3000,3|410041|3000,3|410042|3000,3|410043|3000,3|410049|3000,3|410050|3000,3|410051|3000,3|410052|3000,3|410060|3000,3|410061|3000,3|410062|3000,3|410063|3000,3|410064|3000,3|410065|3000,3|410066|3000,3|410072|3000,3|410073|3000,3|410074|3000,3|410075|3000,3|410076|3000,3|410077|3000,3|410078|3000,3|410085|3000,3|410086|3000,3|410096|3000,3|410088|3000,3|410089|3000,3|410090|3000,3|410091|3000,3|410092|3000,3|410101|3000,3|410104|3000,3|410112|3000,3|410113|3000,3|410115|3000,3|410116|3000,3|410118|3000,3|410135|3000", "0|10000|50000,0|15000|50000,0|20000|150000,0|25000|100000,0|30000|50000,0|35000|50000,3|1013014|4000,3|1013024|3500,3|1023014|4000,3|1023024|3500,3|1023034|3000,3|1033014|4000,3|1033024|3500,3|1043014|8000,3|1043024|8000,3|410037|3000,3|410038|3000,3|410039|3000,3|410040|3000,3|410041|3000,3|410042|3000,3|410043|3000,3|410049|3000,3|410050|3000,3|410051|3000,3|410052|3000,3|410060|3000,3|410061|3000,3|410062|3000,3|410063|3000,3|410064|3000,3|410065|3000,3|410066|3000,3|410072|3000,3|410073|3000,3|410074|3000,3|410075|3000,3|410076|3000,3|410077|3000,3|410078|3000,3|410085|3000,3|410086|3000,3|410096|3000,3|410088|3000,3|410089|3000,3|410090|3000,3|410091|3000,3|410092|3000,3|410101|3000,3|410104|3000,3|410112|3000,3|410113|3000,3|410115|3000,3|410116|3000,3|410118|3000,3|410135|3000", "1|20|5000,1|22|300,1|25|2000", "3|440001|50000,0|20000|50000,0|25000|50000,0|30000|100000,0|40000|50000,0|50000|50000,3|60006|50000,3|410015|2000,3|410016|2000,3|410017|2000,3|410018|2000,3|410021|2000,3|410022|2000,3|410023|2000,3|410024|2000,3|410027|2000,3|410029|2000,3|410030|2000,3|410033|2000,3|410034|2000,3|410035|2000,3|410036|2000,3|410037|3000,3|410038|3000,3|410039|3000,3|410040|3000,3|410041|3000,3|410042|3000,3|410043|3000,3|410049|3000,3|410050|3000,3|410051|3000,3|410052|3000,3|410060|3000,3|410061|3000,3|410062|3000,3|410063|3000,3|410064|3000,3|410065|3000,3|410066|3000,3|410072|3000,3|410073|3000,3|410074|3000,3|410075|3000,3|410076|3000,3|410077|3000,3|410078|3000,3|410085|3000,3|410086|3000,3|410096|3000,3|410088|3000,3|410089|3000,3|410090|3000,3|410091|3000,3|410092|3000,3|410101|3000,3|410104|3000,3|410112|3000,3|410113|3000,3|410115|3000,3|410116|3000,3|410118|3000,3|410135|3000", "1|30|5000,1|35|3000,1|50|1000,1|100|800,1|200|200", "3|440001|50000,0|20000|50000,0|25000|50000,0|30000|100000,0|40000|50000,0|50000|50000,3|60006|50000,3|410015|2000,3|410016|2000,3|410017|2000,3|410018|2000,3|410021|2000,3|410022|2000,3|410023|2000,3|410024|2000,3|410027|2000,3|410029|2000,3|410030|2000,3|410033|2000,3|410034|2000,3|410035|2000,3|410036|2000,3|410037|3000,3|410038|3000,3|410039|3000,3|410040|3000,3|410041|3000,3|410042|3000,3|410043|3000,3|410049|3000,3|410050|3000,3|410051|3000,3|410052|3000,3|410060|3000,3|410061|3000,3|410062|3000,3|410063|3000,3|410064|3000,3|410065|3000,3|410066|3000,3|410072|3000,3|410073|3000,3|410074|3000,3|410075|3000,3|410076|3000,3|410077|3000,3|410078|3000,3|410085|3000,3|410086|3000,3|410096|3000,3|410088|3000,3|410089|3000,3|410090|3000,3|410091|3000,3|410092|3000,3|410101|3000,3|410104|3000,3|410112|3000,3|410113|3000,3|410115|3000,3|410116|3000,3|410118|3000,3|410135|3000", "0|50000|30000,0|60000|30000,0|70000|30000,0|80000|30000,0|90000|30000,0|100000|20000,0|200000|20000,0|500000|10000,3|1014015|40000,3|1014025|12000,3|1014035|12000,3|1024015|12000,3|1024025|12000,3|1024035|12000,3|1034015|12000,3|1034025|12000,3|1034035|12000,3|410015|12000,3|410016|25000,3|410017|25000,3|410018|25000,3|410021|25000,3|410022|25000,3|410023|25000,3|410024|25000,3|410027|25000,3|410029|25000,3|410030|25000,3|410033|25000,3|410034|25000,3|410035|25000,3|410036|25000", "3|1044015|10000,3|1044025|5000,3|1044035|2500", },
}

local mt = {}
mt.__index = function (table, key)
	for i = 1, #keys do
		if (keys[i] == key) then
			return table[i]
		end
	end
end

function getDataById(key_id)
	local id_data = Astrology["id_" .. key_id]
	assert(id_data, "Astrology not found " ..  key_id)
	if id_data == nil then
		return nil
	end
	if getmetatable(id_data) ~= nil then
		return id_data
	end
	setmetatable(id_data, mt)

	return id_data
end

function getArrDataByField(fieldName, fieldValue)
	local arrData = {}
	local fieldNo = 1
	for i=1, #keys do
		if keys[i] == fieldName then
			fieldNo = i
			break
		end
	end
	for k, v in pairs(Astrology) do
		if v[fieldNo] == fieldValue then
			setmetatable (v, mt)
			arrData[#arrData+1] = v
		end
	end

	return arrData
end

function release()
	_G["DB_Astrology"] = nil
	package.loaded["DB_Astrology"] = nil
	package.loaded["db/DB_Astrology"] = nil
end
