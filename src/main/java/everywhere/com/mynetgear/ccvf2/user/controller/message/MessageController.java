package everywhere.com.mynetgear.ccvf2.user.controller.message;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.user.dto.message.MessageDto;
import everywhere.com.mynetgear.ccvf2.user.service.message.MessageService;

/**
 * @author 배성욱
 * @createDate 2015. 12. 13.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Controller
public class MessageController {
	@Autowired
	MessageService messageService;
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 13.
	 * @described 1:1대화함
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/message/messageTalkList.do", method=RequestMethod.GET)
	public ModelAndView getListParsonTalk(HttpServletRequest request, HttpServletResponse response,MessageDto messageDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("messageDto",messageDto);
		messageService.getListParsonTalk(mav);
		return mav;	
	}

	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 13.
	 * @described 매소드의 용도를 적어주세요
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/user/message/messageBox.do", method=RequestMethod.GET)
	public ModelAndView getListMessageBox(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		mav.addObject("mem_no", mem_no);
		messageService.getListMessageBox(mav);
		return mav;	
	}
	
	/**
	 * @author 배성욱
	 * @createDate 2015. 12. 13.
	 * @described 매소드의 용도를 적어주세요
	 * @param request
	 * @param response
	 * @param dto
	 * @throws IOException
	 */
	@RequestMapping(value="/user/message/messageSend.ajax", method=RequestMethod.POST)
	public void insertMessage(HttpServletRequest request, HttpServletResponse response,MessageDto dto) throws IOException {
		int result = messageService.insertMessageSender(dto);
		response.setContentType("application/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	
	@RequestMapping(value="/user/message/messageBoxDelete.do", method=RequestMethod.POST)
	public ModelAndView deleteMessageBox(HttpServletRequest request, HttpServletResponse response,MessageDto dto) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.addObject("messageDto",dto);
		messageService.deleteMessageBox(mav);
		return mav;
	}
	
	
	
}
