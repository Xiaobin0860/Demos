-- Filename: DB_Guru.lua
-- Author: auto-created by XmlToScript tool.
-- Function: it`s auto-created by XmlToScript tool.

module("DB_Guru", package.seeall)

keys = {
	"id", "needlv", "attr1", "attr2", "attr3", "attr4", "attr5", "attr6", "attr7", "attr8", "attr9", "attr10", "attr11", "attr12", "attr13", "attr14", "attr15", "attr16", "attr17", "attr18", "attr19", "attr20", 
}

Guru = {
	id_1 = {1, "10|20|30|40|50|60|70|80|90|100|110|120|130|140|150|160|170|180|190|200", "2|80,3|80,4|20,5|20", "2|120,3|120,4|30,5|30", "2|160,3|160,4|40,5|40", "2|220,3|220,4|56,5|56", "2|280,3|280,4|72,5|72", "2|340,3|340,4|88,5|88", "2|400,3|400,4|104,5|104", "2|480,3|480,4|126,5|126", "2|560,3|560,4|148,5|148", "2|640,3|640,4|170,5|170", "2|720,3|720,4|192,5|192", "2|820,3|820,4|220,5|220", "2|920,3|920,4|248,5|248", "2|1020,3|1020,4|276,5|276", "2|1120,3|1120,4|304,5|304", "2|1220,3|1220,4|332,5|332", "2|1340,3|1340,4|366,5|366", "2|1460,3|1460,4|400,5|400", "2|1580,3|1580,4|434,5|434", "2|1700,3|1700,4|468,5|468", },
	id_2 = {2, "1|2|4|6|8|10|12|16|20|24|28|32|36|40|44|48|52|56|60|64", "1|810,29|100", "1|1215,29|150", "1|1620,29|200", "1|2185,29|270", "1|2750,29|340", "1|3315,29|410", "1|3880,29|480", "1|4605,29|570", "1|5330,29|660", "1|6055,29|750", "1|6780,29|840", "1|7665,29|950", "1|8550,29|1060", "1|9435,29|1170", "1|10320,29|1280", "1|11205,29|1390", "1|12250,29|1520", "1|13295,29|1650", "1|14340,29|1780", "1|15385,29|1910", },
	id_3 = {3, "2|5|8|10|12|14|16|20|24|28|32|36|40|45|50|55|60|65|70|75", "2|108,3|108,4|24,5|24", "2|162,3|162,4|36,5|36", "2|216,3|216,4|48,5|48", "2|290,3|290,4|64,5|64", "2|364,3|364,4|80,5|80", "2|438,3|438,4|96,5|96", "2|512,3|512,4|112,5|112", "2|606,3|606,4|132,5|132", "2|700,3|700,4|152,5|152", "2|794,3|794,4|172,5|172", "2|888,3|888,4|192,5|192", "2|1002,3|1002,4|216,5|216", "2|1116,3|1116,4|240,5|240", "2|1230,3|1230,4|264,5|264", "2|1344,3|1344,4|288,5|288", "2|1458,3|1458,4|312,5|312", "2|1592,3|1592,4|340,5|340", "2|1726,3|1726,4|368,5|368", "2|1860,3|1860,4|396,5|396", "2|1994,3|1994,4|424,5|424", },
	id_4 = {4, "1|2|3|4|5|6|8|10|12|14|16|18|20|22|24|26|28|30|32|34", "1|1080,30|120", "1|1620,30|180", "1|2160,30|240", "1|2916,30|324", "1|3672,30|408", "1|4428,30|492", "1|5184,30|576", "1|6156,30|684", "1|7128,30|792", "1|8100,30|900", "1|9072,30|1008", "1|10260,30|1140", "1|11448,30|1272", "1|12636,30|1404", "1|13824,30|1536", "1|15012,30|1668", "1|16416,30|1824", "1|17820,30|1980", "1|19224,30|2136", "1|20628,30|2292", },
	id_5 = {5, "60|72|84|96|108|120|128|136|144|148|152|156|160|164|168|172|176|180|184|188", "4|12,5|12,1|270", "4|18,5|18,1|405", "4|24,5|24,1|540", "4|34,5|34,1|731", "4|44,5|44,1|922", "4|54,5|54,1|1113", "4|64,5|64,1|1304", "4|78,5|78,1|1551", "4|92,5|92,1|1798", "4|106,5|106,1|2045", "4|120,5|120,1|2292", "4|138,5|138,1|2595", "4|156,5|156,1|2898", "4|174,5|174,1|3201", "4|192,5|192,1|3504", "4|210,5|210,1|3807", "4|232,5|232,1|4166", "4|254,5|254,1|4525", "4|276,5|276,1|4884", "4|298,5|298,1|5243", },
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
	local id_data = Guru["id_" .. key_id]
	assert(id_data, "Guru not found " ..  key_id)
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
	for k, v in pairs(Guru) do
		if v[fieldNo] == fieldValue then
			setmetatable (v, mt)
			arrData[#arrData+1] = v
		end
	end

	return arrData
end

function release()
	_G["DB_Guru"] = nil
	package.loaded["DB_Guru"] = nil
	package.loaded["db/DB_Guru"] = nil
end

