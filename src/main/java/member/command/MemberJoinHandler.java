package member.command;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.ConnectionProvider;

import member.service.MemberDAO;
import member.service.MemberDTO;
import handler.CommandHandler;

public class MemberJoinHandler implements CommandHandler {
	MemberDAO dao = null;
	MemberDTO dto = null;

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberJoin 핸들러 호출됨");
		Connection conn = ConnectionProvider.getConnection();
		String mem_id = request.getParameter("user_id");
		String mem_pw = request.getParameter("user_pass");
		String mem_name = request.getParameter("user_name");
		String mem_mail = request.getParameter("user_email");
		String mem_num = request.getParameter("user_hphone").replaceAll("-", "");
		
		HttpSession sess= request.getSession();
		sess.getAttribute("user_id");
		dao = new MemberDAO();
		int mem_point = dao.memPoint(mem_id,conn);
		
		
		dto = new MemberDTO(mem_id, mem_pw, mem_name, mem_mail, mem_num, mem_point);
		int rowCount = dao.insert(dto, conn);
		
		conn.close();
		if(rowCount == 1) {
			HttpSession session = request.getSession(false);
			
			session.setAttribute("meminfo", dto);
			return "/login/login.do?login=y";
		}
		else
			return null;
	}

}
