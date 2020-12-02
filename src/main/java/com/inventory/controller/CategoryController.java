package com.inventory.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inventory.app.domain.CategoryVO;
import com.inventory.app.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/updateCategory.do")
	public String updateCategoryView(Model model) {
		List<CategoryVO> categoryList = categoryService.selectList(null);
		model.addAttribute("categoryList", categoryList);
		return "updateCategory";
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
			if (category != null)
				categoryService.delete(category);
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
}
