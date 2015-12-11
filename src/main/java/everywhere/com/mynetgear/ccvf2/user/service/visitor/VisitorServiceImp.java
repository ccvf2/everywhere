package everywhere.com.mynetgear.ccvf2.user.service.visitor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.visitor.VisitorDao;
import everywhere.com.mynetgear.ccvf2.user.dto.visitor.VisitorDto;

/**
 * @author 김준호
 * @createDate 2015. 12. 10.
 * @described 방명록서비스 구현부
 * @reference class
 */
@Component
public class VisitorServiceImp implements VisitorService {
	@Autowired
	private VisitorDao visitorDao;

	@Override
	public void visitorWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		
		int boardSize=3;
		
		int startRow=(currentPage-1)*boardSize+1; 
		int endRow=currentPage*boardSize;
		
		int count=visitorDao.getVisitorCount();
		System.out.println("VisitorService write count:"+count);
		
		List<VisitorDto> visitorList=null;
		if(count>0) {
			visitorList=visitorDao.getVisitorList(startRow, endRow);
		}
		System.out.println("VisitorService write visitorList:"+visitorList.size());
		
		mav.addObject("visitorList", visitorList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/user/visitor/visitorWrite");
	}

	@Override
	public void visitorWriteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		VisitorDto visitorDto=(VisitorDto)map.get("visitorDto");
		int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		
		visitorDto.setMem_no(mem_no);
		visitorDto.setVisitor_status_code(Constant.SYNB_YN_Y);
		
		int check=visitorDao.visitorInsert(visitorDto);
		System.out.println("VisitorService writeOk check:"+check);
		
	}

}
