package everywhere.com.mynetgear.ccvf2.comm.util.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SecurityUtil {
	/**
     *	byte[] ret = HashUtil.digest("MD5", "abcd".getBytes()); 
     *  처럼 호출
     */
    public static byte[] digest(String alg, byte[] input) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance(alg);
        return md.digest(input);
    }

    public static String getCryptoMD5String(String inputValue) throws Exception {
        if( inputValue == null ) throw new Exception("Can't conver to Message Digest 5 String value!!");
        byte[] ret = digest("MD5", inputValue.getBytes());
        String result = Base64Util.encode(ret);    
        return result;
    }
    
    public static String Sha256Encrypt(String strId, String pwd){
    	  String result = "";
    	  MessageDigest md = null;
    	  try {
    	   md = MessageDigest.getInstance("SHA-256");
    	  } catch (NoSuchAlgorithmException e) {
    	   // TODO Auto-generated catch block
    	   e.printStackTrace();
    	  }
    	        md.update(strId.getBytes());
    	        md.update(pwd.getBytes());
    	        
    	        byte byteData[] = md.digest();
    	 
    	        //convert the byte to hex format method 2
    	        StringBuffer hexString = new StringBuffer();
    	     for (int i=0;i<byteData.length;i++) {
    	      String hex=Integer.toHexString(0xff & byteData[i]);
    	          if(hex.length()==1) hexString.append('0');
    	          hexString.append(hex);
    	     }
    	     result = hexString.toString();
    	     return result;
    	 }
    
}

