<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page errorPage="errorpg.jsp" 
import="java.sql.*, 
javax.sql.*, 
java.io.*,
javax.naming.InitialContext,
javax.naming.Context" %>
</head>
<body>
<h1>JDBC JNDI Resource Test</h1>

<%
InitialContext initCtx = new InitialContext();
DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/mytc5");
Connection conn = ds.getConnection();
Statement stmt = conn.createStatement();
ResultSet rset = stmt.executeQuery("select version();");
while (rset.next()) { 
out.println("mysql version=="+rset.getString("version()")); 
}
rset.close();
stmt.close();
conn.close();
initCtx.close();
%>
</body>
</html>