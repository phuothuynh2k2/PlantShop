<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plants Page</title> 
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
            }
            .form-select {
                width: 150px;
                margin-right: 10px;
            }

            #dateFrom, #dateTo {
                border: 1px solid #ced4da;
                border-radius: 0.2rem;
                padding: 5px;
            }

            #dateFrom:focus,
            #dateTo:focus {
                outline: none;
                border-color: 86b7fe;
                box-shadow: 0 0 0 0.25rem rgb(13 110 253 / 25%);
            }

            #date-selector{
                display: none;
            }

        </style>
    </head>
    <body>

        <%@ include file="../common/header.jsp" %>

        <div class="container">

            <h2 class="mb-3 mt-3">All Plants(${listPlants.size()})</h2>

            <p class="text-danger">${saveError}</p>
            <p class="text-success">${saveSuccess}</p>

            <a class="mb-5 btn btn-success" href="${pageContext.request.contextPath}/admin?action=addPlant">Add new plant</a>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col" >ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Description</th>
                        <th scope="col">Status</th>
                        <th scope="col">Image path</th>
                        <th scope="col">Category</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach items="${listPlants}" var="plant">
                        <tr>
                            <td>${plant.id}</td>
                            <td>${plant.name}</td>
                            <td>${plant.price}</td>
                            <td>${plant.description}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${plant.status == 1}">
                                        <span class="badge bg-success">Available</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger">Out of stock</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${plant.imgPath}</td>
                            <td>${plant.cateName}</td>
                            <td >
                                <a class="mb-5" href="${pageContext.request.contextPath}/admin?action=updatePlant&pId=${plant.id}">Update</a> |
                                <a onclick="if (!confirm('Do you want to delete this plant?'))
                                            return false;" class="mb-5 text-danger" href="${pageContext.request.contextPath}/admin?action=deletePlant&pId=${plant.id}"> Delete</a>
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

