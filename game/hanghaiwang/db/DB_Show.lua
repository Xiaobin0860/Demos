-- Filename: DB_Show.lua
-- Author: auto-created by XmlToScript tool.
-- Function: it`s auto-created by XmlToScript tool.

module("DB_Show", package.seeall)

keys = {
	"id", "item_array", 
}

Show = {
	id_1 = {1, "10126,10138,10139,10140,10143,10144,10145,10147,10148,10149,10150,10152,10153,10154,10155,10156,10157,10160,10161,10163,10165,10166,10168,10170,10172,10174,10175", },
	id_2 = {2, "10049,10050,10051,10087,10088,10090,10091,10093,10094,10095,10096,10097,10098,10099,10100,10102,10103,10105,10106,10107,10108,10109,10110,10111,10112,10113,10114,10116,10117,10118,10119,10120,10121,10122,10123,10124,10125,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10146,10151,10173,10176,10178,10179", },
	id_3 = {3, "10014,10015,10016,10018,10020,10021,10022,10029,10031,10032,10033,10037,10038,10039,10040,10042,10043,10060,10061,10062,10063,10064,10065,10066,10072,10073,10074,10075,10076,10077,10085,10086,10089,10092,10101,10104,10115", },
	id_4 = {4, "10017,10019,10023,10024,10025,10026,10027,10030,10034,10035,10041,10052,50014,50015,50016,50018,50020,50022,50029,50031,50038,50042,50043,50060,50061,50063,50064,50072,50073,50076,50085,50086,50101", },
	id_101 = {101, "101212,101222,101312,101322,101412,101422,101432,101512,101522,101532,101391", },
	id_102 = {102, "102212,102222,102312,102322,102412,102422,102432,102512,102522,102532", },
	id_103 = {103, "103212,103222,103312,103322,103412,103422,103432,103512,103522,103532", },
	id_104 = {104, "104212,104222,104312,104322,104412,104422,104432,104512,104522,104532", },
	id_201 = {201, "501301,501401,501402,501501,501502,501503,501504", },
	id_202 = {202, "502301,502401,502402,502501,502502,502503,502504", },
	id_203 = {203, "503301,503401,503402,503501,503502,503503,503504", },
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
	local id_data = Show["id_" .. key_id]
	assert(id_data, "Show not found " ..  key_id)
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
	for k, v in pairs(Show) do
		if v[fieldNo] == fieldValue then
			setmetatable (v, mt)
			arrData[#arrData+1] = v
		end
	end

	return arrData
end

function release()
	_G["DB_Show"] = nil
	package.loaded["DB_Show"] = nil
	package.loaded["db/DB_Show"] = nil
end
