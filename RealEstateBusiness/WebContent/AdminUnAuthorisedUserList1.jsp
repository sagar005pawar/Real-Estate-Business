<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin unauthorised Users</title>
</head>
<body style="background-color: rgb(202, 231, 157)">
	<form action="UserController?page=AdminUnAuthorisedUserList" method="post">
		<h2 align="center" style="color: blue">Un-Authorized users</h2>
		<%
			HttpSession sess = request.getSession();
			ArrayList<User> a1 = new ArrayList<User>();
			a1 = (ArrayList<User>) sess.getAttribute("AdminArrayList");
			User[] u = new User[a1.size()];
			for (int i = 0; i < a1.size(); i++) {
				u[i] = new User();
				u[i] = a1.get(i);
			}
		%>
		<table align="center">
			<tr>

				<th>Name</th>
				<th>Email</th>
				<th>City</th>
				<th>Role</th>
			</tr>
			<%
				for (int i = 0; i < a1.size(); i++) {
			%>
			<tr>
				<td align="center"><input type="text" name="a[<%=i%>]"
					align="middle" value="<%=u[i].getName()%>"></td>
				<td align="center"><input type="text" name="b[<%=i%>]"
					align="middle" value="<%=u[i].getEmail()%>" size="30"></td>
				<td align="center"><input type="text" name="d[<%=i%>]"
					align="middle" value="<%=u[i].getCity()%>"></td>
				<td align="center"><input type="text" name="e[<%=i%>]"
					align="middle" value="<%=u[i].getRole()%>"></td>
				<td align="center"><input type="submit" name="btn[<%=i%>]"
					value="Approve" align="middle"></td>
				<%-- <td align="center"> <input type="hidden" name="e[<%=i %>]"  value="<%=p[i].getProduct_Id() %>"></td> --%>

			</tr>
			<%
				}
			%>


			<tr>
				<td></td>
				<td align="center"><input type="button" name="btn3"
					value="Home" align="middle"
					onclick='window.location.href="AdminHomePage.jsp"'></td>
			</tr>

		</table>
	</form>
<br/><br/><a href="BargainCntr?page=Logout" >Logout</a>
</body>
</html>