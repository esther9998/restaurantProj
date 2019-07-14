package com.esther.adminBoard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.esther.model.ReservationVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.mysql.cj.xdevapi.JsonArray;

@RestController
public class AdminSchedule {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/adminBoard/scheduler")
	public ModelAndView adminScheduler(ReservationVO  vo, HttpSession session) throws JsonProcessingException{
		ModelAndView mav = new ModelAndView();
		List<ReservationVO> rstVo = new ArrayList<>();
		rstVo = sqlSession.selectList("reservationMapper.selectAll", vo);

		String jsonRst = new ObjectMapper().writeValueAsString(rstVo);
		mav.addObject("reserveList", jsonRst);
		System.out.println(jsonRst);
		mav.setViewName("/adminBoard/adminScheduler");
		return mav;
	}
}
