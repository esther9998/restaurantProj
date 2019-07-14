package com.esther.adminBoard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.esther.model.ReservationVO;


@Controller
public class AdminBoard {
	
	@Autowired
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AdminBoard.class);
	@RequestMapping(value = "/adminBoard/main")
	public ModelAndView  adminBoard(ReservationVO  vo, HttpSession session, Locale locale, HttpServletResponse response) throws IOException {
		logger.info("admin 페이지 >>>>>>>>>>>>>>>>>>>" );
		ModelAndView mav = new ModelAndView();
		String url="";
		if (session.getAttribute("admin_session") != null) {
		//	url = "/adminBoard/main";
			mav.setViewName("/adminBoard/adminBoard");
			
		} else {
		//	url = "/adminBoard/login";
			mav.setViewName("/adminBoard/adminLogin");
		}
		return mav;
//		 response.sendRedirect(url);
	}
	

	//로그인 페이지
	@RequestMapping(value="/adminBoard/loginPage")
	public ModelAndView admin_loginPage(HttpSession session ) throws IOException {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/admin/loginPage");
			return mav;
		
	}
		
}
