package com.inventory.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inventory.app.domain.CategoryVO;
import com.inventory.app.domain.ItemTestVO;
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
	public String shopInfo(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");
		ShopVO vo = new ShopVO();
		vo.setShopSeq(user.getShopSeq());
		vo = shopService.select(vo);
		if (vo != null) {
			session.setAttribute("shop", vo);
			
//			나중에 지울것
			ItemTestVO item1 = new ItemTestVO(1, "우유", 1000, 5, 3);
			ItemTestVO item2 = new ItemTestVO(2, "초코우유", 1000, 5, 3);
			ItemTestVO item3 = new ItemTestVO(3, "커피우유", 1000, 5, 3);
			CategoryVO category = new CategoryVO();
			category.setSize(3);
			category.setName("우유");
			List<ItemTestVO> list = new ArrayList<ItemTestVO>();
			list.add(item1);
			list.add(item2);
			list.add(item3);
			category.setItemList(list);
			List<CategoryVO> categoryList = new ArrayList<CategoryVO>();
			categoryList.add(category);
			session.setAttribute("categoryList", categoryList);
			
			
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
				e.printStackTrace();
			}
		}
		return "shopItems";
	}
	
	@RequestMapping(value = "check.do")
	public String check(HttpSession session) {
		@SuppressWarnings("unchecked")
		List<CategoryVO> categoryList = (List<CategoryVO>) session.getAttribute("categoryList");
//		db에 결산 데이터 적용해야함
		return "shopInfo";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "updateShop.do", method = RequestMethod.POST)
	public String updateShop(HttpServletRequest request, HttpSession session) {
		List<CategoryVO> categoryList = (List<CategoryVO>) session.getAttribute("categoryList");
		int size = categoryList.size();
		int length =0;
		for(int i =0;i<size;i++)
			length += categoryList.get(i).getSize();
		for(int i=1;i<=length;i++) {
			System.out.println(request.getParameter("need."+i));
		}
		return "shopInfo";
	}
	

	@RequestMapping(value = "graph.do")
	public String graph(HttpServletRequest request, HttpSession session) {
		List<CategoryVO> categoryList = (List<CategoryVO>) session.getAttribute("categoryList");
		
		return "graph";
	}
}
