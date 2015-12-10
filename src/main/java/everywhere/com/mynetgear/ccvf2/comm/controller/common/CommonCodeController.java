package everywhere.com.mynetgear.ccvf2.comm.controller.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import everywhere.com.mynetgear.ccvf2.comm.dao.commoncode.CommonCodeDao;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonReplyDto;
import everywhere.com.mynetgear.ccvf2.comm.dto.commoncode.CommonCodeDto;
import everywhere.com.mynetgear.ccvf2.comm.service.commoncode.CommonCodeService;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;

/**
 * @author 배성욱
 * @createDate 2015. 12. 9.
 * @described 공통코드AJAX 요청
 * @reference class
 */
@Controller
public class CommonCodeController {
	@Autowired
	private CommonCodeService commonCodeService;
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 9.
	 * @described 코드목록을 ajax요청
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	
	@RequestMapping(value="/common/code/codelist.ajax", method=RequestMethod.GET)
	public void getListRequestCommonCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println(Constant.LOG_ID3+"요~~췅");
		String code_group = request.getParameter("code_group"); 
		List<CommonCodeDto> list= commonCodeService.getListCodeGroup(code_group);
		JSONArray jsonArray = new JSONArray();
		JSONObject rootObj = new JSONObject();
		for (int i = 0; i < list.size(); i++) {
			CommonCodeDto dto = list.get(i);
			
			//DTO의 Date객체를 문자화
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateStr = transFormat.format(dto.getCode_regdate());

			JSONObject obj = new JSONObject();
			obj.put("code_no", dto.getCode_no());
			obj.put("code", StringUtils.clean(dto.getCode()));
			obj.put("code_name", StringUtils.clean(dto.getCode_name()));
			obj.put("code_group", StringUtils.clean(dto.getCode_group()));
			obj.put("code_group_name", StringUtils.clean(dto.getCode_group_name()));
			obj.put("code_sort", dto.getCode_sort());
			obj.put("code_value", StringUtils.clean(dto.getCode_value()));
			obj.put("code_regdate", dateStr);
			jsonArray.add(obj);
		}

		rootObj.put("common_code", jsonArray);
		String test = rootObj.toJSONString();
		System.out.println(test);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(test);
	}
}
