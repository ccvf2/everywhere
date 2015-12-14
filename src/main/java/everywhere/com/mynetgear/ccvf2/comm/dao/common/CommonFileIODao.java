package everywhere.com.mynetgear.ccvf2.comm.dao.common;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;

/**
 * @author 배성욱
 * @createDate 2015. 12. 9.
 * @described 공통파일 Data Access Object 인터페이스
 * @reference interface
 */
public interface CommonFileIODao {
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 9.
	 * @described 공통파일 데이터베이스 입력
	 * @param commonFileIODto
	 * @return
	 */
	
	public int insertFileInfo(CommonFileIODto commonFileIODto);

	/**
	 * @author 안희진
	 * @createDate 2015. 12. 14.
	 * @described 공통파일의 데이터를 한개씩 가져오는 함수
	 * @return
	 */
	public CommonFileIODto getOneFileDto(int file_no);
}
