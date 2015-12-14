package everywhere.com.mynetgear.ccvf2.comm.util.common;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class Base64Util {

	public Base64Util() {}

    /**
     *	Base64Encoding; 
     *
     *	@param encodeBytes encoding byte array
     *	@return encoding String
     */
    public static String encode(byte[] encodeBytes) {
        
        BASE64Encoder base64Encoder = new BASE64Encoder();
        ByteArrayInputStream bin = new ByteArrayInputStream(encodeBytes);
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        byte[] buf = null;

        try{
            base64Encoder.encodeBuffer(bin, bout);
        } catch(Exception e) {
            System.out.println("Exception");
            e.printStackTrace();
        }
        buf = bout.toByteArray();
        return new String(buf).trim();
    }

    /**
     *	Base64Decoding 
     *
     *	@param strDecode decoding String
     *	@return decoding byte array
     */
    public static byte[] decode(String strDecode) {
        
        BASE64Decoder base64Decoder = new BASE64Decoder();
        ByteArrayInputStream bin = new ByteArrayInputStream(strDecode.getBytes());
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        byte[] buf = null;

        try {		
            base64Decoder.decodeBuffer(bin, bout);
        } catch(Exception e) {
            System.out.println("Exception");
            e.printStackTrace();
        }

        buf = bout.toByteArray();

        return buf;

    }
}
