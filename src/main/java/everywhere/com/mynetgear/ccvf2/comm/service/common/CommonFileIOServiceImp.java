package everywhere.com.mynetgear.ccvf2.comm.service.common;

import java.io.File;
import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import everywhere.com.mynetgear.ccvf2.comm.dao.common.CommonFileIODao;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;

/**
 * @author 배성욱
 * @createDate 2015. 12. 8.
 * @described 공통 파일 업로드 관련 클래스
 * @reference class
 */
@Component
public class CommonFileIOServiceImp implements CommonFileIOService {
@Autowired
private CommonFileIODao commonFileIODao;
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 8.
	 * @described 공통 파일 업로드입니다.
	 */
	@Override
	public CommonFileIODto requestWriteFileAndDTO(HttpServletRequest request, String fieldName, String savePath) {
		// 리턴할 CommonFileIODto 객체 인스턴스
		CommonFileIODto returnDto = null;
		String errorMsg = Constant.SYNB_NULL;
		try {
			MultipartHttpServletRequest mulltRequest = (MultipartHttpServletRequest) request;
			
			// 지정한 필드네임으로 파일을 선택
			MultipartFile upFile = mulltRequest.getFile(fieldName);
			if (upFile.isEmpty() == false) {
				String realFileName = StringUtils.substringBeforeLast(upFile.getOriginalFilename(), Constant.SYNB_DOT);
				String extension = StringUtils.substringAfterLast(upFile.getOriginalFilename(), Constant.SYNB_DOT);
				
				// DTO에 삽입
				returnDto = new CommonFileIODto();
				returnDto.setReal_name(realFileName);
				returnDto.setExtension(StringUtils.upperCase(extension));
				returnDto.setSave_name("_" + System.currentTimeMillis());
				returnDto.setSave_path(savePath);
				returnDto.setFile_size(upFile.getSize());
				File path = new File(savePath);
				File file = new File(path, returnDto.getSave_name() + Constant.SYNB_DOT+returnDto.getExtension());
				returnDto.setFile(file);

				upFile.transferTo(file);
			} else {
				errorMsg = "필드네임이 맞지 않거나 request객체에 파일이 첨부되어 있지 않습니다.";
			}
		} catch (Exception e) {
			System.out.println(Constant.LOG_ID3 + "공통파일 쓰기에서 문제가 발생하였습니다.");
			e.printStackTrace();
		} finally {
			System.out.println(errorMsg);
		}
		return returnDto;
	}

	
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 8.
	 * @described 작업실패 또는 삭제 요청시 파일 삭제 매소드
	 */
	@Override
	public boolean requestDeleteFile(String fullName) {
		boolean result = false;
		File file = new File(fullName);
		if (file.exists()) {
			file.delete();
			result=true;
		}
		return result;
	}
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 8.
	 * @described 작업실패 또는 삭제 요청시 파일 삭제 매소드(경로명과 파일명을 매개변수로 사용할 때)
	 */
	@Override
	public boolean requestDeleteFile(String savePath, String fileName) {
		boolean result = false;
		File file = new File(savePath, fileName);
		if (file.exists()) {
			file.delete();
			result=true;
		}
		return result;
	}



	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 9.
	 * @described 파일내용을 데이터베이스에 insert
	 */
	@Override
	public int insertFileInfo(CommonFileIODto commonFileIODto) {
		int result=0;
		commonFileIODao.insertFileInfo(commonFileIODto);
		result=commonFileIODto.getFile_no();
		
		//파일 업로드 실패 시 삭제처리
		if(result==0){
			String fullpath=commonFileIODto.getSave_path()+
					commonFileIODto.getSave_name()+
					Constant.SYNB_DOT+
					commonFileIODto.getExtension(); 
			requestDeleteFile(fullpath);
		}
		return result;
	}
	
	

}
