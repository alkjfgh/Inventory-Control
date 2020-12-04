package com.inventory.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inventory.app.domain.CategoryVO;
import com.inventory.app.domain.ItemInfoVO;
import com.inventory.app.domain.ItemListVO;
import com.inventory.app.domain.ShopInfoVO;
import com.inventory.app.domain.ShopVO;
import com.inventory.app.service.CategoryService;
import com.inventory.app.service.ItemInfoService;
import com.inventory.app.service.ShopService;
import com.inventory.app.service.StockService;

@Controller
public class BuyerController {

	@Autowired
	private ShopService shopService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private StockService stockService;
	
	@Autowired
	private ItemInfoService itemInfoService;
	
	@RequestMapping(value = "buy.do", method = RequestMethod.GET)
	public String buyView(Model model) {
		List<ShopInfoVO> shopInfoList = new ArrayList<ShopInfoVO>();
		Iterator<ShopVO> shopIt = shopService.selectList(null).iterator(); 
		while(shopIt.hasNext()) {
			List<ItemListVO> categoryList = new ArrayList<ItemListVO>();
			ShopVO shop = shopIt.next();
			long shopSeq = shop.getShopSeq();
			int categorySize = categoryService.selectCnt();
			for(int i=1;i<=categorySize;i++) {
				List<ItemInfoVO> itemInfoList = itemInfoService.selectList(shopSeq, i);
				int itemInfoListSize = itemInfoList.size();
				if(itemInfoListSize > 0) {
					CategoryVO category = new CategoryVO();
					category.setCategorySeq(i);
					category = categoryService.select(category);
					categoryList.add(new ItemListVO(category, itemInfoListSize, itemInfoList));
				}
			}
			shopInfoList.add(new ShopInfoVO(shop, categoryList.size(), categoryList));
		}
		
		Iterator<ShopInfoVO> shopInfoIt = shopInfoList.iterator();
		while(shopInfoIt.hasNext()) {
			ShopInfoVO shopInfo = shopInfoIt.next();
			System.out.println(shopInfo.getShop());
			Iterator<ItemListVO> categoryIt = shopInfo.getCategoryList().iterator();
			while(categoryIt.hasNext()){
				ItemListVO categoryInfo = categoryIt.next();
				System.out.println(categoryInfo.getCategory());
				Iterator<ItemInfoVO> itemIt = categoryInfo.getItemList().iterator();
				while(itemIt.hasNext()) {
					System.out.println(itemIt.next());
				}
			}
		}
		
		model.addAttribute("shopInfoList", shopInfoList);
		return "buy";
	}
}
