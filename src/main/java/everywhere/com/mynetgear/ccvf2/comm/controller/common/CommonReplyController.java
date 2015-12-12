package everywhere.com.mynetgear.ccvf2.comm.controller.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.dao.common.CommonReplyDao;
import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonReplyDto;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonReplyService;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonReplyServiceImp;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.service.member.MemberService;

/**
 * @author 배성욱
 * @createDate 2015. 12. 8.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
/**
 * @author 배성욱
 * @createDate 2015. 12. 12.
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
	 * @param commonReplyDto 
	 * @return 
	 * @throws IOException 
	 * @createDate 2015. 12. 8.
	 * @described 공통댓글목록
	 */
	@RequestMapping(value="/common/reply/replylist.ajax", method=RequestMethod.GET)
	public void replylist(HttpServletRequest request, HttpServletResponse response,CommonReplyDto commonReplyDto) throws IOException {
		List<CommonReplyDto> list= commonReplyService.getListCommonReplyList(commonReplyDto);
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			CommonReplyDto dto = list.get(i);
			JSONObject obj = new JSONObject();
			//DTO의 Date객체를 문자화
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateStr = transFormat.format(dto.getReply_write_date());
			
			obj.put("reply_no", dto.getReply_no());
			obj.put("mem_no", dto.getMem_no());
			obj.put("type_code", StringUtils.clean(dto.getType_code()));
			obj.put("item_no", dto.getItem_no());
			obj.put("reply_content", StringUtils.clean(dto.getReply_content()));
			obj.put("reply_writer_name", StringUtils.clean(dto.getReply_writer_name()));
			obj.put("reply_write_date", StringUtils.clean(dateStr));
			obj.put("use_yn", StringUtils.clean(dto.getUse_yn()));
			obj.put("mem_profile_photo", StringUtils.clean(dto.getMem_profile_photo()));
			jsonArray.add(obj);
		}

		String test = jsonArray.toJSONString();
		response.setContentType("application/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(test);
	}
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 12.
	 * @described 공통댓글작성
	 * @param request
	 * @param response
	 * @param commonReplyDto
	 * @throws IOException
	 */
	@RequestMapping(value="/common/reply/replyWrite.ajax", method=RequestMethod.POST)
	public void register(HttpServletRequest request, HttpServletResponse response,CommonReplyDto commonReplyDto) throws IOException {
		//List<CommonReplyDto> list= commonReplyService.getListCommonReplyList(commonReplyDto);
		int result = commonReplyService.inserCommonReply(commonReplyDto);
		System.out.println(Constant.LOG_ID1+"ajax호출");
		response.setContentType("application/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	
	
	
	
	
	/**
	 * @author 배성욱
	 * @param request 
	 * @param response 
	 * @return 
	 * @throws IOException 
	 * @createDate 2015. 12. 11.
	 * @described 공통댓글삭제
	 */
	@RequestMapping(value="/common/reply/replydelete.ajax", method=RequestMethod.POST)
	public void replyDelete(HttpServletRequest request, HttpServletResponse response,CommonReplyDto commonReplyDto) throws IOException {
		
		int result=commonReplyService.deleteCommonReply(commonReplyDto);
		
		response.setContentType("application/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
