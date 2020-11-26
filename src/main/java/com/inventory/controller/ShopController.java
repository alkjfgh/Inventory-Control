package com.inventory.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.inventory.app.domain.ShopVO;
import com.inventory.app.domain.UserVO;
import com.inventory.app.service.ShopService;

@Controller
public class ShopController {

	@Autowired
	private ShopService service;

	@RequestMapping(value = "ShopInfo.do")
	public String shopInfo(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		ShopVO vo = new ShopVO();
		vo.setShopSeq(user.getShopSeq());
		vo = service.select(vo);
		if (vo != null) {
			session.setAttribute("shop", vo);
			return "shopInfo";
		} else {
			return "insertShop";
		}
	}
}
