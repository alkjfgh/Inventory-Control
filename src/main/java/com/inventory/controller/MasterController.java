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
public class MasterController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ItemInfoService itemInfoService;
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private UserService userService;

	@Autowired
	private StockService stockService;
	
	@RequestMapping(value = "/updateCategory.do")
	public String updateCategoryView(Model model) {
		List<CategoryVO> categoryList = categoryService.selectList(null);
		model.addAttribute("categoryList", categoryList);
		return "updateCategory";
	}

	@RequestMapping(value = "/masterUpdateItem.do")
	public String masterUpdateItemView(Model model) {
		List<CategoryVO> categoryList = categoryService.selectList(null);
		model.addAttribute("categoryList", categoryList);

		Iterator<CategoryVO> categoryIt = categoryList.iterator();
		List<CategoryItemVO> categoryItemList = new ArrayList<CategoryItemVO>();
		while (categoryIt.hasNext()) {
			CategoryVO category = categoryIt.next();
			List<ItemVO> itemInfoList = itemService.selectListByCategory(category);
			categoryItemList.add(new CategoryItemVO(category, itemService.selectCntByCategory(category), itemInfoList));
		}
		model.addAttribute("categoryItemList", categoryItemList);

		return "masterUpdateItem";
	}

	@RequestMapping(value = "/deleteCategory.do", method = RequestMethod.POST)
	public String deleteCategory(HttpServletRequest request) {
		int category_size = categoryService.selectCnt();
		for (int i = 1; i <= category_size; i++) {
			int categorySeq = 0;
			if (request.getParameter(String.valueOf(i)).equals("on"))
				categorySeq = i;
			CategoryVO category = new CategoryVO();
			category.setCategorySeq(categorySeq);
			category = categoryService.select(category);
//			if (category != null)
//				categoryService.delete(category);
		}
		return "master";
	}

	@RequestMapping(value = "/insertCategory.do", method = RequestMethod.POST)
	public String insertCategory(HttpServletRequest request) {
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		for (int i = 1; i <= cnt; i++) {
			String categoryName = request.getParameter("categoryName_" + i);
			if (categoryName != null && !categoryName.equals("")) {
				CategoryVO category = new CategoryVO();
				category.setCategoryName(categoryName);
				System.out.println(category);
			}
		}
		return "master";
	}

	@RequestMapping(value = "/masterInsertItem.do", method = RequestMethod.POST)
	public String masterInsertItem(HttpServletRequest request) {
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		for (int i = 1; i <= cnt; i++) {
			ItemVO item = new ItemVO();
			long categorySeq = Long.parseLong(request.getParameter("categorySeq_" + i));
			String itemName = request.getParameter("itemName_" + i);
			long itemPrice = Long.parseLong(request.getParameter("itemPrice_" + i));
			String itemMaker = request.getParameter("itemMaker_" + i);
			item.setCategorySeq(categorySeq);
			item.setItemName(itemName);
			item.setItemPrice(itemPrice);
			item.setItemMaker(itemMaker);
			System.out.println(item);
//			itemService.insert(item);
		}
		return "master";
	}

	@RequestMapping(value = "/masterDeleteItem.do", method = RequestMethod.POST)
	public String masterDeleteItem(HttpServletRequest request) {
		System.out.println(request.getParameter("1_itemSeq_1"));
		return "master";
	}

	@RequestMapping(value = "/shopList.do")
	public String shopList(HttpServletRequest request, Model model) {
		List<ShopVO> shopList = shopService.selectList(null);
		model.addAttribute("shopList", shopList);
		return "shopList";
	}
	
	@RequestMapping(value = "/ownerList.do")
	public String ownerList(Model model) {
		List<UserVO> userList = userService.selectList(null);
		model.addAttribute("userList", userList);
		return "ownerList";
	}
	
	@RequestMapping(value = "/totalItem.do")
	public String totalItem(Model model, HttpSession session) {
		StockVO vo = new StockVO();
		vo.setShopSeq(0l);
		Iterator<CategoryVO> categoryList = categoryService.selectList(null).iterator();
		List<ItemListVO> totalItemList = new ArrayList<ItemListVO>();
		while(categoryList.hasNext()) {
			CategoryVO category = categoryList.next();
			long categorySeq = category.getCategorySeq();
			totalItemList.add(new ItemListVO(category, itemService.selectCntByCategory(category), itemInfoService.selectList(0l, categorySeq)));
		}
		model.addAttribute("totalItemList", totalItemList);
		return "totalItem";
	}
}
