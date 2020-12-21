package com.inventory.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inventory.app.domain.ShopVO;
import com.inventory.app.domain.UserVO;
import com.inventory.app.service.ShopService;
import com.inventory.app.service.UserService;

@Controller
@RequestMapping("/user/")
public class UserController {

	private final static String PATH = "/user/";

	@Autowired
	private UserService userService;
	
	@Autowired
	private ShopService shopService;

	@RequestMapping(value = "SignIn.do", method = RequestMethod.GET)
	public String signInView(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			Cookie[] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("user")) {
					user = new UserVO();
					user.setUserId(cookie.getValue());
					user = userService.select(user);
					session.setAttribute("user", user);
					ShopVO shop = new ShopVO();
					shop.setShopSeq(user.getShopSeq());
					shop = shopService.select(shop);
					session.setAttribute("shop", shop);
					break;
				}
			}
		}
		if (user != null) {
			int level = user.getUserLevel();
			if (level == 1)
				return "redirect:/shop/ShopInfo.do";
			else if (level == 9)
				return "redirect:/master/master.do";
		}
		return PATH + "signIn";
	}

	@RequestMapping(value = "SignIn.do", method = RequestMethod.POST)
	public String signIn(UserVO vo, HttpServletResponse response, HttpSession session, HttpServletRequest request)
			throws IOException {
		UserVO get = userService.select(vo);
		if (get != null && get.getUserPassword().equals(vo.getUserPassword())) {
			if (request.getParameter("keepLogin") != null && request.getParameter("keepLogin").equals("on")) {
				Cookie cookie = new Cookie("user", get.getUserId());
				cookie.setComment("접속 아이디");
				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 24 * 365);
				response.addCookie(cookie);
			}
			session.setAttribute("user", get);
			ShopVO shop = new ShopVO();
			shop.setShopSeq(get.getShopSeq());
			shop = shopService.select(shop);
			session.setAttribute("shop", shop);
			if (get.getUserLevel() == 9)
				return "redirect:/master/master.do";
			return "redirect:/shop/ShopInfo.do";
		} else {
			alert("잘못된 아이디 또는 비밀번호 입니다.", response);
			return PATH + "signIn";
		}
	}

	@RequestMapping(value = "SignUp.do", method = RequestMethod.GET)
	public String signUpView(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user != null) {
			int level = user.getUserLevel();
			if (level == 1)
				return "redirect:/shop/ShopInfo.do";
			else if (level == 9)
				return "redirect:/master/master.do";
		}
		return PATH + "signUp";
	}

	@RequestMapping(value = "SignUp.do", method = RequestMethod.POST)
	public String signUp(UserVO user, HttpServletRequest request,HttpSession session) {
		user.setUserLevel((short) 1);
		try {
			userService.insert(user);
			session.setAttribute("user", user);
			return "redirect:/shop/insertShop.do";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:../home.do";
		}
	}

	@RequestMapping(value = "SignOut.do", method = RequestMethod.GET)
	public String signOut(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		session.invalidate();
		Cookie cookie = new Cookie("user", null);
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		return "redirect:/home.do";
	}
	
	@RequestMapping(value = "cancelInsertUser.do", method = RequestMethod.GET)
	public String cancelInsertUser(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		userService.delete(user);
		session.invalidate();
		return "redirect:/home.do";
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
}
