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
public class BuyerController {

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
			long shopSeq = shop.getShopSeq();
			int categorySize = categoryService.selectCnt();
			for (int i = 1; i <= categorySize; i++) {
				List<ItemInfoVO> itemInfoList = itemInfoService.selectList(shopSeq, i);
				int itemInfoListSize = itemInfoList.size();
				for(int j=0;j<itemInfoListSize;j++) {
					if(itemInfoList.get(j).getRemain()==0) {
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
			if(categoryList.size() > 0)
				shopInfoList.add(new ShopInfoVO(shop, categoryList.size(), categoryList));
		}

		model.addAttribute("shopInfoList", shopInfoList);
		return "buy";
	}

	@RequestMapping(value = "buyCheck.do", method = RequestMethod.POST)
	public String buyCheckView(HttpServletRequest request, HttpSession session) {
		String cntCheck = request.getParameter("cnt");
		if (cntCheck == null || cntCheck.equals(""))
			return "index";
		int cnt = Integer.parseInt(cntCheck);
		List<BuyCheckVO> buyList = new ArrayList<BuyCheckVO>();
		Set<BuyCheckVO> buySet = new HashSet<BuyCheckVO>();
		for (int i = 1; i <= cnt; i++) {
			String nullCheck = request.getParameter("shop_" + i);
			if (nullCheck != null && !nullCheck.equals("")) {
				long shopSeq = Long.parseLong(nullCheck);
				long categorySeq = Long.parseLong(request.getParameter("category_" + i));
				long itemSeq = Long.parseLong(request.getParameter("item_" + i));
				long buyCnt = Long.parseLong(request.getParameter("total_" + i));
				ShopVO shop = new ShopVO();
				shop.setShopSeq(shopSeq);
				CategoryVO category = new CategoryVO();
				category.setCategorySeq(categorySeq);
				ItemVO item = new ItemVO();
				item.setCategorySeq(categorySeq);
				item.setItemSeq(itemSeq);
				BuyCheckVO buyCheck = new BuyCheckVO(shopService.select(shop), categoryService.select(category),
						itemService.select(item), buyCnt);
				if (!buySet.contains(buyCheck)) {
					buySet.add(buyCheck);
					buyList.add(buyCheck);
				}
			}
		}
		session.setAttribute("buyList", buyList);
		return "buyCheck";
	}

	@RequestMapping(value = "buyComplete.do", method = RequestMethod.POST)
	public String buyCheck(HttpServletRequest request, HttpSession session) {
		@SuppressWarnings("unchecked")
		Iterator<BuyCheckVO> buyIt = ((List<BuyCheckVO>) session.getAttribute("buyList")).iterator();
		while(buyIt.hasNext()) {
			BuyCheckVO buy = buyIt.next();
			StockVO stock = new StockVO();
			stock.setShopSeq(buy.getShop().getShopSeq());
			stock.setCategorySeq(buy.getCategory().getCategorySeq());
			stock.setItemSeq(buy.getItem().getItemSeq());
			stock = stockService.select(stock);
			stock.setSold(stock.getSold() + buy.getBuyCnt());
			stock.setRemain(stock.getRemain() - buy.getBuyCnt());
			stockService.update(stock);
		}
		
		session.removeAttribute("buyList");
		return "index";
	}
}
