package com.inventory.app.security;

import java.io.FileReader;
import java.io.IOException;

public class Recorvery {

	public StringBuffer recorvery(String data) {
		int n = data.charAt(data.length() - 1) - 48;
		StringBuffer result = new StringBuffer(data.substring(0, data.length() - 1));
		while (n-- > 0) {
			int key = result.charAt(result.length() - 1) % 7;
			System.out.println(result);
			if (key == 1)
				result = new StringBuffer(recorvery1(result.toString()));
			else if (key == 2)
				result = new StringBuffer(recorvery2(result.toString()));
			else if (key == 3)
				result = new StringBuffer(recorvery3(result.toString()));
			else if (key == 4)
				result = new StringBuffer(recorvery4(result.toString()));
			else if (key == 5)
				result = new StringBuffer(recorvery5(result.toString()));
		}
		return result;
	}

	private StringBuffer recorvery1(String data) {
		int size = data.length();
		StringBuffer recoveryData = new StringBuffer(size / 2 + 1);
		for (int i = 0; i < size - 1; i += 2)
			recoveryData.insert(0, data.charAt(i));
		return recoveryData;
	}

	private StringBuffer recorvery2(String data) {
		int size = data.length();
		StringBuffer recoveryData = new StringBuffer(size - 1);
		for (int i = size - 3; i >= 0; i -= 2)
			recoveryData.append(data.charAt(i));
		for (int i = size - 2; i >= 0; i -= 2)
			recoveryData.append(data.charAt(i));
		return recoveryData;
	}

	private StringBuffer recorvery3(String data) {
		FileReader fr = null;
		char[] key = new char[94];
		try {
			fr = new FileReader("key.txt");
			fr.read(key);
			fr.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		int size = data.length();
		StringBuffer recoveryData = new StringBuffer(size - 1);
		for (int i = 0; i < size - 1; i++)
			recoveryData.append(key[data.charAt(i) - 30]);
		return recoveryData;
	}

	private StringBuffer recorvery4(String data) {
		int size = data.length();
		StringBuffer recoveryData = new StringBuffer(size - 1);
		byte[] ByteArray = hexToByte(data);
		for (int i = 0; i < size / 2; i++)
			recoveryData.append((char) ByteArray[i]);
		return recoveryData;
	}

	private StringBuffer recorvery5(String data) {
		int size = data.length();
		StringBuffer recoveryData = new StringBuffer(size - 1);
		for (int i = 0; i < size - 1; i++)
			recoveryData.append((char) (data.charAt(i) - 5));
		return recoveryData;
	}

	public static byte[] hexToByte(String str) {
		int len = str.length() - 1;
		byte[] data = new byte[len / 2];
		for (int i = 0; i < len; i += 2)
			data[i / 2] = (byte) ((Character.digit(str.charAt(i), 16) << 4) + Character.digit(str.charAt(i + 1), 16));
		return data;
	}

}
