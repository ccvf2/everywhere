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
		VisitorDto visitorDto=(VisitorDto)map.get("visitorDto");
		String mem_no="64";
		visitorDto.setMem_no(Integer.parseInt(mem_no));
		visitorDto.setVisitor_status_code(Constant.SYNB_YN_Y);
		
		int check=visitorDao.visitorInsert(visitorDto);
		System.out.println("VisitorService writeOk check:"+check);
		
		mav.addObject("check", check);
		mav.setViewName("/user/visitor/visitorWriteOk");
	}

	@Override
	public void visitorUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		VisitorDto visitorDto=(VisitorDto)map.get("visitorDto");
		
		int visitor_no=Integer.parseInt(request.getParameter("visitor_no"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		System.out.println("VisitorController update visitor_no:"+visitor_no+"&pageNumber:"+pageNumber);
		
		visitorDto=visitorDao.visitorSelect(visitor_no);
		System.out.println("VisitorController update visitorDto:"+visitorDto);
		
		mav.addObject("visitorDto", visitorDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("/user/visitor/visitorUpdate");
		
	}

	@Override
	public void visitorUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		VisitorDto visitorDto=(VisitorDto)map.get("visitorDto");
		
		int check=visitorDao.visitorUpdate(visitorDto);
		System.out.println("VisitorService updateOk check:"+check);
		
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("/user/visitor/visitorUpdateOk");
	}

	@Override
	public void visitorDelete(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		VisitorDto visitorDto=(VisitorDto)map.get("visitorDto");
		
		int visitor_no=Integer.parseInt(request.getParameter("visitor_no"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		System.out.println("VisitorController delete visitor_no:"+visitor_no+"&pageNumber:"+pageNumber);
		
		visitorDto=visitorDao.visitorSelect(visitor_no);
		System.out.println("VisitorController delete visitorDto:"+visitorDto);
		
		visitorDto.setVisitor_status_code(Constant.SYNB_YN_N);
		
		int check=visitorDao.visitorDelete(visitorDto);
		System.out.println("VisitorService delete check:"+check);
		
		mav.addObject("check", check);
		mav.setViewName("/user/visitor/visitorDelete");
	}

}
