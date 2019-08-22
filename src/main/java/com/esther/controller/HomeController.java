package com.esther.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.esther.model.PromotionVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model,HttpServletRequest request) throws JsonProcessingException {
		logger.info("Welcome home! The client locale is {}.", locale);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/home");
		
		// 이미지 파일 가져오기
				String folderPath = request.getSession().getServletContext().getRealPath("/");

		// Promotion 데이터 가져오기
		List<PromotionVO> list = sqlSession.selectList("adminMapper.selectPromotion");
		  String jsonPromo = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(list);
		  System.out.println("jsonPromotion Data ::: "+jsonPromo);
		  mav.addObject("jsonPromo", jsonPromo);
		  
		  
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		
		return mav;
	}
	
}
