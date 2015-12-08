package everywhere.com.mynetgear.ccvf2.comm.service.common;

import javax.servlet.http.HttpServletRequest;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 8.
 * @described 공통파일 서비스 인터페이스
 * @reference interface
 */
public interface CommonFileIOService {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 8.
	 * @described request객체를 받아 CommonFileIODto 객체로 반환
	 * @param request
	 * @param fieldName 
	 * @param savePath 
	 * @return
	 */
	public CommonFileIODto requestWriteFileAndDTO(HttpServletRequest request, String fieldName, String savePath);
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 8.
	 * @described 작업실패 또는 삭제 요청시 파일 삭제 매소드(경로명+파일명+확장자)
	 * @param savePath
	 * @param fileName
	 * @return
	 */
	public boolean requestDeleteFile(String fullName);
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 8.
	 * @described 작업실패 또는 삭제 요청시 파일 삭제 매소드(경로명과 파일명을 매개변수로 사용할 때)
	 * @param savePath
	 * @param fileName
	 * @return
	 */
	public boolean requestDeleteFile(String savePath, String fileName);
	
}
