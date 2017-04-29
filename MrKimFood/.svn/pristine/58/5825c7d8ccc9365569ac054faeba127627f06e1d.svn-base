package com.mrkimfood.gonggam.util;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

public class UseJson {

	public UseJson() {

	}
	
	public static List<String> jsonToMapKeys(String json) {
		Gson gson = new Gson();
		Type mapType = new TypeToken<Map<String, Object>>(){}.getType();
		Map<String, Object> getTestMap = gson.fromJson(json, mapType);
		List<String> keys = new ArrayList<String>();
		
		for (String key : getTestMap.keySet()) {
    		System.out.println("key = " + key + ", map.get = " + getTestMap.get(key));
    		keys.add(key);
		}
		
		return keys;
		
	}
	
	public static String mapDataToJson(String json, String key) {
		JsonElement root = new JsonParser().parse(json);
    	JsonElement value = root.getAsJsonObject().get(key);
    	String jsonData = value.toString();
    	return jsonData;
	}
	
	public static String JSONObjectToJsonp(JSONObject js, String callback) {
		StringBuffer buffer = new StringBuffer(callback);
		buffer.append("(");
		buffer.append(js.toString());
		buffer.append(")");
		
		return buffer.toString();
	}
	
}
