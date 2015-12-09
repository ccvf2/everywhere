package everywhere.com.mynetgear.ccvf2.comm.controller.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.dao.common.CommonReplyDao;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonReplyDto;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonReplyService;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonReplyServiceImp;
import everywhere.com.mynetgear.ccvf2.user.service.member.MemberService;

/**
 * @author 배성욱
 * @createDate 2015. 12. 8.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Controller
public class CommonReplyController {
	@Autowired
	private CommonReplyService commonReplyService;
	
	/**
	 * @author 배성욱
	 * @param request 
	 * @param response 
	 * @return 
	 * @throws IOException 
	 * @createDate 2015. 12. 8.
	 * @described 공통댓글목록
	 */
	@RequestMapping(value="/common/reply/replylist.ajax", method=RequestMethod.GET)
	public void register(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String type_code="";
		int item_no=0;
		List<CommonReplyDto> list= commonReplyService.getListCommonReplyList(type_code, item_no);
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			CommonReplyDto dto = list.get(i);
			JSONObject obj = new JSONObject();
			obj.put("reply_no", dto.getReply_no());
			obj.put("mem_no", dto.getMem_no());
			obj.put("type_code", dto.getType_code());
			obj.put("item_no", dto.getItem_no());
			obj.put("reply_content", dto.getReply_content());
			obj.put("reply_writer_name", dto.getReply_writer_name());
			obj.put("reply_write_date", dto.getReply_write_date());
			obj.put("use_yn", dto.getUse_yn());
			jsonArray.add(obj);
		}

		String test = jsonArray.toJSONString();
		response.setContentType("application/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(test);
	}
}
