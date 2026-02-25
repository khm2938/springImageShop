package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/auth")
public class LoginController {

	/**
	 * /login?error 또는 /login?logout 파라미터가 들어오면 JSP에서 메시지를 보여주도록 model에 실어줍니다.
	 */
	@GetMapping("/login")
	public String loginForm(String error, String logout, Model model) {
		log.info("error: {}", error);
		log.info("logout: {}", logout);

		if (error != null) {
			model.addAttribute("error", "로그인 에러!!!");
		}
		if (logout != null) {
			model.addAttribute("logout", "로그아웃!!!");
		}
		return "auth/loginForm";
	}

	// 로그아웃 페이지
	@RequestMapping("/logout")
	public String logoutForm() {
		log.info("logoutForm");
		return "auth/logoutForm";
	}

}
