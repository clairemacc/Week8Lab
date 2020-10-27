<%-- 
    Document   : users
    Created on : Oct 27, 2020, 10:17:56 AM
    Author     : 819466
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <form action="User">
                    <input type="text" name="email" value="Email"><br>
                    <input type="text" name="fname" value="First Name"><br>
                    <input type="text" name="lname" value="Last Name"><br>
                    <input type="text" name="password" value="Password"><br>
                    <input type="text" name="role" value="Role"><br>
                    <input style="background-color:blue;" type="submit" value="Submit">
                </form>
            </div>
            <div class="column middle" style="background-color:#bbb;">
                <h2>Manage Users</h2>
                <table style="width:100%">
                    <tr>
                        <th>Email Address</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Role</th>
                        <th>Edit User</th>
                        <th>Delete User</th>
                    </tr>
                    <c:forEach items="${fnames}" var="item">
                        <tr>
                            <td name="email">${email}</td>
                            <td name="fname">${fname}</td>
                            <td name="lname">${lname}</td>
                            <td name="role">${role}</td>
                            <td>
                                <form name="edit" action="" >
                                    <input style="background-color:blue;" id="email" type="submit" name="edit" value="Edit">
                                </form>
                            </td>
                            <td>
                                <form name="edit" action="" >
                                    <input style="background-color:tomato;" id="email" type="submit" name="delete" value="Delete">
                                </form>
                            </td>

                        </tr>
                    </c:forEach> 
                </table>
            </div>
            <div class="column right" style="background-color:#ccc;">
                <h2>Edit User</h2>
                <form action="user">
                    <input type="text" name="email" value="${email}"><br>
                    <input type="text" name="fname" value="${fname}"><br>
                    <input type="text" name="lname" value="${lname}"><br>
                    <input type="text" name="password" value="${password}"><br>
                    <input type="text" name="role" value="${role}"><br>
                    <input style="background-color:blue;" type="submit" name="save" value="Save Changes">
                    <input style="background-color:tomato;" type="submit" name="cancel" value="Cancel Changes">
                </form>
            </div>
        </div>
    </body>
</html>
