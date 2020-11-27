package com.inventory.app.json;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.inventory.app.domain.ItemVO;
import com.inventory.app.domain.ShopVO;

public class ShopJson {

	private long shopSeq;

	public ShopJson(ShopVO shop) {
		shopSeq = shop.getShopSeq();
	}

	@SuppressWarnings("unchecked")
	public void add(ItemVO item, int need) throws IOException, ParseException {
//		System.out.println(new File(".").getAbsolutePath());
		String path = "../../spring2/Inventory-Control/src/main/resources/json/shop-" + shopSeq + ".json";

//		json 읽기
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(new FileReader(path));
		JSONArray arr = (JSONArray) obj;

//		데이터 작성
		JSONObject itemData = new JSONObject();
		itemData.put("need", need);
		itemData.put("count", 0);
		itemData.put("seq", item.getItemSeq());

//		데이터 체크
		int size = arr.size();
		for (int i = 0; i < size; i++) {
			JSONObject json = (JSONObject) arr.get(i);
			System.out.println("=============");
			System.out.println(json.get("seq"));
			System.out.println("=============");
			if (((Long) json.get("seq")).equals((Long) shopSeq)) {
//				데이터가 있으면 삭제
				arr.remove(json);
				break;
			}
		}

//		데이터 입력
		arr.add(itemData);

//		json 입력
		FileWriter writer = new FileWriter(path);
		writer.write(arr.toJSONString());
		writer.flush();
		writer.close();
	}
}
