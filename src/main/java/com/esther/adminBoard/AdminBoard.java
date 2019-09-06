package com.esther.adminBoard;

import java.io.File;
import java.io.FileNotFoundException;
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
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.esther.model.ReservationVO;
import com.esther.util.GaApi;
import com.google.api.services.analyticsreporting.v4.AnalyticsReporting;
import com.google.api.services.analyticsreporting.v4.model.GetReportsResponse;


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
		Map map = null;
		if (session.getAttribute("admin_session") != null) {
			// 대쉬보드 GA데이터 요청 
			String key ="";
			try {
				File accFile = ResourceUtils.getFile( "classpath:json/client_secret.json");
				String file = accFile.toURI().toString();
				key = file.substring(5,file.length());
			} catch (FileNotFoundException e1) {
				// TODO Auto-generated catch block
				System.out.println("file not found ~~");
				e1.printStackTrace();
			}

			try {
				AnalyticsReporting service = GaApi.initializeAnalyticsReporting(key);
				GetReportsResponse resp = GaApi.getReport(service);
				System.out.println(resp);
				map = GaApi.printResponse(resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
				  
			mav.setViewName("/adminBoard/adminBoard");
			mav.addObject("gadata", map);
		} else {
			mav.setViewName("/adminBoard/adminLogin");
		}
		
		return mav;
	}
	

}
