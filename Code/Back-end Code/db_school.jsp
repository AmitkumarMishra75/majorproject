<%@page import="java.sql.*"%>
<%@page import="oracle.jdbc.driver.*" %>
<%@page import="oracle.sql.*" %>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%  
String username=request.getParameter("username");
String password =request.getParameter("username");

try {


Connection con = null;
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@10.145.1.235:1522:rundb1", "hrn_ir", "school123");
Statement st = null;
PreparedStatement ps=null;
ResultSet rs =null;
String query = "select * from SCHOL_COURSE_MASTER";

ps.executeUpdate(query);

} catch(Exception ex){

} 

%>
