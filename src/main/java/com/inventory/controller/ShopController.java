package com.inventory.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.inventory.app.domain.ItemVO;
import com.inventory.app.domain.ShopVO;
import com.inventory.app.domain.UserVO;
import com.inventory.app.json.ShopJson;
import com.inventory.app.service.ItemService;
import com.inventory.app.service.ShopService;

@Controller
public class ShopController {

	@Autowired
	private ShopService shopService;

	@Autowired
	private ItemService itemService;

	@RequestMapping(value = "ShopInfo.do")
	public String shopInfo(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		ShopVO vo = new ShopVO();
		vo.setShopSeq(user.getShopSeq());
		vo = shopService.select(vo);
		if (vo != null) {
			session.setAttribute("shop", vo);
			return "shopInfo";
		} else {
			return "insertShop";
		}
	}

	@RequestMapping(value = "setShopItems.do")
	public String downInfo(ItemVO item, HttpServletRequest request, HttpSession session) {
		ShopVO shop = (ShopVO) session.getAttribute("shop");
		item = itemService.select(item);
		int need = Integer.parseInt(request.getParameter("need"));
		if (item != null) {
			ShopJson sj = new ShopJson(shop);
			try {
				sj.add(item, need);
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "shopItems";
	}
}
