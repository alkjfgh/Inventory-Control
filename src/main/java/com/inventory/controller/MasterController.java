package com.inventory.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.inventory.app.domain.ItemMovementVO;
import com.inventory.app.domain.ItemVO;
import com.inventory.app.domain.ShopVO;
import com.inventory.app.domain.StockVO;
import com.inventory.app.domain.UserVO;
import com.inventory.app.service.CategoryService;
import com.inventory.app.service.ItemInfoService;
import com.inventory.app.service.ItemMovementService;
import com.inventory.app.service.ItemService;
import com.inventory.app.service.ShopService;
import com.inventory.app.service.UserService;

@Controller
@RequestMapping("/master/")
public class MasterController {

	private final static String PATH = "/master/";

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
	private ItemMovementService itemMovementService;

	@RequestMapping(value = "master.do", method = RequestMethod.GET)
	public String masterView(HttpSession session, HttpServletResponse response) throws IOException {
		System.out.println("masterView");
		String url = masterCheck(session, response);
		if (url != null)
			return url;
		return PATH + "master";	
	}

	@RequestMapping(value = "updateCategory.do", method = RequestMethod.GET)
	public String updateCategoryView(Model model, HttpSession session, HttpServletResponse response)
			throws IOException {
		String url = masterCheck(session, response);
		if (url != null)
			return url;
		List<CategoryVO> categoryList = categoryService.selectList(null);
		model.addAttribute("categoryList", categoryList);
		return PATH + "updateCategory";
	}

	@RequestMapping(value = "masterUpdateItem.do", method = RequestMethod.GET)
	public String masterUpdateItemView(Model model, HttpSession session, HttpServletResponse response)
			throws IOException {
		String url = masterCheck(session, response);
		if (url != null)
			return url;
		List<CategoryVO> categoryList = categoryService.selectList(null);
		model.addAttribute("categoryList", categoryList);
		Iterator<CategoryVO> categoryIt = categoryList.iterator();
		List<CategoryItemVO> categoryItemList = new ArrayList<CategoryItemVO>();
		while (categoryIt.hasNext()) {
			CategoryVO category = categoryIt.next();
			List<ItemVO> itemInfoList = itemService.selectListByCategory(category);
			int cnt = itemService.selectCntByCategory(category);
			if (cnt > 0)
				categoryItemList.add(new CategoryItemVO(category, cnt, itemInfoList));
		}
		model.addAttribute("categoryItemList", categoryItemList);

		return PATH + "masterUpdateItem";
	}

	@RequestMapping(value = "deleteCategory.do", method = RequestMethod.POST)
	public String deleteCategory(HttpServletRequest request) {
//		나중에 매장에 아이템이 남아았는지 하나하나 검사해야함
		int category_size = categoryService.selectCnt();
		for (int i = 1; i <= category_size; i++) {
			int categorySeq = 0;
			String checkBox = request.getParameter(String.valueOf(i));
			if (checkBox != null && checkBox.equals("on"))
				categorySeq = i;
			else
				continue;
			CategoryVO category = new CategoryVO();
			category.setCategorySeq(categorySeq);
			category = categoryService.select(category);
			if (category != null)
				categoryService.delete(category);
		}
		return "redirect:" + PATH + "master.do";
	}

	@RequestMapping(value = "insertCategory.do", method = RequestMethod.POST)
	public String insertCategory(HttpServletRequest request) {
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		for (int i = 1; i <= cnt; i++) {
			String categoryName = request.getParameter("categoryName_" + i);
			if (categoryName != null && !categoryName.equals("")) {
				CategoryVO category = new CategoryVO();
				category.setCategoryName(categoryName);
				categoryService.insert(category);
			}
		}
		return "redirect:" + PATH + "master.do";
	}

	@RequestMapping(value = "masterInsertItem.do", method = RequestMethod.POST)
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
			itemService.insert(item);
		}
		return "redirect:" + PATH + "master.do";
	}

	@RequestMapping(value = "masterDeleteItem.do", method = RequestMethod.POST)
	public String masterDeleteItem(HttpServletRequest request) {
		int size1 = categoryService.selectCnt();
		for (int i = 1; i <= size1; i++) {
			CategoryVO category = new CategoryVO();
			category.setCategorySeq(i);
			category = categoryService.select(category);
			int size2 = itemService.selectCntByCategory(category);
			for (int j = 1; j <= size2; j++) {
				String checkBox = request.getParameter(i + "_itemSeq_" + j);
				if (checkBox != null && checkBox.equals("on")) {
					ItemVO item = new ItemVO();
					item.setCategorySeq((long) i);
					item.setItemSeq((long) j);
					itemService.delete(item);
				}
			}
		}
		return "redirect:" + PATH + "master.do";
	}

	@RequestMapping(value = "shopList.do", method = RequestMethod.GET)
	public String shopListView(HttpServletRequest request, Model model, HttpSession session,
			HttpServletResponse response) throws IOException {
		String url = masterCheck(session, response);
		if (url != null)
			return url;
		List<ShopVO> shopList = shopService.selectList(null);
		shopList.remove(1);
		model.addAttribute("shopList", shopList);
		return PATH + "shopList";
	}

	@RequestMapping(value = "ownerList.do", method = RequestMethod.GET)
	public String ownerListView(Model model, HttpSession session, HttpServletResponse response) throws IOException {
		String url = masterCheck(session, response);
		if (url != null)
			return url;
		List<UserVO> userList = userService.selectList(null);
		model.addAttribute("userList", userList);
		return PATH + "ownerList";
	}

	@RequestMapping(value = "totalItem.do", method = RequestMethod.GET)
	public String totalItemView(Model model, HttpSession session, HttpServletResponse response) throws IOException {
		String url = masterCheck(session, response);
		if (url != null)
			return url;
		StockVO vo = new StockVO();
		vo.setShopSeq(2l);
		Iterator<CategoryVO> categoryList = categoryService.selectList(null).iterator();
		List<ItemListVO> totalItemList = new ArrayList<ItemListVO>();
		while (categoryList.hasNext()) {
			CategoryVO category = categoryList.next();
			long categorySeq = category.getCategorySeq();
			List<ItemInfoVO> itemInfoList = itemInfoService.selectList(2l, categorySeq);
			if (itemInfoList.size() > 0)
				totalItemList.add(new ItemListVO(category, itemService.selectCntByCategory(category), itemInfoList));
		}
		model.addAttribute("totalItemList", totalItemList);
		return PATH + "totalItem";
	}
	
	@RequestMapping(value = "itemMovement.do", method = RequestMethod.GET)
	public String itemMovementView(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		ItemMovementVO itemMovement = new ItemMovementVO(0, 0, 0);
		List<ItemMovementVO> itemMovementList = itemMovementService.selectView(itemMovement);
		return PATH + "totalItem";
	}

	private String masterCheck(HttpSession session, HttpServletResponse response) throws IOException {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null || user.getUserLevel() != 9)
			return "redirect:../home.do";
		return null;
	}
}
