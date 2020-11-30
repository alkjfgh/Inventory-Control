package com.inventory.controller;

import java.io.IOException;
import java.util.Iterator;
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
import com.inventory.app.domain.ItemInfoVO;
import com.inventory.app.domain.ItemVO;
import com.inventory.app.domain.ShopVO;
import com.inventory.app.domain.StockVO;
import com.inventory.app.domain.UserVO;
import com.inventory.app.json.ShopJson;
import com.inventory.app.service.CategoryService;
import com.inventory.app.service.ItemInfoService;
import com.inventory.app.service.ItemService;
import com.inventory.app.service.ShopService;
import com.inventory.app.service.StockService;
import com.inventory.app.service.UserService;

@Controller
public class ShopController {

	@Autowired
	private ShopService shopService;

	@Autowired
	private ItemService itemService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private StockService stockService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ItemInfoService itemInfoService;

	@RequestMapping(value = "ShopInfo.do")
	public String shopInfo(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");
		ShopVO shop = new ShopVO();
		shop.setShopSeq(user.getShopSeq());
		shop = shopService.select(shop);
		session.setAttribute("shop", shop);
		StockVO stock = new StockVO();
		stock.setShopSeq(user.getShopSeq());
		Iterator<CategoryVO> categoryIt = categoryService.selectList(null).iterator();
		while(categoryIt.hasNext()) {
			CategoryVO category = categoryIt.next();
			int categorySize = itemInfoService.categoryCount(category);
			System.out.println(categorySize);
		}
		List<ItemInfoVO> itemInfoList = itemInfoService.selectList(null);
		System.out.println(itemInfoList);

		return "shopInfo";
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
		@SuppressWarnings({ "unchecked", "unused" })
		List<CategoryVO> categoryList = (List<CategoryVO>) session.getAttribute("categoryList");
//		db에 결산 데이터 적용해야함
		return "shopInfo";
	}

	@RequestMapping(value = "updateShop.do", method = RequestMethod.POST)
	public String updateShop(HttpServletRequest request, HttpSession session) {
//		List<CategoryVO> categoryList = (List<CategoryVO>) session.getAttribute("categoryList");
//		int size = categoryList.size();
//		int length =0;
//		for(int i =0;i<size;i++)
//			length += categoryList.get(i).getSize();
//		for(int i=1;i<=length;i++) {
//			System.out.println(request.getParameter("need."+i));
//		}
		return "shopInfo";
	}

	@RequestMapping(value = "graph.do")
	public String graph(HttpServletRequest request, HttpSession session) {
		List<CategoryVO> categoryList = (List<CategoryVO>) session.getAttribute("categoryList");

		return "graph";
	}

	@RequestMapping(value = "insertShop.do")
	public String insertShop(ShopVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		user = userService.select(user);
		session.setAttribute("user", user);
		vo.setShopSeq(user.getShopSeq());
		shopService.insert(vo);
		return "redirect:ShopInfo.do";
	}
}
