package com.esther.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class ImageUpload {

	public int imgUpload(MultipartFile mFile, String folderPath) {
		
        File imgFolder = new File(folderPath+"/imgUpload");
        if(!imgFolder.exists()) {
        	imgFolder.mkdirs();
        }
        	
        	
        //서버 파일이름 
        SimpleDateFormat sdf= new SimpleDateFormat("yyyMMdd");
        String date = sdf.format(new Date());
        String uu = UUID.randomUUID().toString().replace("-", "");
        String fileNm = date + uu;
        
        //서버에 파일 쓰기
        File file = new File(imgFolder, fileNm);
        try {
			mFile.transferTo(file);
			return 1;
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
		
		
		
	}
}
