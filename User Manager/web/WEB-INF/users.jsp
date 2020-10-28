<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css"/>
        <title>User Manager</title>
    </head>
    <body>
        <h1>User Manager</h1>
        <div class="row">
            <div class="column left" style="background-color:#aaa;">
                <h2>Add User</h2>
                <form action="create">
                   
                    <input type="text" name="email" placeholder="Email"><br>
                    <input type="text" name="fname" placeholder="First Name"><br>
                    <input type="text" name="lname" placeholder="Last Name"><br>
                    <input type="text" name="password" placeholder="Password"><br>
                    <input type="text" name="role" placeholder="Role"><br><br>
                    <input class="blueButton" type="submit" value="Submit">
                   
                </form>
            </div>
            <div class="column middle" style="background-color:#bbb;">
                <h2>Manage Users</h2>
                <table style="width:100%" id="userTable">
                    <tr>
                        <th>Email Address</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Role</th>
                        <th>Edit User</th>
                        <th>Delete User</th>
                    </tr>
                    <c:forEach items="${users}" var="item">
                        <tr>
                            <td name="email">${item.email}</td>
                            <td name="fname">${item.firstname}</td>
                            <td name="lname">${item.lastname}</td>
                            <td name="role">${item.role}</td>
                            <td name="active">${active}</td>
                            <td>
                                <form method="post" name="edit" action="User" >
                                    <input style="background-color:blue;" id="email" type="submit" name="edit" value="Edit">
                                    <input type="hidden" name="action" value="edit">
                                </form>
                            </td>
                            <td>
                                <form method="post" name="edit" action="User" >
                                    <input style="background-color:tomato;" id="email" type="submit" name="delete" value="Delete">
                                    <input type="hidden" name="action" value="edit">
                                </form>
                            </td>
                        </tr>
                        
                    </c:forEach>
                </table>
            </div>
            <div class="column right" style="background-color:#ccc;">
                <h2>Edit User</h2>
                <form action="update">
                    <input type="text" name="email" value="${user.email}"><br>
                    <input type="text" name="fname" value="${user.firstname}"><br>
                    <input type="text" name="lname" value="${user.lastname}"><br>
                    <input type="text" name="password" value="${user.password}"><br>
                    <input type="text" name="role" value="${user.role}"><br>
                    <input type="radio" id="activeTrue" name="active" value="true">
                    <label for="activeTrue">Active</label>
                    <input type="radio" name="active" value="false">
                    <label for="activeFalse">Not Active</label><br>
                    <input class="blueButton" type="submit" name="save" value="Save Changes">
                    <input class="redButton" type="submit" name="cancel" value="Cancel Changes">
                </form>
            </div>
        </div>
    </body>
</html>