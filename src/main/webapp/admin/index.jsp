<%-- 
    Document   : index
    Created on : May 18, 2017, 12:42:44 PM
    Author     : obernay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PizzaAPI - Admin</title>
        <script>
            if(document.cookie.indexOf('username=') === -1 ){window.location.replace("login.jsp");}          
        </script>
        <link href="../styles/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .tab-pane{margin-top: 45px;}
        </style>
    </head>
    <body>
        <div class="container">
        <jsp:include page="include/navbar.jsp" />
        <div class="jumbotron">
        <h1>Hello, <script> document.write(document.cookie.split("username=")[1].split(";")[0]); </script> !</h1>
        </div>
        </div>
        

        
<div class="container">
   <div>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#rendelesek" aria-controls="rendelesek" role="tab" data-toggle="tab">Rendelések </a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"> Éttermek </a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"> Pizzák </a></li>
    <li role="presentation"><a href="#feltetek" aria-controls="feltetek" role="tab" data-toggle="tab"> Feltétek </a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="rendelesek">        
        <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default panel-table">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h3 class="panel-title">Rendelések</h3>
                        </div>
                        <div class="col col-xs-6 text-right">
                            <div class="pull-right">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-success btn-filter active" data-target="completed">
                                        <input type="radio" name="options" id="option1" autocomplete="off" >
                                        Teljesített
                                    </label>
                                    <label class="btn btn-warning btn-filter" data-target="pending">
                                        <input type="radio" name="options" id="option2" autocomplete="off"> Feldolgozás alatt
                                    </label>
                                    <label class="btn btn-default btn-filter" data-target="all">
                                        <input type="radio" name="options" id="option3" autocomplete="off" checked> Mind
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <table id="mytable" class="table table-striped table-bordered table-list">
                        <thead>
                        <tr>
                            <th class="col-check"><input type="checkbox" id="checkall" onclick="test()"/></th>
                            <th class="col-tools"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
                            </th>
                            <th class="hidden-xs">ID</th>
                            <th class="col-text">Name</th>
                            <th class="col-text">Email</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr data-status="completed">
                            <td align="center"><input type="checkbox" class="checkthis"/></td>
                            <td align="center">
                                <a class="btn btn-default"><span class="glyphicon glyphicon-pencil"
                                                                 aria-hidden="true"></span></a>
                                <a class="btn btn-danger"><span class="glyphicon glyphicon-trash"
                                                                aria-hidden="true"></span></a>
                            </td>
                            <td class="hidden-xs">1</td>
                            <td>John Doe</td>
                            <td>johndoe@example.com</td>
                        </tr>
                        <tr data-status="pending">
                            <td align="center"><input type="checkbox" class="checkthis"/></td>
                            <td align="center">
                                <a class="btn btn-default"><span class="glyphicon glyphicon-pencil"
                                                                 aria-hidden="true"></span></a>
                                <a class="btn btn-danger"><span class="glyphicon glyphicon-trash"
                                                                aria-hidden="true"></span></a>
                            </td>
                            <td class="hidden-xs">2</td>
                            <td>Jen Curtis</td>
                            <td>jencurtis@example.com</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
                <div class="panel-footer">
                    
                </div>
            </div>
        </div>
        </div>     
        </div>      
    <div role="tabpanel" class="tab-pane" id="profile"> 
               
        
     </div>
    <div role="tabpanel" class="tab-pane" id="messages"> 
    
        <form id="pizzaform">            
            <div id="pizzafeltetlista">
                <select name="feltet[]">
                    <option>Sonka</option>
                </select>
            </div>
        </form>
    
    
    
    </div>
    <div role="tabpanel" class="tab-pane" id="feltetek"> 
    
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-primary">
                <div class="panel-heading">Feltét hozzáadása <span id="errormsg" class="pull-right label label-danger"></span></div>
                <form id="feltetform">
                <div class="panel-body">
                    <div class="form-group">
                        <label for="addFeltet">Feltét megnevezése </label>
                        <input class="form-control" type="text" name="feltet"> 
                    </div>
                </div>
                <div class="panel-footer"><button class="btn btn-sm btn-block btn-primary" >Hozzáadás</button></div>
                </form>
            </div>
        </div>
        
        <div class="col-md-10 col-md-offset-1"  >
        <table class="table table-condensed">
                <thead>
                 <th>ID</th>
                 <th>Feltét</th>
                </thead>
                <tbody id="feltetek_table">                    
                </tbody>
            </table>
            </div>
    
    </div>
  </div>

</div>
   
</div>
        
        <script src="../styles/bootstrap/js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="../styles/async.js" type="text/javascript"></script>
        <script> loadFeltetek("../rest/feltet/osszes","feltet", "feltetek_table"); </script>
        <script src="../styles/customjqueries.js" type="text/javascript"></script>
        <script src="../styles/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
