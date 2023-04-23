<%@page import="com.lsse.DbConnect"%>
<%@page import="java.sql.*"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	try {
		Connection con = DbConnect.Connect();
		Statement st = con.createStatement();
		st.executeUpdate("delete from category where id="+id+"");
		response.sendRedirect("viewCategory.jsp?msg=deleted");
	} catch (Exception e) {
		System.out.println(e);
	}
%>