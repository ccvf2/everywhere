package everywhere.com.mynetgear.ccvf2.comm.util.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import everywhere.com.mynetgear.ccvf2.comm.dto.common.CommonFileIODto;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonFileIOService;
import everywhere.com.mynetgear.ccvf2.comm.service.common.CommonFileIOServiceImp;
import everywhere.com.mynetgear.ccvf2.user.dao.spot.SpotDao;
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
	private CommonFileIOService commonFileIOService;
	@Autowired
	private SpotDao spotDao;
	
	
	@Value("${attach.spot.path}")
	private String Filepath;
	
	@Autowired
	private MemberService memberService;

	@RequestMapping(value="/password/passwordChanghe.do", method=RequestMethod.GET)
	public ModelAndView passwordUtil(HttpServletRequest request, HttpServletResponse response) {
		memberService.passwordUtil();
		
		return null;	
	}
	
	
	
	@RequestMapping(value="/xmlparse/parse.do", method=RequestMethod.GET)
	public ModelAndView parse(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int currentPage=1;
		int numOfRows=100;
		//도시코드
		int areaCode=1;
		String requestUrl="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=ccG6MDZvttNoXzutJHYMjBFR3AWZFCe%2B22ZHpIoB1ufPrRk48dGNhxEPYOdaNjsQowDwMpegNEU03lcRgm%2BXUw%3D%3D&MobileOS=ETC&MobileApp=everywhere&areaCode="+areaCode+"&numOfRows="+numOfRows+"&pageNo="+currentPage;
		
		int totalCnt=totalCount(requestUrl);
		int rollCount=(Integer)totalCnt/numOfRows;
		//int rollCount=1;
		if((totalCnt%numOfRows)!=0){
			rollCount=rollCount+1;
		}
		
			for (int j = 0; j < rollCount; j++) {
				//관광명소 일괄 넣기
				ArrayList<SpotDto> list=start(requestUrl);
				int size=list.size();
				for (int i = 0; i < size; i++) {
					SpotDto dto= list.get(i);
						dto.setSpot_no(spotDao.getSpotNextSeq());
						int result = spotDao.insertSpot(dto);
						System.out.println(Constant.LOG_ID3+dto.getSpot_name()+":::성공");
				}
				currentPage++;
				System.out.println("-------------------------------------------------------------------------------------------");
				System.out.println("PAGECOUNT:"+rollCount+"/"+currentPage);
				System.out.println("-------------------------------------------------------------------------------------------");
			}
		return null;	
	}
	
	
	private ArrayList<SpotDto> start(String requestUrl) throws Exception{
        URL url = new URL(requestUrl);
        URLConnection connection = url.openConnection();
 
        Document doc = parseXML(connection.getInputStream());
        NodeList descNodes = doc.getElementsByTagName("item");
        	ArrayList<SpotDto> list=new ArrayList<SpotDto>(); 
        for(int i=0; i<descNodes.getLength();i++){
        	SpotDto dto= new SpotDto();
        	dto.setMem_no(384);
        	dto.setCountry_code("B0001");
        	dto.setCity_code("C0001");
        	dto.setMem_level_code("M0001");
        	String addr="";
        	String imgSeq="";
        	String type="";
        	String contentId="";
        	String contentTypeId="";
            for(Node node = descNodes.item(i).getFirstChild(); node!=null; node=node.getNextSibling()){ 
            	//첫번째 자식을 시작으로 마지막까지 다음 형제를 실행
                if(node.getNodeName().equals("title")){
                	dto.setSpot_name(node.getTextContent());
                }else if(node.getNodeName().equals("contentid")){
                	contentId=node.getTextContent();
                }else if(node.getNodeName().equals("contenttypeid")){
                	contentTypeId=node.getTextContent();
                	//타입을 설정
                	if(StringUtils.equals(node.getTextContent(), "12")){
                		type="T0001";
                	}else if(StringUtils.equals(node.getTextContent(), "39")){
                		type="T0003";
                	}else if(StringUtils.equals(node.getTextContent(), "14")){
                		type="T0005";
                	}else if(StringUtils.equals(node.getTextContent(), "38")){
                		type="T0004";
                	}else if(StringUtils.equals(node.getTextContent(), "32")){
                		type="T0002";
                	}else if(StringUtils.equals(node.getTextContent(), "15")){
                		type="T0006";
                	}else if(StringUtils.equals(node.getTextContent(), "25")){
                		type="T0006";
                	}else if(StringUtils.equals(node.getTextContent(), "28")){
                		type="T0006";
                		
                	}else{
                		type="Error";
                	}
                }else if(node.getNodeName().equals("addr")){
                	addr+=node.getTextContent();
                }else if(node.getNodeName().equals("addr1")){
                	addr+=node.getTextContent();
                }else if(node.getNodeName().equals("addr2")){
                	addr+=" ";
                	addr+=node.getTextContent();
                }else if(node.getNodeName().equals("mapy")){
                	dto.setSpot_lat(Double.parseDouble(node.getTextContent()));
                }else if(node.getNodeName().equals("mapx")){
                	dto.setSpot_long(Double.parseDouble(node.getTextContent()));
                }else if(node.getNodeName().equals("firstimage")){
                	imgSeq+=imgprocess(node.getTextContent());
                	imgSeq+=",";
                }
            }
            
            dto.setSpot_note(start3(contentId,contentTypeId));
            dto.setAttach_file(imgSeq);
            dto.setSpot_addr(addr);
            dto.setSpot_type_code(type);
            list.add(dto);
        }
        
        return list;
        
    }
	
	
	private int totalCount(String requestUrl) throws Exception{
		URL url = new URL(requestUrl);
		URLConnection connection = url.openConnection();
		
		Document doc = parseXML(connection.getInputStream());
		NodeList descNodes = doc.getElementsByTagName("body");
		int totcount=0;
		
		for(int i=0; i<descNodes.getLength();i++){
			for(Node node = descNodes.item(i).getFirstChild(); node!=null; node=node.getNextSibling()){ 
				//첫번째 자식을 시작으로 마지막까지 다음 형제를 실행
				if(node.getNodeName().equals("totalCount")){
					totcount=Integer.parseInt(node.getTextContent());
				}
			}
			
		}
		
		return totcount;
		
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
    
    
    private String imgprocess(String imgUrl){
    	CommonFileIODto commFileDto = new CommonFileIODto();
    	commFileDto.setSave_path(Filepath);
    	
    	String extension = StringUtils.substringAfterLast(imgUrl, Constant.SYNB_DOT);
    	commFileDto.setExtension(extension);
    	String realFileName = StringUtils.substringAfterLast(imgUrl, "/");
    	commFileDto.setReal_name(realFileName);
    	commFileDto.setSave_name("spot_" + System.currentTimeMillis());
    	
    	String result="";
    	try {
    		//String imageSrc = "http://codekin.com/wp-content/uploads/2013/10/1315972_87020943-300x199.jpg";  
    		String imageSrc = imgUrl;  
    		URL voImageURL = new URL(imageSrc);  

    		
    		
    		//이미지에 해당하는 url을 통하여 커넥션을 진행  
    		HttpURLConnection voImageReponse = (HttpURLConnection) voImageURL.openConnection();  
    		  
    		
    		InputStream is = null;
    		FileOutputStream fos= null;
    		BufferedInputStream bis= null;
    		BufferedOutputStream bos= null;
    		//200_OK 응답에 대해서만 처리  
    		if (voImageReponse.getResponseCode() == HttpURLConnection.HTTP_OK) {
    		    is = voImageReponse.getInputStream();  
    		  
    		    //응답 코드를 C:\1.jpg에 저장  
    		    fos = new FileOutputStream(Filepath + File.separator + commFileDto.getSave_name()+"."+commFileDto.getExtension());
    		    bis = new BufferedInputStream(is);  
    		    bos = new BufferedOutputStream(fos);  
    		      
    		    //응답 코드를 1024바이트 단위로 저장  
    		    int len = 0;  
    		    byte[] buf = new byte[1024];  
    		    while ((len = bis.read(buf, 0, 1024)) != -1) {  
    		        bos.write(buf, 0, len);  
    		        bos.flush();  
    		    }
    		    
    		    commFileDto.setWrite_no(384);
    		    commFileDto.setType_code("F0001");
    		    int fileSeq=commonFileIOService.insertFileInfo(commFileDto);
    		    result=""+fileSeq;
    		    
    		    
    		    
    		    
    		} else {  
    		    System.out.println("connection failed. code is : "  
    		            + voImageReponse.getResponseCode());  
    		    System.out.println("failed connection url : " + voImageReponse.getURL());  
    		}  
    		bos.close();
    		bis.close();
    		fos.close();
    		is.close();

    	
    		
    		
    		
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return result;
    }
    
    
    
    
    
    
    
    
    
    
    //http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=ccG6MDZvttNoXzutJHYMjBFR3AWZFCe%2B22ZHpIoB1ufPrRk48dGNhxEPYOdaNjsQowDwMpegNEU03lcRgm%2BXUw%3D%3D&MobileOS=ETC&MobileApp=everywhere&contentId=*&contentTypeId=*&numOfRows=2
    //contentId=*&contentTypeId=*
    //---------------------------------------------------------------내용을 다시 긁어옴
    private String start3(String contentId,String contentTypeId) throws Exception{
    	String reQuestUrl="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=ccG6MDZvttNoXzutJHYMjBFR3AWZFCe%2B22ZHpIoB1ufPrRk48dGNhxEPYOdaNjsQowDwMpegNEU03lcRgm%2BXUw%3D%3D&MobileOS=ETC&MobileApp=everywhere&contentId="+contentId+"&contentTypeId="+contentTypeId+"&numOfRows=1";
    	URL url = new URL(reQuestUrl);
    	URLConnection connection = url.openConnection();
    	
    	Document doc = parseXML(connection.getInputStream());
    	NodeList descNodes = doc.getElementsByTagName("item");
    	StringBuffer content=new StringBuffer();
    	
    	for(int i=0; i<descNodes.getLength();i++){
    		
    		for(Node node = descNodes.item(i).getFirstChild(); node!=null; node=node.getNextSibling()){ //첫번째 자식을 시작으로 마지막까지 다음 형제를 실행
    			if(node.getNodeName().equals("infoname")){
    				//제목을 붙임
    				content.append("<H1 id='infoname'>");
    				content.append(node.getTextContent());
    				content.append("</H1>");
    			}else if(node.getNodeName().equals("infotext")){
    				content.append("<div id='condentAll'>");
    				content.append(node.getTextContent());
    				content.append("</div>");
    				content.append("<br/>");
    				content.append("<br/>");
    				
    			}
    			
    		}
    	}
    	return content.toString();
    }

}
