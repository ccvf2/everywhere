package everywhere.com.mynetgear.ccvf2.comm.dto.common;

import java.io.File;

/**
 * @author 배성욱
 * @createDate 2015. 12. 8.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public class CommonFileIODto {
	/** 파일 : 파일 고유번호 */
	private int file_no=0;
	/** 파일 : 파일 사용처 코드 */
	private String type_code="";
	/** 파일 : 파일 사용처 글코드 */
	private int write_no=0;
	/** 파일 : 파일 확장자 */
	private String extension="";
	/** 파일 : 사용자자 업로드한 파일명 */
	private String real_name="";
	/** 파일 : 서버에 실제저장 파일명 */
	private String save_name="";
	/** 파일 : 서버에 실제저장 파일위치 */
	private String save_path="";
	/** 파일 : 파일크기 */
	private long file_size=0;
	/** 파일 : 파일객체 */
	private File file=null;
	
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getType_code() {
		return type_code;
	}
	public void setType_code(String type_code) {
		this.type_code = type_code;
	}
	public int getWrite_no() {
		return write_no;
	}
	public void setWrite_no(int write_no) {
		this.write_no = write_no;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}
	public String getSave_name() {
		return save_name;
	}
	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}
	public String getSave_path() {
		return save_path;
	}
	public void setSave_path(String save_path) {
		this.save_path = save_path;
	}
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	
	
}
