<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accounts User</title> 
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
            crossorigin="anonymous">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />        
        <link href="./css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">

        <style>
            .carousel-item {
                height: 85vh;
            }

            .description {
                border-radius: 10px;
                background: #ddd;
                color: #343a40;
                backdrop-filter: blur(10px);
            }
            .section__header {
                text-align: center;
                margin-top: 8rem;
                margin-bottom: 5rem;
                font-weight: 700;
            }
            .card {
                box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 15px -3px, rgba(0, 0, 0, 0.05) 0px 4px 6px -2px;
                transition: all 0.3s;
                position: relative;
            }
            .card .plant__img {
                height: 15rem;
            }

            .card:hover {
                transform: scale(1.02);
                background: #b2f2bb;
            }

            .card p {
                margin-bottom: 10px;
            }

            .card .plant__name a {
                text-decoration: underline;
                text-decoration-color: transparent;
                transition: all 0.2s;
            }
            .card .plant__name:hover a{
                text-decoration-color: #0d6efd;
            }

            .card a.btn {
                margin-top: 20px;
                width: 47px;
                white-space: nowrap;
                overflow: hidden;
                display: flex;
                align-items: center;
                gap: 10px;
                word-wrap: none;
                transition: all 0.3s;
            }

            .card a.btn:hover {
                width: 110px;
            }

            .plant__name {
                margin-bottom: 10px;
            }
            .plant__price {
                display: inline-block;
                margin-left: 5px;
                font-size: 18px;
                font-weight: 600;
                color: #e03131;
            }
            .footer {
                height: 100px;
            }
            .page-numbers {
                display: flex;
                gap: 5px;
                justify-content: center;
                list-style: none;
                .form-select {
                    width: 150px;
                    margin-right: 10px;
                }
            </style>
        </head>
        <body>

            <%@ include file="../common/header.jsp" %>

            <div class="container">

                <h2 class="mb-5 mt-3">All Accounts (${listUsers.size()})</h2>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Email</th>
                            <th scope="col">Fullname</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Status</th>
                            <th scope="col">Role</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${listUsers}" var="user">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.email}</td>
                                <td>${user.fullname}</td>
                                <td>${user.phone}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.status == 0}">
                                            <span class="badge bg-warning">Inactive</span>
                                        </c:when>
                                        <c:when test="${user.status == 1}">
                                            <span class="badge bg-success">Active</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.role == 1}">
                                            Admin
                                        </c:when>
                                        <c:when test="${user.role == 0}">
                                            User
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.role == 0 && user.status == 1}">
                                            <a href="${pageContext.request.contextPath}/admin?action=updateAccStatus&accId=${user.id}&status=0" class="badge bg-primary" style="background-color: blue !important; color: white !important">Block</a>
                                            </c:when>
                                            <c:when test="${user.role == 0 && user.status == 0}">
                                                <a href="${pageContext.request.contextPath}/admin?action=updateAccStatus&accId=${user.id}&status=1"  class="badge bg-primary" style="background-color: red !important; color: white !important">Unblock</a>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>   
                </div> 

                <%@ include file="../common/footer.jsp" %>

                <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script> 
                <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
                <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

            </body>
        </html>

