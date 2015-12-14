/**
 * @author 배성욱
 * @createDate 2015. 12. 5.
 * @described 공통처리를 상수
 * @reference Constant-class
 */
package everywhere.com.mynetgear.ccvf2.comm.util.common;

/**
 * @author 배성욱
 * @createDate 2015. 12. 6.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
public class Constant {
	/** 개발자 로그 : 개발자 전용 */
	public static final String LOG_ID1 = "★★★log★★★  ";
	/** 개발자 로그 : Aspect default */
	public static final String LOG_ID2 = "※userInfo:  ";
	/** 개발자 로그 : Aspect Error */
	public static final String LOG_ID3 = "※userError:  ";

	/** 문자 셋트 설정 : UTF-8 */
	public static final String CHARACTER_SET_UTF8 = "UTF-8";

	/** YN : Y */
	public static final String SYNB_YN_Y = "Y";
	/** YN : N */
	public static final String SYNB_YN_N = "N";

	/** CRUD : C */
	public static final String SYNB_CRUD_C = "C";
	/** CRUD : R */
	public static final String SYNB_CRUD_R = "R";
	/** CRUD : U */
	public static final String SYNB_CRUD_U = "U";
	/** CRUD : D */
	public static final String SYNB_CRUD_D = "D";

	/** NULLSTRING : "" */
	public static final String SYNB_NULL = "";
	/** NULLSTRING : " " */
	public static final String SYNB_NULL_SPACE = " ";
	/** DOTSTRING : "." */
	public static final String SYNB_DOT = ".";
	/** COMMASTRING : "," */
	public static final String SYNB_COMMA = ",";

	/** String Numbr : 1 */
	public static final String SYNB_NUM_1 = "1";
	/** String Numbr : 2 */
	public static final String SYNB_NUM_2 = "2";
	/** String Numbr : 3 */
	public static final String SYNB_NUM_3 = "3";
	/** String Numbr : 4 */
	public static final String SYNB_NUM_4 = "4";
	/** String Numbr : 5 */
	public static final String SYNB_NUM_5 = "5";
	/** String Numbr : 6 */
	public static final String SYNB_NUM_6 = "6";
	/** String Numbr : 7 */
	public static final String SYNB_NUM_7 = "7";
	/** String Numbr : 8 */
	public static final String SYNB_NUM_8 = "8";
	/** String Numbr : 9 */
	public static final String SYNB_NUM_9 = "9";
	/** String Numbr : 0 */
	public static final String SYNB_NUM_0 = "0";

	/** 회원등급:관리자 */
	public static final String MEMBER_LEVEL_ADMIN = "M0001";
	/** 회원등급:일반사용자 */
	public static final String MEMBER_LEVEL_USER = "M0002";
	
	/**메일 컨덴츠 타입: text*/
	public static final String MAIL_CONTENT_TYPE_TEXT = "text";
	/**메일 컨덴츠 타입: html*/
	public static final String MAIL_CONTENT_TYPE_HTML = "html";

	/**여행동행구하기 성별: 남*/
	public static final String ACCOMPANY_GENDER_MALE = "G0001";
	/**여행동행구하기 성별: 여*/
	public static final String ACCOMPANY_GENDER_FEMALE = "G0002";

	public static final String ACCOMPANY_GENDER_BOTH = "G0003";
	
	/** 회원 계정 상태: 비활성 */
	public static final String MEMBER_STATUS_LOCK = "M1001";
	/** 회원 계정 상태: 활성 */
	public static final String MEMBER_STATUS_ACTIVE = "M1002";
	/** 회원 계정 상태: 삭제 */
	public static final String MEMBER_STATUS_WITHDRAW = "M1003";
	/** 회원 계정 상태: 휴면 */
	public static final String MEMBER_STATUS_DORMANT = "M1004";
	
	/** 핸드폰 인증 상태: 활성 */
	public static final String MEMBER_P_STATUS_ACTIVE = "M2001";
	/** 핸드폰 인증 상태: 비활성 */
	public static final String MEMBER_P_STATUS_LOCK = "M2002";
	
	/**여행동행구하기 게시글 종류: 공지*/
	public static final String ACCOMPANY_TYPE_NOTICE = "H0001";
	/**여행동행구하기 게시글 종류: 한국 출발*/
	public static final String ACCOMPANY_TYPE_FROMKOREA = "H0002";
	/**여행동행구하기 게시글 종류: 여행중*/
	public static final String ACCOMPANY_TYPE_ONTRIP = "H0003";
	/**여행동행구하기 게시글 종류: 완료*/
	public static final String ACCOMPANY_TYPE_COMPLETED = "H0004";
	
}
