package member.command;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.ConnectionProvider;

import member.service.MemberDAO;
import member.service.MemberDTO;
import handler.CommandHandler;

public class MemberLoginHandler implements CommandHandler{
	MemberDAO dao = null;
	MemberDTO dto = null;
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = ConnectionProvider.getConnection();
		HttpSession session = request.getSession(false);
		System.out.println("MemberLogin 핸들러 호출됨");
		String user_id = null;
		String input_pw = null;
		
		String mode = request.getParameter("login");
	      
	      if(mode.equals("n")) {
	         session.removeAttribute("meminfo");
	         return "/timeticket/main/main.do";
	      }else if(mode.equals("y")) {
	    	  MemberDTO joinMem =  (MemberDTO)session.getAttribute("meminfo");
	    	  if(joinMem != null) {
			user_id = joinMem.getmem_id();
			input_pw=joinMem.getmem_pw();
		} else {
			user_id = request.getParameter("user_id");
			input_pw = request.getParameter("user_pass");
		}
		
		
		dto = new MemberDTO(user_id);
		dao = new MemberDAO();
				
		String checkID = dao.checkID(user_id, conn);
		if(checkID ==null) {
			conn.close();
			String location = "/timeticket/timeticket/login/login.jsp?fail=id";
			response.sendRedirect(location);
		}	else {
			
			String user_pw = dao.getMemberPw(user_id, conn);
		
			if( input_pw.equals(user_pw) ) {
				MemberDTO meminfo = dao.selectMem(user_id,conn);
				session.setAttribute("meminfo", meminfo);
				conn.close();
				return "/timeticket/main/main.do";
			}
			else {
				conn.close();
				String location = "/timeticket/timeticket/login/login.jsp?fail=pw";
				response.sendRedirect(location);
			}
		}
		conn.close();
	      }
		
		
		return null;
	}

}
