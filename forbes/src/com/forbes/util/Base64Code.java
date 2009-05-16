package com.forbes.util;
import org.apache.commons.codec.binary.Base64;


public class Base64Code {
	
	/**  
     * Gets the encoding String of base64Encode by a String.  
     *   
     * @param str  
     *            The source String.  
     * @return a new String that have been encoded.  
     */  
	public static String Base64Encode(String str) {   
	    try {   
	        return Base64Encode(str.getBytes("UTF-8"));   
	    } catch (Exception ex) {   
	        //log.fatal(ex.toString()); 
	    	ex.printStackTrace();
	    }   
	    return "";   
	}   
	  
	/**  
	 * Gets the decoding String of base64Decode.  
	 *   
	 * @param str  
	 *            The source String.  
	 * @return a new String that have been decoded.  
	 */  
	public static String Base64Decode(String str) {   
	    return  Base64Decode(str.getBytes());   
	    }   
	  
	/**  
	 * Gets the encoding String of base64Encode by a byte array.  
	 *   
	 * @param str  
	 *            The source byte array.  
	 * @return a new String that have been encoded.  
	 */  
	public static String Base64Encode(byte[] str) {   
	    return new String((new Base64()).encode(str));   
	}   
	  
	/**  
	 * Gets the decoding String of base64Decode by a byte array.  
	 *   
	 * @param str  
	 *            The source byte array.  
	 * @return a new String that have been decoded.  
	 */  
	public static String Base64Decode(byte[] str) {   
	    if (str != null && str.length > 0) {   
	        byte buf[] = (new Base64()).decode(str);   
	        try {   
	        	return new String(buf, "UTF-8");   
	        } catch (Exception ex) {   
	        	//log.fatal(ex.toString()); 
		    	ex.printStackTrace();
	        }   
	    }   
	    return "";   
	}  

}
