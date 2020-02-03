package com.esther.adminBoard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.RequestBody;
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
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AdminPromotion {

	@Autowired
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AdminPromotion.class);

//	데이터를 두가지 형식( json, list<map<vo>>)으로 전송함. 
	@RequestMapping(value = "/adminBoard/promotion")
	public ModelAndView adminPromotion(HttpSession session, Locale locale, HttpServletRequest request)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		// 이미지 파일 가져오기
		String folderPath = request.getSession().getServletContext().getRealPath("/");

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
					  promoList.add(map);
				  }

		  String jsonPromo = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(list);
	//	  System.out.println("jsonPromotion Data ::: "+jsonPromo);
		
		mav.addObject("promoList", promoList);
		mav.addObject("jsonPromo", jsonPromo);
		mav.addObject("imgPath", folderPath);
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

		ImageUpload up = new ImageUpload();
		Map fileInfo = up.imgUpload(mFile, folderPath);
		System.out.println("업로드 결과 : " + fileInfo);
		System.out.println("form 파라미터:" + params);

		// db저장 (파일명, 서버파일명)
		PromotionVO vo = new PromotionVO();
		vo.setStatus(Integer.parseInt((String)params.get("status")));
		vo.setPriority(Integer.parseInt((String)params.get("addPriority")));
		vo.setPromo_title((String) params.get("title"));
		vo.setPromo_price((String) params.get("price"));
		vo.setPromo_content((String) params.get("content"));
		vo.setPromo_imgNm((String) fileInfo.get("serverFileNm"));
		vo.setPromo_userFile(mFile.getOriginalFilename());
		vo.setStart_date((String) params.get("startDate"));
		vo.setEnd_date((String) params.get("endDate"));

		vo.toString();

		int result;
		// 데이터값 조회
		result = sqlSession.insert("adminMapper.insertPromotion", vo);
		System.out.println("결과가 1이면 데이터 삽입 성공 : " + result);

	}
	@RequestMapping("/adminBoard/editPromotionForm")
	@ResponseBody
	public void editPromotionForm(MultipartHttpServletRequest request, @RequestParam HashMap<String, Object> params)
			throws IOException {
		PromotionVO vo = new PromotionVO();

		// 서버 이미지저장 폴더 path
		String folderPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println(folderPath);
		Map fileInfo = null;
		MultipartFile mFile = request.getFile("editFile");
		System.out.println("mfile 결과 : "+mFile.isEmpty()); 
		if(mFile.isEmpty()) {
			vo.setPromo_imgNm((String) params.get("editImgNm"));
			vo.setPromo_uuid((String)params.get("editUuid"));
		}else {
			ImageUpload up = new ImageUpload();
			fileInfo = up.imgUpload(mFile, folderPath);
			
			vo.setPromo_imgNm((String)fileInfo.get("serverFileNm"));
		}
		System.out.println("Form 가져온 파라미터:" + params);
		System.out.println("수정 이미지 파일 업로드 있을때 : " + fileInfo );
		System.out.println("- : " + params.get("editPriority") );
		

		vo.setIdx(Integer.valueOf((String) params.get("editIdx")));
		vo.setPriority(Integer.valueOf((String)params.get("editPriority")));
		vo.setStatus(Integer.valueOf((String)params.get("editStatus")));
		vo.setPromo_title((String) params.get("editTitle"));
		vo.setPromo_price((String) params.get("editPrice"));
		vo.setPromo_content((String) params.get("editContent"));
		vo.setPromo_userFile((String) params.get("editFileName02"));
		vo.setStart_date((String) params.get("editStartDate"));
		vo.setEnd_date((String) params.get("editEndDate"));
		System.out.println("업데이트할 데이터 : " + vo );

		vo.toString();

		int result;
		// 데이터값 조회
		result = sqlSession.update("adminMapper.updatePromotion", vo);
		System.out.println("결과가 1이면 데이터 삽입 성공 : " + result);


	}
	///////////////////////////////////// 순위 변경
	@RequestMapping("/adminBoard/promoPriority")
	@ResponseBody
	public void promoPriority(@RequestBody HashMap<String, Integer> params)throws IOException {
		
		PromotionVO vo = new PromotionVO();
		// todo 파라미터 indx , priority 넘기기
		vo.setIdx((Integer) params.get("boardIdx"));
		vo.setPriority((Integer)params.get("boardPriority"));
		
		int result;
		result = sqlSession.update("adminMapper.updatePromotionPriority",vo);
		System.out.println("결과가 1이면 데이터 삽입 성공 : " + result);
		
	}
	
	///////////////////////////////////// 상태 변경
	@RequestMapping("/adminBoard/promoStatus")
	@ResponseBody
	public void promoStatus(@RequestBody HashMap<String, Integer> params)throws IOException {
		
		PromotionVO vo = new PromotionVO();
		// todo 파라미터 indx, status 넘기기
		vo.setIdx((Integer) params.get("boardIdx"));
		vo.setStatus((Integer)params.get("boardStatus"));
		
		int result;
		result = sqlSession.update("adminMapper.updatePromotionStatus",vo);
		System.out.println("결과가 1이면 데이터 삽입 성공 : " + result);
		
		
	}
	
	///////////////////////////////////// 삭제
	@RequestMapping("/adminBoard/promoDelete")
	@ResponseBody
	public void promoDelete(@RequestBody String request)
			throws IOException {
		
		PromotionVO vo = new PromotionVO();
		// todo 파라미터 indx, status 넘기기
		vo.setIdx(Integer.valueOf(request));
		
		
		 int result; result = sqlSession.update("adminMapper.deletePromotion",vo);
		 System.out.println("결과가 1이면 데이터 삽입 성공 : " + result);
		
		
	}
	
	
}
