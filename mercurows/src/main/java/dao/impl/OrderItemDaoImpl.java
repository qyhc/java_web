package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanMapHandler;

import dao.Db;
import dao.IBaseDao;
import pur.OrderItem;
import service.impl.GoodsServicelmpl;
import service.impl.OrdersServicelmpl;

public class OrderItemDaoImpl extends Db implements IBaseDao<OrderItem> {
    GoodsServicelmpl gsi = new GoodsServicelmpl();
    OrdersServicelmpl osi = new OrdersServicelmpl();
    PreparedStatement ps = null;//带占位符参数？的操作
    Connection conn = null;
    ResultSet rs = null;//结果集
    QueryRunner runner = new QueryRunner(getDataSource());
    @Override
    public boolean add(OrderItem OrderItem) {
        boolean res = false;
        String sql = "insert into OrderItem(orders_id,goods_id,buyPrice,buyNum)values(?,?,?,?)";
        Object[] potion = new Object[]{OrderItem.getOrders_id().getId(),OrderItem.getGoods_id().getId()
                , OrderItem.getBuyPrice(), OrderItem.getBuyNum() };
        try {
            res = runner.update(sql, potion) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
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
        OrderItem orderItem = null;//定义订单类对象
        // 创建queryRunner 查询器
        String sql = "SELECT  *  from OrderItem where id=?";
        // 调用方法
        try {
            conn = getDataSource().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                orderItem = new OrderItem();
                orderItem.setId(rs.getInt("id"));
                orderItem.setBuyNum(rs.getInt("buyNum"));
                orderItem.setBuyPrice(rs.getDouble(("buyPrice")));
                orderItem.setGoods_id(gsi.findById(rs.getInt("goods_id")));
                orderItem.setOrders_id(osi.findById(rs.getInt("orders_id")));
            }
            rs.close();
            ps.close();
            conn.close();
            // orderItem = (OrderItem) runner.query(sql, new BeanHandler<OrderItem>(OrderItem.class), new Object[] {id});
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItem;
    }

    @Override
    public HashMap<Integer, OrderItem> findByProp(HashMap<String, Object> prop) {
        HashMap<Integer, OrderItem> res = new HashMap<Integer, OrderItem>();
        OrderItem orderItem = null;//定义订单类对象
        String sql = "Select * from orderitem";
        try {
            conn = getDataSource().getConnection();
            ps = conn.prepareStatement(sql);
            boolean hasResultSet = ps.execute(sql);
            if (hasResultSet) {
                rs = ps.getResultSet();
                while (rs.next()) {
                    orderItem = new OrderItem();
                    orderItem.setId(rs.getInt("id"));
                    orderItem.setBuyNum(rs.getInt("buyNum"));
                    orderItem.setBuyPrice(rs.getDouble(("buyPrice")));
                    orderItem.setGoods_id(gsi.findById(rs.getInt("goods_id")));
                    orderItem.setOrders_id(osi.findById(rs.getInt("orders_id")));
                    res.put(rs.getInt("id"), orderItem);
                }
                rs.close();
                ps.close();
                conn.close();
            }
            // res = (HashMap<Integer, OrderItem>) runner.query(sql, new BeanMapHandler<Integer, OrderItem>(OrderItem.class));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            // rs.close();
        }
        return res;
    }

}
