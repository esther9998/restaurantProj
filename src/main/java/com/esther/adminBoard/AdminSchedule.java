package com.esther.adminBoard;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.esther.controller.HomeController;
import com.esther.model.ReservationVO;
import com.esther.util.DateFormating;
import com.esther.util.SendMail;
import com.esther.util.TimeFormating;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.mysql.cj.xdevapi.JsonArray;

@RestController
public class AdminSchedule {
	@Autowired
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AdminSchedule.class);
	
	@RequestMapping(value="/adminBoard/scheduler")
	public ModelAndView adminScheduler(ReservationVO  vo, HttpSession session) throws JsonProcessingException{
		ModelAndView mav = new ModelAndView();
//		List<ReservationVO> rstVo = new ArrayList<>();
//		rstVo = sqlSession.selectList("reservationMapper.selectAll", vo);
//
//		String jsonRst = new ObjectMapper().writeValueAsString(rstVo);
//		mav.addObject("reserveList", jsonRst);
//		System.out.println(jsonRst);
		mav.setViewName("/adminBoard/adminScheduler");
		return mav;
	}
	
	@RequestMapping(value = "/getSchedule", method = RequestMethod.GET)
	@ResponseBody
	public void getSchedule(ReservationVO  vo, HttpSession session, HttpServletResponse resp) throws JsonProcessingException{
		List<ReservationVO> rstVo = new ArrayList<>();
		rstVo = sqlSession.selectList("reservationMapper.selectAll", vo);

		String jsonRst = new ObjectMapper().writeValueAsString(rstVo);
		System.out.println(jsonRst);
		try {
			resp.getWriter().printf(jsonRst);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	//예약 등록
		@RequestMapping(value = "/updateEvent", method = RequestMethod.POST)
		@ResponseBody
		public int  reservedInfo(@RequestBody Map formData,HttpServletRequest httpRequest){
			logger.info("ajax 예약 reservedInfo>>>>>>>>>>>>>>>>>>>" );
				System.out.println("컨트롤에서 출력"+formData);
				ReservationVO vo = new ReservationVO();
				
				vo.setReserv_name((String)formData.get("name"));
				vo.setReserv_phone((String)formData.get("phone"));
				vo.setReserv_email((String)formData.get("email"));
				vo.setReserv_persons(Integer.valueOf((String) formData.get("persons")));
				//데이트 형변환 
				String strDate = (String) formData.get("date");
				Date date = DateFormating.transformDate(strDate);
				vo.setReserv_date(date);
				//타임 형변
				String strTime = (String) formData.get("time");
				Time time = TimeFormating.transToTime(strTime);
				vo.setReserv_time(time);
				System.out.println("vo: "+vo.toString());
				
				//이메일 발송 성공1, 
				//디비 저장 성공1,
				//에러 0, 
				//이메일 발송 에러 2
				SendMail sm = new SendMail();
				try {
					// 이메일 발송
					int resp = sm.sendmail(vo);
					logger.info( "이메일 발송 성공이면  1 : " + resp);
						if(resp == 1){
							// 디비에 예약정보 저장
							int result = sqlSession.insert("insertReserv",vo);
							System.out.println("결과가 1이면 성공= "+result);
							return result;
						}else{
							return 0;
						}
					
				} catch (Exception e) {
					System.out.println("컨트롤러에서 에러"+vo.toString());
					e.printStackTrace();
					return 0;
				}
				
		}
		
}
