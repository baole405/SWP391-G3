/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author hoadnt
 */
public class Product {
    private String id="";
    private String name="";
    private double price=0;
    private int quantity=0;
    private String img = "";

    public Product() {
    }
    
    public Product(String id, String name, double price, int quantity) {
        this.id= id;
        this.name= name;
        this.price= price;
        this.quantity= quantity;
    }
    
    public Product(String id, String name, double price, int quantity, String img) {
        this.id= id;
        this.name= name;
        this.price= price;
        this.quantity= quantity;
        this.img= img;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    
    
    
}
