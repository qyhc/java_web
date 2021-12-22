package service.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanMapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import dao.Db;
import dao.IBaseDao;
import dao.impl.GoodsDaoImpl;
import pur.Goods;
import pur.Region;

public class DataServiceImpl extends Db implements IBaseDao<Goods> {
    QueryRunner runner = new QueryRunner(getDataSource());
    Goods goods;
    PreparedStatement ps = null;//带占位符参数？的操作
    ResultSet rs = null;//结果集
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
        return gdi.findById(id);
    }
    @Override
    public HashMap<Integer, Goods> findByProp(HashMap<String, Object> prop) {
        return gdi.findByProp(prop);
    }

    public HashMap<Integer, Goods> getAll() {
        String sql = "SELECT  *  from Goods";
        HashMap<Integer, Goods> data = new HashMap<Integer, Goods>();

        QueryRunner runner = new QueryRunner(getDataSource());
        try {
            List<Map<String, Object>> map = runner.query(sql, new MapListHandler());
            for (Map<String, Object> goods : map) {
                String sql2 = "SELECT  *  from Goods where id = ?";
                Integer id = (Integer) goods.get("id");
                data.put(id, (Goods) runner.query(sql2, new BeanHandler<Goods>(Goods.class), "" + id));
            }

        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        return data;
    }

    public HashMap<Integer, Region> findRegionOnOrderitem() {
        // String sql = "select customer_id from orderitem item inner join orders ers on item.orders_id = ers.id";
        String sql = "select * from ((orderitem item inner join orders ers on item.orders_id = ers.id)"+
                " inner join customer cu on cu.id = customer_id ) inner join region on cu.region_id = region.id";
        HashMap<Integer, Region> data = null;
        try {
            data = (HashMap<Integer, Region>) runner.query(sql, new BeanMapHandler<Integer, Region>(Region.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return data;
    }
}
