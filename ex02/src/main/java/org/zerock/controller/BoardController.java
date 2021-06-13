package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/register")
	public void register() {
		
	}

	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("register: " + board);
		
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, Model model) {
		
		log.info("/get");
		
		model.addAttribute("board", service.get(bno));
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("bno") Long bno, Model model) {
		
		log.info("/modify");
		
		model.addAttribute("board", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(@RequestParam("bno") Long bno, @RequestParam("title") String title, @RequestParam("content") String content, @RequestParam("writer") String writer, RedirectAttributes rttr) {
		
		BoardVO board = new BoardVO();
		
		board.setBno(bno);
		board.setTitle(title);
		board.setContent(content);
		board.setWriter(writer);
		
		log.info("modify : " + board);
		service.modify(board);
		

		rttr.addFlashAttribute("result", "success");
		
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove : " + bno);
		
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list";
	}
}
