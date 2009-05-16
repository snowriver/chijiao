package com.forbes.util;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.HttpURLConnection;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class HttpInvoke {
	public HttpInvoke() {
	}

	public String getURL(String s, String postType) throws Exception {
		String s1 = s;
		try {
			URL url = new URL(s);
			HttpURLConnection connection = (HttpURLConnection) url
					.openConnection();
			connection.setRequestMethod(postType);
			DataInputStream datainputstream = new DataInputStream(connection
					.getInputStream());
			ByteArrayOutputStream bytearrayoutputstream = new ByteArrayOutputStream();
			try {
				byte abyte0[] = new byte[1024];
				boolean flag = false;
				do {
					int i = datainputstream.read(abyte0);
					if (i == -1)
						break;
					bytearrayoutputstream.write(abyte0, 0, i);
				} while (true);
				bytearrayoutputstream.flush();
				byte abyte1[] = bytearrayoutputstream.toByteArray();
				s1 = new String(abyte1, 0, abyte1.length, "GB2312");
			} catch (Exception _ex) {
				_ex.printStackTrace();
			} finally {
				datainputstream.close();
				bytearrayoutputstream.close();
			}
		} catch (Exception _ex) {
			_ex.printStackTrace();
			return null;
		}
		return s1;
	}

	

	public static String invoke(String paramStr, String urlStr, String encode,
			String contType) throws Exception {
		String rs = null;
		HttpURLConnection connection = null;
		DataInputStream in = null;
		DataOutputStream out = null;
		URL url = null;
		try {
			url = new URL(urlStr);

			connection = (HttpURLConnection) url.openConnection();
			if (contType != null && contType.length() > 0) {
				connection.setRequestProperty("Content-Type", contType);
			}
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestMethod("POST");
			out = new DataOutputStream(connection.getOutputStream());
			out.write(paramStr.getBytes(encode));
			out.flush();
		} catch (java.io.IOException e) {
			throw new Exception("Http connection exception!", e);
		}
		try {
			in = new DataInputStream(connection.getInputStream());

			StringBuffer strBuf = new StringBuffer();
			byte[] buf = new byte[256];
			while (in.read(buf) > 0) {
				strBuf.append(new String(buf));
			}
			rs = strBuf.toString().trim();

			return rs;
		} catch (java.io.IOException e) {
			throw new Exception("Http response exception!", e);
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
				if (connection != null) {
					connection.disconnect();
				}
			} catch (Exception e) {
			}
		}
	}

	public static String invoke(String paramStr, String urlStr, String encode)
			throws Exception {
		String rs = null;
		HttpURLConnection connection = null;
		DataInputStream in = null;
		DataOutputStream out = null;
		URL url = null;
		try {
			url = new URL(urlStr);

			connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestMethod("POST");
			out = new DataOutputStream(connection.getOutputStream());
			out.write(paramStr.getBytes(encode));
			out.flush();
		} catch (java.io.IOException e) {
			throw new Exception("Http connection exception!", e);
		}
		try {
			in = new DataInputStream(connection.getInputStream());

			StringBuffer strBuf = new StringBuffer();
			byte[] buf = new byte[256];
			while (in.read(buf) > 0) {
				strBuf.append(new String(buf));
			}
			rs = strBuf.toString().trim();

			return rs;
		} catch (java.io.IOException e) {
			throw new Exception("Http response exception!", e);
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
				if (connection != null) {
					connection.disconnect();
				}
			} catch (Exception e) {
			}
		}
	}

	public static String getResponseResult(String data, String path) {
		String rs = null;
		try {
			URL url = new URL(path);
			HttpURLConnection cn = (HttpURLConnection) url.openConnection();
			cn.setDoOutput(true);
			cn.setDoInput(true);
			cn.setRequestMethod("POST");
			DataOutputStream osData = new DataOutputStream(cn.getOutputStream());
			osData.write(data.getBytes("utf-8"));
			osData.flush();
			//System.out.println(cn.getResponseCode());
			DataInputStream isData = new DataInputStream(cn.getInputStream());
			if (cn.getResponseCode() == HttpURLConnection.HTTP_OK
					|| cn.getResponseCode() == HttpURLConnection.HTTP_MOVED_TEMP) {
				int c;
				StringBuffer b = new StringBuffer();
				String inStr;
				while ((c = isData.read()) != -1)
					b.append((char) c);
				inStr = b.toString().trim();
				rs = inStr;
			}
			if (osData != null) {
				osData.close();
			}
			if (isData != null) {
				isData.close();
			}
			if (cn != null) {
				cn.disconnect();
			}

			return rs;
		} catch (java.io.IOException e) {
			return null;
		}
	}

	public String getUrlRspBySession(String url, String data) {
		HttpURLConnection urlConn;
		try {
			urlConn = (HttpURLConnection) (new URL(url).openConnection());

			String cookie = "PHPSESSID\n" + "aeb03f25b9304304c5a030bb4e1ad90b"
					+ "www.ucloo.com/" + "1536" + "3146176640" + "29842410"
					+ "3548511744" + "29842386" + "*" + "";
			urlConn.addRequestProperty("Cookie", "PHPSESSID");
			urlConn.addRequestProperty("Cookie", "aeb03f25b9304304c5a030bb4e1ad90b");
			urlConn.addRequestProperty("Cookie", "www.ucloo.com/");
			urlConn.addRequestProperty("Cookie", "1536");
			urlConn.addRequestProperty("Cookie", "3146176640");
			urlConn.addRequestProperty("Cookie", "29842410");
			urlConn.addRequestProperty("Cookie", "3548511744");
			urlConn.addRequestProperty("Cookie", "29842386");
			urlConn.addRequestProperty("Cookie", "*");

			urlConn.setRequestMethod("POST");
			urlConn.setRequestProperty("User-Agent", "Mozilla/4.0   (compatible;   MSIE   6.0;   Windows   2000)");
			urlConn.setFollowRedirects(true);
			urlConn.setDoOutput(true); //   需要向服务器写数据   
			urlConn.setDoInput(true); //     
			urlConn.setUseCaches(false); //   获得服务器最新的信息   
			urlConn.setAllowUserInteraction(false);
			urlConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			urlConn.setRequestProperty("Content-Language", "en-US");
			urlConn.setRequestProperty("Content-Length", "" + data.length());

			DataOutputStream outStream = new DataOutputStream(urlConn.getOutputStream());
			outStream.writeBytes(data);
			outStream.flush();
			outStream.close();

			cookie = urlConn.getHeaderField("Set-Cookie");
			BufferedReader br = new BufferedReader(new InputStreamReader(
					urlConn.getInputStream(), "gb2312"));
			String content = "";
			String line = br.readLine();
			while (line != null) {
				content = content + line + "\r\n";
				line = br.readLine();
			}
			return content;
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void httclient() {
		HttpClient client = new HttpClient();

		GetMethod get = new GetMethod(
				"http://www.ucloo.com/?m=detail&pid=12035289");

		get.setDoAuthentication(true);

		int status;
		try {
			status = client.executeMethod(get);

			System.out.println(status + "" + get.getResponseBodyAsString());
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		get.releaseConnection();

	}

	public static void main(String[] args) {
		HttpInvoke httpInvoke1 = new HttpInvoke();
		try {
			//String c = httpInvoke1.getUrlRspBySession("http://www.ucloo.com/","m=detail&pid=12035289");
			String rst = httpInvoke1.invoke("ip=211.139.151.42&action=2", "http://www.ip138.com/ips8.asp", "GB2312");
			//System.out.println(rst);
			//System.out.println(c);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}