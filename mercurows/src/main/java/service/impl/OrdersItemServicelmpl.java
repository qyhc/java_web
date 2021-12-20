package service.impl;

import java.util.HashMap;


import dao.IBaseDao;
import dao.impl.OrderItemDaoImpl;
import pur.OrderItem;

public class OrdersItemServicelmpl implements IBaseDao<OrderItem> {

    // 持久层
    OrderItemDaoImpl odi = new OrderItemDaoImpl();
    @Override
    public boolean add(OrderItem t) {
        return odi.add(t);
    }

    @Override
    public boolean delete(int id) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean modify(OrderItem t) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public OrderItem findById(int id) {
        return odi.findById(id);
    }

    @Override
    public HashMap<Integer, OrderItem> findByProp(HashMap<String, Object> prop) {
        return odi.findByProp(prop);
    }

}
