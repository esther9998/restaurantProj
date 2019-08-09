package com.esther.adminBoard;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.esther.model.PromotionVO;
import com.esther.model.ReservationVO;
import com.esther.util.ImageUpload;

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

@RequestMapping("/adminBoard/promotionForm")
@ResponseBody
public void  promotionForm(MultipartHttpServletRequest request, @RequestParam HashMap<String, Object> params) throws IOException {
	MultipartFile mFile = request.getFile("file");
	
		//서버 저장 폴더 path
		String folderPath =  request.getSession().getServletContext().getRealPath("/");
		System.out.println(folderPath);
		
		ImageUpload up = new ImageUpload();
		int rst = up.imgUpload(mFile, folderPath);
		System.out.println("업로드 결과 1이면 성공 : "+rst +" // 파라미터:"+params);
        
		
        //db저장 (파일명, 서버파일명)
		PromotionVO vo = new PromotionVO();
		vo.setPromo_title((String)params.get("title"));
		vo.setPromo_title((String)params.get("price"));
		vo.setPromo_title((String)params.get("priority"));
		vo.setPromo_title((String)params.get("content"));
		vo.setPromo_title((String)params.get("status"));
		vo.setPromo_title((String)params.get("startDate"));
		vo.setPromo_title((String)params.get("endDate"));
        
      
	}
}
	
