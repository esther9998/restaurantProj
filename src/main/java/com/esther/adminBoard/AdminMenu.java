package com.esther.adminBoard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.esther.model.MenuVO;
import com.esther.model.PromotionVO;
import com.esther.util.ImageUpload;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AdminMenu {

	@Autowired
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AdminPromotion.class);

//	데이터를 두가지 형식
	@RequestMapping(value = "/adminBoard/menu")
	public ModelAndView adminMenu(HttpSession session, Locale locale, HttpServletRequest request)
			throws IOException {
		ModelAndView mav = new ModelAndView();
	
		
		List<MenuVO> list = sqlSession.selectList("menuMapper.selectMenu");
		System.out.println(list);
		ArrayList <HashMap<String,Object>> menuList = new ArrayList<HashMap<String,Object>>();
		
		for(MenuVO vo: list) { 
			HashMap<String, Object> map = new HashMap<String,Object>();
			map.put("menuIdx", vo.getIdx());
			map.put("menuPriority", vo.getPriority());
			map.put("menuCategory", vo.getCategory());
			map.put("menuStatus", vo.getStatus());
			map.put("menuTitle", vo.getMenu_title());
			map.put("menuPrice", vo.getMenu_price());
			map.put("menuContent", vo.getMenu_content());
			map.put("menuServerImgFile", vo.getmenu_serverImgFile());
			map.put("menuUserImgNm", vo.getmenu_userImgNm());
			map.put("menuCreatedAt", vo.getCreate_at());
			
			menuList.add(map);
		}
		String jsonMenu = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(list);
		//	  System.out.println("jsonPromotion Data ::: "+jsonPromo);
		
		// 이미지 파일 가져오기
		String folderPath = request.getSession().getServletContext().getRealPath("/");
				
			mav.addObject("menuList", menuList);
			mav.addObject("jsonMenu", jsonMenu);
			mav.addObject("imgPath", folderPath);
			mav.setViewName("/adminBoard/adminMenu");
		
		
		return mav;
	}
	
	
	@RequestMapping("/adminBoard/addMenuForm")
	@ResponseBody
	public void promotionForm(MultipartHttpServletRequest request, @RequestParam HashMap<String, Object> params)
			throws IOException {
		MultipartFile mFile = request.getFile("file");
		
		// 서버 이미지저장 폴더 path
		String folderPath = request.getSession().getServletContext().getRealPath("/");

		ImageUpload up = new ImageUpload();
		Map fileInfo = up.imgUpload(mFile, folderPath);
		System.out.println("메뉴 파일 업로드 결과 : " + fileInfo);
		System.out.println("form 파라미터:" + params);

		// db저장 (파일명, 서버파일명)
		MenuVO vo = new MenuVO();
		vo.setStatus(Integer.parseInt((String)params.get("status")));
		vo.setPriority(Integer.parseInt((String)params.get("priority")));
		vo.setCategory(Integer.parseInt((String)params.get("category")));
		vo.setMenu_title((String) params.get("title"));
		vo.setMenu_price((String) params.get("price"));
		vo.setMenu_content((String) params.get("content"));
		vo.setmenu_serverImgFile((String)fileInfo.get("serverFileNm"));
		vo.setmenu_userImgNm(mFile.getOriginalFilename());

		if(params.get("startDate")!=null) {
			vo.setStart_date((String) params.get("startDate"));
			vo.setEnd_date((String) params.get("endDate"));
		}

		vo.toString();

		int result;
		// 데이터값 조회
		result = sqlSession.insert("menuMapper.insertMenu", vo);
		System.out.println("결과가 1이면 데이터 삽입 성공 : " + result);

	}
	@RequestMapping("/adminBoard/editMenuForm")
	@ResponseBody
	public void editMenuForm(MultipartHttpServletRequest request, @RequestParam HashMap<String, Object> params)
			throws IOException {
		MenuVO vo = new MenuVO();

		// 서버 이미지저장 폴더 path
		String folderPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println(folderPath);
		Map fileInfo = null;
		MultipartFile mFile = request.getFile("editFile");
		System.out.println("mfile 결과 : "+mFile.isEmpty()); 
		if(mFile.isEmpty()) {
			System.out.println("서버파일 없을시 여기 들어와서 기존꺼 넣어야함.");
			vo.setmenu_serverImgFile((String)params.get("editImgNm"));
		}else {
			ImageUpload up = new ImageUpload();
			fileInfo = up.imgUpload(mFile, folderPath);
			
			vo.setmenu_serverImgFile((String)fileInfo.get("serverFileNm"));
		}
		System.out.println("Form 가져온 파라미터:" + params);
		System.out.println("수정 이미지 파일 업로드 있을때 : " + fileInfo );
		System.out.println("- : " + params.get("editPriority") );
		

		vo.setIdx(Integer.valueOf((String) params.get("editIdx")));
		vo.setPriority(Integer.valueOf((String)params.get("editPriority")));
		vo.setStatus(Integer.valueOf((String)params.get("editStatus")));
		vo.setCategory(Integer.valueOf((String)params.get("editCategory")));
		vo.setMenu_title((String) params.get("editTitle"));
		vo.setMenu_price((String) params.get("editPrice"));
		vo.setMenu_content((String) params.get("editContent"));
		vo.setmenu_userImgNm((String) params.get("editFileName02"));
		System.out.println("업데이트할 데이터 : " + vo );

		vo.toString();

		int result;
		// 데이터값 조회
		result = sqlSession.update("menuMapper.updateMenu", vo);
		System.out.println("결과가 1이면 데이터 삽입 성공 : " + result);


	}
///////////////////////////////////// 카테고리 변경
@RequestMapping("/adminBoard/menuCategory")
@ResponseBody
public void menuCategory(@RequestBody HashMap<String, Integer> params)throws IOException {
MenuVO vo = new MenuVO();
// todo 파라미터 indx , priority 넘기기
vo.setIdx((Integer) params.get("boardIdx"));
vo.setCategory((Integer)params.get("boardCategory"));
int result;
result = sqlSession.update("menuMapper.updateMenuCategory",vo);
System.out.println("[카테고리 변경] 결과가 1이면 데이터 삽입 성공 : " + result);

}
///////////////////////////////////// 순위 변경
@RequestMapping("/adminBoard/menuPriority")
@ResponseBody
public void menuPriority(@RequestBody HashMap<String, Integer> params)throws IOException {
	MenuVO vo = new MenuVO();
	// todo 파라미터 indx , priority 넘기기
	vo.setIdx((Integer) params.get("boardIdx"));
	vo.setPriority((Integer)params.get("boardPriority"));
	
	int result;
	result = sqlSession.update("menuMapper.updateMenuPriority",vo);
	System.out.println("[순위 변경]결과가 1이면 데이터 삽입 성공 : " + result);

}

///////////////////////////////////// 상태 변경
@RequestMapping("/adminBoard/menuStatus")
@ResponseBody
public void menuStatus(@RequestBody HashMap<String, Integer> params)throws IOException {

	MenuVO vo = new MenuVO();
	// todo 파라미터 indx, status 넘기기
	vo.setIdx((Integer) params.get("boardIdx"));
	vo.setStatus((Integer)params.get("boardStatus"));
	
	int result;
	result = sqlSession.update("menuMapper.updateMenuStatus",vo);
	System.out.println("[상태 변경]결과가 1이면 데이터 삽입 성공 : " + result);
	
	
	}

///////////////////////////////////// 삭제
@RequestMapping("/adminBoard/menuDelete")
@ResponseBody
public void menuDelete(@RequestBody String request)throws IOException {

		MenuVO vo = new MenuVO();
		// todo 파라미터 indx, status 넘기기
		vo.setIdx(Integer.valueOf(request));
		
		
		int result; result = sqlSession.update("menuMapper.deleteMenu",vo);
		System.out.println("[삭제]결과가 1이면 데이터 삽입 성공 : " + result);
		
		
		}

	}
