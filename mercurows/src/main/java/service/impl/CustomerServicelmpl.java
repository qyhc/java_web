package service.impl;

import java.util.HashMap;

import dao.IBaseDao;
import dao.impl.CustomerDaoImpl;
import pur.Customer;

public class CustomerServicelmpl implements IBaseDao<Customer> {
    // 这是一个持久层
    CustomerDaoImpl cdi = new CustomerDaoImpl();

    @Override
    public boolean add(Customer t) {
        return cdi.add(t);
    }

    @Override
    public boolean delete(int id) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean modify(Customer t) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public Customer findById(int id) {
        // TODO Auto-generated method stub
        return null;
    }

    public Customer login(String u, String p) {
        return cdi.findByUandP(u, p);
    }
    @Override
    public HashMap<Integer, Customer> findByProp(HashMap<String, String> prop) {
        // TODO Auto-generated method stub
        return null;
    }

}
