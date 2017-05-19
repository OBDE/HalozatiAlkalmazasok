/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hu.obde.pizzaapi.datamodell;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author obernay
 */
@Entity
@Table(name="Pizza")
@NamedQueries({        
        @NamedQuery(name = "Pizza.getAll", query = "SELECT p FROM Pizza p order by 1")
        })
public class Pizza implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;    
    private String nev;
    private int centimeter;
    
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "Pizza", orphanRemoval = true, cascade = CascadeType.ALL)
    private Feltet feltet;
    
    
    public String getNev() {
        return nev;
    }

    public void setNev(String nev) {
        this.nev = nev;
    }
    

    public int getCentimeter() {
        return centimeter;
    }

    public void setCentimeter(int centimeter) {
        this.centimeter = centimeter;
    }

    public Feltet getFeltet() {
        return feltet;
    }

    public void setFeltet(Feltet feltet) {
        this.feltet = feltet;
    }

   
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pizza)) {
            return false;
        }
        Pizza other = (Pizza) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "hu.obde.pizzaapi.datamodell.Pizza[ id=" + id + " ]";
    }
    
}
