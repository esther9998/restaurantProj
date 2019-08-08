package com.esther.adminBoard;

import java.io.File;
import java.io.IOException;
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

import com.esther.model.ReservationVO;

@Controller
public class AdminPromotion {
	
@Autowired
private SqlSession sqlSession;
private static final Logger logger = LoggerFactory.getLogger(AdminPromotion.class);

@Resource(name="uploadPath")
String uploadPath;

@RequestMapping(value = "/adminBoard/promotion")
public ModelAndView  adminPromotion(ReservationVO  vo, HttpSession session, Locale locale, HttpServletResponse response) throws IOException {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/adminBoard/adminPromotion");
	return mav;
	}

@RequestMapping("/adminBoard/promotionForm")
@ResponseBody
public ModelAndView  promotionForm(MultipartHttpServletRequest request, @RequestParam HashMap<String, Object> params) throws IOException {
	ModelAndView mav = new ModelAndView();
	List<MultipartFile> mFiles = request.getFiles("file");
	for(MultipartFile mFile : mFiles) {
		System.out.println("file length : " + mFile.getBytes().length); 
		String orgName = mFile.getOriginalFilename(); 
		
		String fakeName = UUID.randomUUID().toString().replace("-", "");
		params.put("fakeName", fakeName); // 가짜이름
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;
System.out.println("vvvvvvvvvvvvvv"+rootPath);
        	File target = new File(uploadPath, orgName);
        	if (!target.exists()) {
        		try{
        			target.mkdir(); //폴더 생성합니다.
        		    System.out.println("폴더가 생성되었습니다.");
        	        } 
        	        catch(Exception e){
        		    e.getStackTrace();
        		}        
        	}else{
        		System.out.println("이미 폴더가 생성되어 있습니다.");
        	}
        	
        	FileCopyUtils.copy(mFile.getBytes(), target);
        //필요정보 파람스에 담은 후 ,board_attach DB insert 쿼리날림.(*없던 boardSeq도 담겼다.)
    //    attFileDao.addAttFile(params);
        
        //3. DB에 정보 저장만했으니, 이제 실제파일을 지정해놓은 물리적 위치로 카피 ..
      
    }
	System.out.println(params);
	mav.setViewName("/adminBoard/adminPromotion");
	return mav;
	}
}
	
