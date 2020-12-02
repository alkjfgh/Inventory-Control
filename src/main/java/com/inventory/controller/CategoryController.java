package com.inventory.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inventory.app.domain.CategoryItemVO;
import com.inventory.app.domain.CategoryVO;
import com.inventory.app.domain.ItemListVO;
import com.inventory.app.domain.ItemVO;
import com.inventory.app.service.CategoryService;
import com.inventory.app.service.ItemService;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ItemService itemService;

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
		for(int i=1;i<=cnt;i++) {
			String categoryName = request.getParameter("categoryName_" + i);
			if(categoryName!=null && !categoryName.equals("")) {
				CategoryVO category = new CategoryVO();
				category.setCategoryName(categoryName);
				System.out.println(category);
			}
		}
		return "master";
	}


	@RequestMapping(value = "/masterInsertItem.do", method = RequestMethod.POST)
	public String masterInsertItem(HttpServletRequest request) {
		System.out.println(request.getParameter("categoryName"));
		System.out.println(request.getParameter("itemName"));
		System.out.println(request.getParameter("itemPrice"));
		System.out.println(request.getParameter("itemMaker"));
		return "master";
	}
	
	@RequestMapping(value = "/masterDeleteItem.do", method = RequestMethod.POST)
	public String masterDeleteItem(HttpServletRequest request) {
		System.out.println(request.getParameter("1_itemSeq_1"));
		return "master";
	}
}
