package com.util;

import java.sql.Connection;
import java.sql.SQLException;

import oracle.jdbc.pool.OracleDataSource;

public class DataHandler {
	public DataHandler() {
	}
	
	public String jdbcUrl = null;
	public String userid = null;
	public String password = null; 
	public Connection conn;
	
	public void getDBConnection() throws SQLException{
		// 데이터 소스 
		// datasource ds 객체 생성 후,
		// ds.getConnection() 메서드를 통해서 Connection객체를 얻어 올 수 있다.
		OracleDataSource ds;
		ds = new OracleDataSource();
		ds.setURL(jdbcUrl);
		conn=ds.getConnection(userid,password);

	}
}