package kr.gudi;

import static org.junit.Assert.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletInputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.gudi.trois.controller.TestController;
import kr.gudi.trois.controller.TroisController;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestAdmin {

	int size = 10;
	int tot = 66;
	ModelAndView mav;
	
	HttpSession session = new HttpSession() {
		
		@Override
		public void setMaxInactiveInterval(int interval) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setAttribute(String name, Object value) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void removeValue(String name) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void removeAttribute(String name) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void putValue(String name, Object value) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public boolean isNew() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public void invalidate() {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public String[] getValueNames() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Object getValue(String name) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public HttpSessionContext getSessionContext() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public ServletContext getServletContext() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getMaxInactiveInterval() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public long getLastAccessedTime() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public String getId() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public long getCreationTime() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public Enumeration getAttributeNames() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Object getAttribute(String name) {
			// TODO Auto-generated method stub
			return null;
		}
	};
	
	HttpServletRequest req = new HttpServletRequest() {
		
		@Override
		public void setCharacterEncoding(String env) throws UnsupportedEncodingException {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setAttribute(String name, Object o) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void removeAttribute(String name) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public boolean isSecure() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public int getServerPort() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public String getServerName() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getScheme() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public RequestDispatcher getRequestDispatcher(String path) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getRemotePort() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public String getRemoteHost() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRemoteAddr() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRealPath(String path) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public BufferedReader getReader() throws IOException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getProtocol() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String[] getParameterValues(String name) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Enumeration getParameterNames() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Map getParameterMap() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getParameter(String name) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Enumeration getLocales() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Locale getLocale() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getLocalPort() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public String getLocalName() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getLocalAddr() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public ServletInputStream getInputStream() throws IOException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getContentType() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getContentLength() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public String getCharacterEncoding() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Enumeration getAttributeNames() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Object getAttribute(String name) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public boolean isUserInRole(String role) {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isRequestedSessionIdValid() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isRequestedSessionIdFromUrl() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isRequestedSessionIdFromURL() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isRequestedSessionIdFromCookie() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public Principal getUserPrincipal() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public HttpSession getSession(boolean create) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public HttpSession getSession() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getServletPath() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRequestedSessionId() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public StringBuffer getRequestURL() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRequestURI() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRemoteUser() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getQueryString() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getPathTranslated() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getPathInfo() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getMethod() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getIntHeader(String name) {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public Enumeration getHeaders(String name) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Enumeration getHeaderNames() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getHeader(String name) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public long getDateHeader(String name) {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public Cookie[] getCookies() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getContextPath() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getAuthType() {
			// TODO Auto-generated method stub
			return null;
		}
	};
	
	@Autowired
	TroisController tc;
	
	@Test
	public void test3Controller(){
		ModelAndView mav = tc.adminData(new ModelAndView(), req, session);
		
		HashMap<String, Object> map = (HashMap<String, Object>) mav.getModel();
		String message = map.get("message").toString(); 
		System.out.println(message);
		
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(message);
		System.out.println(element);
		
		JsonObject jobject = element.getAsJsonObject();
		JsonArray list = jobject.get("data").getAsJsonArray();
		assertEquals(size, list.size());
		System.out.println(list);
		
		JsonObject totCnt = jobject.get("totCnt").getAsJsonObject();
		assertEquals(tot, Integer.parseInt(totCnt.get("tot").toString()));
		System.out.println(totCnt);
	}

}
