package com.inventory.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inventory.app.domain.CategoryVO;

@Controller
public class ViewController {
	@RequestMapping(value = "shopInfo.do", method = RequestMethod.GET)
	public String shopInfoView() {
		return "shopInfo";
	}
	
	@RequestMapping(value = "check.do", method = RequestMethod.GET)
	public String checkView() {
		return "check";
	}
}
