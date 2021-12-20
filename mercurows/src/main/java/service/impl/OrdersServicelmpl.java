package service.impl;

import java.util.HashMap;


import dao.IBaseDao;
import dao.impl.OrdersDaoImpl;
import pur.Orders;

public class OrdersServicelmpl implements IBaseDao<Orders> {

    // 持久层
    OrdersDaoImpl odi = new OrdersDaoImpl();
    @Override
    public boolean add(Orders t) {
        return odi.add(t);
    }

    @Override
    public boolean delete(int id) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean modify(Orders t) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public Orders findById(int id) {
        return odi.findById(id);
    }

    @Override
    public HashMap<Integer, Orders> findByProp(HashMap<String, Object> prop) {
        return odi.findByProp(prop);
    }

}
