package com.esther.adminBoard;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.resource.HttpResource;

import com.esther.controller.HomeController;
import com.esther.model.AdminVO;
import com.esther.util.SendMail;
import com.esther.util.SendMailForgot;

@Controller
public class AdminLogin {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminLogin.class);
	@RequestMapping(value = "/single/login")
	public ModelAndView adminLogin(HttpSession session, AdminVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/adminBoard/adminLogin");
		return mav;
	}
	//로그인 체크 
	@RequestMapping(value="/admin_chk", method = RequestMethod.POST)
	public @ResponseBody AdminVO admin_loginChk(HttpSession session, HttpServletResponse res, @RequestParam Map<String, String> map ) throws IOException {
		AdminVO vo  = new AdminVO();
		vo.setAdmin_email(map.get("email"));
		vo.setAdmin_pw(map.get("pw"));
		
		AdminVO rst =null;
		//데이터값 조회 
		rst = sqlSession.selectOne("adminMapper.selectAdmin", vo);
		if(rst != null){
			session.setAttribute("admin_session", vo.getAdmin_email());
			Object ss = session.getAttribute("admin_session");
			System.out.println("------  session --------"+ ss);
			return rst;
		}else{
			Object ss = session.getAttribute("admin_session");
			System.out.println("------  session 없어야 --------"+ ss);
			return null;
		}
		
	}
	@RequestMapping(value = "/adminBoard/register")
	public ModelAndView adminRegister() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/adminBoard/adminRegister");
		return mav;
	}
	
	//로그인 체크 
		@RequestMapping(value="/register_chk", method = RequestMethod.POST)
		@ResponseBody
		public int register_chk(HttpSession session, HttpServletResponse res, @RequestParam Map<String, String> map ) throws IOException {
			AdminVO vo  = new AdminVO();
			vo.setAdmin_name(map.get("name"));
			vo.setAdmin_email(map.get("email"));
			vo.setAdmin_pw(map.get("pw"));
			
			int rst;
			//admin 등
			rst = sqlSession.insert("adminMapper.insertAdmin", vo);
			
			if(rst == 1){ 
				return rst;
			}else{
				return rst;
			}
			
		}
//		로그아웃  
		@RequestMapping(value = "/adminBoard/logout")
		public void adminLogout(HttpSession session,  HttpServletResponse res ) throws IOException {
			session.invalidate();
			res.sendRedirect("/adminBoard/main");
		}
//		비번 아이디 찾기 뷰
		@RequestMapping(value = "/adminBoard/forgot")
		public ModelAndView adminForgot() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/adminBoard/adminForgot");
			return mav;
		}
//		패스워드 리셋 페이지  
		@RequestMapping(value = "/adminBoard/reset", method = RequestMethod.POST)
		@ResponseBody
		public int adminReset(HttpServletResponse res, @RequestBody  Map param) throws IOException {
			SendMailForgot smf = new SendMailForgot();
			String  recipient = (String)param.get("email");
			int result = 0;
			try {
				// 이메일 발송
				result = smf.sendmail(recipient);
				logger.info( "이메일 발송 성공이면  1 : " + result);
				return result;
			} catch (Exception e) {
				e.printStackTrace();
				return result;
			}
		//	res.sendRedirect("/adminBoard/main");
		}
		
}
