package com.inventory.app.test;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsonTest {

	@SuppressWarnings("unchecked")
	public static void main(String[] args) throws ParseException, IOException {
		// JSON생성시 언제나 내부부터 채워나가기
		// JSONObject 3개에 각각 데이터 저장
		JSONObject data1 = new JSONObject();
		data1.put("count", 2);
		data1.put("need", 5);
		JSONObject item1 = new JSONObject();
		item1.put(1, data1);

		JSONObject data2 = new JSONObject();
		data2.put("count", 3);
		data2.put("need", 10);
		JSONObject item2 = new JSONObject();
		item2.put(2, data1);

		JSONObject data3 = new JSONObject();
		data3.put("count", 7);
		data3.put("need", 20);
		JSONObject item3 = new JSONObject();
		item3.put(3, data1);

		// 위에서 만든 3개의 오브젝트 데이터를 JSONArray에 순서대로 저장
		JSONArray arr = new JSONArray();
		arr.add(item1);// 0번인덱스
		arr.add(item2);// 1번인덱스
		arr.add(item3);// 2번인덱스

		// 최종적으로 univ오브젝트에 JSON배열 저장
		JSONObject univ = new JSONObject();
		univ.put("1", arr);

		FileWriter writer = new FileWriter("src/main/resources/json/mydata.json");
		writer.write(univ.toJSONString());
		writer.flush();
		writer.close();
//		System.out.println(univ.toJSONString());

		// 테스트용 출력

		JSONParser parser = new JSONParser();
		Object obj = parser.parse(new FileReader("src/main/resources/json/mydata.json"));
		JSONObject univ2 = (JSONObject) obj;

		// 테스트출력
		// System.out.println(univ.toJSONString());

		JSONArray arr2 = (JSONArray) univ2.get("1");

		// 테스트출력
		// System.out.println(arr.toJSONString());
		int size = arr2.size();
		for (int i = 0; i < size; i++) {
			JSONObject tmp = (JSONObject) arr2.get(i);// 인덱스 번호로 접근해서 가져온다.
			JSONObject item = (JSONObject) tmp.get(String.valueOf(i + 1));

			int professor = Integer.parseInt(item.get("count").toString());
			int student = Integer.parseInt(item.get("need").toString());

			System.out.println("----- " + i + "번째 인덱스 값 -----");
			System.out.println("count : " + professor);
			System.out.println("need : " + student);
		}

	}

}
