package com.inventory.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inventory.app.domain.CategoryItemVO;
import com.inventory.app.domain.CategoryVO;
import com.inventory.app.domain.ItemInfoVO;
import com.inventory.app.domain.ItemListVO;
import com.inventory.app.domain.ItemVO;
import com.inventory.app.domain.ShopVO;
import com.inventory.app.domain.StockVO;
import com.inventory.app.domain.UserVO;
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
		StockVO stock = new StockVO();
		stock.setShopSeq(user.getShopSeq());
		Iterator<CategoryVO> categoryIt = categoryService.selectList(null).iterator();
		List<ItemListVO> categoryList = new ArrayList<ItemListVO>();
		long shopCount = shop.getShopCount();
//		지난 날짜를 임시로 3으로 정함
		shopCount = 3;
		while (categoryIt.hasNext()) {
			CategoryVO category = categoryIt.next();
			List<ItemInfoVO> itemInfoList = itemInfoService.selectList(category);
			for (ItemInfoVO itemInfo : itemInfoList) {
				long total = itemInfo.getTotal();
				double sold = itemInfo.getSold();
				double targetSold = total * shopCount;
				double percent = Math.floor(sold * 100.0 / targetSold) / 100 + 0.05;
				long autoSup = (long) Math.floor(total * percent) + 1;
				itemInfo.setAutoSup(autoSup);
			}
			categoryList.add(new ItemListVO(category, itemInfoService.categoryCount(category), itemInfoList));
		}

		session.setAttribute("categoryList", categoryList);
		session.setAttribute("shop", shop);
		return "shopInfo";
	}

	@RequestMapping(value = "updateItem.do")
	public String updateItemView(HttpSession session) {
		int categorySize = categoryService.selectCnt();
		List<CategoryItemVO> categoryItemList = new ArrayList<CategoryItemVO>();
		for (int i = 1; i <= categorySize; i++) {
			CategoryVO category = new CategoryVO();
			category.setCategorySeq(i);
			category = categoryService.select(category);
			categoryItemList.add(new CategoryItemVO(category, itemService.selectCntByCategory(category), itemService.selectListByCategory(category)));
		}
		session.setAttribute("categoryItemList", categoryItemList);
		return "updateItem";
	}

	@RequestMapping(value = "insertItem.do", method = RequestMethod.POST)
	public String downInfo(CategoryVO category, HttpServletRequest request, HttpSession session) {
		ShopVO shop = (ShopVO) session.getAttribute("shop");
		long itemSeq = Long.parseLong(request.getParameter("itemSeq"));
		long total = Long.parseLong(request.getParameter("total"));
		StockVO stock = new StockVO();
		stock.setItemSeq(itemSeq);
		stock.setShopSeq(shop.getShopSeq());
		stock.setTotal(total);
//		stockService.insert(stock);
		return "shopInfo";
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
//		List<ItemListVO> categoryList = (List<ItemListVO>) session.getAttribute("categoryList");

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
