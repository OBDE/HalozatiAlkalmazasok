/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hu.obde.pizzaapi.resources.api;

import hu.obde.pizzaapi.datamodell.Feltet;
import hu.obde.pizzaapi.datamodell.Pizza;
import java.util.List;

/**
 *
 * @author obernay
 */
public interface PizzaService 
{
    public List<Pizza> getAll();
    public String insertPizza(String nev, String centimeter, List<String> feltetlista);
    
}
