/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hu.obde.pizzaapi.resources.api;

/**
 *
 * @author obernay
 */
public interface AdminService 
{
    public String insertAdmin(String username, String password, String email, String level);
}
