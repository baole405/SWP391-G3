/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author hoadnt
 */
public class Cart {
    private Map<String, Product> cart;

    public Map<String, Product> getCart() {
        return cart;
    }

    public void setCart(Map<String, Product> cart) {
        this.cart = cart;
    }

    public boolean add(String id, Product product) {
         boolean check= false;
         try {
            if(this.cart== null){
                this.cart= new HashMap<>();
            }
            if(this.cart.containsKey(id)){
                int currentQuantity= this.cart.get(id).getQuantity();
                product.setQuantity(currentQuantity+ product.getQuantity());
            }
            cart.put(id, product);
            check= true;
        } catch (Exception e) {
        }
         return check;
    }

    public boolean edit(String id, int quantity) {
         boolean check= false;
         try {
            if(this.cart!= null){
                if(this.cart.containsKey(id)){
                    this.cart.get(id).setQuantity(quantity);
                    check= true;
                }
            }
        } catch (Exception e) {
        }
         return check;
    }
    public boolean remove(String id) {
         boolean check= false;
         try {
            if(this.cart!= null){
                if(this.cart.containsKey(id)){
                    this.cart.remove(id);
                    check= true;
                }
            }
        } catch (Exception e) {
        }
         return check;
    }
    
}
