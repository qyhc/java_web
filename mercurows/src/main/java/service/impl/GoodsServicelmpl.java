package service.impl;

import java.util.HashMap;

import dao.IBaseDao;
import dao.impl.GoodsDaoImpl;
import pur.Goods;

public class GoodsServicelmpl implements IBaseDao<Goods> {
    // 这是一个持久层
    GoodsDaoImpl gdi = new GoodsDaoImpl();

    @Override
    public boolean add(Goods t) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean modify(Goods t) {
        return false;
    }

    @Override
    public Goods findById(int id) {
        return null;
    }

    @Override
    public HashMap<Integer, Goods> findByProp(HashMap<String, Object> prop) {
        return gdi.findByProp(prop);
    }

}
