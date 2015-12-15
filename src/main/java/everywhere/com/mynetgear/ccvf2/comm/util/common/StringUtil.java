package everywhere.com.mynetgear.ccvf2.comm.util.common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.commons.lang.StringUtils;


public class StringUtil {
	/**
     * strNull :  NULL값이면 빈문자열로 변경
     *
     * @param str <code>java.lang.String</code> : 문자열
     * @return str <code>java.lang.String</code> : NULL이면 ""를 아니면 기존 문자열 반환
     */
    public static String strNull(String str) {
         return (str == null) ? "" : str.trim();
    }

    /**
     * strNull : [2002-01-23 추가] NULL값 오브젝트
     *
     * @param str <code>java.lang.String</code> : 문자열
     * @return str <code>java.lang.String</code> : NULL이면 ""를 아니면 기존 문자열 반환
     */
    public static String strNull(Object obj) {
         return (obj == null) ? "" : obj.toString();
    }
    
    /**
     * strNull :  NULL값이면 빈문자열로 변경
     *
     * @param str <code>java.lang.String</code> : 문자열
     * @param text <code>java.lang.String</code>: 문자열
     * @return str <code>java.lang.String</code> : NULL이면 text 문자열을 아니면 기존 문자열 반환
     */
    public static String strNull(String str, String text) {
         return (str == null) ? text : str.trim();
    }

    /**
     * strNull : NULL값 오브젝트
     *
     * @param str <code>java.lang.String</code> : 문자열
     * @param text <code>java.lang.String</code>: 문자열
     * @return str <code>java.lang.String</code> : NULL이면 text 문자열을 아니면 기존 문자열 반환
     */
    public static String strNull(Object obj, String text) {
         return (obj == null) ? text : obj.toString();
    }
    
	public static String MD5Encryption(String strId, String strPass)
	{
		String strResult = "";
		try 
		{			
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(strId.getBytes());
			md5.update(strPass.getBytes());
			
			byte[] md5Byte = md5.digest();
			
			for(int i=0; i < md5Byte.length; i++)
			{	
				if(Integer.toHexString(0xff & md5Byte[i]).length() < 2)
					strResult += "0" + Integer.toHexString(0xff & md5Byte[i]);
				else
					strResult += Integer.toHexString(0xff & md5Byte[i]);    
			}			
		} 
		catch (NoSuchAlgorithmException e) 
		{
			e.printStackTrace();
		} 
		return strResult;
	}    
        
    public static String isNullToString(Object object) {
        String string = "";
        if (object != null) {
            string = object.toString().trim();
        }
        return string;
    }
        
    public static int isNullToInt(Object object) {
        int result = 0;
        
        if (object != null) {
            result = (Integer)object; 
        }
        return result;
    }
    
    public static int isNum(String str) {
    	if(str==null)       return 3;
        byte[] ori = str.getBytes();
        if(ori==null)       return 3;
        int result = -1;
        for(int i=0;i<ori.length;i++){
            if(ori[i]>0x2F && ori[i] < 0x3A){               //숫자인 경우
                if(result==-1){
                    result = 0; 
                }else if(result!=0){
                    result = 1;
                }
            }else{                                          //문자인 경우. 특수문자도 문자로 취급
                if(result==-1)      result = 2;
                else if(result==0)  result = 1;
            }
        }
        return result;
    }
        
    public static String toEuckr(String source) {
        String ret = null;
        if (source == null)
            return null;
        try {
            ret = new String(source.getBytes(), "KSC5601");
            System.out.println("====!!!=========>!!! ret : " + ret);
        } catch (UnsupportedEncodingException e) {
            ret = null;
        }
        return ret;
    }
   
    public static String toEuckr2(String source) {
        String ret = null;
        
        if (source == null)
            return null;
        try {
            ret = new String(source.getBytes("8859_1"), "KSC5601");
        	//ret = source;
        } catch (UnsupportedEncodingException e) {
        //} catch (Exception ex) {
            ret = null;
        }
        return ret;
    }
       
    public static String toCharset(String source, String charset) {
        String ret = null;
        if (source == null)
            return null;
        try {
            ret = new String(source.getBytes("8859_1"), charset);
        } catch (UnsupportedEncodingException e) {
            ret = null;
        }
        return ret;
    }
        
    public static String toUnicode(String source) {
        String ret = null;
        if (source == null)
            return null;
        try {
            ret = new String(source.getBytes(), "8859_1");
        } catch (UnsupportedEncodingException e) {
            ret = null;
        }
        return ret;
    }
    
    public static String replace(String source, String subject, String object) 
    {    	        	    	
        StringBuffer rtnStr = new StringBuffer();
        String preStr = "";
        String nextStr = source;
        
        while (source.indexOf(subject) >= 0) {
            preStr = source.substring(0, source.indexOf(subject));
            nextStr = source.substring(source.indexOf(subject) + subject.length(), source.length());
            source = nextStr;
            rtnStr.append(preStr).append(object);
        }
        rtnStr.append(nextStr);
        return rtnStr.toString();
    }
    
    public static String getToday()
    {
    	String result = "";
		
		Calendar today = Calendar.getInstance();
		String day = "";
		int nDay = today.get(Calendar.DAY_OF_WEEK);
		
		if(nDay == 1)
			day = "일요일";
		else if(nDay == 2)
			day = "월요일";
		else if(nDay == 3)
			day = "화요일";
		else if(nDay == 4)
			day = "수요일";
		else if(nDay == 5)
			day = "목요일";
		else if(nDay == 6)
			day = "금요일";
		else if(nDay == 7)
			day = "토요일";
		
		result = today.get(Calendar.YEAR) + "년 " + (today.get(Calendar.MONTH) + 1) + "월 " + today.get(Calendar.DATE) + "일 (" + day + ")";
		
		return result;
    }
    
    public static String getMainName(String url)
    {
    	String rtn = replace(url, ".do", "");
    	
    	return rtn;
    }
    
	public static String eraseSpace(String obj) {		
		return obj.replaceAll(" ", "");
	}
    
    public static String getSplitterString(String data, int index, String sep)
    {
    	String[] tokens = data.split(sep);
    	if (index == 1)
    	{
    		return tokens[0];
    	}
    	else
    	{
    		return tokens[1];
    	}
    }
    
    public static String[] getSplitterStringEx(String data, String sep)
    {
    	return data.split(sep);    	
    }
    
    public static String processingImages(String contents) {
    	if (contents == null) {
    		return "";
    	}
    	
		int index = contents.indexOf("<img ");
		
		if (index != -1) {
			contents = StringUtil.replace(contents, "./", "/KIMFT/lmxdata/images/");
			contents = StringUtil.replace(contents, "<img", "<img class=\"resize_image\"");
		}
		
		return contents;
	}
    
    @SuppressWarnings("static-access")
	public static String convertDateFormat(String data, int type)
    {
    	String rtn = "";
    	// type = 1, 년월일
    	// type = 2, yyyy-mm-dd
    	// type = 3, yyyy/mm/dd
    	// type = 4, yyyy.mm.dd
    	String year = data.substring(0, 4);
    	String month = data.substring(4, 6);
    	String day = data.substring(6, 8);
    	
    	switch(type)
    	{
    	case 1:
    		rtn = rtn.format("%s년 %s월 %s일", year, month, day);
    		break;
    	case 2:
    		rtn = rtn.format("%s-%s-%s", year, month, day);
    		break;
    	case 3:    		
    		rtn = rtn.format("%s/%s/%s", year, month, day);
    		break;
    	case 4:    		
    		rtn = rtn.format("%s.%s.%s", year, month, day);
    		break;
    	}
    	
    	return rtn;
    }
    
    public static ArrayList<String> splitStringData(String data, String sep)
    {
    	ArrayList<String> list = new ArrayList<String>();
    	
    	if(data != null && "".equals(data) == false) {
	    	StringTokenizer token = new StringTokenizer(data, sep);    	
	    	while (token.hasMoreTokens()) { list.add(token.nextToken()); }
    	}
    	
    	return list;
    }
    
    public static String getDateDayInfo(int term)
    {    	  
    	Calendar today = Calendar.getInstance();
    	
    	today.add(Calendar.DATE, term);
    	
    	String year = String.format("%04d", today.get(Calendar.YEAR));
		String month = String.format("%02d", today.get(Calendar.MONTH) + 1);
		String day = String.format("%02d", today.get(Calendar.DATE));    	
		
    	return String.format("%s년 %s월 %s일", year, month, day);
    }
    
    /** 현재년도 추출 */
    public static String getCurrentYear() {
    	String result = "";
		
		Calendar today = Calendar.getInstance();			
		
		result = "" + today.get(Calendar.YEAR);
		
		return result;
    }
    
    public static String getTodayEx() {
    	String result = "";
		
		Calendar today = Calendar.getInstance();			
		
		result = today.get(Calendar.YEAR) + "-" + (today.get(Calendar.MONTH) + 1) + "-" + today.get(Calendar.DATE);
		
		return result;
    }
    
    public static String getTodayEx2() {
    	String result = "";
		
		Calendar today = Calendar.getInstance();			
		
		
		result = today.get(Calendar.YEAR) + "-" + String.format("%02d", today.get(Calendar.MONTH) + 1) + "-" + String.format("%02d", today.get(Calendar.DATE));
		
		return result;
    }
    
    public static String getTodayEx3() {
    	String result = "";
		
		Calendar today = Calendar.getInstance();			
		
		
		result = today.get(Calendar.YEAR) +  String.format("%02d", today.get(Calendar.MONTH) + 1) +  String.format("%02d", today.get(Calendar.DATE));
		
		return result;
    }
    
    public static String getTodayEx4(int term) {
    	String result = "";
		
		Calendar today = Calendar.getInstance();	
		
		today.add(Calendar.DATE, term);		
		
		result = today.get(Calendar.YEAR) +  String.format("%02d", today.get(Calendar.MONTH) + 1) +  String.format("%02d", today.get(Calendar.DATE));
		
		return result;
    }
    
    public static String getTodayEx5() {
    	String result = "";
		
		Calendar today = Calendar.getInstance();			
		result = today.get(Calendar.YEAR) + "년" +  String.format(" %02d월", today.get(Calendar.MONTH) + 1) +  String.format(" %02d일", today.get(Calendar.DATE));		
		
		return result;
    }
    
    
    public static String getTodayTime() {
    	String result = "";
    	
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyyMMddHHmmssSSS", Locale.KOREA );
		Date currentTime = new Date();
		result = formatter.format (currentTime);
		
		return result;
    }
    
    public static String getLastMonthTodayEx(){
    	String result = "";
    	
    	Calendar today = Calendar.getInstance();
    	today.add(Calendar.MONTH, -1);
    	result = today.get(Calendar.YEAR) + String.format("%02d", today.get(Calendar.MONTH) + 1) + String.format("%02d", today.get(Calendar.DATE));
    	
    	return result;
    }
    
    public static String getLastMonthTodayEx2(){
    	String result = "";
    	
    	Calendar today = Calendar.getInstance();
    	today.add(Calendar.MONTH, -1);
    	result = today.get(Calendar.YEAR) + "-" + String.format("%02d", today.get(Calendar.MONTH) + 1) + "-" + String.format("%02d", today.get(Calendar.DATE));
    	
    	return result;
    }
    
    public static String getLastYearTodayEx2(){
    	String result = "";
    	
    	Calendar today = Calendar.getInstance();
    	today.add(Calendar.YEAR, -1);
    	result = today.get(Calendar.YEAR) + "-" + String.format("%02d", today.get(Calendar.MONTH) + 1) + "-" + String.format("%02d", today.get(Calendar.DATE));
    	
    	return result;
    }
    
    public static String getMonthDayInfo(int term)
    {
    	Calendar today = Calendar.getInstance();
    	
    	today.add(Calendar.MONTH, term);
    	
    	String year = String.format("%04d", today.get(Calendar.YEAR));
		String month = String.format("%02d", today.get(Calendar.MONTH) + 1);
		String day = String.format("%02d", today.get(Calendar.DATE));
		
		return String.format("%s년 %s월 %s일", year, month, day);
    }
    
    public static String getMonthDayInfo2(int term)
    {
    	Calendar today = Calendar.getInstance();
    	
    	today.add(Calendar.MONTH, term);
    	
    	String year = String.format("%04d", today.get(Calendar.YEAR));
    	String month = String.format("%02d", today.get(Calendar.MONTH) + 1);
    	String day = String.format("%02d", today.get(Calendar.DATE));
    	
    	return String.format("%s%s%s", year, month, day);
    }
    
    public static String getYearInfo(int term)
    {
    	Calendar today = Calendar.getInstance();
    	
    	today.add(Calendar.YEAR, term);
    	
    	String year = String.format("%04d", today.get(Calendar.YEAR));
		String month = String.format("%02d", today.get(Calendar.MONTH) + 1);
		String day = String.format("%02d", today.get(Calendar.DATE));
		
		return String.format("%s년 %s월 %s일", year, month, day);
    }   
    
    public static String changeFormatString(String data)
    {
    	if (data.length() == 8)
    	{
	    	String year = data.substring(0, 4);
	    	String month = data.substring(4, 6);
	    	String day = data.substring(6, 8);
	    	
	    	return String.format("%s.%s.%s", year, month, day);
    	}
    	else
    	{
    		return data;
    	}    	
    }
    
    public static String changeFormatStringEx(String data)
    {
    	if (data.length() == 8)
    	{
	    	String year = data.substring(0, 4);
	    	String month = data.substring(4, 6);
	    	String day = data.substring(6, 8);
	    	
	    	return String.format("%s-%s-%s", year, month, day);
    	}
    	else
    	{
    		return data;
    	}    	
    }
    
    public static InputStream convertStringtoInputStream(String data)
    {
    	InputStream rtn = null;
    	
    	try 
    	{
			rtn = new ByteArrayInputStream(data.getBytes("UTF-8"));
		}
    	catch (UnsupportedEncodingException e) 
    	{		
			e.printStackTrace();
		}
		
		return rtn;
    }
    
    public static String NumberFormatting(long num)
    {
    	NumberFormat formatter = NumberFormat.getCurrencyInstance();
    	
    	return formatter.format(num);
    }
    
    public static String NumberFormatting(float num)
    {
    	NumberFormat formatter = NumberFormat.getCurrencyInstance();
    	
    	return formatter.format(num);
    }
    
    public static String NumberFormatting(int num)
    {
    	NumberFormat formatter = NumberFormat.getCurrencyInstance();
    	
    	return formatter.format(num);
    }
    
    /**
	 * 파일저장
	 * @param path 저장경로
 	 * @param data 저장내용
	 */
	public static void saveFile(String path, String data) {
		try 
		{
			BufferedWriter UniOutput = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path),"UTF8"));
			
			UniOutput.write(data);			
			UniOutput.close();							
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
	}
	
	public static String eraseHtmlTag(String obj)
	{
		String rtn = obj;
		
		// 엔터문자 처리
		rtn = replace(rtn, "\r\n", "");
		rtn = replace(rtn, "\n", "");		
		
		// 공백문자 처리
		rtn = replace(rtn, "$#160;", "");
		rtn = replace(rtn, "&nbsp;", "");
		rtn = replace(rtn, "\"", "");
		
		int indexStart = rtn.indexOf("<");
		
		while(indexStart >=0 )
		{
			int indexEnd = rtn.indexOf(">", indexStart);			
			String eraseStr = rtn.substring(indexStart, indexEnd+1);
			
			// 태그 제거
			rtn = replace(rtn, eraseStr, "");			
			indexStart = rtn.indexOf("<");
		}
				
		return rtn;
	}	
	
	public static String eraseHtmlTagEx(String obj)
	{
		String rtn = obj;
		
		// 엔터문자 처리
		rtn = replace(rtn, "\r\n", "");
		rtn = replace(rtn, "\n", "");		
		
		// 공백문자 처리
		rtn = replace(rtn, "$#160;", "");
		rtn = replace(rtn, "&nbsp;", "");
		rtn = replace(rtn, "\"", "");
		
		int indexStart = rtn.indexOf("<");
		
		while(indexStart >=0 )
		{
			int indexEnd = rtn.indexOf(">", indexStart);			
			String eraseStr = rtn.substring(indexStart, indexEnd+1);
			
			// 태그 제거
			rtn = replace(rtn, eraseStr, "");			
			indexStart = rtn.indexOf("</");
		}
				
		return rtn;
	}
	
	public static String eraseATag(String obj) {
		String rtn = obj;
		
		int indexStart = rtn.indexOf("<a");
		
		while(indexStart >=0 )
		{
			int indexEnd = rtn.indexOf(">", indexStart);			
			String eraseStr = rtn.substring(indexStart, indexEnd+1);
			
			// 태그 제거
			rtn = replace(rtn, eraseStr, "");			
			indexStart = rtn.indexOf("<a");
		}
		
		indexStart = rtn.indexOf("</a");
		
		while(indexStart >=0 )
		{
			int indexEnd = rtn.indexOf(">", indexStart);			
			String eraseStr = rtn.substring(indexStart, indexEnd+1);
			
			// 태그 제거
			rtn = replace(rtn, eraseStr, "");			
			indexStart = rtn.indexOf("</a");
		}
		
		return rtn;
	}
	
	public static String eraseContentTag(String obj) {
		String rtn = obj;
		
		int indexStart = rtn.indexOf("<engcontent");
		
		while(indexStart >=0 )
		{
			int indexEnd = rtn.indexOf(">", indexStart);			
			String eraseStr = rtn.substring(indexStart, indexEnd+1);
			
			// 태그 제거
			rtn = replace(rtn, eraseStr, "");			
			indexStart = rtn.indexOf("<engcontent");
		}
		
		indexStart = rtn.indexOf("</engcontent");
		
		while(indexStart >=0 )
		{
			int indexEnd = rtn.indexOf(">", indexStart);			
			String eraseStr = rtn.substring(indexStart, indexEnd+1);
			
			// 태그 제거
			rtn = replace(rtn, eraseStr, "");			
			indexStart = rtn.indexOf("</engcontent");
		}
		
		return rtn;
	}
	
	public static String eraseLinkTag(String obj) {
		String rtn = obj;
		
		int indexStart = rtn.indexOf("<linkref");
		
		while(indexStart >=0 )
		{
			int indexEnd = rtn.indexOf(">", indexStart);			
			String eraseStr = rtn.substring(indexStart, indexEnd+1);
			
			// 태그 제거
			rtn = replace(rtn, eraseStr, "");			
			indexStart = rtn.indexOf("<linkref");
		}
		
		indexStart = rtn.indexOf("</linkref");
		
		while(indexStart >=0 )
		{
			int indexEnd = rtn.indexOf(">", indexStart);			
			String eraseStr = rtn.substring(indexStart, indexEnd+1);
			
			// 태그 제거
			rtn = replace(rtn, eraseStr, "");			
			indexStart = rtn.indexOf("</linkref");
		}
		
		rtn = rtn.replace( System.getProperty( "line.separator" ), "");
		rtn = rtn.replace("  ", "");
		
		return rtn;
	}
	
	/**
     * '0'을 채운다.
     * @param s
     * @return
     */
 	public static String lpad(String s, int len){
 	    String reVal = "";
 	    
 	    reVal = s;
 	    
 	    if(s.length() < len){
 	      for(int i = 0;i < len - s.length();i++)
 	        reVal = "0" + reVal;
 	    }
 	  
 	    return reVal;
 	  }
 	
 	public static String trimForBbs(String obj) {
 		if (obj.length() < 20) {
 			return obj;
 		} else {
 			return obj.substring(0, 20) + "...";
 		}
 	}
 	
 	public static String trimForBbsEx(String obj) {
 		if (obj.length() < 45) {
 			return obj;
 		} else {
 			return obj.substring(0, 45) + "...";
 		}
 	}
 	
 	/**
 	 * 숫자이외의 문자가 포함되었는지 확인
 	 * 'aaa' - > false
 	 * '111' - > true
 	 * @param str
 	 * @return
 	 */
    public static boolean isNumberValidator(String str)
    {
    	char c = ' ';
    	if( str == null || str.equals(""))	return false;
    	
    	for(int i=0; i< str.length(); i++)
    	{
    		c = str.charAt(i);
    		if( c < 48 || c > 59 )
    		{
    			return false;    			
    		}
    	}
    	return true;        
    }
    
    /**
     * int 2^31 (2,147,483,648)
     * Numberic 10^38
     * @param str
     * @param length
     * @return
     */
    public static boolean isLengthValidator(String str, int length)
    {    	
    	if( length == 0 )			return false;
    	
    	if( str.length() > length )	return false;

    	return true;
    }          
    
    public static boolean valuedateInt(String str)
    {
    	boolean isFieldValid = false;
    	try{
    		Integer.parseInt(str);
    		isFieldValid = true;
    	}catch(Exception e){
    		isFieldValid = false;
    	}
    	return isFieldValid;
    }
    
    /**
     * 최저 길이, 최대 길이 체크
     * @param value
     * @param min
     * @param max
     * @return
     */
    public static boolean validateRange(int value, int min, int max) {
    	return (value >= min && value <= max);
    }
    
    /**
	 * 통합검색 키워드 length 체크
	 * @param search_keyword
	 * @return
	 */
	public static boolean getTotalSearchKeywordLength(String search_keyword)
	{
		if( search_keyword == null || search_keyword.equals(""))	
			return false;
		
		if( search_keyword.length() < 2 )
			return false;
		else
			return true;
		
	}
	
	/**
	 * 통합검색 구분값 체크
	 * @param search_type
	 * @return
	 */
	public static boolean getTotalSearchTypeList(String search_type){
		
		List<String> searchTypeList = new ArrayList<String>();
		searchTypeList.add("");
		searchTypeList.add("ALL");
		searchTypeList.add("BOOK");
		searchTypeList.add("BOARD");
		searchTypeList.add("AFILE");
		
		if( searchTypeList.contains(search_type)){
			return true;
		}else{		
			return false;
		}		
	}
	
	/**
	 * 파일 확장자 가져오기
	 * @param filename
	 * @return
	 */
	public static String getFileExtension(String filename) {
		String ext = "";
		
		int index = filename.lastIndexOf(".");
		
		if (index != -1) {
			ext = filename.substring(index + 1);
		}
		
		return ext;
	}
	
	public static String getLinkCode(String target, String lawtype) {
		String code = target.trim();
		
		int part = 0;
		int chapter = 0;
		int section = 0;
		int subsection = 0;
		
		// 편정보 가져오기
		int indexPart = code.indexOf("편");
		if (indexPart != -1) {
			int jae = code.indexOf("제", 0);
			
			part = Integer.parseInt(code.substring(jae + 1, indexPart));
		}
		
		// 장정보 가져오기
		int indexChapter = code.indexOf("장");
		if (indexChapter != -1) {
			int jae = code.indexOf("제", indexPart);
			
			chapter = Integer.parseInt(code.substring(jae + 1, indexChapter));
		}
		
		 // 절정보 가져오기
		int indexSection = code.indexOf("절");
		if (indexSection != -1) {
			int jae = code.indexOf("제", indexChapter);
			
			section = Integer.parseInt(code.substring(jae + 1, indexSection));
		}
		
		 // 관정보 가져오기
		int indexSubSection = code.indexOf("관");
		if (indexSubSection != -1) {
			int jae = code.indexOf("제", indexSection);
			
			subsection = Integer.parseInt(code.substring(jae + 1, indexSubSection));
		}
		
		
		return String.format("%s%02d0%02d0%02d0%02d0", lawtype, part, chapter, section, subsection);
	}

	public static String getLinkId(String lawcode, String lawtype) {
		
		String part = "";
		String chapter = "";
		String section = "";
		String subsection = "";
		
		// 주의! --- 위탁업무방법서의 경우 편번호를 1빼준다.
		if ("2".equals(lawtype) == true) {
			part = lawcode.substring(1, 3);
			
			int number = Integer.parseInt(part);
			number = number - 1;
			
			part = String.format("%02d0", number);
			
		} else {
			part = lawcode.substring(1, 4);
		}
		part = lawcode.substring(1, 4);
		chapter = lawcode.substring(4, 7);
		section = lawcode.substring(7, 10);
		subsection = lawcode.substring(10, 13);				
		
		return String.format("%s%s%s%s%s", lawtype, part, chapter, section, subsection);
	}
	
	public static String getTransformData(String xmlData, String xslPath) {
		try{
			String result = "";
			TransformerFactory tFactory = TransformerFactory.newInstance();   
			Transformer transformer = tFactory.newTransformer(new StreamSource(xslPath));
			StringReader sr = null;
			StringWriter sw = new StringWriter();
			
			transformer.setParameter("author", 1);
	        sr = new StringReader(xmlData);	     		
			
			transformer.transform(new StreamSource(sr), new StreamResult(sw));
			result = sw.toString();
			
			return result;
		}catch(Exception e){
			System.out.println(e);
			return "";
		}
	}
	
	public static String convertHTMLChar(String data) {
		String result = "";
		
		result = result.replace("&", "&amp;");
		result = data.replace("<", "&lt;");
		result = result.replace(">", "&gt;");		
		
		return result;
	}
	
	public static boolean IsEmailStr(String strEmail)
	{
		String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";

		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(strEmail);

		 if(!m.matches())
			 return false;
		 
		return true;
	}	
	
	public static String findRegularLinkInfo(String content, String lawname) {
		String result = "";
		String regex = lawname + "」 제[0-9]+조";
		
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(content);
		
		if (m.find()) {			
			return  m.group(0);			
		}
		
		regex = lawname + "』 제[0-9]+조";
		
		p = Pattern.compile(regex);
		m = p.matcher(content);
		
		if (m.find()) {			
			return  m.group(0);			
		}
		
		regex = lawname + "」제[0-9]+조";
		
		p = Pattern.compile(regex);
		m = p.matcher(content);
		
		if (m.find()) {			
			return  m.group(0);			
		}
		
		regex = lawname + " 제[0-9]+조";
		
		p = Pattern.compile(regex);
		m = p.matcher(content);
		
		if (m.find()) {			
			return  m.group(0);			
		}
		
		regex = lawname;
		p = Pattern.compile(regex);
		m = p.matcher(content);
		
		if (m.find()) {			
			return  m.group(0);			
		}
		
		return result;
	}	
	
	public static String getRandomPassword(int length) {
		char[] charaters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};
        StringBuilder sb = new StringBuilder("");
        Random rn = new Random();
        for( int i = 0 ; i < length ; i++ ){
            sb.append( charaters[ rn.nextInt( charaters.length ) ] );
        }
        return sb.toString();
	}
	
	public static String selectBrowser(String info) {
		if(info.indexOf("MSIE") > 0)
			return "IE";
		else if(info.indexOf("Firefox/") > 0)
			return "FF";
		else if(info.indexOf("Chrome/") > 0)
			return "CR";
		else if(info.indexOf("Safari/") > 0)
			return "SP";
		else if(info.indexOf("Opera/") > 0)
			return "OP";
		else
			return "ET";
	}
	
	public static String checkXSSFileExtension(String name) {
		if(name == null)
			return "";
		if(name.length() == 0)
			return "";
		
		String[] ch = {".hwp", ".cell", ".csv", ".show", ".hpt", ".hsdt", ".doc", ".docx", ".xls", ".xlsx", ".xlsm", ".xlsb", ".xml", ".txt", ".log", ".pdf", ".ppt", ".pptx", ".gul", ".hst", ".zip", ".alz",
				".jpg", ".jpeg", ".bmp", ".gif", ".png", ".psd", ".swi", ".wav", ".mid", ".mp3", ".ai", ".avi", ".mp4", ".gl4"};
		
		if(name.indexOf(".") == -1)
			return "파일에 확장자가 없습니다.";
		else
		{
			String exe = name.substring(name.lastIndexOf(".")).toLowerCase();
			
			for(int i = 0; i < ch.length; i++)
			{
				if(exe.equals(ch[i]))
					return "";
			}
		}
		
		return "허용된 확장자의 파일만 업로드 할 수 있습니다.";
	}
	
	public static String removeXSS(String str, boolean use_html) 
	{
	    String str_low = "";
	    if (!"".equals(str)) {
    	    if(use_html) { // HTML tag를 사용하게 할 경우 부분 허용
    	        // HTML tag를 모두 제거
    	        //str = str.replaceAll("&", "&amp;");
    	        
    	        //str = str.replaceAll("<","&lt;");
    	        //str = str.replaceAll(">","&gt;");
    	         
    	        // 특수 문자 제거
    	        //str = str.replaceAll("\"","&gt;");    	        
    	        str = str.replaceAll("%00", null);
    	        str = str.replaceAll("\"", "&#34;");
    	        str = str.replaceAll("\'", "&#39;");
    	        str = str.replaceAll("%", "&#37;");    
    	        //str = str.replaceAll("../", "");
    	        str = str.replaceAll("..\\\\", "");
    	        //str = str.replaceAll("./", "");
    	        str = str.replaceAll("%2F", "");
    	        // 허용할 HTML tag만 변경
    	        str = str.replaceAll("&lt;p&gt;", "<p>");
    	        str = str.replaceAll("&lt;P&gt;", "<P>");
    	        str = str.replaceAll("&lt;/p&gt;", "</p>");
                str = str.replaceAll("&lt;/P&gt;", "</P>");
    	        str = str.replaceAll("&lt;br&gt;", "<br>");
                str = str.replaceAll("&lt;BR&gt;", "<BR>");
    	        str = str.replaceAll("&lt;br/&gt;", "<br />");
    	        str = str.replaceAll("&lt;BR/&gt;", "<BR />");
    	        // 스크립트 문자열 필터링 (선별함 - 필요한 경우 보안가이드에 첨부된 구문 추가)
    	        str_low= str.toLowerCase();
    	        if( str_low.contains("javascript") || str_low.contains("script")     || str_low.contains("iframe") || 
    	                str_low.contains("document")   || str_low.contains("vbscript")   || str_low.contains("applet") || 
    	                str_low.contains("embed")      || str_low.contains("object")     || str_low.contains("frame") || 
    	                str_low.contains("grameset")   || str_low.contains("layer")      || str_low.contains("bgsound") || 
    	                str_low.contains("alert")      || str_low.contains("onblur")     || str_low.contains("onchange") || 
    	                str_low.contains("onclick")    || str_low.contains("ondblclick") || str_low.contains("enerror") ||  
    	                str_low.contains("onfocus")    || str_low.contains("onload")     || str_low.contains("onmouse") || 
    	                str_low.contains("onscroll")   || str_low.contains("onsubmit")   || str_low.contains("onunload"))
    	        {
    	            str = str_low;
    	            str = str.replaceAll("javascript", "x-javascript");
    	            str = str.replaceAll("script", "x-script");
    	            str = str.replaceAll("iframe", "x-iframe");
    	            str = str.replaceAll("document", "x-document");
    	            str = str.replaceAll("vbscript", "x-vbscript");
    	            str = str.replaceAll("applet", "x-applet");
    	            str = str.replaceAll("embed", "x-embed");
    	            str = str.replaceAll("object", "x-object");
    	            str = str.replaceAll("frame", "x-frame");
    	            str = str.replaceAll("grameset", "x-grameset");
    	            str = str.replaceAll("layer", "x-layer");
    	            str = str.replaceAll("bgsound", "x-bgsound");
    	            str = str.replaceAll("alert", "x-alert");
    	            str = str.replaceAll("onblur", "x-onblur");
    	            str = str.replaceAll("onchange", "x-onchange");
    	            str = str.replaceAll("onclick", "x-onclick");
    	            str = str.replaceAll("ondblclick","x-ondblclick");
    	            str = str.replaceAll("enerror", "x-enerror");
    	            str = str.replaceAll("onfocus", "x-onfocus");
    	            str = str.replaceAll("onload", "x-onload");
    	            str = str.replaceAll("onmouse", "x-onmouse");
    	            str = str.replaceAll("onscroll", "x-onscroll");
    	            str = str.replaceAll("onsubmit", "x-onsubmit");
    	            str = str.replaceAll("onunload", "x-onunload");
    	        }
    	    } else { // HTML tag를 사용하지 못하게 할 경우
    	        str = str.replaceAll("\"","&gt;");
    	        str = str.replaceAll("&", "&amp;");
    	        str = str.replaceAll("<", "&lt;");
    	        str = str.replaceAll(">", "&gt;");
    	        str = str.replaceAll("%00", null);
    	        str = str.replaceAll("\"", "&#34;");
    	        str = str.replaceAll("\'", "&#39;");
    	        str = str.replaceAll("%", "&#37;");    
    	        str = str.replaceAll("../", "");
    	       // str = str.replaceAll("..\\\\", "");//개인정보 수정에서 치환됨으로 주석처리
    	       // str = str.replaceAll("./", ""); //개인정보 수정에서 치환됨으로 주석처리
    	        str = str.replaceAll("%2F", "");
    	    }
	    }
	    return str;
	}
	
	public static String deleteHTML(String str)
	{
		if(str == null)
			return "";
		
		str = str.replaceAll("&lt;", "<");
		str = str.replaceAll("&gt;", ">");
		return str = str.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");		
	} 
	
	/**
	 * path에 해당하는 폴더(디렉토리)가 없으면 생성 한다.
	 * @param path
	 */
	public static void createDir(String path)
	{
		File dir = new File(path);
		
		if(dir.isDirectory() == false)
		{
			dir.mkdirs();
		}
	}
	
	/**
	 * 폴더와 그안의 파일 삭제
	 * @param targetFolder 폴더
	 * @param folderDelete 폴더 삭제 여부 true:폴더까지삭제, false:파일만삭제
	 * @return
	 */
	public static boolean deleteFolder(File targetFolder, Boolean folderDelete)
	{
		File[] childFile = targetFolder.listFiles();		
		boolean confirm = false;
		
		if(childFile == null)
			return false;
		
		int size = childFile.length;

		if (size > 0) 
		{
			for (int i = 0; i < size; i++)
			{	
				if (childFile[i].isFile()) 
				{		
					confirm = childFile[i].delete();
				} 
				else
				{		
					deleteFolder(childFile[i], true);		
				}	
			}
		}
		if(folderDelete)
			targetFolder.delete();
		
		return (!targetFolder.exists());
	}
	
	/**
	 * str값이 NULL이면 text을 리턴하고 아니면 str값을 리턴한다.
	 * @param str
	 * @return
	 */
	public static String checkNullSP(String str, String text)
	{
		if(str == null)
			return text;
		else
			return str;
	}
	
	public static String getMonitorStr(HttpServletRequest request) {
		return "IP : " +  request.getRemoteAddr() + " HOST : " + request.getRemoteHost() + " USER-ID : " + (String)request.getSession().getAttribute("sid");
	}
	
	
	//신구대비 비교
	public static String printDiffence(String text1, String text2) {
		
		StringBuffer sb = new StringBuffer();
		
		List<String> text1_new = split(text1, "</div>", true);
		List<String> text2_new = split(text2, "</div>", true);
		
		List<String> text1TokenList = null;
		List<String> text2TokenList = null;
		
		//new 사이즈가 더 클 경우
		if(text1_new.size() > text2_new.size()) {
			for(int z=0; z < text1_new.size(); z++) {
				
				text1TokenList = getTokenList(text1_new.get(z));
				//String check1 = text1_new.get(z).substring(0, text1_new.get(z).indexOf(">"));
				
				int text1TokenIndex = 0;
				int text2TokenIndex = 0;
				int text1TokenIndexOffset = 0;
				int text2TokenIndexOffset = 0;
				
				if(z < text2_new.size()) {
					text2TokenList = getTokenList(text2_new.get(z));
					//String check2 = text2_new.get(z).substring(0, text2_new.get(z).indexOf(">"));

					while (text1TokenIndex < text1TokenList.size()) {
						String text1Token = text1TokenList.get(text1TokenIndex);		
						
						text2TokenIndexOffset = getTokenIndex(text2TokenList, text1Token, text2TokenIndex + text2TokenIndexOffset) - text2TokenIndex;

						if (text1TokenIndexOffset == text2TokenIndexOffset) {

							sb.append(text1Token);
											
							text1TokenIndex++;
							text2TokenIndex++;								
						} else {
							int text2TokenIndexOffsetByText1Token = text2TokenIndexOffset;
							
							String text2Token = "";
							
							if(text2TokenList.size() > text2TokenIndex)
								text2Token = text2TokenList.get(text2TokenIndex);
											
							int text1TokenIndexOffsetByText2Token = getTokenIndex(text1TokenList, text2Token, text1TokenIndex + text1TokenIndexOffset) - text1TokenIndex;
							
							// 변경된 단어
							if (text1TokenIndexOffsetByText2Token < 0 && text2TokenIndexOffsetByText1Token < 0) {					
								int pos = 0;
								for (int i = 0; i < text1TokenIndex; i++) {
									String token = text1TokenList.get(i);
									pos+= token.length();
								}
								
								//span 태그로 감쌀 문장의 유효성 검사를 한다.					
								if(checkSpanText(text1Token))	{
									sb.append("<span style=\"background-color: yellow;\">"+text1Token+"</span>");
								} else {
									sb.append(text1Token);
								}
								
								text1TokenIndex++;
								text2TokenIndex++;
								
							//삭제된 단어
							} else if (text1TokenIndexOffsetByText2Token < 0) {					
								int pos = 0;
								for (int i = 0; i < text1TokenIndex; i++) {
									String token = text1TokenList.get(i);
									pos+= token.length();

								}
								StringBuilder tokensSB = new StringBuilder();
								for (int i = text2TokenIndex; i < text2TokenIndex + text2TokenIndexOffsetByText1Token; i++) {
									String token = text2TokenList.get(i);
									tokensSB.append(token);
								}										

								text2TokenIndex = text2TokenIndex + text2TokenIndexOffsetByText1Token;
								
							//추가된 단어
							} else {					
								StringBuilder tokensSB = new StringBuilder();
								int pos = 0;
								for (int i = 0; i < text1TokenIndex + text1TokenIndexOffsetByText2Token; i++) {
									String token = text1TokenList.get(i);
									pos+= token.length();
									if (i >= text1TokenIndex) {
										tokensSB.append(token);	
									}
								}
								pos = pos - tokensSB.length();
								
								//span 태그로 감쌀 문장의 유효성 검사를 한다.
								if(checkSpanText(tokensSB.toString())) {
									sb.append("<span style=\"background-color: yellow;\">"+tokensSB.toString()+"</span>");
								} else {
									sb.append(tokensSB.toString());
								}

								text1TokenIndex = text1TokenIndex + text1TokenIndexOffsetByText2Token;					
							}
						}
						text1TokenIndexOffset = 0;
						text2TokenIndexOffset = 0;
					}
				} else {
					sb.append("<span style=\"background-color: yellow;\">"+ text1_new.get(z) +"</span>");
				}
				//while문 끝
			}
			
		//old 사이즈가 더 크거나 같을 경우
		} else if(text1_new.size() < text2_new.size()) {
			for(int z=0; z < text2_new.size(); z++) {
				text2TokenList = getTokenList(text2_new.get(z));
				
				int text1TokenIndex = 0;
				int text2TokenIndex = 0;
				int text1TokenIndexOffset = 0;
				int text2TokenIndexOffset = 0;
				
				if(z < text1_new.size()) {
					text1TokenList = getTokenList(text1_new.get(z));
					
					while (text1TokenIndex < text1TokenList.size()) 
					{
						String text1Token = text1TokenList.get(text1TokenIndex);		
						
						text2TokenIndexOffset = getTokenIndex(text2TokenList, text1Token, text2TokenIndex + text2TokenIndexOffset) - text2TokenIndex;

						if (text1TokenIndexOffset == text2TokenIndexOffset) {

							sb.append(text1Token);
											
							text1TokenIndex++;
							text2TokenIndex++;								
						} else {
							int text2TokenIndexOffsetByText1Token = text2TokenIndexOffset;
							
							String text2Token = "";
							
							if(text2TokenList.size() > text2TokenIndex)
								text2Token = text2TokenList.get(text2TokenIndex);
											
							int text1TokenIndexOffsetByText2Token = getTokenIndex(text1TokenList, text2Token, text1TokenIndex + text1TokenIndexOffset) - text1TokenIndex;
							
							// 변경된 단어
							if (text1TokenIndexOffsetByText2Token < 0 && text2TokenIndexOffsetByText1Token < 0) 
							{					
								int pos = 0;
								for (int i = 0; i < text1TokenIndex; i++) {
									String token = text1TokenList.get(i);
									pos+= token.length();
								}
								
								//span 태그로 감쌀 문장의 유효성 검사를 한다.					
								if(checkSpanText(text1Token)) {
									sb.append("<span style=\"background-color: yellow;\">"+text1Token+"</span>");
								} else {
									sb.append(text1Token);
								}
								
								text1TokenIndex++;
								text2TokenIndex++;
							}

							//삭제된 단어
							else if (text1TokenIndexOffsetByText2Token < 0) 
							{					
								int pos = 0;
								for (int i = 0; i < text1TokenIndex; i++) {
									String token = text1TokenList.get(i);
									pos+= token.length();

								}
								StringBuilder tokensSB = new StringBuilder();
								for (int i = text2TokenIndex; i < text2TokenIndex + text2TokenIndexOffsetByText1Token; i++) {
									String token = text2TokenList.get(i);
									tokensSB.append(token);
								}										

								text2TokenIndex = text2TokenIndex + text2TokenIndexOffsetByText1Token;
								
							}
							
							//추가된 단어
							else 
							{					
								StringBuilder tokensSB = new StringBuilder();
								int pos = 0;
								for (int i = 0; i < text1TokenIndex + text1TokenIndexOffsetByText2Token; i++) {
									String token = text1TokenList.get(i);
									pos+= token.length();
									if (i >= text1TokenIndex) {
										tokensSB.append(token);	
									}
								}
								pos = pos - tokensSB.length();
								
								//span 태그로 감쌀 문장의 유효성 검사를 한다.
								if(checkSpanText(tokensSB.toString())) {
									sb.append("<span style=\"background-color: yellow;\">"+tokensSB.toString()+"</span>");
								} else {
									sb.append(tokensSB.toString());
								}

								text1TokenIndex = text1TokenIndex + text1TokenIndexOffsetByText2Token;					
							}
						}
						text1TokenIndexOffset = 0;
						text2TokenIndexOffset = 0;
					}
				}
				//while문 끝
		}
			
		//두개 사이즈가 같을 경우
		}else if(text1_new.size() == text2_new.size()) {
			for(int z=0; z < text1_new.size(); z++) {
				text1TokenList = getTokenList(text1_new.get(z));
				text2TokenList = getTokenList(text2_new.get(z));
				
				int text1TokenIndex = 0;
				int text2TokenIndex = 0;
				int text1TokenIndexOffset = 0;
				int text2TokenIndexOffset = 0;
				
				while (text1TokenIndex < text1TokenList.size()) 
				{
					String text1Token = text1TokenList.get(text1TokenIndex);		
					
					text2TokenIndexOffset = getTokenIndex(text2TokenList, text1Token, text2TokenIndex + text2TokenIndexOffset) - text2TokenIndex;

					if (text1TokenIndexOffset == text2TokenIndexOffset) {
						
						sb.append(text1Token);
										
						text1TokenIndex++;
						text2TokenIndex++;								
					} else {
						int text2TokenIndexOffsetByText1Token = text2TokenIndexOffset;
						
						String text2Token = "";
						
						if(text2TokenList.size() > text2TokenIndex)
							text2Token = text2TokenList.get(text2TokenIndex);
										
						int text1TokenIndexOffsetByText2Token = getTokenIndex(text1TokenList, text2Token, text1TokenIndex + text1TokenIndexOffset) - text1TokenIndex;
						
						// 변경된 단어
						if (text1TokenIndexOffsetByText2Token < 0 && text2TokenIndexOffsetByText1Token < 0) 
						{					
							int pos = 0;
							for (int i = 0; i < text1TokenIndex; i++) {
								String token = text1TokenList.get(i);
								pos+= token.length();
							}
							
							//span 태그로 감쌀 문장의 유효성 검사를 한다.					
							if(checkSpanText(text1Token)) {
								sb.append("<span style=\"background-color: yellow;\">"+text1Token+"</span>");
							} else {
								sb.append(text1Token);
							}
							
							text1TokenIndex++;
							text2TokenIndex++;
						}

						//삭제된 단어
						else if (text1TokenIndexOffsetByText2Token < 0) 
						{					
							int pos = 0;
							for (int i = 0; i < text1TokenIndex; i++) {
								String token = text1TokenList.get(i);
								pos+= token.length();

							}
							StringBuilder tokensSB = new StringBuilder();
							for (int i = text2TokenIndex; i < text2TokenIndex + text2TokenIndexOffsetByText1Token; i++) {
								String token = text2TokenList.get(i);
								tokensSB.append(token);
							}										

							text2TokenIndex = text2TokenIndex + text2TokenIndexOffsetByText1Token;
							
						}
						
						//추가된 단어
						else 
						{					
							StringBuilder tokensSB = new StringBuilder();
							int pos = 0;
							for (int i = 0; i < text1TokenIndex + text1TokenIndexOffsetByText2Token; i++) {
								String token = text1TokenList.get(i);
								pos+= token.length();
								if (i >= text1TokenIndex) {
									tokensSB.append(token);	
								}
							}
							pos = pos - tokensSB.length();
							
							//span 태그로 감쌀 문장의 유효성 검사를 한다.
							if(checkSpanText(tokensSB.toString())) {
								sb.append("<span style=\"background-color: yellow;\">"+tokensSB.toString()+"</span>");
							} else {
								sb.append(tokensSB.toString());
							}
							text1TokenIndex = text1TokenIndex + text1TokenIndexOffsetByText2Token;					
						}
					}
					
					text1TokenIndexOffset = 0;
					text2TokenIndexOffset = 0;
				}
				//while문 끝
			}
		}
		return sb.toString();
	}
	
	//span으로 감쌀 문장의 유효성 검사
	public static Boolean checkSpanText(String text)
	{
		Boolean b = true;
	
		//문장이 공백이라면
		if("".equals(text.replace(" ", "")))
			b = false;
		
		//문장안에 특정 태그가 있을 경우
		if(text.indexOf("<") != -1 || text.indexOf(">") != -1 || text.toLowerCase().indexOf("class") != -1 
				|| text.toLowerCase().indexOf("id") != -1 || text.toLowerCase().indexOf("name") != -1
				|| text.toLowerCase().indexOf("style") != -1 || text.toLowerCase().indexOf("div") != -1
				|| text.toLowerCase().indexOf("img") != -1 || text.toLowerCase().indexOf("table") != -1
				|| text.toLowerCase().indexOf("tr") != -1 || text.toLowerCase().indexOf("td") != -1
				|| text.toLowerCase().indexOf("href") != -1 || text.toLowerCase().indexOf("src") != -1
				|| text.toLowerCase().indexOf("width") != -1 || text.toLowerCase().indexOf("height") != -1
				|| text.toLowerCase().indexOf("colspan") != -1 || text.toLowerCase().indexOf("rowspan") != -1
				|| text.toLowerCase().indexOf("align") != -1 || text.toLowerCase().indexOf("level") != -1
				|| text.toLowerCase().indexOf("type") != -1 || text.toLowerCase().indexOf("code") != -1
				|| text.toLowerCase().indexOf("onmouseover") != -1 || text.toLowerCase().indexOf("=") != -1
				|| text.toLowerCase().indexOf(":") != -1 || text.toLowerCase().indexOf(";") != -1
				|| text.toLowerCase().indexOf("-") != -1 || text.toLowerCase().indexOf("\"") != -1
				|| text.toLowerCase().indexOf("'") != -1
			) 
		{
			b = false;
		}
		
		return b;
	}
	
	//해당 토큰의 위치를 반환한다
	public static int getTokenIndex(List<String> tokenList, String token, int beingIndex) {
		for (int i = beingIndex; i < tokenList.size(); i++) {
			// 대소문자 무시
			if (tokenList.get(i).equalsIgnoreCase(token)) {
				return i;
			}
		}
		return -1;
	}
	
	//문자열을 구분자로 나눈다
	public static List<String> getTokenList(String text) {
		List<String> tokenList = new ArrayList<String>();
		int textLen = text.length();
		int index = 0;
		int beginIndex = 0;
		int endIndex = 0;
		
		text = text + " ";
		
		for (index = 0; index < textLen; index++) 
		{
			//해당 문자가 구분자인지 판단한다.
			if (isDelimiter(text.charAt(index))) 
			{
				endIndex = index;
				String token = text.substring(beginIndex, endIndex);
				
				if (token.length() > 0) 
				{						
					tokenList.add(token);	
				}
				
				beginIndex = endIndex;
				endIndex = endIndex + 1;
				token = text.substring(beginIndex, endIndex);
				
				if (token.length() > 0)
					tokenList.add(token);
				
				beginIndex = endIndex;
			}
		}
		return tokenList;
	}
	
	//해당 문자가 구분자인지 판단한다.
	public static boolean isDelimiter(char c) {
		for (char d : delimiters) {
			if (d == c) {
				return true;
			}
		}
		return false;
	}
	
	private static char[] delimiters = {' ', '<', '>'};
	
	public static String deleteHtml(String str, String[] html)
	{
		for(int i = 0; i < html.length; i++)
		{
			while(true)
			{
				int s = str.indexOf("<"+html[i]);
				
				if(s == -1)
					break;
				
				if(s != -1)
				{
					String span = "";				
					int e = str.substring(s).indexOf(">");
					e += str.substring(0, s).length();
					if(e != -1)
					{
						span = str.substring(s, e + 1);
						str = str.replace(span, " ");
					}
				}				
			}	
			str = str.replace("</"+html[i]+">", " ");
		}
		
		return str;
	}
	
	public static List<String> getDataFormatList(String revisionDate) {
		List<String> list = new ArrayList<String>();
		
		int year = Integer.valueOf(revisionDate .substring(0,  4));   
		int month = Integer.valueOf(revisionDate .substring(4,  6));
		int day = Integer.valueOf(revisionDate .substring(6,  8));
		
		list.add(String.format("%04d.%02d.%02d", year, month, day));
		list.add(String.format("%04d/%02d/%02d", year, month, day));
		list.add(String.format("%04d-%02d-%02d", year, month, day));
		
		list.add(String.format("%04d.%d.%d", year, month, day));
		list.add(String.format("%04d/%d/%d", year, month, day));
		list.add(String.format("%04d-%d-%d", year, month, day));
		
		list.add(String.format("%04d.%2d.%2d", year, month, day));
		list.add(String.format("%04d/%2d/%2d", year, month, day));
		list.add(String.format("%04d-%2d-%2d", year, month, day));
		
		list.add(String.format("%04d.%2d.%3d", year, month, day));
		list.add(String.format("%04d/%2d/%3d", year, month, day));
		list.add(String.format("%04d-%2d-%3d", year, month, day));
			 
		return list;
	}
	
	@SuppressWarnings("unchecked")
	 public static List<String> split(String text , String rex ,boolean keepDelim) { 
	        if (text == null) { 
	            return null;
	        } 
	 
	        int lastInx = 0; 
	        //LinkedList splitted = new LinkedList(); 
	        List<String> splitted = new ArrayList<String>();
	 
	        Pattern pattern = Pattern.compile(rex);
	        Matcher m = pattern.matcher(text); 
	 
	        while (m.find()) { 
	 
	        	splitted.add(text.substring(lastInx,m.start()) + m.group());
	        	
	            /*if (keepDelim) { 
	                splitted.add(m.group()); 
	            } */
	 
	            lastInx = m.end(); 
	        } 
	 
	        
	        	splitted.add(text.substring(lastInx));
	        	splitted.remove(splitted.size() - 1);
	 
	        /*return (String[]) splitted.toArray(new String[splitted.size()]);*/ 
	        return splitted;
	}
	
	public static String getWorkStepString(String step) {
		String stepName = "";
		
		if ("ALL".equals(step)) return "모든단계";
		if ("LAW".equals(step)) return "모든단계";
		if ("WEB".equals(step)) return "모든단계";
		
		int stepNo = Integer.parseInt(step);
		
		switch(stepNo) {
		case 202:
			stepName = "영역";
			break;
		case 203:
			stepName = "형식교정";
			break;
		case 204:
			stepName = "원어민감수";
			break;
		case 205:
			stepName = "1차교정";
			break;
		case 206:
			stepName = "2차교정";
			break;
		case 207:
			stepName = "최종교정";
			break;		
		case 208:
			stepName = "통상감수";
			break;		
		case 401:
			stepName = "원고작성";
			break;	
		case 402:
			stepName = "원고확인";
			break;	
		case 403:
			stepName = "1차교정";
			break;	
		case 404:
			stepName = "최종교정";
			break;		
		}
		
		return stepName;
	}
	
	public static String getWorkName(String type) {
		String workName = "";
		
		int workNo = Integer.parseInt(type);
		
		switch(workNo) {
		case 1:
			workName = "할당";
			break;
		case 2:
			workName = "완료";
			break;
		case 3:
			workName = "진행";
			break;
		case 4:
			workName = "대기";
			break;
		}
		
		return workName;
	}
	
	public static String deleteOrdinal(String data, String ordinal) {
		
		String dataNew = "";
		
		if(data.contains(ordinal)) {
			dataNew = data.substring( ordinal.length(), data.length());
		} else {
			dataNew = data;
		}
		
		/*String dataNew = data.substring( ordinal.length(), data.length());*/
		
		return dataNew;
	}
	
	public static String replaceAllContent(String source, String subject, String object) 
    {
        StringBuffer rtnStr = new StringBuffer();
        String preStr = "";
        String nextStr = source;
        while (source.indexOf(subject) >= 0) {
            preStr = source.substring(0, source.indexOf(subject));
            nextStr = source.substring(source.indexOf(subject) + subject.length(), source.length());
            source = nextStr;
            rtnStr.append(preStr).append(object);
        }
        rtnStr.append(nextStr);
        return rtnStr.toString();
    }	
	
	/**
	 * 파일저장
	 * @param path 저장경로
 	 * @param data 저장내용
	 */
	public void saveFiles(String path, String data) {
		try 
		{
			BufferedWriter UniOutput = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path),"UTF8"));
			
			UniOutput.write(data);			
			UniOutput.close();		
			
		} 
		catch (IOException e) 
		{
		}
	}
	
	/**
	 * 파일 이어쓰기 
	 * @param path 저장 경로
	 * @param data 저장 내용
	 */
	public void saveFileOverWrite(String path, String data) {
		try 
		{
			//BufferedWriter UniOutput = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path),"UTF8"));						
			BufferedWriter UniOutput = new BufferedWriter(new FileWriter(path, true));
			
			UniOutput.write(data);
			UniOutput.newLine();
			UniOutput.close();								
		} 
		catch (IOException e) {
		}
	}
	
	/**
	 * 특정 폴더의 파일리스트 가져오기
	 * @param path
	 * @return
	 */
	public ArrayList<String> getFileList(String path)
	{
		ArrayList<String> filelist = new ArrayList<String>();
		
		// 특정 폴더내의 파일 검색
		File directory = new File(path); 		
		File[] files = directory.listFiles();
		
		for (File file : files)
		{
			filelist.add(file.getName());
		}
				
		return filelist;
	}
	
	/**
	 * 특정 폴더의 파일리스트 가져오기 (확장명 제외)
	 * @param path
	 * @return
	 */
	public ArrayList<String> getFileListNoExt(String path, String extension)
	{
		ArrayList<String> filelist = new ArrayList<String>();
		
		// 특정 폴더내의 파일 검색
		File directory = new File(path); 		
		File[] files = directory.listFiles();
		
		for (File file : files)
		{
			
			String filename = file.getName();
			filename = filename.replace("."+ extension, "");			
			
			filelist.add(filename);
		}
				
		return filelist;
	}
	
	public boolean isFile(String path, String lawname) {
		boolean exist = false;
		
		File file = new File(path); 
		
		if (file.exists() == true) {
			exist = true;
		}
		
		return exist;
	}
	
	/**
	 * 파일 내용읽기
	 * @param path 전체경로
	 * @return 파일 내용 문자열
	 */
	public String getFileContent(String path)
	{						
		StringBuffer sb = new StringBuffer();
		
		try 
		{
			BufferedReader input = new BufferedReader(new InputStreamReader(new FileInputStream(path),"UTF8"));			
			String data = "";
			
			while ( (data = input.readLine()) != null )
			{
				sb.append(data + "@");
			}			
						
			input.close();		
			
		} 
		catch (IOException e) 
		{
		}
		
		return sb.toString();
	}
	
	/**
	 * 파일 내용읽기
	 * @param path 전체경로
	 * @return 파일 내용 문자열
	 */
	public String getFileContentKR(String path)
	{						
		StringBuffer sb = new StringBuffer();
		
		try 
		{
			BufferedReader input = new BufferedReader(new InputStreamReader(new FileInputStream(path),"ISO-8859-1"));			
			String data = "";
			
			while ( (data = input.readLine()) != null )
			{
				sb.append(data + "@");
			}			
						
			input.close();		
			
		} 
		catch (IOException e) 
		{
			
		}
		
		return sb.toString();
	} 
	
	/**
	 * XML 파일 인덴트 맞추기
	 */
	public void saveXMLIndent(String path) {
//		try {
//			FileOutputStream fos = new FileOutputStream(path);
//			
//			OutputFormat of = new OutputFormat("XML","UTF-8",true);
//			of.setIndent(1);
//			of.setIndenting(true);
//			
//			XMLSerializer serializer = new XMLSerializer(fos,of);
//			serializer.Deserialize()			
//			
//			fos.close();
//			
//		} catch (FileNotFoundException e) {			
//			logger.error(e.getMessage(), "saveXMLIndent");
//		} catch (IOException e) {
//			logger.error(e.getMessage(), "saveXMLIndent");
//		}
	}
	
	
	/**
	 * 파일 이동 
	 * @param source 원본파일경로
	 * @param target 이동파일경로
	 * @return
	 */
	public boolean moveFile(String source, String target) {
		boolean result = false;  
        
	    FileInputStream inputStream = null;  
	    FileOutputStream outputStream = null;  
	          
	    try {  
	        inputStream = new FileInputStream(source);  
	        outputStream = new FileOutputStream(target);  
	    } catch (FileNotFoundException e) {  
	        e.printStackTrace();  
	        result = false;  
	    }  
	          
	    FileChannel fcin = inputStream.getChannel();  
	    FileChannel fcout = outputStream.getChannel();  
	          
	    long size = 0;  
	    try {  
	        size = fcin.size();  
	        fcin.transferTo(0, size, fcout);  
	              
	        fcout.close();  
	        fcin.close();  
	        outputStream.close();  
	        inputStream.close();  
	              
	        result = true;  
	    } catch (IOException e) {  
	        e.printStackTrace();  
	        result = false;  
	    }  
	          
	    File f = new File(source);  
	    if (f.delete()) {  
	        result = true;  
	    }
	    
	    return result;  
	}
	
	public static void copy(String source, String target) {
		  //복사 대상이 되는 파일 생성 
		  File sourceFile = new File( source );
		  
		  //스트림 선언 
		  FileInputStream inputStream = null;
		  FileOutputStream outputStream = null;
		  
		  try {
			  
		   //스트림 생성
		   inputStream = new FileInputStream(sourceFile);
		   outputStream = new FileOutputStream(target);
		   
		   int bytesRead = 0;
		   
		   //인풋스트림을 아웃픗스트림에 쓰기
		   byte[] buffer = new byte[1024];   
		   while ((bytesRead = inputStream.read(buffer, 0, 1024)) != -1) {
		    outputStream.write(buffer, 0, bytesRead);
		   }
		   
		  } catch (Exception e) {
		   e.printStackTrace();
		  } finally {
		   //자원 해제
		   try{
		    outputStream.close();
		   } catch(IOException ioe){}
			   try{
			    inputStream.close();
			   }catch(IOException ioe){}
		  }
	}
	
	public static void createFoler(String path) {
		//디렉토리 생성 
		File desti = new File(path);
		
		//해당 디렉토리의 존재여부를 확인
		if(!desti.exists()){
			//없다면 생성
			desti.mkdirs(); 
		}
	}
	
	public void delete(String path) {
		File file = new File(path);
		
		file.delete();
	}
	
	/**
	 * 특정문자열을 SPAN태그를 이용하여 배경색을 변경한다.
	 * @param originalStr - originalString
	 * @param searchWord - searchWord
	 * @param colorValue - #0000ff
	 * */
	public static String replaceWordBackgroundColor(String originalStr, String searchWord, String colorValue) {
		String replacement = "<span id=markingReplace style=\"background-color: #" + colorValue + ";\">"+searchWord+"</span>"; 
		String tempString = StringUtils.replace(originalStr, searchWord, replacement);
		//TODO 영문의 경우 대소문자 문제로 인하여 originalStr을 token후 적용해야함.
		return tempString;
	}

	/**
	 * A테그만 제거한다.
	 * */
	public static String removeATag(String changeStr){
	    if(changeStr != null && !changeStr.equals("")){
	        changeStr = changeStr.replaceAll("<(/)?([aA]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	    }else{
	        changeStr = "";
	    }
	    return changeStr;
	}

}
