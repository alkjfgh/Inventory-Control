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
@RequestMapping("/shop/")
public class ShopController {

	private final static String PATH = "/shop/";

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

	@RequestMapping(value = "ShopInfo.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String shopInfo(HttpSession session, Model model, HttpServletRequest request) {
		long shopSeq = -1;
		if (request.getParameter("shopSeq") != null && !request.getParameter("shopSeq").equals(""))
			shopSeq = Long.parseLong(request.getParameter("shopSeq"));
		UserVO user = new UserVO();
		if (shopSeq != -1) {
			user.setShopSeq(shopSeq);
		} else {
			user = (UserVO) session.getAttribute("user");
		}
		ShopVO shop = new ShopVO();
		shop.setShopSeq(user.getShopSeq());
		shop = shopService.select(shop);
		StockVO stock = new StockVO();
		stock.setShopSeq(user.getShopSeq());
		Iterator<CategoryVO> categoryIt = categoryService.selectList(null).iterator();
		List<ItemListVO> categoryList = new ArrayList<ItemListVO>();
		long shopCount = shop.getShopCount();
		while (categoryIt.hasNext()) {
			CategoryVO category = categoryIt.next();
			shopSeq = shop.getShopSeq();
			long categorySeq = category.getCategorySeq();
			List<ItemInfoVO> itemInfoList = itemInfoService.selectList(shopSeq, categorySeq);
			for (ItemInfoVO itemInfo : itemInfoList) {
				long total = itemInfo.getTotal();
				if (shopCount > 6) {
					double sold = itemInfo.getSold();
					double targetSold = total * shopCount;
					double percent = Math.floor(sold * 100.0 / targetSold) / 100 + 0.05;
					long autoSup = (long) Math.floor(total * percent) + 1;
					itemInfo.setAutoSup(autoSup);
				} else {
					itemInfo.setAutoSup(total);
				}
			}
			if (itemInfoList.size() > 0)
				categoryList.add(
						new ItemListVO(category, itemInfoService.categoryCount(shopSeq, categorySeq), itemInfoList));
		}
		session.setAttribute("categoryList", categoryList);
		session.setAttribute("shop", shop);
		return PATH + "shopInfo";
	}

	@RequestMapping(value = "updateItem.do")
	public String updateItemView(HttpSession session) {
		ShopVO shop = (ShopVO) session.getAttribute("shop");
		int categorySize = categoryService.selectCnt();
		List<CategoryItemVO> categoryItemList = new ArrayList<CategoryItemVO>();
		for (int i = 1; i <= categorySize; i++) {
			CategoryVO category = new CategoryVO();
			category.setCategorySeq(i);
			category = categoryService.select(category);
			List<ItemVO> itemList = itemService.selectListByCategory(category);
			int size = itemList.size();
			for (int j = 0; j < size; j++) {
				StockVO stock = new StockVO();
				stock.setShopSeq(shop.getShopSeq());
				stock.setCategorySeq(category.getCategorySeq());
				stock.setItemSeq(itemList.get(j).getItemSeq());
				stock = stockService.select(stock);
				if (stock != null) {
					itemList.remove(j);
					size--;
					j--;
				}
			}
			size = itemList.size();
			if (size != 0) {
				categoryItemList.add(new CategoryItemVO(category, size, itemList));
			}
		}
		session.setAttribute("categoryItemList", categoryItemList);
		return PATH + "updateItem";
	}

	@RequestMapping(value = "insertItem.do", method = RequestMethod.POST)
	public String insertItem(HttpServletRequest request, HttpSession session) {
		ShopVO shop = (ShopVO) session.getAttribute("shop");
		int input_size = Integer.parseInt(request.getParameter("cnt"));
		for (int i = 1; i <= input_size; i++) {
			long categorySeq = Long.parseLong(request.getParameter("category_" + i));
			long itemSeq = Long.parseLong(request.getParameter("item_" + i));
			long total = Long.parseLong(request.getParameter("total_" + i));
			StockVO stock = new StockVO();
			stock.setCategorySeq(categorySeq);
			stock.setItemSeq(itemSeq);
			stock.setShopSeq(shop.getShopSeq());
			stock.setTotal(total);
			stockService.insert(stock);
		}
		return "redirect:" + PATH + "ShopInfo.do";
	}

	@RequestMapping(value = "deleteItem.do", method = RequestMethod.POST)
	public String deleteItem(HttpServletRequest request, HttpSession session) {
		ShopVO shop = (ShopVO) session.getAttribute("shop");
		int size1 = categoryService.selectCnt();
		for (int i = 1; i <= size1; i++) {
			CategoryVO category = new CategoryVO();
			category.setCategorySeq(i);
			category = categoryService.select(category);
			int size2 = itemService.selectCntByCategory(category);
			for (int j = 1; j <= size2; j++) {
				String checkBox = request.getParameter(i + "_itemSeq_" + j);
				if (checkBox != null && checkBox.equals("on")) {
					StockVO stock = new StockVO();
					stock.setCategorySeq((long) i);
					stock.setItemSeq((long) j);
					stock.setShopSeq(shop.getShopSeq());
					stock = stockService.select(stock);
					stockService.delete(stock);
				}
			}
		}
		return "redirect:" + PATH + "ShopInfo.do";
	}

	@RequestMapping(value = "check.do", method = RequestMethod.GET)
	public String checkView() {
		return PATH + "check";
	}

	@RequestMapping(value = "check.do", method = RequestMethod.POST)
	public String check(HttpSession session, HttpServletRequest request) {
		@SuppressWarnings("unchecked")
		Iterator<ItemListVO> itemListIt = ((List<ItemListVO>) session.getAttribute("categoryList")).iterator();
		while (itemListIt.hasNext()) {
			Iterator<ItemInfoVO> itemInfoIt = itemListIt.next().getItemList().iterator();
			while (itemInfoIt.hasNext()) {
				ItemInfoVO itemInfo = itemInfoIt.next();
				long shopSeq = itemInfo.getShopSeq();
				long categorySeq = itemInfo.getCategorySeq();
				long itemSeq = itemInfo.getItemSeq();
				long remain = itemInfo.getRemain();
				long autoSup = Long.parseLong(request.getParameter(categorySeq + "_" + itemSeq + "_autoSup"));
				if (autoSup < remain)
					autoSup = remain;
				StockVO shopStock = new StockVO();
				shopStock.setShopSeq(shopSeq);
				shopStock.setCategorySeq(categorySeq);
				shopStock.setItemSeq(itemSeq);
				shopStock.setTotal(autoSup);
				shopStock.setRemain(autoSup);

				StockVO masterStock = new StockVO();
				masterStock.setShopSeq(2);
				masterStock.setCategorySeq(categorySeq);
				masterStock.setItemSeq(itemSeq);
				masterStock = stockService.select(masterStock);
				masterStock.setRemain(masterStock.getRemain() - (autoSup - remain));

				stockService.update(shopStock);
				stockService.update(masterStock);
			}
		}
		ShopVO shop = (ShopVO) session.getAttribute("shop");
		shop.setShopCount(shop.getShopCount() + 1);
		shopService.update(shop);
		return "redirect:" + PATH + "ShopInfo.do";
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
		return PATH + "shopInfo";
	}

	@RequestMapping(value = "graph.do")
	public String graph(HttpServletRequest request, HttpSession session) {
//		List<ItemListVO> categoryList = (List<ItemListVO>) session.getAttribute("categoryList");
		return PATH + "graph";
	}

	@RequestMapping(value = "insertShop.do")
	public String insertShop(ShopVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		user = userService.select(user);
		session.setAttribute("user", user);
		vo.setShopSeq(user.getShopSeq());
		shopService.insert(vo);
		return "redirect:" + PATH + "ShopInfo.do";
	}
}
