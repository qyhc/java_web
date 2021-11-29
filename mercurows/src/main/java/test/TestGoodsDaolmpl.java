package test;

import dao.impl.GoodsDaoImpl;


public class TestGoodsDaolmpl {
    public static void main(String[] st) {
        System.out.println(new GoodsDaoImpl().findByProp(null));
    }
}
