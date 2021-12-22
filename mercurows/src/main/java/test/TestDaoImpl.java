package test;

import java.util.HashMap;

import dao.impl.CustomerDaoImpl;
import pur.Customer;

public class TestDaoImpl {

    public static void testOrderDaoImpl() {
        HashMap<String, Object> m = new HashMap<>();
        m.put("username", "admin");
        HashMap<Integer, Customer> map = new CustomerDaoImpl().findByProp(m);
        System.out.print("a");
    }
    public static void main(String[] args) {
        testOrderDaoImpl();
    }
}
