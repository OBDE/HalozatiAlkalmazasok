<%-- 
    Document   : index
    Created on : May 18, 2017, 11:01:36 AM
    Author     : obernay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin bejelentkezés</title>
        <link href="../styles/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../styles/bootstrap/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    </head>
    <body style="background:url('../styles/images/bg.jpg') no-repeat">
    <div class="container" >
    <div class="row ">
        <div class="col-md-6 col-md-offset-3">
        	<div class="panel panel-default" style="margin-top:200px;">
			  	<div class="panel-heading">
                                    <h3 class="panel-title">Bejelentkezés <span id="errormsg" class="pull-right label label-danger"></span></h3> 
			 	</div>
			  	<div class="panel-body">
                                    <form id="adminlogin" accept-charset="UTF-8" role="form" >
                                <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="Felhasználónév" name="username" type="text">
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="Jelszó" name="password" type="password" >
			    		</div>			    		
			    		<input class="btn btn-lg btn-success btn-block" type="submit" value="Belépés">
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
        <script>
           $(document).ready(function(){
                $("#adminlogin").submit(function(e) {
                var url = "/pizzaapi/rest/admin/login";

                $.ajax({
                       type: "POST",
                       url: url,
                       data: $("#adminlogin").serialize(), 
                       success: function(data)
                       {
                        if(!data.hasOwnProperty("error"))
                        {
                            document.cookie = "username="+data.admin.username;
                            console.log("Sikeres bejelentkezés!");
                            window.location.replace("index.jsp");
                        }
                        if(data.hasOwnProperty("error"))
                        {
                            $('#errormsg').fadeIn(1000).text(data.error).delay(2000).fadeOut(1000);
                        }
                       }
                     });

                e.preventDefault();
                });        
           });
        </script>
    </div>
    </body>
</html>
