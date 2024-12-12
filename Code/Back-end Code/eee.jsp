<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.DriverManager" %>
<%@ page language="java" import="java.sql.*, java.util.*, java.io.*" session="true" %>
<%@ include file="db_school.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Scholarship</title>
   
<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.container {
    width: 80%;
    margin: auto;
}

input {
    padding: 0.3rem 0rem;
}

.topdta{
    /* width: 9rem; */
    height: 5rem;
    background-color: #ffffff;
}

.topdta label {
    display: inline-block;
}

.topdta input {
    display: inline-block;
}
.tocon {
    width: 100%;
    margin: 1rem 0rem;
    background-color: rgb(255, 255, 255);
}

.heading {
    display: inline-block;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 5rem;
}
.container1, .container2 {
    background-color: #f0f0f0;
    border: 1px solid #000;
    padding: 0 10px;
    margin-bottom: 10px;
    border-radius: 1rem;
}

.row1 {
    display: flex;
}

.container {
    width: 70vw;
    max-width: 100rem;
    min-width: 50rem
}

.c0 {
    margin-top: 1rem;
    width: 50vw;
    display: flex;
    justify-content: space-between;
}
.container1{
    width: 60vw;
    margin-top: 2rem;
    min-width: 59rem;
}

.numb {
    width: 20%;
}
.namefield {
    width: 51%;
}



.row {
    margin: 0.8rem 0rem;
    display: flex;
}
.row2 {
    display: flex;
}
.row2 div input {
    max-width: 60%;
}

.row3 div label {
    max-width: 2rem;
}
.row3 {
    display: flex;
    justify-content: space-around;
}

.row3 input{
    width: 13rem;
}

.row4 {
    justify-content: space-evenly;
}

.left{
    width: 65%;
}
.right{
    width: 35%;
}

.l{
    display: flex;
    justify-content: space-between;
    padding: 0 1rem;
    margin: 0.4rem 0rem;
}

.l3, .l4{
    justify-content: space-between;
}
.l3 input, .l4 input{
    margin-left: 1rem;
    width: 85%;
}

.right {
    display: flex;
    flex-direction: column;

}
.right input {
    width: 70%;
    height: 100%;
}

.dept {
    width: 47%;
}

.row6{
    margin-top: 1rem;
}
.left6{
    /* border: 2px solid red; */
    width: 60%;
    padding-left: 0.8rem;
}

.left6 div {
    display: inline-block;
    margin: 0.5rem 0.2rem;
}
.right6 {
    /* border: 2px solid blue; */
    width: 49%;
    display: flex;
    flex-direction: column;
    align-items: center;
    
}

.right6 div{
    margin: 0.3rem 0rem;
}

.uic {
    margin-top: 1rem;
    background-color: rgb(244, 238, 200);
    width: 70%;
    display: flex;
    flex-direction: column;
    align-items: center;
    border-radius: 1rem;
    border: 1px solid rgb(0, 0, 0);
}
.uic h2 {
    font-size: 1rem;
    margin: 0.6rem 0rem;
}

.row7 {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 1rem 0rem;
}

.row7 div button {
    background-color: rgb(185, 236, 109);
    height: 2rem;
    width: 5rem;
    margin: 0rem 1rem;
    border: none;
    box-shadow: 2px 2px 5px;

}

.row7 div button:active{
    background-color: rgb(129, 165, 73);
    box-shadow: none

}
</style>
  <script>
   function submitAndFetch() 
   {
	   if (document.getElementById("plno").value != '')
		   {
		   var form = document.getElementById("form1");
		   form.action = "eee.jsp";
		   form.submit();
       
		   }
   }
</script>
</head>
<body>
    <form id="form1" method="post" action="eee.jsp">
    <div class="container c0">
        <h1 class="heading" align="center"><u>Scholarship for Dependent Children</u></h1>
        
        <div class="topdta">
            <div class="tocon">
                <label for="year">Year</label>
                <select id="year"> 
                    <option value="2016">2016</option>
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                    <option value="2019">2019</option>
                    <option value="2020">2020</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                </select>
            </div>
            
            <div class="tocon">
                <label for="Schol ID">Schol ID</label>
                <input style="width: 8rem;" type="text"></input>
            </div>
           
        </div>
    </div>
        <div class="background sky"></div>
        <div class="form-container">
            <div class="container container1">
                <div class="row row1">
                    <div style="width: 50%;">
                        <label for="PLNO">Plno</label>
                        <input class="numb" type="text" name="plno" onclick="submitAndFetch()" id="plno">
 
 <%
// Establishing database connection
Connection con = null;
try {
    // Load the JDBC driver
    Class.forName("com.mysql.jdbc.Driver");
    
    // Connection URL
    String url = "jdbc:oracle:thin:@//10.145.1.235:1522/rundb1";
    String name = "";
	String dept_code = "";
	String dept = "";
	String desg = "";
	String grade = "";
	String doj_sail = "";
	String emp_status = "";
	String category_code = "";
	
    String st2 = "";
    // Establish the connection
    con = DriverManager.getConnection("jdbc:oracle:thin:@10.145.1.235:1522:rundb1", "hrn_ir", "school123");
    //out.println("Amit2");    
    // Your SQL query and further processing
    String plno = request.getParameter("plno");
    if ( plno != null)
    {
     st2 = "SELECT NAME, DEPT_CODE, cpispak.get_DEPT(DEPT_CODE) AS DEPT, " +
            "cpispak.get_short_desc(dept_code, sect_code, desg_code) AS desg, " +
            "grade, doj_sail, emp_status, category_code " +
            "FROM employees WHERE plno = '"+Integer.parseInt(request.getParameter("plno"))+"'";
    }
    //out.println(st2);
    if (!st2.equals(""))
    {
    PreparedStatement ps2 = con.prepareStatement(st2);
    ResultSet rs2 = ps2.executeQuery(st2);
    
     if (rs2.next()) 
     { 
    	 
    	 name = rs2.getString("NAME");
    	 dept_code = rs2.getString("Dept_Code");
    	 dept = rs2.getString("DEPT");
    	 desg = rs2.getString("Desg");
    	 grade = rs2.getString("Grade");
    	 doj_sail = rs2.getString("Doj_SAIL");
    	 emp_status = rs2.getString("Emp_Status");
    	 category_code = rs2.getString("Category_Code");
     
    }
     
    }
    // HTML rendering of ResultSet
    %>
 

<input class="namefield" type="text" id="emp_name" value=<%=name%>>
                    </div>
                    <div style="width: 50%;" class="dept">
                        <label style="margin-left: 1REM;" for="dept_code">Dept Code</label>
                        <input class="numb" type="text" id="dept_code" value=<%=dept_code%>>
                        <input class="namefield" type="text" id="dept" value=<%=dept%>>

                    </div>
                </div>

                <div class="row row2">
                    <div>
                        <label for="grade">Grade</label>
                        <input type="text" id="grade" value=<%=grade%>>
                    </div>

                    <div>
                        <label for="desg">Desg</label>
                        <input type="text" id="desg" value=<%=desg%>>
                    </div>

                    <div>
                        <label class="squize" for="category_code">Category</label>
                        <input type="text" id="category_code" value=<%=category_code%>>
                    </div>

                    <div>
                        <label class="squize" for="DOJ_SAIL">Doj SAIL</label>
                        <input type="text" id="doj_sail" value=<%=doj_sail%>>
                    </div>
                    <div>
                        <label class="squize" for="emp_status">Emp Status</label>
                        <input type="text" id="emp_status" value=<%=emp_status%>>
                    </div>

                </div>

            </div>
            <div class="container container2">
                <div class="row row3">
                    <div>
                        <label for="depn_slno">Depn. Slno</label>
                        <input type="text" id="depn_slno" >
                    </div>
                    <div>
                        <label for="name">Name</label>
                        <input type="text" id="name">
                    </div>
                    <div>
                        <label for="relation">Relation</label>
                        <input type="text" id="relation">
                    </div>
                    <div>
                        <label for="sarvotam">Sarvotam</label>
                        <select id="sarvotam">
                            <option value="option1">Option 1</option>
                            <option value="option2">Option 2</option>
                        </select>
                    </div>
                    <div>
                        <label for="disabled">Disabled</label>
                        <select id="disabled">
                            <option value="yes">Yes</option>
                            <option value="no">No</option>
                        </select>
                    </div>

                </div>



                <div class="row row4">
                    <div>
                        <p>**Double click for LIST</p>
                        <label for="qual_exam">Qual Exam</label>
                        <select id="qual_exam">
                            <option value="10th">10th</option>
                            <option value="12th">12th</option>
                        </select>
                       
                    </div>


                    <div>
                        <label class="to_buttom" for="passing_year">Passing Year</label>
                        <select class="to_buttom" id="passing_year">
                            <option value="2017">2017</option>
                            <option value="2018">2018</option>
                            <option value="2019">2019</option>
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            <option value="2022">2022</option>
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                        </select>
                    </div>
                    <div>
                        <label class="to_buttom" for="12th_percentage">12TH %age Marks</label>
                        <input class="to_buttom" type="text" id="12th_percentage">
                    </div>
                    <div>
                        <button class="to_buttom" id="show_sarvotam_courses">Show SARVOTAM Courses</button>
                        <span class="to_buttom">**Click for LIST</span>
                    </div>
                </div>



                <div class="row row5">
                    <div class="left">
                        <div class="l l1">
                            <div>
                                <label for="course_type">Course Type</label>
                                <input type="text" id="course_type">
                                <span>**Double click for LIST</span>
                            </div>
                            <div>
                                <label for="course_category">Course Category</label>
                                <select id="course_category">
                                    <option value="category1">Category 1</option>
                                    <option value="category2">Category 2</option>
                                </select>
                            </div>
                        </div>

                        <div class="l l2">
                            <div>
                                <label for="sub_catg">Sub Catg</label>
                                <input type="text" id="sub_catg">
                                <span>**Only for SPL Sarvotam</span>
                            </div>
                            <div>
                                <label for="pmt_catg">PMT Catg</label>
                                <input type="text" id="pmt_catg">
                            </div>
                        </div>

                        <div class="l l3">

                                <label for="inst_name">Inst Name</label>
                                <input type="text" id="inst_name">

                        </div>


                        <div class="l l4">

                                <label for="inst_address">Inst Address</label>
                                <input type="text" id="inst_address">

                        </div>

                    </div>

                    <div class="right">
                        <label for="course_details">Course Details</label>
                        <input type="text" id="course_details">
                    </div>
                </div>

                <div class="row row6">
                    <div class="left6">

                        <div>
                            <label for="duration">Duration (In Years)</label>
                            <input style="width: 5rem;" type="text" id="duration">
                        </div>
                        <div>
                            <label for="graduation_percent">Graduation Percent</label>
                            <input type="text" id="graduation_percent">
                        </div>
                        <div>
                            <label for="entrance_exam">Entrance Exam</label>
                            <input type="text" id="entrance_exam">
                            <span>**Double Click for LIST</span>
                        </div>
       

                        <div style="display: block;">
                            <label for="entrance_exam_percentile">Entrance Exam Percentile</label>
                            <input type="text" id="entrance_exam_percentile">
                        </div>
                        <div>
                            <label for="rank">Rank</label>
                            <input type="text" id="rank">
                        </div>



                    </div>
  

                    <div class="right6">
                        <div>
                            <label for="post_dist">Post & Dist</label>
                            <input type="text" id="post_dist">
                        </div>
                        <div>
                            <label for="state">State</label>
                            <input type="text" id="state">
                        </div>
                        <div class="updated-info-container uic">
                            <h2>WILL BE UPDATED AFTER AWARDING</h2>
                                <div>
                                    <label for="schol_status">Schol_Status</label>
                                    <input type="text" id="schol_status">
                                </div>
                                <div>
                                    <label for="scholarship_type">Scholarship Type</label>
                                    <input type="text" id="scholarship_type">
                                </div>
                                <div>
                                    <label for="annual_amount">Annual Amount</label>
                                    <input type="text" id="annual_amount">
                                </div>
                        </div>

                    </div>
                </div>

                <div class="row row7">
                    <div class="button-container">
                        <button id="save_button">Save</button>
                        <button id="next_button">Next</button>
                    </div>
                </div>

            </div>

        </div>
   </form> 
    
<%

// Close the connection
con.close();
} catch (Exception e) {
    out.println("Exception: " + e.getMessage());
    e.printStackTrace();
} finally {
    try {
        if (con != null) con.close();
    } catch (SQLException e) {
        out.println("SQLException: " + e.getMessage());
    }
}
%>
</body>
</html>