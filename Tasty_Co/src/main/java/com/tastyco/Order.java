package com.tastyco;

import java.sql.Date;
import java.sql.Timestamp;

public class Order {
    private int orders_id;
    private int user_id;
    private int dish_id;
    private double amount;
    private int quantity;
    private Date order_date;
    private Timestamp order_time;

    // Constructors
    public Order() {}

    public Order(int user_id, int dish_id, double amount, int quantity, Date order_date) {
        this.user_id = user_id;
        this.dish_id = dish_id;
        this.amount = amount;
        this.quantity = quantity;
        this.order_date = order_date;
    }

    // Getters and Setters
    public int getOrdersId() { return orders_id; }
    public void setOrdersId(int orders_id) { this.orders_id = orders_id; }

    public int getUserId() { return user_id; }
    public void setUserId(int user_id) { this.user_id = user_id; }

    public int getDishId() { return dish_id; }
    public void setDishId(int dish_id) { this.dish_id = dish_id; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public Date getOrderDate() { return order_date; }
    public void setOrderDate(Date order_date) { this.order_date = order_date; }

    public Timestamp getOrderTime() { return order_time; }
    public void setOrderTime(Timestamp order_time) { this.order_time = order_time; }
}
