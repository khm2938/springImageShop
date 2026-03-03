package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.common.security.domain.CustomUser;
import com.project.domain.BoardComment;
import com.project.domain.Member;
import com.project.service.BoardCommentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/comment")
public class BoardCommentController {

	@Autowired
	private BoardCommentService commentService;

	// 댓글 등록 페이지
	@GetMapping("/register")
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public void registerForm(int boardNo, Model model, Authentication authentication) throws Exception {
		// 로그인한 사용자 정보 획득
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		Member member = customUser.getMember();

		BoardComment comment = new BoardComment();
		// 댓글을 달고자하는 해당 게시글
		comment.setBoardNo(boardNo);
		// 로그인한 사용자 아이디를 등록 페이지에 표시
		comment.setCommenter(member.getUserId());
		model.addAttribute(comment);
	}

	// 댓글 등록 처리
	@PostMapping("/register")
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String register(BoardComment comment, Authentication authentication, RedirectAttributes rttr)
			throws Exception {

		CustomUser customUser = (CustomUser) authentication.getPrincipal();

		comment.setCommenter(customUser.getUsername());

		int count = commentService.register(comment);
		rttr.addFlashAttribute("msg", count != 0 ? "SUCCESS" : "FAIL");

		return "redirect:/board/read?boardNo=" + comment.getBoardNo();
	}

	// 댓글 수정 처리
	@PostMapping("/modify")
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String modify(BoardComment comment, Authentication authentication, RedirectAttributes rttr)
			throws Exception {

		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		comment.setCommenter(customUser.getUsername());

		int count = commentService.modify(comment);
		rttr.addFlashAttribute("msg", count != 0 ? "SUCCESS" : "FAIL");

		return "redirect:/board/read?boardNo=" + comment.getBoardNo();
	}

	// 댓글 삭제 처리
	@PostMapping("/remove")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
	public String remove(BoardComment comment, Authentication authentication, RedirectAttributes rttr) throws Exception {

		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		String loginId = customUser.getUsername();

		boolean isAdmin = false;

		for (GrantedAuthority auth : authentication.getAuthorities()) {
			if (auth.getAuthority().equals("ROLE_ADMIN")) {
				isAdmin = true;
				break;
			}
		}

		int count;
		
		if (isAdmin) {
			count = commentService.removeAdmin(comment);
		} else {
			comment.setCommenter(loginId);
			count = commentService.remove(comment);
		}

		rttr.addFlashAttribute("msg", count != 0 ? "SUCCESS" : "FAIL");
		return "redirect:/board/read?boardNo=" + comment.getBoardNo();
	}

}
