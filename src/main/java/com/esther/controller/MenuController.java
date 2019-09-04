package com.esther.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.esther.model.MenuVO;
import com.esther.model.PromotionVO;
import com.esther.util.ImageUpload;

@Controller
public class MenuController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 사용자 뷰 
	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public ModelAndView menu(Locale locale, Model model) {
		logger.info("메뉴 페이지 >>>>>>>>>>>>>>>>>>>" );
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/menu");
		
		//Select Menu
		
		return mav;
	}
	

}
