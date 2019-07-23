package com.esther.adminBoard;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.esther.util.SendMailUpdate;
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
	//예약 업데이트 
		@RequestMapping(value = "/updateEvent", method = RequestMethod.POST)
		@ResponseBody
		public int  updateEvent(@RequestBody Map formData,HttpServletRequest httpRequest) throws ParseException{
			logger.info("ajax 예약 updateEvent>>>>>>>>>>>>>>>>>>>" );
				System.out.println("컨트롤에서 출력"+formData);
				ReservationVO vo = new ReservationVO();
				vo.setReserv_idx(Integer.valueOf((String)formData.get("index")));
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
				SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
				long ms = df.parse(strTime).getTime();
				Time time = new Time(ms);
		//		Time time = (Time) formData.get("time");
				System.out.println(time);
				vo.setReserv_time(time);
				int status =  Integer.parseInt((String) formData.get("status"));
				vo.setReserv_status(status);
				System.out.println("vo: "+vo.toString());
				
				//이메일 발송 성공1, 
				//디비 저장 성공1,
				//에러 0, 
				//이메일 발송 에러 2
				SendMailUpdate smu = new SendMailUpdate();
				int result;
				try {
					// 디비에 예약정보 저장
					result = sqlSession.update("reservationMapper.updateEvent",vo);
					logger.info( "데이터 업데이트 성공이면  1 : " + result);
					if(result == 1){
						// 이메일 발송
						int resp = smu.sendmail(vo);
						System.out.println("결과가 1이면 성공 이메일 발송 성공  = "+resp);
						result = resp;
					}
				} catch (Exception e) {
					System.out.println("컨트롤러에서 에러"+vo.toString());
					e.printStackTrace();
					result = 0;
				}
				
				return result;
				
		}
		//예약 등록
				@RequestMapping(value = "/addEvent", method = RequestMethod.POST)
				@ResponseBody
				public int addEvent(@RequestBody Map formData,HttpServletRequest httpRequest) throws ParseException{
					logger.info("ajax 예약 addEvent>>>>>>>>>>>>>>>>>>>" );
						System.out.println("addEvent 어드민 : "+formData);
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
						SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
						long ms = df.parse(strTime).getTime();
						Time time = new Time(ms);
						vo.setReserv_time(time);
						
						//이메일 발송 성공1, 
						//디비 저장 성공1,
						//에러 0, 
						//이메일 발송 에러 2
						SendMail sm = new SendMail();
						int result;
						try {
							// 디비에 예약정보 저장
							result = sqlSession.insert("reservationMapper.addEvent",vo);
							logger.info( "데이터 업데이트 성공이면  1 : " + result);
							if(result == 1){
								// 이메일 발송
								int resp = sm.sendmail(vo);
								System.out.println("결과가 1이면 성공 이메일 발송 성공  = "+resp);
								result = resp;
							}
						} catch (Exception e) {
							System.out.println("컨트롤러에서 에러"+vo.toString());
							e.printStackTrace();
							result = 0;
						}
						
						return result;
						
				}
		
}
