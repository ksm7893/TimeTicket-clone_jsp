package rank.command;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import domain.LcateDTO;
import handler.CommandHandler;
import persistence.TopDAO;
import rank.service.RankDAO;
import rank.service.RankDTO;
import rank.service.RankListDAO;
import rank.service.RankListDTO;

public class RankHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = ConnectionProvider.getConnection();

		//TOP 부분
		TopDAO tdao = new TopDAO(conn);
		ArrayList<LcateDTO> llist = tdao.select();	
				
		String lcate_code = request.getParameter("lcate_code");
		String sort = request.getParameter("sort") == null?"daily":request.getParameter("sort");
		
		RankDAO dao = new RankDAO();
		ArrayList<RankDTO> rList = dao.select(conn);
		
		if(lcate_code != null) {
		RankListDAO lDao = new RankListDAO();
		ArrayList<RankListDTO> rlList = lDao.select(lcate_code, sort, conn);
		request.setAttribute("rlList", rlList);
		}
		request.setAttribute("llist", llist);
		request.setAttribute("rList", rList);
		
		
		conn.close();
		return "/timeticket/rank/ranksum.jsp";
	}

}
