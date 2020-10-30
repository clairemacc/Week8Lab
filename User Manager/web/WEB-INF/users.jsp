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
                <form action="create" method="post">
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
                    <input class="blueButton bigButton" type="submit" value="Add User">
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
                        <th>Delete User</th>
                    </tr>
                    <c:forEach items="${users}" var="item">
                        <tr>
                            <td name="email">${item.email}</td>
                            <td name="fname">${item.firstname}</td>
                            <td name="lname">${item.lastname}</td>
                            <td name="role">${item.role}</td>
                            <td>
                                <form method="post" name="edit" action="User" >
                                    <input class="blueButton tableButton" id="email" type="submit" name="edit" value="Edit">
                                    <input type="hidden" name="action" value="edit">
                                </form>
                            </td>
                            <td>
                                <form method="post" name="edit" action="User" >
                                    <input class="redButton tableButton" id="email" type="submit" name="delete" value="Delete">
                                    <input type="hidden" name="action" value="edit">
                                </form>
                            </td>
                        </tr>

                    </c:forEach>
                </table>
            </div>
            <div class="column right">
                <h2>Edit User</h2>
                <form action="update" method="post">
                    <label for="email">Email: </label>
                    <input type="text" id="email" name="email" value="${user.email}">
                    <br><br>
                    <label for="firstname">First Name: </label>
                    <input type="text" id="fname" name="firstname" value="${user.firstname}">
                    <br><br>
                    <label for="lastname">Last Name: </label>
                    <input type="text" id="lastname" name="lastname" value="${user.lastname}">
                    <br><br>
                    <label for="password">Password: </label>
                    <input type="text" id="password" name="password" value="${user.password}">
                    <br><br>
                    <label for="role">Role: </label>
                    <input type="text" id="role" name="role" value="${user.role}">
                    <br><br>
                    <label for="activeTrue">Active</label>
                    <input type="radio" id="activeTrue" name="active" value="true">

                    <label for="activeFalse">Not Active</label>
                    <input type="radio" id="activeFalse" name="active" value="false">
                    <br><br>
                    <input class="blueButton bigButton inputButton" type="submit" name="save" value="Save Changes">
                    <input class="redButton bigButton inputButton" type="submit" name="cancel" value="Cancel Changes">
                    <input type="hidden" name="action" value="udpate">
                </form>
            </div>
        </div>
    </body>
</html>