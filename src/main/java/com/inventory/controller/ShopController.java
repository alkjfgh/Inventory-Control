package com.inventory.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

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
import com.inventory.app.domain.SoldCategoryVO;
import com.inventory.app.domain.SoldLogVO;
import com.inventory.app.domain.StockVO;
import com.inventory.app.domain.UserVO;
import com.inventory.app.service.CategoryService;
import com.inventory.app.service.ItemInfoService;
import com.inventory.app.service.ItemMovementService;
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

	@Autowired
	private ItemMovementService itemMovementService;

	@RequestMapping(value = "ShopInfo.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String shopInfo
	(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
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
		ItemInfoVO itemInfo = new ItemInfoVO();
		itemInfo.setShopSeq(shop.getShopSeq());
		model.addAttribute("itemInfoList", itemInfoService.selectList(itemInfo));
		session.setAttribute("shop", shop);
		return PATH + "shopInfo";
	}

	@RequestMapping(value = "shopStock.do", method = RequestMethod.GET)
	public String shopStockView(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int pageIndex)
			throws IOException {
		String url = userCheck(session, response);
		if (url != null)
			return url;
		ShopVO shop = (ShopVO) session.getAttribute("shop");
		ItemInfoVO itemInfo = new ItemInfoVO();
		itemInfo.setStart((pageIndex - 1) * 20);
		itemInfo.setShopSeq(shop.getShopSeq());
		model.addAttribute("itemInfoList", itemInfoService.selectList(itemInfo));
		model.addAttribute("itemCount", itemInfoService.selectCount(itemInfo));
		return PATH + "shopStock";
	}
	
	@RequestMapping(value = "check.do", method = RequestMethod.GET)
	public String checkView(HttpSession session, HttpServletResponse response) throws IOException {
		String url = userCheck(session, response);
		if (url != null)
			return url;
		ShopVO shop = (ShopVO) session.getAttribute("shop");
		ItemInfoVO itemInfo = new ItemInfoVO();
		itemInfo.setShopSeq(shop.getShopSeq());
		List<ItemInfoVO> itemInfoList = itemInfoService.selectList(itemInfo);
		long shopCount = shop.getShopCount();
		if (shopCount == 7) {
			shop.setShopCount(1);
			shopService.update(shop);
		}
		for (ItemInfoVO vo : itemInfoList) {
			long total = vo.getTotal();
			if (shopCount == 7) {
				double sold = vo.getSold();
				double targetSold = total * shopCount;
				double percent = Math.floor(sold * 100.0 / targetSold) / 100 + 0.05;
				total = (long) Math.floor(total * percent) + 1;
			}
			vo.setAutoSup(total);
		}
		session.setAttribute("itemInfoList", itemInfoList);
		return PATH + "check";
	}

	@RequestMapping(value = "check.do", method = RequestMethod.POST)
	public String check(HttpSession session, HttpServletRequest request) {
		@SuppressWarnings("unchecked")
		Iterator<ItemInfoVO> itemInfoIt = ((List<ItemInfoVO>) session.getAttribute("itemInfoList")).iterator();
		ShopVO shop = (ShopVO) session.getAttribute("shop");
		long shopSeq = shop.getShopSeq();
		while (itemInfoIt.hasNext()) {
			ItemInfoVO itemInfo = itemInfoIt.next();
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
			masterStock.setShopSeq(1);
			masterStock.setCategorySeq(categorySeq);
			masterStock.setItemSeq(itemSeq);
			masterStock = stockService.select(masterStock);
			masterStock.setRemain(masterStock.getRemain() - (autoSup - remain));
			masterStock.setSold((autoSup - remain));
			
			SoldLogVO soldLog = new SoldLogVO(shop.getShopCount(), (autoSup - remain), shopSeq, categorySeq, itemSeq);

			ItemMovementVO itemMovement = new ItemMovementVO(shop.getShopCount(), categorySeq, itemSeq);
			itemMovement.setShopSeq(shopSeq);
			itemMovement.setStockMove((autoSup - remain));

			stockService.update(shopStock);
			stockService.update(masterStock);
			soldLogService.insert(soldLog);
			itemMovementService.insert(itemMovement);
		}
		shop.setShopCount(shop.getShopCount() + 1);
		shopService.update(shop);
		return "redirect:" + PATH + "ShopInfo.do";
	}

	@RequestMapping(value = "updateItem.do", method = RequestMethod.GET)
	public String updateItemView(HttpSession session, HttpServletResponse response, Model model) throws IOException {
		String url = userCheck(session, response);
		if (url != null)
			return url;
		ShopVO shop = (ShopVO) session.getAttribute("shop");
		ItemInfoVO itemInfo = new ItemInfoVO();
		itemInfo.setShopSeq(shop.getShopSeq());
		List<ItemInfoVO> addList = new ArrayList<ItemInfoVO>();
		List<ItemInfoVO> deleteList = itemInfoService.shopItemList(itemInfo);
		List<CategoryVO> categoryList = new ArrayList<CategoryVO>();
		Iterator<CategoryVO> categorIt = categoryService.selectList(null).iterator();
		while(categorIt.hasNext()) {
			CategoryVO category = categorIt.next();
			Iterator<ItemVO> itemIt = itemService.selectListByCategory(category).iterator();
			while(itemIt.hasNext()) {
				ItemVO item = itemIt.next();
				itemInfo = new ItemInfoVO();
				itemInfo.setCategorySeq(category.getCategorySeq());
				itemInfo.setItemSeq(item.getItemSeq());
				if(!deleteList.contains(itemInfo)) {
					itemInfo.setCategoryName(category.getCategoryName());
					itemInfo.setItemName(item.getItemName());
					addList.add(itemInfo);
					if(!categoryList.contains(category))
						categoryList.add(category);
				}
			}
		}
		if(addList.isEmpty()) {
			itemInfo = new ItemInfoVO();
			itemInfo.setCategorySeq(0);
			addList.add(itemInfo);
		}
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("addList", addList);
		model.addAttribute("deleteList",deleteList);
		return PATH + "updateItem";
	}

	@RequestMapping(value = "insertItem.do", method = RequestMethod.POST)
	public String insertItem(HttpServletRequest request, HttpSession session) {
		ShopVO shop = (ShopVO) session.getAttribute("shop");
		int input_size = Integer.parseInt(request.getParameter("cnt"));
		Set<StockVO> duplicateCheck = new HashSet<StockVO>();
		for (int i = 1; i <= input_size; i++) {
			if (request.getParameter("category_" + i) == null)
				continue;
			long categorySeq = Long.parseLong(request.getParameter("category_" + i));
			if (request.getParameter("item_" + i) == null)
				continue;
			long itemSeq = Long.parseLong(request.getParameter("item_" + i));
			if (request.getParameter("total_" + i) == null)
				continue;
			long total = Long.parseLong(request.getParameter("total_" + i));
			StockVO stock = new StockVO();
			stock.setCategorySeq(categorySeq);
			stock.setItemSeq(itemSeq);
			stock.setShopSeq(shop.getShopSeq());
			stock.setTotal(total);
			if (!duplicateCheck.contains(stock)) {
				stockService.insert(stock);
				duplicateCheck.add(stock);
			}
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
		while (categoryIt.hasNext()) {
			CategoryVO category = categoryService.select(categoryIt.next());
			soldLog.setCategorySeq(category.getCategorySeq());
			List<SoldLogVO> soldLogList = soldLogService.selectPeriod(soldLog);
			if (soldLogList.size() > 0) {
				for (SoldLogVO log : soldLogList) {
					ItemVO item = new ItemVO();
					item.setCategorySeq(log.getCategorySeq());
					item.setItemSeq(log.getItemSeq());
					item = itemService.select(item);
					log.setItemName(item.getItemName());
					log.setItemPrice(item.getItemPrice());
				}
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
		String searchCondition = request.getParameter("searchCondition");
		if (searchCondition != null) {
			long searchKeyWord = Long.parseLong(request.getParameter("searchKeyword"));
			if (searchCondition.equals("day")) {
				soldLog.setStart(searchKeyWord);
				soldLog.setEnd(searchKeyWord);
			} else if (searchCondition.equals("week")) {
				soldLog.setStart(searchKeyWord * 7 - 6);
				soldLog.setEnd(searchKeyWord * 7);
			} else if (searchCondition.equals("month")) {
				soldLog.setStart(searchKeyWord * 30 - 29);
				soldLog.setEnd(searchKeyWord * 30);
			}
		} else {
			long start = Long.parseLong(request.getParameter("start"));
			long end = Long.parseLong(request.getParameter("end"));
			soldLog.setStart(start);
			soldLog.setEnd(end);
		}
//		검색어를 입력 하지 않은 경우는 js로 검열

		Iterator<CategoryVO> categoryIt = soldLogService.selectCategoryPeriod(soldLog).iterator();
		List<SoldCategoryVO> soldList = new ArrayList<SoldCategoryVO>();
		while (categoryIt.hasNext()) {
			CategoryVO category = categoryService.select(categoryIt.next());
			soldLog.setCategorySeq(category.getCategorySeq());
			List<SoldLogVO> soldLogList = soldLogService.selectPeriod(soldLog);
			if (soldLogList.size() > 0) {
				for (SoldLogVO log : soldLogList) {
					ItemVO item = new ItemVO();
					item.setCategorySeq(log.getCategorySeq());
					item.setItemSeq(log.getItemSeq());
					item = itemService.select(item);
					log.setItemName(item.getItemName());
					log.setItemPrice(item.getItemPrice());
				}
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
		return PATH + "insertShop";
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
		if (user == null || (user.getUserLevel() != 1 && user.getUserLevel() != 9))
			return "redirect:../home.do";
		return null;
	}
}
