package com.inventory.app.security;

import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.util.Random;

public class Security {

	public StringBuffer security(String data) throws UnsupportedEncodingException {
		int k;
		int n = k = 3;
		StringBuffer result = new StringBuffer(data);
		while (n-- > 0) {
			int rd = new Random().nextInt(4) + 1;
			if (rd == 1)
				result = security1(result.toString());
			else if (rd == 2)
				result = security2(result.toString());
			else if (rd == 3)
				result = security1(result.toString());
			else if (rd == 4)
				result = security4(result.toString());
			else if (rd == 5)
				result = security5(result.toString());
		}
		return result.append(k);
	}

	public static StringBuffer security1(String data) {
		int size = data.length();
		StringBuffer seStr = new StringBuffer(size * 2);
		Random rd = new Random();
		for (int i = 0; i < size; i++) {
			seStr.append(data.charAt(size - 1 - i));
			int num = 0;
			num = rd.nextInt(75) + 48;
			seStr.append((char) num);
		}
		seStr.append(makeKey(1));
		return seStr;
	}

	public static StringBuffer security2(String data) {
		int size = data.length();
		String[] splitData = { data.substring(0, size / 2), data.substring(size / 2, size) };
		StringBuffer seStr = new StringBuffer(size);
		size /= 2;
		for (int i = 0; i < size; i++) {
			seStr.append(splitData[1].charAt(i));
			seStr.append(splitData[0].charAt(i));
		}
		if (splitData[1].length() > size) {
			seStr.append(splitData[1].charAt(splitData[1].length() - 1));
		}
		seStr = seStr.reverse();
		seStr.append(makeKey(2));
		return seStr;
	}

	public static StringBuffer security3(String data) {
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
		StringBuffer seStr = new StringBuffer(size);
		for (int i = 0; i < size; i++) {
			char c = data.charAt(i);
			for (int j = 0; j < 94; j++)
				if (key[j] == c)
					seStr.append((char) (j + 30));
		}
		seStr.append(makeKey(3));
		return seStr;
	}

	private StringBuffer security4(String data) throws UnsupportedEncodingException {
		int size = data.length();
		StringBuffer seStr = new StringBuffer(size);
		seStr.append(toHex(data, size));
		seStr.append(makeKey(4));
		return seStr;
	}

	private StringBuffer security5(String data) {
		int size = data.length();
		StringBuffer seStr = new StringBuffer(size);
		for (int i = 0; i < size; i++)
			seStr.append((char) (data.charAt(i) + 5));
		seStr.append(makeKey(5));
		return seStr;
	}

	public String toHex(String data, int size) throws UnsupportedEncodingException {
		return String.format("%0" + size + "x", new BigInteger(1, data.getBytes("UTF-8")));
	}

	public static char makeKey(int n) {
		int key = 0;
		Random rd = new Random();
		if (n == 4)
			while (!(key > 47 && key < 58))
				key = rd.nextInt(17) * 7 + n;
		else
			while (!(key > 47 && key < 58) && !(key > 64 && key < 91) && !(key > 96 && key < 123))
				key = rd.nextInt(17) * 7 + n;
		return (char) key;
	}
}
