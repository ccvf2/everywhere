package everywhere.com.mynetgear.ccvf2.user.service.accompany;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import everywhere.com.mynetgear.ccvf2.comm.aop.EverywhereAspect;
import everywhere.com.mynetgear.ccvf2.comm.util.common.CommonUtils;
import everywhere.com.mynetgear.ccvf2.comm.util.common.Constant;
import everywhere.com.mynetgear.ccvf2.user.dao.accompany.AccompanyDao;
import everywhere.com.mynetgear.ccvf2.user.dto.accompany.AccompanyDto;


/**
 * @author 곽성국
 * @createDate 2015. 12. 7.
 * @described 동행구하기 Service구현부
 * @reference class
 */
@Component
public class AccompanyServiceImp implements AccompanyService {
	@Autowired
	private AccompanyDao accompanyDao;

	@Override
	public void insertAccompany(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		//게시판 번호 가져오는 것으로 바꿀 예정
		int accompany_no = 4;
		
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + accompany_no);
		
		mav.addObject("accompany_no", accompany_no);
		mav.setViewName("user/accompany/accompanyWrite");
	}

	@Override
	public void insertOkAccompany(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		AccompanyDto accompanyDto = new AccompanyDto();
		
		/*글쓴이: 임시라 변경 필요*/
		accompanyDto.setWriter_num(10);
		
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		
		/*여행 시작일 - 여행 종료일 Date 형식으로 변경*/
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			accompanyDto.setStart_date(sdf.parse(start_date));
			accompanyDto.setEnd_date(sdf.parse(end_date));

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//System.out.println("blah:" + accompanyDto.getStart_date());
		/*성별 코드: 1. 남자, 2. 여자, 3. 둘다*/
		accompanyDto.setGender(request.getParameter("gender_code"));
		
		/*제목 및 HTML제거*/
		accompanyDto.setTitle(CommonUtils.deleteHTML(request.getParameter("title")));
		
		/*내용 및 HTML 제거*/
		accompanyDto.setContent(CommonUtils.deleteHTML(request.getParameter("content")));
		/*기본값으로 동행은 구해지지 않았다*/
		accompanyDto.setAccompany_status_code(Constant.SYNB_YN_N);
		
		accompanyDto.setUse_yn(Constant.SYNB_YN_Y);
		
		accompanyDto.printAll();
		int check = accompanyDao.insertAccompany(accompanyDto);
		
		
		EverywhereAspect.logger.info(EverywhereAspect.logMsg + check);
		
		//mav.addObject("check", check);
		//mav.setViewName("user/accompany/accompanyWriteOk");
	}
}
