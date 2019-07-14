package com.esther.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.esther.model.AdminVO;

@Controller
public class LoginController {

	
		//로그인 페이지
		@RequestMapping(value="/admin/loginPage")
		public ModelAndView admin_loginPage(HttpSession session, HttpServletResponse res, @RequestParam Map<String, String> map ) throws IOException {
			ModelAndView mav = new ModelAndView();
				mav.setViewName("/admin/loginPage");
				return mav;
			
		}
	
}
