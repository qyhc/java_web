package dao.impl;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import dao.Db;
import dao.IBaseDao;
import pur.Orders;

public class OrdersDaoImpl extends Db implements IBaseDao<Orders> {
    PreparedStatement ps = null;//带占位符参数？的操作
    ResultSet rs = null;//结果集

    @Override
    public boolean add(Orders orders) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean modify(Orders orders) {
        return false;
    }

    @Override
    public Orders findById(int id) {
        Orders orders = null;//定义订单类对象
        String s = "SELECT  *  from orders WHERE  id=?";
        //在连接的基础上执行操作
        try {
            // ps = getConn().prepareStatement(s);//操作
            //完善操作参数
            ps.setInt(1, id);//60000
            //执行查询操作，返回结果集
            rs = ps.executeQuery();
            //判断并将结果集转化为对象
            //rs!=null
            if (rs.next()) {
                //若有数据回来，则先生成订单对象，再填充对象
                orders = new Orders();
                orders.setId(rs.getInt("id"));//从记录集中取对应列的值
                orders.setOrderTime(rs.getString("orderTime"));
                orders.setReceiverAddress(rs.getString("receiverAddress"));
                //........
                // 借助消费者实现类的精确查询，通过cutomer_id找到具体的消费者
                orders.setCustomer(new CustomerDaoImpl().findById(rs.getInt("customer_id")));
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return orders;
    }

    @Override
    public HashMap<Integer, Orders> findByProp(HashMap<String, Object> prop) {
        return null;
    }
}
