package com.inventory.app.security;

import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Service;

@Service
public class SecurityUse {
	
	public static void main(String[] args) {
		String rtn = security("asd123!@#");
		System.out.println("asd123!@#");
		System.out.println(rtn);
		System.out.println(recorvery(rtn));
	}
	
	public static String security(String data) {
		String rtnData = null;
		try {
			rtnData = new Security().security(data).toString();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return rtnData;
	}

	public static String recorvery(String data) {
		String rtnData = new Recorvery().recorvery(data).toString();
		return rtnData;
	}
}
