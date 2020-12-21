package com.inventory.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inventory.app.domain.BuyCheckVO;
import com.inventory.app.domain.BuyItemVO;
import com.inventory.app.domain.ItemInfoVO;
import com.inventory.app.domain.ItemVO;
import com.inventory.app.domain.ShopInfoVO;
import com.inventory.app.domain.ShopVO;
import com.inventory.app.domain.SoldLogVO;
import com.inventory.app.domain.StockVO;
import com.inventory.app.service.ItemInfoService;
import com.inventory.app.service.ItemService;
import com.inventory.app.service.ShopService;
import com.inventory.app.service.SoldLogService;
import com.inventory.app.service.StockService;

@Controller
@RequestMapping("/buy/")
public class BuyerController {

	private final static String PATH = "/buy/";

	@Autowired
	private ShopService shopService;

//	@Autowired
//	private CategoryService categoryService;

	@Autowired
	private ItemService itemService;

	@Autowired
	private StockService stockService;

	@Autowired
	private ItemInfoService itemInfoService;

	@Autowired
	private SoldLogService soldLogService;

	@RequestMapping(value = "buy.do", method = RequestMethod.GET)
	public String buyView(Model model) {
		List<ShopInfoVO> shopInfoList = new ArrayList<ShopInfoVO>();
		Iterator<ShopVO> shopIt = shopService.selectList(null).iterator();
		while (shopIt.hasNext()) {
			ShopVO shop = shopIt.next();
			if (shop.getShopSeq() == 1)
				shop = shopIt.next();
			ItemInfoVO itemInfo = new ItemInfoVO();
			itemInfo.setShopSeq(shop.getShopSeq());
			if (itemInfoService.selectBuyCount(itemInfo) > 0)
				shopInfoList.add(new ShopInfoVO(shop, itemInfoService.selectBuyList(itemInfo)));
		}

		if (shopInfoList.isEmpty())
			return "redirect:/home.do";
		model.addAttribute("shopInfoList", shopInfoList);
		return PATH + "buy";
	}

	@RequestMapping(value = "buyCheck.do", method = RequestMethod.POST)
	public String buyCheckView(HttpServletRequest request, HttpSession session) {
		String cntCheck = request.getParameter("cntCheck");
		if (cntCheck == null || cntCheck.equals("") || Integer.parseInt(cntCheck) < 1)
			return "redirect:/home.do";
		int cnt = Integer.parseInt(cntCheck);
		List<BuyCheckVO> buyList = new ArrayList<BuyCheckVO>();
		Set<ItemVO> duplicateCheck = new HashSet<ItemVO>();
		List<BuyItemVO> itemList = new ArrayList<BuyItemVO>();
		ShopVO shop = new ShopVO();
		for (int i = 1; i <= cnt; i++) {
			String nullCheck = request.getParameter("shop_" + i);
			if (nullCheck != null && !nullCheck.equals("")) {
				long shopSeq = Long.parseLong(nullCheck);
				long categorySeq = Long.parseLong(request.getParameter("category_" + i));
				long itemSeq = Long.parseLong(request.getParameter("item_" + i));
				long buyCnt = Long.parseLong(request.getParameter("total_" + i));
				if (shop.getShopSeq() != null && shopSeq != shop.getShopSeq() && itemList.size() > 0) {
					buyList.add(new BuyCheckVO(shop, itemList));
					itemList = new ArrayList<BuyItemVO>();
					duplicateCheck.clear();
				}
				shop.setShopSeq(shopSeq);
				shop = shopService.select(shop);
				ItemVO item = new ItemVO();
				item.setCategorySeq(categorySeq);
				item.setItemSeq(itemSeq);
				item = itemService.select(item);
				BuyItemVO buyItem = new BuyItemVO(item, buyCnt);
				if (!duplicateCheck.contains(item)) {
					duplicateCheck.add(item);
					itemList.add(buyItem);
				}
			}
		}
		if (itemList.size() > 0) {
			buyList.add(new BuyCheckVO(shop, itemList));
		}
		session.setAttribute("buyList", buyList);
		return PATH + "buyCheck";
	}

	@RequestMapping(value = "buyComplete.do", method = RequestMethod.POST)
	public String buyCheck(HttpServletRequest request, HttpSession session) {
		@SuppressWarnings("unchecked")
		Iterator<BuyCheckVO> buyIt = ((List<BuyCheckVO>) session.getAttribute("buyList")).iterator();
		while (buyIt.hasNext()) {
			BuyCheckVO buy = buyIt.next();
			ShopVO shop = buy.getShop();
			long shopSeq = shop.getShopSeq();
			Iterator<BuyItemVO> buyItemIt = buy.getBuyItemList().iterator();
			while (buyItemIt.hasNext()) {
				BuyItemVO buyItem = buyItemIt.next();
				ItemVO item = buyItem.getItem();
				long categorySeq = item.getCategorySeq();
				long itemSeq = item.getItemSeq();
				long buyCnt = buyItem.getBuyCnt();
				StockVO stock = new StockVO();
				stock.setShopSeq(shopSeq);
				stock.setCategorySeq(categorySeq);
				stock.setItemSeq(itemSeq);
				stock = stockService.select(stock);
				stock.setSold(stock.getSold() + buyCnt);
				long remain = stock.getRemain();
				if (remain >= buyCnt) {
					stock.setRemain(remain - buyCnt);
					stockService.update(stock);
					SoldLogVO soldLog = new SoldLogVO(shop.getShopCount(), buyCnt, shopSeq, categorySeq, itemSeq);
					soldLogService.insert(soldLog);
				}
			}
		}
		session.removeAttribute("buyList");
		return "redirect:" + PATH + "buy.do";
	}
}
