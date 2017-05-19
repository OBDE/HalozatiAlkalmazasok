/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// ez a function egy select id -be tölti be az adott URL-ről jövő json tulajdonságot
        function loadLists(url, id, tulajdonsag){
                var xmlHttp = new XMLHttpRequest();
                 xmlHttp.open("GET", url , true);
                 xmlHttp.setRequestHeader("Content-Type","application/json");
                 xmlHttp.responseType = "json";
    
                 xmlHttp.onload = function()
                 {
                  var selectedList = document.getElementById(id);            
              
                  for(var x in xmlHttp.response)
                  {
                     var option = document.createElement("option");                    
                     option.text = xmlHttp.response[x][tulajdonsag];                                         
                     option.value = xmlHttp.response[x].id;
                     selectedList.appendChild(option);
                  }
                 };                 
                 xmlHttp.send();
            }
        function loadFeltetek(url, tulajdonsag, tableid)
        {
            var table = document.getElementById(tableid);
              var xmlHttp = new XMLHttpRequest();
                 xmlHttp.open("GET", url , true);
                 xmlHttp.setRequestHeader("Content-Type","application/json");
                 xmlHttp.responseType = "json";
    
                 xmlHttp.onload = function()
                 {                         
              
                  for(var x in xmlHttp.response)
                  {
                        var tr = document.createElement("tr");
                           var td = document.createElement("td");
                           td.innerHTML = xmlHttp.response[x][tulajdonsag];
                           var td2 = document.createElement("td");
                           td2.innerHTML = xmlHttp.response[x].id;
                        tr.appendChild(td2);
                        tr.appendChild(td);                       
                     table.appendChild(tr);                     
                  }
                 };                 
                 xmlHttp.send();            
        }
        
        function clearNodeById(id)
        {
            var myNode = document.getElementById(id);
                while (myNode.firstChild) {
                    myNode.removeChild(myNode.firstChild);
                }
        }