package test;

import dao.impl.OrdersDaoImpl;

public class TestDaoImpl {

    public static void testOrderDaoImpl() {
        int id = 60000;
        System.out.println(new OrdersDaoImpl().findById(id));
    }
    public static void main(String[] args) {
        testOrderDaoImpl();
    }
}
