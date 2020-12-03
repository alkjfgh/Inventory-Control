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
public class UserController {

	@Autowired
	private UserService service;

	@RequestMapping(value = "SignIn.do", method = RequestMethod.GET)
	public String signInView() {
		return "signIn";
	}

	@RequestMapping(value = "SignIn.do", method = RequestMethod.POST)
	public String signIn(UserVO vo, HttpServletResponse response, HttpSession session) throws IOException {
		UserVO get = service.select(vo);
		if (get != null && get.getUserPassword().equals(vo.getUserPassword())) {
			System.out.println("success");
			session.setAttribute("user", get);
			if(get.getUserLevel() == 9) return "master";
			return "redirect:ShopInfo.do";
		} else {
			System.out.println("failed");
			alert("잘못된 아이디 또는 비밀번호 입니다.", response);
			return "signIn";
		}
	}

	@RequestMapping(value = "SignUp.do", method = RequestMethod.GET)
	public String signUpView() {
		return "signUp";
	}

	@RequestMapping(value = "SignUp.do", method = RequestMethod.POST)
	public String signUp(UserVO vo, HttpSession session) {
		vo.setUserLevel((short) 1);
		service.insert(vo);
		session.setAttribute("user", vo);
		return "insertShop";
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
