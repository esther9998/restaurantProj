package com.esther.adminBoard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.esther.model.AdminVO;
import com.esther.model.PromotionVO;
import com.esther.model.ReservationVO;
import com.esther.util.ImageUpload;

@Controller
public class AdminPromotion {

	@Autowired
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AdminPromotion.class);

	@RequestMapping(value = "/adminBoard/promotion")
	public ModelAndView adminPromotion(HttpSession session, Locale locale, HttpServletRequest request)
			throws IOException {
		ModelAndView mav = new ModelAndView();

		// Promotion 데이터 가져오기
		List<PromotionVO> list = sqlSession.selectList("adminMapper.selectPromotion");
		// 데이터 매핑  
		ArrayList <HashMap<String,Object>> promoList = new ArrayList<HashMap<String,Object>>();
		  for(PromotionVO vo: list) { 
			  HashMap<String, Object> map = new HashMap<String,Object>();
			  map.put("idx" , vo.getIdx());
			  map.put("title" , vo.getPromo_title());
			  map.put("price" , vo.getPromo_price());
			  map.put("content" , vo.getPromo_content());
			  map.put("start" , vo.getStart_date());
			  map.put("end" , vo.getEnd_date());
			  map.put("priority" , vo.getPriority());
			  map.put("status" , vo.getStatus());
			  map.put("imgNm" , vo.getPromo_imgNm());
			  map.put("uuid" , vo.getPromo_uuid());
			  map.put("file" , vo.getPromo_userFile());
			  map.put("createdAt" , vo.getCreate_at());
			  System.out.println("///////////////"+ map);
			  promoList.add(map);
		  }
		  
		// 이미지 파일 가져오기
		String folderPath = request.getSession().getServletContext().getRealPath("/");
		
		

		mav.addObject("imgPath", folderPath);
		mav.addObject("promoList", promoList);
		mav.setViewName("/adminBoard/adminPromotion");
		return mav;
	}
	

	@RequestMapping("/adminBoard/promotionForm")
	@ResponseBody
	public void promotionForm(MultipartHttpServletRequest request, @RequestParam HashMap<String, Object> params)
			throws IOException {
		MultipartFile mFile = request.getFile("file");

		// 서버 이미지저장 폴더 path
		String folderPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println(folderPath);

		ImageUpload up = new ImageUpload();
		PromotionVO fileInfo = up.imgUpload(mFile, folderPath);
		System.out.println("업로드 결과 : " + fileInfo + " // 파라미터:" + params);

		// db저장 (파일명, 서버파일명)
		PromotionVO vo = new PromotionVO();
		if (params.get("status") == "active") {
			vo.setStatus(1);
		} else {
			vo.setStatus(0);
		}
		vo.setPriority(params.get("priority"));
		vo.setPromo_title((String) params.get("title"));
		vo.setPromo_price((String) params.get("price"));
		vo.setPromo_content((String) params.get("content"));
		vo.setPromo_imgNm(fileInfo.getPromo_imgNm());
		vo.setPromo_uuid(fileInfo.getPromo_uuid());
		vo.setPromo_userFile((String) params.get("file"));
		vo.setStart_date((String) params.get("startDate"));
		vo.setEnd_date((String) params.get("endDate"));

		vo.toString();

		int result;
		// 데이터값 조회
		result = sqlSession.insert("adminMapper.insertPromotion", vo);
		System.out.println("결과가 1이면 데이터 삽입 성공 : " + result);

	}
}
