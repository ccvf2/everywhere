package everywhere.com.mynetgear.ccvf2.user.service.visitor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.member.MemberDao;
import everywhere.com.mynetgear.ccvf2.user.dao.planner.PlannerDao;
import everywhere.com.mynetgear.ccvf2.user.dao.visitor.VisitorDao;
import everywhere.com.mynetgear.ccvf2.user.dto.member.MemberDto;
import everywhere.com.mynetgear.ccvf2.user.dto.planner.PlannerDto;
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
	@Autowired
	private MemberDao memberDao;

	
	/**나의 방명록으로 이동*/
	@Override
	public void visitorWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		MemberDto memberDto=(MemberDto) session.getAttribute(Constant.SYNN_LOGIN_OBJECT);
		
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=3;
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;

		
		int count=visitorDao.getVisitorCount(memberDto.getMem_no());
			
		List<VisitorDto> visitorList=null;
		if(count>0) {
			visitorList=visitorDao.getVisitorList(startRow, endRow, memberDto.getMem_no());
		}
		
		memberDto=memberDao.memberRead(memberDto.getMem_no());
		
		mav.addObject("memberDto", memberDto);
		mav.addObject("mateCheck", 2);
		mav.addObject("visitorList", visitorList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/user/visitor/visitorWrite");
	}
	
	
	/** 타회원 방명록*/
	@Override
	public void friendWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		int mate_no=Integer.parseInt(request.getParameter("mem_no"));
		
		MemberDto memberDto = memberDao.memberRead(mate_no);
		
		HttpSession session = request.getSession();
		MemberDto myDto=(MemberDto) session.getAttribute(Constant.SYNN_LOGIN_OBJECT);
		
		int mem_no=myDto.getMem_no();
		HashMap<String, Integer> mateMap=new HashMap<String, Integer>();
		mateMap.put("mem_no", mem_no);
		mateMap.put("mate_no", mate_no);
		
		int mateCheck=memberDao.getMateCheck(mateMap);
		
		memberDto=memberDao.memberRead(mate_no);
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=3;
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		int count=visitorDao.getVisitorCount(mate_no);
		System.out.println("VisitorService write count:"+count);
			
		List<VisitorDto> visitorList=null;
		List<MemberDto> memberList=null;
		if(count>0) {
			visitorList=visitorDao.getVisitorList(startRow, endRow, mate_no);
			memberList=visitorDao.getVisitorMemberList(startRow, endRow, mate_no);

			System.out.println("\n\n ----------- memberList.size() : " + memberList.size());
			System.out.println("memberList.get(0) : " + memberList.get(0));
		}
		
		mav.addObject("memberList", memberList);
		mav.addObject("mateCheck", mateCheck);
		mav.addObject("memberDto", memberDto);
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
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		visitorDto.setVisitor_status_code(Constant.SYNB_YN_Y);
		visitorDto.setVisitor_content(visitorDto.getVisitor_content().replace("\r\n", "<br/>"));
		System.out.println(visitorDto.toString());
		
		int check=visitorDao.visitorInsert(visitorDto);
		
		MemberDto memberDto = memberDao.memberRead(visitorDto.getMate_mem_no());
		
		mav.addObject("mateCheck", 2);
		mav.addObject("memberDto", memberDto);
		mav.addObject("check", check);
		mav.setViewName("/user/visitor/visitorWriteOk");
		
		/*HttpSession session = request.getSession();
		MemberDto memberDto=(MemberDto) session.getAttribute(Constant.SYNN_LOGIN_OBJECT);*/
		
		//int mem_no=Integer.parseInt(request.getParameter("mem_no"));
		/*visitorDto.setMem_no(mem_no);
		
		
		int check=visitorDao.visitorInsert(visitorDto);
		System.out.println("VisitorService writeOk check:"+check);
		
		mav.addObject("mateCheck", 2);
		mav.addObject("memberDto", memberDto);
		mav.addObject("check", check);
		mav.setViewName("/user/visitor/visitorWriteOk");*/
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
