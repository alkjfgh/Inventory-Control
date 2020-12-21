package com.inventory.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.inventory.app.domain.CategoryVO;
import com.inventory.app.domain.ItemInfoVO;
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
import com.inventory.app.service.StockService;
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
	
	@Autowired
	private StockService stockService;

	@RequestMapping(value = "master.do", method = RequestMethod.GET)
	public String masterView(HttpSession session, HttpServletResponse response) throws IOException {
		String url = masterCheck(session, response);
		if (url != null)
			return url;
		return PATH + "master";
	}

	@RequestMapping(value = "updateCategory.do", method = RequestMethod.GET)
	public String updateCategoryView(Model model, HttpSession session, HttpServletResponse response,
			@RequestParam(defaultValue = "1") int pageIndex) throws IOException {
		String url = masterCheck(session, response);
		if (url != null)
			return url;
		CategoryVO category = new CategoryVO();
		category.setStart((pageIndex - 1) * 20);
		model.addAttribute("categoryList", categoryService.selectList(category));
		model.addAttribute("categoryCount", categoryService.selectCnt());
		return PATH + "updateCategory";
	}

	@RequestMapping(value = "masterUpdateItem.do", method = RequestMethod.GET)
	public String masterUpdateItemView(Model model, HttpSession session, HttpServletResponse response)
			throws IOException {
		String url = masterCheck(session, response);
		if (url != null)
			return url;
		List<CategoryVO> categoryList = categoryService.selectList(null);
		List<ItemVO> itemList = itemService.selectList(null);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("itemList", itemList);
		return PATH + "masterUpdateItem";
	}

	@RequestMapping(value = "deleteCategory.do", method = RequestMethod.POST)
	public String deleteCategory(HttpServletRequest request) {
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
			if(request.getParameter("categorySeq_" + i) == null)
				continue;
			long categorySeq = Long.parseLong(request.getParameter("categorySeq_" + i));
			String itemName = request.getParameter("itemName_" + i);
			long itemPrice = Long.parseLong(request.getParameter("itemPrice_" + i));
			String itemMaker = request.getParameter("itemMaker_" + i);
			item.setCategorySeq(categorySeq);
			item.setItemName(itemName);
			item.setItemPrice(itemPrice);
			item.setItemMaker(itemMaker);
			itemService.insert(item);
			item = itemService.select(item);
			StockVO stock = new StockVO();
			stock.setShopSeq(1);
			stock.setCategorySeq(categorySeq);
			stock.setItemSeq(item.getItemSeq());
			stock.setRemain(10000);
			stockService.insert(stock);
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
					StockVO stock = new StockVO();
					stock.setShopSeq(1);
					stock.setCategorySeq(i);
					stock.setItemSeq(j);
					stockService.delete(stock);
				}
			}
		}
		return "redirect:" + PATH + "master.do";
	}

	@RequestMapping(value = "shopList.do", method = RequestMethod.GET)
	public String shopListView(HttpServletRequest request, Model model, HttpSession session,
			HttpServletResponse response, @RequestParam(defaultValue = "1") int pageIndex) throws IOException {
		String url = masterCheck(session, response);
		if (url != null)
			return url;
		ShopVO shop = new ShopVO();
		shop.setStart((pageIndex - 1) * 20);
		model.addAttribute("shopList", shopService.selectList(shop));
		model.addAttribute("shopCount", shopService.selectCnt() - 1);
		return PATH + "shopList";
	}

	@RequestMapping(value = "ownerList.do", method = RequestMethod.GET)
	public String ownerListView(Model model, HttpSession session, HttpServletResponse response,
			@RequestParam(defaultValue = "1") int pageIndex) throws IOException {
		String url = masterCheck(session, response);
		if (url != null)
			return url;
		UserVO user = new UserVO();
		user.setStart((pageIndex - 1) * 20);
		model.addAttribute("userList", userService.selectList(user));
		model.addAttribute("userCount", userService.selectCnt() - 1);
		return PATH + "ownerList";
	}

	@RequestMapping(value = "totalItem.do", method = RequestMethod.GET)
	public String totalItemView(Model model, HttpSession session, HttpServletResponse response,
			@RequestParam(defaultValue = "1") int pageIndex) throws IOException {
		String url = masterCheck(session, response);
		if (url != null)
			return url;
		ItemInfoVO itemInfo = new ItemInfoVO();
		itemInfo.setShopSeq(1);
		itemInfo.setStart((pageIndex - 1) * 20);
		model.addAttribute("totalItemList", itemInfoService.selectList(itemInfo));
		model.addAttribute("totalItemCount", itemInfoService.selectCount(itemInfo));
		return PATH + "totalItem";
	}

	@RequestMapping(value = "itemMovement.do", method = RequestMethod.GET)
	public String itemMovementView(Model model, HttpServletRequest request, HttpSession session,
			HttpServletResponse response, @RequestParam(defaultValue = "1") int pageIndex) throws IOException {
		String url = masterCheck(session, response);
		if (url != null)
			return url;
		long shopCount = request.getParameter("shopCount") == null ? 1 : Long.parseLong(request.getParameter("shopCount"));
		String categorySeq = request.getParameter("categorySeq");
		String itemSeq = request.getParameter("itemSeq");
		ItemMovementVO itemMovement = new ItemMovementVO(shopCount,
				Long.parseLong(categorySeq), Long.parseLong(itemSeq));
		itemMovement.setStart((pageIndex - 1) * 20);
		model.addAttribute("itemMovementList", itemMovementService.selectView(itemMovement));
		model.addAttribute("itemMovement", itemMovement);
		model.addAttribute("itemCount", itemMovementService.selectCnt());
		return PATH + "itemMovement";
	}

	private String masterCheck(HttpSession session, HttpServletResponse response) throws IOException {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null || user.getUserLevel() != 9)
			return "redirect:../home.do";
		return null;
	}
}
