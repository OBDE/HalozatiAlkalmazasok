<%-- 
    Document   : index
    Created on : May 18, 2017, 10:24:44 AM
    Author     : obernay
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pizza Api - The franchise System :-)</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="margin-top:10px">
        <div class="container">
        <jsp:include page="include/navbar.jsp"></jsp:include>
        
        <div class="jumbotron">
            <h1></h1>
        </div> 
        
         <div class="row">
        <c:forEach var = "i" begin = "1" end = "4">       
            <div class="col-sm-4 col-md-3">
                <div class="panel panel-primary">
                    <div class="panel-heading">Pizza neve</div>
                    <div class="thumbnail">
                <img src="http://lorempixel.com/output/food-q-c-200-200-1.jpg">
                    </div>
                <div class="panel-body">                  
                  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                  
                  <p class="">                      
                      <span class="btn btn-success">32 CM</span>
                      <span class="btn btn-success">45 CM</span>
                      <span class="btn btn-success">60 CM</span>
                  </p>
                  <p class="center-block label label-warning" style="font-size:14px;">
                      <span id="pizzaar">1.200</span> Ft
                  </p>
                  <div class="clearfix"></div>
                  <p>
                      <a href="#" class="btn btn-primary btn-block" role="button">Rendelés</a>
                  </p>
                </div>
              </div>
            </div>
        
        </c:forEach>
   </div>
        
        
        </div>
        <script>
            
        </script>
        
        <script src="styles/bootstrap/js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="styles/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
