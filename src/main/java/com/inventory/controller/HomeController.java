package com.inventory.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.inventory.app.domain.UserVO;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@RequestMapping("home.do")
	public String home(HttpServletRequest request, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		if(user != null)
			return "redirect:/user/SignIn.do";
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("user")) {
				return "redirect:/user/SignIn.do";
			}
		}
		return "index";
	}
}
