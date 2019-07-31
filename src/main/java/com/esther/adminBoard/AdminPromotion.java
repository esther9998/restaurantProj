package com.esther.adminBoard;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.esther.model.ReservationVO;

@Controller
public class AdminPromotion {
	
@Autowired
private SqlSession sqlSession;
private static final Logger logger = LoggerFactory.getLogger(AdminPromotion.class);

@RequestMapping(value = "/adminBoard/promotion")
public ModelAndView  adminPromotion(ReservationVO  vo, HttpSession session, Locale locale, HttpServletResponse response) throws IOException {
	ModelAndView mav = new ModelAndView();
	
	
	
	
	mav.setViewName("/adminBoard/adminPromotion");
	return mav;
	}
}
