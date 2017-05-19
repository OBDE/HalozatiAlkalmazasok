/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hu.obde.pizzaapi.resources.jpa;

import hu.obde.pizzaapi.datamodell.Admin;
import hu.obde.pizzaapi.resources.api.AdminService;
import hu.obde.pizzaapi.services.GenericDaoService;
import hu.obde.pizzaapi.services.SHA256;
import java.util.HashMap;
import java.util.Map;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.json.JSONObject;

/**
 *
 * @author obernay
 */

@Path("admin")
@RequestScoped
public class AdminServiceImpl implements AdminService {
    
    @Inject
            GenericDaoService gds;
    
    Logger log = LoggerFactory.getLogger(this.getClass().getName());
        
    
    @POST
    @Path("hozzaad")
    @Override
    public String insertAdmin(
            @FormParam("username")String username, 
            @FormParam("password")String password, 
            @FormParam("email")String email, 
            @FormParam("level")String level) 
    {
        Admin admin = new Admin();
        
        try
        {
         admin.setUsername(username);
         admin.setPassword(SHA256.generateHash(password));
         admin.setEmail(email);
         admin.setLevel(Integer.parseInt(level));        
            
         gds.save(admin);
        }
        catch(Exception ex)
        {
            return "error";
        }
        
        
        return "ok";
    }
    
    
    @POST
    @Path("login")
    @Produces(MediaType.APPLICATION_JSON)
        public String checkLogin(@FormParam("username")String username,
                                 @FormParam("password")String password)
        {
            Map<String,Object> params = new HashMap<>();
            params.put("username", username);
            JSONObject returnJsonObj = new JSONObject();
            Admin admin = null;
            try{
                
                admin = (Admin) gds.getEntity("Admin.getAdminByUsername", params);
                
                if(SHA256.checkHash(password, admin.getPassword()))
                {  
                  JSONObject adminJsonObj = new JSONObject();
                    adminJsonObj.put("username", admin.getUsername());
                    adminJsonObj.put("level", admin.getLevel());
                    adminJsonObj.put("id",admin.getId());


                   returnJsonObj.put("admin",adminJsonObj);
                }
                else
                {
                   returnJsonObj.put("error","no matching password");
                }
            }
            catch(javax.persistence.NoResultException ex)
            {
                returnJsonObj.put("error", "no matching user");
                log.error("Nincs ilyen user", ex);
            }
            
            return returnJsonObj.toString();
        }
    
    
    
}
