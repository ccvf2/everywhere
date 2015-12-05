package everywhere.com.mynetgear.ccvf2.comm.util.common;

import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 배성욱
 * @createDate 2015. 12. 5.
 * @described 공통처리를 유틸리티
 * @reference CommonUtils-class
 */
public class CommonUtils {

	/**
	 * SQL 인젝션 공격 가능성이 있는 문자 포함 여부를 알아 낸다.
	 * 
	 * @param str
	 * @return
	 */
	public static boolean checkSQLInjection(String str) {
		if (str == null)
			str = "";

		String[] text = { ";", "'", "--", "/*", "*/", "xp_", "|", "$", "%", "\"", "(", "<", ")", ">", "+" };
		for (int i = 0; i < text.length; i++) {
			if (str.indexOf(text[i]) > -1) {
				return true;
			}
		}

		return false;
	}

	/**
	 * 모든 파라미터의 sql 인젝션 유효성 검사를 합니다.
	 * 
	 * @param request
	 * @return
	 */
	public static boolean checkRequestSqlInjection(HttpServletRequest request) {
		Map<?, ?> pMap = request.getParameterMap();
		boolean error = false;
		Iterator<?> one = pMap.keySet().iterator();

		while (one.hasNext()) {
			String key = (String) one.next();
			String buffer[] = (String[]) pMap.get(key);

			for (int i = 0; i < buffer.length; i++) {
				String value = buffer[i];

				if (checkSQLInjection(value)) {
					error = true;
					break;
				}
			}

			if (error)
				break;
		}

		return error;
	}

	/** SQL 인젝션 구문 삭제 
	 * @param text 
	 * @return **/
	public String sqlInjectionDelete(String text) {
		String[] ch = { "'", "\"", "-", "(", ")", "<", ">", "=", "*", "/", "+", "user_tables", "user_table_coulmns",
				"table_name", "column_name", "syscolumns", "union", "select", "insert", "drop", "update", "and", "or",
				"if", "join", "ubstring", "from", "where", "declare", "substr", "openrowset", "xp_", "sysobjects" };

		for (int i = 0; i < ch.length; i++) {
			int index = text.toLowerCase().indexOf(ch[i]);
			if (index != -1) {
				String s = text.substring(0, index);
				String e = text.substring(index + ch[i].length());

				text = s + e;

				i = i - 1;
			}
		}
		return text;
	}

	/** SQL 인젝션 구문 검사 
	 * @param text 
	 * @param param 
	 * @return **/
	public static String sqlInjectionCheck(String text, String param) {
		String[] ch = { "'", "\"", "-", "(", ")", "<", ">", "=", "*", "/", "+", "user_tables", "user_table_coulmns",
				"table_name", "column_name", "syscolumns", "union", "select", "insert", "drop", "update", "and", "or",
				"if", "join", "ubstring", "from", "where", "declare", "substr", "openrowset", "xp_", "sysobjects" };

		for (int i = 0; i < ch.length; i++) {
			int index = text.indexOf(ch[i]);
			if (index != -1) {
				return param + "에 \'" + ch[i] + "\'는 입력 할 수 없습니다.";
			}
		}
		return "";
	}

	/** XSS 공격 구문제거 
	 * @param text 
	 * @return **/
	public String xssDelete(String text) {
		String[] ch = { "javascript", "eval", "onabort", "vbscript", "innerHTML", "onactivate", "expression", "charset",
				"onafterprint", "applet", "document", "onafterupdate", "meta", "string", "onbefore", "xml", "create",
				"onbeforeactivate", "blink", "append", "onbeforecopy", "link", "binding", "onbeforecut", "alert",
				"onbeforedeactivate", "script", "msgbox", "onbeforeeditfocus", "embed", "refresh", "onbeforepaste",
				"object", "embed", "onbeforeprint", "iframe", "ilayer", "onbeforeunload", "frame", "applet",
				"onbeforeupdate", "frameset", "cookie", "onblur", "ilayer", "javascript", "onbounce", "layer", "void",
				"oncellchange", "bgsound", "href", "onchange", "title", "onclick", "base", "oncontextmenu",
				"oncontrolselect", "onfocusin", "onpaste", "oncopy", "onfocusout", "onpropertychange", "oncut",
				"onhelp", "onreadystatechange", "ondataavailable", "onkeydown", "onreset", "ondatasetchanged",
				"onkeypress", "onresize", "ondatasetcomplete", "onkeyup", "onresizeend", "ondblclick",
				"onlayoutcomplete", "onresizestart", "ondeactivate", "onload", "onrowenter", "ondrag", "onlosecapture",
				"onrowexit", "ondragend", "onmousedown", "onrowsdelete", "ondragenter", "onmouseenter",
				"onrowsinserted", "ondragleave", "onmouseleave", "onscroll", "ondragover", "onmousemove", "onselect",
				"ondragstart", "onmouseout", "onselectionchange", "ondrop", "onmouseover", "onselectstart", "onerror",
				"onmouseup", "onstart", "onerrorupdate", "onmousewheel", "onstop", "onfilterchange", "onmove",
				"onsubmit", "onfinish", "onmoveend", "onunload", "onfocus", "onmovestart" };

		for (int i = 0; i < ch.length; i++) {
			int index = text.toLowerCase().indexOf(ch[i]);
			if (index != -1) {
				String s = text.substring(0, index);
				String e = text.substring(index + ch[i].length());

				text = s + e;

				i = i - 1;
			}
		}
		return text;
	}

	/** XSS 공격 구문 검사 
	 * @param text 
	 * @return **/
	public String xssCheck(String text) {
		if (text == null)
			return "";
		if (text.length() == 0)
			return "";

		String[] ch = { "javascript", "eval", "onabort", "vbscript", "innerHTML", "onactivate", "expression", "charset",
				"onafterprint", "applet", "document", "onafterupdate", "meta", "string", "onbefore", "xml", "create",
				"onbeforeactivate", "blink", "append", "onbeforecopy", "link", "binding", "onbeforecut", "style",
				"alert", "onbeforedeactivate", "script", "msgbox", "onbeforeeditfocus", "embed", "refresh",
				"onbeforepaste", "object", "embed", "onbeforeprint", "iframe", "ilayer", "onbeforeunload", "frame",
				"applet", "onbeforeupdate", "frameset", "cookie", "onblur", "ilayer", "javascript", "onbounce", "layer",
				"void", "oncellchange", "bgsound", "href", "onchange", "title", "onclick", "base", "oncontextmenu",
				"oncontrolselect", "onfocusin", "onpaste", "oncopy", "onfocusout", "onpropertychange", "oncut",
				"onhelp", "onreadystatechange", "ondataavailable", "onkeydown", "onreset", "ondatasetchanged",
				"onkeypress", "onresize", "ondatasetcomplete", "onkeyup", "onresizeend", "ondblclick",
				"onlayoutcomplete", "onresizestart", "ondeactivate", "onload", "onrowenter", "ondrag", "onlosecapture",
				"onrowexit", "ondragend", "onmousedown", "onrowsdelete", "ondragenter", "onmouseenter",
				"onrowsinserted", "ondragleave", "onmouseleave", "onscroll", "ondragover", "onmousemove", "onselect",
				"ondragstart", "onmouseout", "onselectionchange", "ondrop", "onmouseover", "onselectstart", "onerror",
				"onmouseup", "onstart", "onerrorupdate", "onmousewheel", "onstop", "onfilterchange", "onmove",
				"onsubmit", "onfinish", "onmoveend", "onunload", "onfocus", "onmovestart" };

		for (int i = 0; i < ch.length; i++) {
			int index = text.toLowerCase().indexOf(ch[i]);
			if (index != -1) {
				return ch[i] + "는 보안상 입력 할 수 없습니다.";
			}
		}

		return "";
	}

	/** XSS 공격 구문 검사 
	 * @param text 
	 * @param pram 
	 * @return **/
	public String xssCheck(String text, String pram) {
		if (text == null)
			return "";
		if (text.length() == 0)
			return "";

		String[] ch = { "javascript", "eval", "onabort", "vbscript", "innerHTML", "onactivate", "expression", "charset",
				"onafterprint", "applet", "document", "onafterupdate", "meta", "string", "onbefore", "xml", "create",
				"onbeforeactivate", "blink", "append", "onbeforecopy", "link", "binding", "onbeforecut", "style",
				"alert", "onbeforedeactivate", "script", "msgbox", "onbeforeeditfocus", "embed", "refresh",
				"onbeforepaste", "object", "embed", "onbeforeprint", "iframe", "ilayer", "onbeforeunload", "frame",
				"applet", "onbeforeupdate", "frameset", "cookie", "onblur", "ilayer", "javascript", "onbounce", "layer",
				"void", "oncellchange", "bgsound", "href", "onchange", "title", "onclick", "base", "oncontextmenu",
				"oncontrolselect", "onfocusin", "onpaste", "oncopy", "onfocusout", "onpropertychange", "oncut",
				"onhelp", "onreadystatechange", "ondataavailable", "onkeydown", "onreset", "ondatasetchanged",
				"onkeypress", "onresize", "ondatasetcomplete", "onkeyup", "onresizeend", "ondblclick",
				"onlayoutcomplete", "onresizestart", "ondeactivate", "onload", "onrowenter", "ondrag", "onlosecapture",
				"onrowexit", "ondragend", "onmousedown", "onrowsdelete", "ondragenter", "onmouseenter",
				"onrowsinserted", "ondragleave", "onmouseleave", "onscroll", "ondragover", "onmousemove", "onselect",
				"ondragstart", "onmouseout", "onselectionchange", "ondrop", "onmouseover", "onselectstart", "onerror",
				"onmouseup", "onstart", "onerrorupdate", "onmousewheel", "onstop", "onfilterchange", "onmove",
				"onsubmit", "onfinish", "onmoveend", "onunload", "onfocus", "onmovestart" };

		for (int i = 0; i < ch.length; i++) {
			int index = text.toLowerCase().indexOf(ch[i]);
			if (index != -1) {
				return pram + " \"" + ch[i] + "\"는 보안상 입력 할 수 없습니다.";
			}
		}

		return "";
	}
	
	/**
	 * html 태그를 제거 합니다.
	 * @param str
	 * @return
	 */
	public static String deleteHTML(String str)
	{
		if(str == null)
			return "";
		
		str = str.replaceAll("&lt;", "<");
		str = str.replaceAll("&gt;", ">");
		return str = str.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");		
	}
	
	
	/**
	 * 문장에서 특정 태그를 제거 합니다.
	 * @param str
	 * @param html
	 * @return
	 */
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
	
	
	/**업로드 파일 확장자 검사
	 * @param name 
	 * @return **/
	public String fileExtensionCheck(String name)
	{		
		if(name == null)
			return "";
		if(name.length() == 0)
			return "";
		
		String[] ch = {".hwp", ".cell", ".csv", ".show", ".hpt", ".hsdt", ".doc", ".docx", ".xls", ".xlsx", ".xlsm", ".xlsb", ".xml", ".txt", ".log", ".pdf", ".ppt", ".pptx", ".gul", ".hst", ".zip", ".alz",
				".jpg", ".jpeg", ".bmp", ".gif", ".png", ".psd", ".swi", ".wav", ".mid", ".mp3", ".ai", ".avi", ".mp4", ".gl4"};
		String ext = "";
		if(name.indexOf(".") == -1)
			return "파일에 확장자가 없습니다.";
		else
		{
			ext = name.substring(name.lastIndexOf(".")).toLowerCase();
			
			for(int i = 0; i < ch.length; i++)
			{
				if(ext.equals(ch[i]))
					return "";
			}
		}
		
		return ext + " 확장자 파일은 업로드 할 수 없습니다.";
	}
}