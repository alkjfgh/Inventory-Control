package com.inventory.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inventory.app.domain.UserVO;
import com.inventory.app.service.UserService;

@Controller
@RequestMapping("/user/")
public class UserController {

	private final static String PATH = "/user/";

	@Autowired
	private UserService service;

	@RequestMapping(value = "SignIn.do", method = RequestMethod.GET)
	public String signInView(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
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
	public String signIn(UserVO vo, HttpServletResponse response, HttpSession session) throws IOException {
		UserVO get = service.select(vo);
		if (get != null && get.getUserPassword().equals(vo.getUserPassword())) {
			System.out.println("success");
			session.setAttribute("user", get);
			if (get.getUserLevel() == 9)
				return "redirect:/master/master.do";
			return "redirect:/shop/ShopInfo.do";
		} else {
			System.out.println("failed");
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
	public String signUp(UserVO vo, HttpSession session) {
		vo.setUserLevel((short) 1);
		service.insert(vo);
		session.setAttribute("user", vo);
		return "redirect:" + PATH + "insertShop";
	}

	@RequestMapping(value = "SignOut.do", method = RequestMethod.GET)
	public String signOut(HttpSession session) {
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
