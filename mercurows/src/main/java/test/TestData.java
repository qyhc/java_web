package test;

import pur.Goods;
import pur.Product;

import service.impl.DataServiceImpl;

public class TestData {
    static DataServiceImpl dsi = new DataServiceImpl();
    public static void main(String[] st) {
        for (Goods p : dsi.getAll().values()) {
            System.out.println(p);
        }
        System.out.println(dsi.findById(0));

    }
}
