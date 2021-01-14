package com.macssusa.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macssusa.model.BoardService;
import com.macssusa.model.BoardVO;
import com.macssusa.model.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MemberService mService;
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		if (!mService.isAdminExist()) {
			mService.adminCreation();
		} 
		
		List<BoardVO> macReviewList = null;
		List<BoardVO> macQuestionList = null;
		List<BoardVO> addonReviewList = null;
		List<BoardVO> addonQuestioList = null;
		macReviewList = bService.getRecentBoardList(1);
		macQuestionList = bService.getRecentBoardList(3);
		addonReviewList = bService.getRecentBoardList(2);
		addonQuestioList = bService.getRecentBoardList(4);
		model.addAttribute("macReviewList",macReviewList);
		model.addAttribute("macQuestionList",macQuestionList);
		model.addAttribute("addonReviewList",addonReviewList);
		model.addAttribute("addonQuestioList",addonQuestioList);
		
		return "home";
	}
	
}
