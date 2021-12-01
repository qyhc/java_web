package dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import dao.Db;
import dao.IBaseDao;
import pur.OrderItem;

public class OrderItemDaoImpl extends Db implements IBaseDao<OrderItem> {
    PreparedStatement ps = null;//带占位符参数？的操作
    ResultSet rs = null;//结果集

    @Override
    public boolean add(OrderItem OrderItem) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean modify(OrderItem OrderItem) {
        return false;
    }

    @Override
    public OrderItem findById(int id) {
        OrderItem OrderItem = null;//定义订单类对象
        // 创建queryRunner 查询器
        QueryRunner runner = new QueryRunner(getDataSource());
        String sql = "SELECT  *  from OrderItem where id=?";
        // 调用方法
        try {
            OrderItem = (OrderItem) runner.query(sql, new BeanHandler<OrderItem>(OrderItem.class), new Object[] {id});
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return OrderItem;
    }

    @Override
    public HashMap<Integer, OrderItem> findByProp(HashMap<String, Object> prop) {
        return null;
    }

}
