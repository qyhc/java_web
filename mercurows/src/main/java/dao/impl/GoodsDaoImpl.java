package dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanMapHandler;

import dao.Db;
import dao.IBaseDao;
import pur.Goods;

public class GoodsDaoImpl extends Db implements IBaseDao<Goods> {
    QueryRunner runner = new QueryRunner(getDataSource());
    Goods goods;

    PreparedStatement ps = null;//带占位符参数？的操作
    ResultSet rs = null;//结果集

    @Override
    public boolean add(Goods goods) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean modify(Goods goods) {
        boolean res = false;
        // String sql = "update customer set realname = ? ,pass = ? ,intro = ?,tel = ?, email = ?,gender = ?, cardID = ?, region_id = ?  where id = ?";
        String sql = "update goods set stock = ? where id = ?";
        // update customer set realname = 666 ,pass = 666 ,intro = 666,email = 666,gender = 1, cardID = 6666  where id = 40025
        Object[] para = new Object[]{
            goods.getStock(),goods.getId()
        };
        try {
            res = runner.update(sql, para) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    /**
     * @param 模糊查询
     *
     */

    @Override
    public HashMap<Integer, Goods> findByProp(HashMap<String, Object> prop) {
        String sql = "select  *  from goods";
        HashMap<Integer, Goods> data = null;
        if(prop!=null && prop.containsKey("keywords")){
            String u = (String) prop.get("keywords");
            sql += " where keywords like '%" +u +"%'";
        }
        try {
            data = (HashMap<Integer, Goods>) runner.query(sql, new BeanMapHandler<Integer, Goods>(Goods.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return data;
    }

    @Override
    public Goods findById(int id) {
        Goods good = null;//定义订单类对象
        // 创建queryRunner 查询器
        String sql = "SELECT  *  from Goods where id=?";
        // 调用方法
        try {
            good = (Goods) runner.query(sql, new BeanHandler<Goods>(Goods.class), new Object[] {id});
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return good;
    }

}
