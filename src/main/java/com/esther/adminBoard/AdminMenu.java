package com.esther.adminBoard;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMenu {

	@Autowired
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AdminPromotion.class);

//	데이터를 두가지 형식
	@RequestMapping(value = "/adminBoard/menu")
	public ModelAndView adminMenu(HttpSession session, Locale locale, HttpServletRequest request)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/adminBoard/adminMenu");
		
		
		
		return mav;
	}
		// 이미지 파일 가져오기
}
