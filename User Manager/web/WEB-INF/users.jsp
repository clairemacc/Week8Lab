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
                <form action="create">
                    <input type="text" name="email" value="${user.email}" placeholder="Email"><br>
                    <input type="text" name="fname" value="${user.firstName}" placeholder="First Name"><br>
                    <input type="text" name="lname" value="${user.lastName}" placeholder="Last Name"><br>
                    <input type="text" name="password" value="${user.password}" placeholder="Password"><br>
                    <input type="text" name="role" value="${user.role}" placeholder="Role"><br>
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
                    <c:forEach items="${user.firstName}" var="item">
                        <tr>
                            <td name="email">${user.email}</td>
                            <td name="fname">${user.firstName}</td>
                            <td name="lname">${user.lastName}</td>
                            <td name="role">${user.role}</td>
                            <td name="active">${user.active}</td>
                            <td>
                                <form name="edit" action="edit" >
                                    <input style="background-color:blue;" id="email" type="submit" name="edit" value="Edit">
                                </form>
                            </td>
                            <td>
                                <form name="edit" action="delete" >
                                    <input style="background-color:tomato;" id="email" type="submit" name="delete" value="Delete">
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
                    <input type="text" name="fname" value="${user.firstName}"><br>
                    <input type="text" name="lname" value="${user.lastName}"><br>
                    <input type="text" name="password" value="${user.password}"><br>
                    <input type="text" name="role" value="${user.role}"><br>
                    <input style="background-color:blue;" type="submit" name="save" value="Save Changes">
                    <input style="background-color:tomato;" type="submit" name="cancel" value="Cancel Changes">
                </form>
            </div>
        </div>
    </body>
</html>
