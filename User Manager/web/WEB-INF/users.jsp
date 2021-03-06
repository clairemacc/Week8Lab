<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet"> 
        <title>User Manager</title>
    </head>
    <body>
        <h1>User Manager</h1>
        <div class="row">
            <div class="column left">
                <h2>Add User</h2>
                <form action="User" method="post">
                    <input type="text" name="email" placeholder="Email">
                    <br><br>
                    <input type="text" name="fname" placeholder="First Name">
                    <br><br>
                    <input type="text" name="lname" placeholder="Last Name">
                    <br><br>
                    <input type="text" name="password" placeholder="Password">
                    <br><br>
                    <input type="text" name="role" placeholder="Role">
                    <br><br>
                    <input class="blueButton bigButton" style="width: 100%;" type="submit" value="Add User">
                    <input type="hidden" name="action" value="create">
                </form>
            </div>
            <div class="column middle">
                <h2>Manage Users</h2>
                <table class="userTable">
                    <tr>
                        <th>Email Address</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Role</th>
                        <th>Edit User</th>
                    </tr>
                    <c:forEach items="${users}" var="item">
                        <tr>
                             <form method="post" name="edit" action="User" >
                            <td name="email">${item.email}</td>
                            <td name="fname">${item.firstname}</td>
                            <td name="lname">${item.lastname}</td>
                            <td name="role">${item.role}</td>
                            <td>
                              
                                    <input class="blueButton tableButton" style="width: 100%;" id="email" type="submit" name="edit" value="Edit">
                                    <input type="hidden" name="action" value="edit">
                                </form>
                            </td>
                        </tr>

                    </c:forEach>
                </table>
            </div>
            <div class="column right">
                <h2>Edit User</h2>
                <form action="User" method="post">
                    <input type="text" id="email" name="updateEmail" value="${user.email}" placeholder="Email">
                    <br><br>
                    <input type="text" id="fname" name="updateFname" value="${user.firstname}" placeholder="First Name">
                    <br><br>
                    <input type="text" id="lastname" name="updateLname" value="${user.lastname}" placeholder="Last Name">
                    <br><br>
                    <input type="text" id="password" name="updatePassword" value="${user.password}" placeholder="Password">
                    <br><br>
                    <input type="text" id="role" name="updateRole" value="${user.role}" placeholder="Role">
                    <br><br>
                    <input type="radio" id="activeTrue" name="active" value="true">
                    <label for="activeTrue">Active</label>
                    <input type="radio" id="activeFalse" name="active" value="false">
                    <label for="activeFalse">Not Active</label>
                    <br><br>
                    <input class="blueButton bigButton inputButton" style="width: 49%;" type="submit" name="save" value="Save Changes">
                    <input class="redButton bigButton inputButton" style="width: 49%;" type="reset" name="cancel" value="Cancel Changes">
                    <input type="hidden" name="action" value="udpate">
                </form>
            </div>
        </div>
    </body>
</html>