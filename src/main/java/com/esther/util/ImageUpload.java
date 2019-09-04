package com.esther.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.esther.model.PromotionVO;

public class ImageUpload {

	public Map imgUpload(MultipartFile mFile, String folderPath) {
		PromotionVO vo = new PromotionVO();
		Map<String, String> map = new HashMap<String, String>();
		
        File imgFolder = new File(folderPath+"/resources/imgUpload");
        if(!imgFolder.exists()) {
        	imgFolder.mkdirs();
        }
        	
        	
        //서버 파일이름 (날짜 + uuid)
        SimpleDateFormat sdf= new SimpleDateFormat("yyyMMdd");
        String date = sdf.format(new Date());
        String uu = UUID.randomUUID().toString().replace("-", "");
        String fileNm = date + uu;
        
        //서버에 파일 쓰기
        File file = new File(imgFolder, fileNm);
        
        try {
			mFile.transferTo(file);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        map.put("serverFileNm", fileNm);
		return map;
		
	}
}
