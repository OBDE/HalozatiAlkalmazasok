/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hu.obde.pizzaapi.resources.jpa;

import hu.obde.pizzaapi.datamodell.Feltet;
import hu.obde.pizzaapi.resources.api.AdminService;
import hu.obde.pizzaapi.resources.api.FeltetService;
import hu.obde.pizzaapi.services.GenericDaoService;
import java.util.HashMap;
import java.util.List;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author obernay
 */
@Path("feltet")
@RequestScoped
public class FeltetServiceImpl implements FeltetService {
    
    @Inject
            GenericDaoService gds;
    
    Logger log = LoggerFactory.getLogger(this.getClass().getName());
    
    
    @GET
    @Path("osszes")    
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    @Override
    public List<Feltet> getAll()
    {
        return gds.getEntities("Feltet.getAll", new HashMap());        
    }
    
    @POST
    @Path("hozzaad")
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    @Override
    public String insertFeltet(@FormParam("feltet")String pFeltet) 
    {
        JSONObject returnJsonObj = new JSONObject();
        
            Feltet feltet = new Feltet();
            feltet.setFeltet(pFeltet);
            
            try
            {
                gds.save(feltet); 
                returnJsonObj.put("success", "sikeres hozzáadás (" + pFeltet + ")");
            }
            catch(Exception ex)
            {
                returnJsonObj.put("error", "Már van ilyen feltét!");
            }
            
        return returnJsonObj.toString();
    }
}
