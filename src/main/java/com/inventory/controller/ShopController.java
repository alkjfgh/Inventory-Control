package com.inventory.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.inventory.app.domain.ItemVO;
import com.inventory.app.domain.ShopVO;
import com.inventory.app.domain.SoldCategoryVO;
import com.inventory.app.domain.SoldLogVO;
import com.inventory.app.domain.StockVO;
import com.inventory.app.domain.UserVO;
import com.inventory.app.service.CategoryService;
import com.inventory.app.service.ItemInfoService;
import com.inventory.app.service.ItemService;
import com.inventory.app.service.ShopService;
import com.inventory.app.service.SoldLogService;
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

	@Autowired
	private SoldLogService soldLogService;

	@RequestMapping(value = "ShopInfo.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String shopInfo(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String url = userCheck(session, response);
		if (url != null)
			return url;
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

		session.setAttribute("categoryList", createCategoryList(user, shop, 0));
		session.setAttribute("shop", shop);
		return PATH + "shopInfo";
	}

	@RequestMapping(value = "check.do", method = RequestMethod.GET)
	public String checkView(HttpSession session, HttpServletResponse response) throws IOException {
		String url = userCheck(session, response);
		if (url != null)
			return url;
		UserVO user = (UserVO) session.getAttribute("user");
		ShopVO shop = new ShopVO();
		shop.setShopSeq(user.getShopSeq());
		shop = shopService.select(shop);
		session.setAttribute("categoryList", createCategoryList(user, shop, 1));
		return PATH + "check";
	}

	private List<ItemListVO> createCategoryList(UserVO user, ShopVO shop, int state) {
		long shopSeq = shop.getShopSeq();
		Iterator<CategoryVO> categoryIt = categoryService.selectList(null).iterator();
		List<ItemListVO> categoryList = new ArrayList<ItemListVO>();
		long shopCount = shop.getShopCount();
		if (state == 1 && shopCount == 7) {
			shop.setShopSeq(0l);
			shopService.update(shop);
		}
		while (categoryIt.hasNext()) {
			CategoryVO category = categoryIt.next();
			long categorySeq = category.getCategorySeq();
			List<ItemInfoVO> itemInfoList = itemInfoService.selectList(shopSeq, categorySeq);
			for (ItemInfoVO itemInfo : itemInfoList) {
				long total = itemInfo.getTotal();
				if (state == 1 && shopCount == 7) {
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
				categoryList.add( new ItemListVO(category, itemInfoService.categoryCount(shopSeq, categorySeq), itemInfoList));
		}
		return categoryList;
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
				long sold = itemInfo.getSold();
				long autoSup = Long.parseLong(request.getParameter(categorySeq + "_" + itemSeq + "_autoSup"));
				if (autoSup < remain)
					autoSup = remain;
				StockVO shopStock = new StockVO();
				shopStock.setShopSeq(shopSeq);
				shopStock.setCategorySeq(categorySeq);
				shopStock.setItemSeq(itemSeq);
				shopStock.setTotal(autoSup);
				shopStock.setRemain(autoSup);
				shopStock.setSold(sold);

				StockVO masterStock = new StockVO();
				masterStock.setShopSeq(2);
				masterStock.setCategorySeq(categorySeq);
				masterStock.setItemSeq(itemSeq);
				masterStock = stockService.select(masterStock);
				masterStock.setRemain(masterStock.getRemain() - (autoSup - remain));
				masterStock.setSold((autoSup - remain));

				ShopVO shop = new ShopVO();
				shop.setShopSeq(shopSeq);
				shop = shopService.select(shop);
				SoldLogVO soldLog = new SoldLogVO(shop.getShopCount(), (autoSup - remain), shopSeq, categorySeq, itemSeq);
				
				stockService.update(shopStock);
				stockService.update(masterStock);
				soldLogService.insert(soldLog);
			}
		}
		ShopVO shop = (ShopVO) session.getAttribute("shop");
		shop.setShopCount(shop.getShopCount() + 1);
		shopService.update(shop);
		return "redirect:" + PATH + "ShopInfo.do";
	}

	@RequestMapping(value = "updateItem.do", method =  RequestMethod.GET)
	public String updateItemView(HttpSession session, HttpServletResponse response) throws IOException {
		String url = userCheck(session, response);
		if (url != null)
			return url;
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

	@RequestMapping(value = "graph.do", method = RequestMethod.GET)
	public String graphView(HttpSession session, HttpServletResponse response, Model model) throws IOException {
		String url = userCheck(session, response);
		if (url != null)
			return url;
		ShopVO shop = (ShopVO) session.getAttribute("shop");
		SoldLogVO soldLog = new SoldLogVO(0, 0, shop.getShopSeq(), 0, 0);
		soldLog.setStart(shop.getShopCount());
		soldLog.setEnd(shop.getShopCount());
		Iterator<CategoryVO> categoryIt = soldLogService.selectCategoryPeriod(soldLog).iterator();
		List<SoldCategoryVO> soldList = new ArrayList<SoldCategoryVO>();
		while(categoryIt.hasNext()) {
			CategoryVO category = categoryService.select(categoryIt.next());
			soldLog.setCategorySeq(category.getCategorySeq());
			List<SoldLogVO> soldLogList = soldLogService.selectPeriod(soldLog);
			if(soldLogList.size() > 0) {
				soldList.add(new SoldCategoryVO(category, soldLogList));
			}
		}
		model.addAttribute("soldList", soldList);
		return PATH + "graph";
	}
	
	@RequestMapping(value = "graph.do", method = RequestMethod.POST)
	public String graph(HttpSession session, Model model, HttpServletRequest request) {
		ShopVO shop = (ShopVO) session.getAttribute("shop");
		SoldLogVO soldLog = new SoldLogVO(0, 0, shop.getShopSeq(), 0, 0);
		short c = 0;
		if(request.getParameter("week") != null) { 
			soldLog.setWeek(Long.parseLong(request.getParameter("week")));
		} else if(request.getParameter("month") != null) {
			soldLog.setMonth(Long.parseLong(request.getParameter("month")));
		} else if(request.getParameter("start") != null && request.getParameter("end") != null) {
			soldLog.setStart(Long.parseLong(request.getParameter("start")));
			soldLog.setEnd(Long.parseLong(request.getParameter("end")));
		}
//		검색어를 입력 하지 않은 경우는 js로 검열

		Iterator<CategoryVO> categoryIt = soldLogService.selectCategoryPeriod(soldLog).iterator();
		List<SoldCategoryVO> soldList = new ArrayList<SoldCategoryVO>();
		while(categoryIt.hasNext()) {
			CategoryVO category = categoryService.select(categoryIt.next());
			soldLog.setCategorySeq(category.getCategorySeq());
			List<SoldLogVO> soldLogList = null;
			switch (c) {
				case 1: soldLogList = soldLogService.selectWeek(soldLog);
					break;
				case 2: soldLogList = soldLogService.selectMonth(soldLog);
					break;
				case 3: soldLogList = soldLogService.selectPeriod(soldLog);
					break;
			}
			if(soldLogList.size() > 0) {
				soldList.add(new SoldCategoryVO(category, soldLogList));
			}
		}
		model.addAttribute("soldList", soldList);
		return PATH + "graph";
	}

	@RequestMapping(value = "insertShop.do", method = RequestMethod.GET)
	public String insertShopView(ShopVO vo, HttpSession session, HttpServletResponse response) throws IOException {
		String url = userCheck(session, response);
		if (url != null)
			return url;
		return PATH+"insertShop";
	}
	
	@RequestMapping(value = "insertShop.do", method = RequestMethod.POST)
	public String insertShop(ShopVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		user = userService.select(user);
		session.setAttribute("user", user);
		vo.setShopSeq(user.getShopSeq());
		shopService.insert(vo);
		return "redirect:" + PATH + "ShopInfo.do";
	}

	public void alert(String msg, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.println("<script language='javascript'>");
		out.println("alert('" + msg + ".');");
		out.println("</script>");
		out.flush();
	}

	private String userCheck(HttpSession session, HttpServletResponse response) throws IOException {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null || user.getUserLevel() != 1)
			return "../home";
		return null;
	}
}
