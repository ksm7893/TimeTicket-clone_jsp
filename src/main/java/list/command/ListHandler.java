package list.command;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import domain.LcateDTO;
import handler.CommandHandler;
import list.service.RegionDAO;
import list.service.RegionDTO;
import list.service.ScategoryDAO;
import list.service.ScategoryDTO;
import persistence.TopDAO;
import list.service.ListDTO;
import list.service.ListDAO;
import list.service.GenreDTO;
import list.service.GenreDAO;



public class ListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = ConnectionProvider.getConnection();
		
		//TOP 부분
		TopDAO tdao = new TopDAO(conn);
		ArrayList<LcateDTO> llist = tdao.select();	
			
		
		String lcate_code = request.getParameter("lcate_code") != null? request.getParameter("lcate_code"):"lcate_1";
		String scate_code = request.getParameter("scate_code") != null?request.getParameter("scate_code"):"";
		String gen_code=request.getParameter("gen_code") != null?request.getParameter("gen_code"):"";
		String reg_code = request.getParameter("reg_code") != null?request.getParameter("reg_code"):"";
		String sort = request.getParameter("sort") != null? request.getParameter("sort"):"";
		
		System.out.println("ListHandler 호출");
		RegionDAO rDao = new RegionDAO();
		ArrayList<RegionDTO> rList = rDao.select(conn);
		
		ScategoryDAO sDao = new ScategoryDAO();
		ArrayList<ScategoryDTO> sList = sDao.select(lcate_code, conn); 
		
		GenreDAO gDao = new GenreDAO();
		ArrayList<GenreDTO> gList = gDao.select(scate_code,conn);
		
		ListDAO lDao = new ListDAO();
		ArrayList<ListDTO> lList = lDao.select(lcate_code , scate_code , gen_code , reg_code , sort , conn);
		String lcate_name = lDao.getLcateName(lcate_code, conn);
		
		if(gList != null) request.setAttribute("gList", gList);
		request.setAttribute("llist", llist);
		request.setAttribute("lcate_name", lcate_name);
		request.setAttribute("rList", rList);
		request.setAttribute("sList", sList);
		request.setAttribute("lList", lList);
		conn.close();
		
		return "/timeticket/category/listsum.jsp";
	}
	
}
