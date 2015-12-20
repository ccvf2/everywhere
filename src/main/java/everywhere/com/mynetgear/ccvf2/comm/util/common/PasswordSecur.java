package everywhere.com.mynetgear.ccvf2.comm.util.common;

import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import everywhere.com.mynetgear.ccvf2.user.dto.spot.SpotDto;
import everywhere.com.mynetgear.ccvf2.user.service.member.MemberService;

/**
 * @author 배성욱
 * @createDate 2015. 12. 20.
 * @described 클래스전체의 하는(큰)일을 적어주세요.
 * @reference class
 */
@Controller
public class PasswordSecur {

	
	@Autowired
	private MemberService memberService;

	@RequestMapping(value="/password/passwordChanghe.do", method=RequestMethod.GET)
	public ModelAndView passwordUtil(HttpServletRequest request, HttpServletResponse response) {
		memberService.passwordUtil();
		
		return null;	
	}
	
	
	
	@RequestMapping(value="/xmlparse/parse.do", method=RequestMethod.GET)
	public ModelAndView parse(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//memberService.passwordUtil();
		start();
		return null;	
	}
	
	
	private void start() throws Exception{
        URL url = new URL("http://api.visitkorea.or.kr/TourAPI2_manual/sample/searchKeyword_sample2.xml");
        URLConnection connection = url.openConnection();
 
        Document doc = parseXML(connection.getInputStream());
        NodeList descNodes = doc.getElementsByTagName("item");
        	ArrayList<SpotDto> list=new ArrayList<SpotDto>(); 
        for(int i=0; i<descNodes.getLength();i++){
        	SpotDto dto= new SpotDto();
        	dto.setMem_no(384);
        	dto.setCountry_code("B0001");
        	dto.setCity_code("C0001");
            for(Node node = descNodes.item(i).getFirstChild(); node!=null; node=node.getNextSibling()){ 
            	//첫번째 자식을 시작으로 마지막까지 다음 형제를 실행
            	
                if(node.getNodeName().equals("title")){
                	dto.setSpot_name(node.getTextContent());
                }else if(node.getNodeName().equals("addr1")){
                    System.out.println(node.getTextContent());
                }else if(node.getNodeName().equals("Child3")){
                    System.out.println(node.getTextContent());
                }
 
            }
 
        }
    }
 
    private Document parseXML(InputStream stream) throws Exception{
 
        DocumentBuilderFactory objDocumentBuilderFactory = null;
        DocumentBuilder objDocumentBuilder = null;
        Document doc = null;
 
        try{
 
            objDocumentBuilderFactory = DocumentBuilderFactory.newInstance();
            objDocumentBuilder = objDocumentBuilderFactory.newDocumentBuilder();
 
            doc = objDocumentBuilder.parse(stream);
 
        }catch(Exception ex){
            throw ex;
        }       
 
        return doc;
    }

}
