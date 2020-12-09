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
import com.inventory.app.domain.CategoryVO;
import com.inventory.app.domain.ItemInfoVO;
import com.inventory.app.domain.ItemListVO;
import com.inventory.app.domain.ItemVO;
import com.inventory.app.domain.ShopInfoVO;
import com.inventory.app.domain.ShopVO;
import com.inventory.app.domain.StockVO;
import com.inventory.app.service.CategoryService;
import com.inventory.app.service.ItemInfoService;
import com.inventory.app.service.ItemService;
import com.inventory.app.service.ShopService;
import com.inventory.app.service.StockService;

@Controller
@RequestMapping("/buy/")
public class BuyerController {

	private final static String PATH = "/buy/";

	@Autowired
	private ShopService shopService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ItemService itemService;

	@Autowired
	private StockService stockService;

	@Autowired
	private ItemInfoService itemInfoService;

	@RequestMapping(value = "buy.do", method = RequestMethod.GET)
	public String buyView(Model model) {
		List<ShopInfoVO> shopInfoList = new ArrayList<ShopInfoVO>();
		Iterator<ShopVO> shopIt = shopService.selectList(null).iterator();
		while (shopIt.hasNext()) {
			List<ItemListVO> categoryList = new ArrayList<ItemListVO>();
			ShopVO shop = shopIt.next();
			if (shop.getShopSeq() == 2)
				shop = shopIt.next();
			long shopSeq = shop.getShopSeq();
			int categorySize = categoryService.selectCnt();
			for (int i = 1; i <= categorySize; i++) {
				List<ItemInfoVO> itemInfoList = itemInfoService.selectList(shopSeq, i);
				int itemInfoListSize = itemInfoList.size();
				for (int j = 0; j < itemInfoListSize; j++) {
					if (itemInfoList.get(j).getRemain() == 0) {
						itemInfoList.remove(j);
						j--;
						itemInfoListSize--;
					}
				}
				if (itemInfoListSize > 0) {
					CategoryVO category = new CategoryVO();
					category.setCategorySeq(i);
					category = categoryService.select(category);
					categoryList.add(new ItemListVO(category, itemInfoListSize, itemInfoList));
				}
			}
			if (categoryList.size() > 0)
				shopInfoList.add(new ShopInfoVO(shop, categoryList.size(), categoryList));
		}

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
				if (shop.getShopSeq() != null && shopSeq != shop.getShopSeq()) {
					if (itemList.size() > 0) {
						System.out.println(itemList);
						buyList.add(new BuyCheckVO(shop, itemList));
						itemList = new ArrayList<BuyItemVO>();
						duplicateCheck.clear();
					}
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
			long shopSeq = buy.getShop().getShopSeq();
			Iterator<BuyItemVO> buyItemIt = buy.getBuyItemList().iterator();
			while (buyItemIt.hasNext()) {
				BuyItemVO buyItem = buyItemIt.next();
				ItemVO item = buyItem.getItem();
				long buyCnt = buyItem.getBuyCnt();
				StockVO stock = new StockVO();
				stock.setShopSeq(shopSeq);
				stock.setCategorySeq(item.getCategorySeq());
				stock.setItemSeq(item.getItemSeq());
				stock = stockService.select(stock);
				stock.setSold(stock.getSold() + buyCnt);
				if (stock.getRemain() >= buyCnt) {
					stock.setRemain(stock.getRemain() - buyCnt);
					stockService.update(stock);
				}
			}

		}

		session.removeAttribute("buyList");
		return "redirect:" + PATH + "buy.do";
	}
}
