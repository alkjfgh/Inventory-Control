package com.inventory.app.security;

import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Service;

@Service
public class SecurityUse {
	public String security(String data) {
		String rtnData = null;
		try {
			rtnData = new Security().security(data).toString();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return rtnData;
	}

	public String recorvery(String data) {
		String rtnData = new Recorvery().recorvery(data).toString();
		return rtnData;
	}
}
