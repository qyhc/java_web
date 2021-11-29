package dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import dao.Db;
import dao.IBaseDao;
import pur.Customer;

public class CustomerDaoImpl extends Db implements IBaseDao<Customer> {
    PreparedStatement ps = null;//带占位符参数？的操作
    ResultSet rs = null;//结果集
    QueryRunner runner = new QueryRunner(getDataSource());

    @Override
    public boolean add(Customer customer) {
        boolean res = false;
        String sql = " insert into customer(username,pass,tel,region_id) values(?,?,?,?)";
        Object[] potion = new Object[] { customer.getUsername(), customer.getPass(), customer.getTel(),
                customer.getRegion().getId() };
        try {
            res = runner.update(sql, potion) > 0;

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean modify(Customer customer) {
        return false;
    }

    @Override
    public Customer findById(int id) {
        Customer customer = null;//定义订单类对象
        // 创建queryRunner 查询器
        String sql = "SELECT  *  from customer where id=?";
        // 调用方法
        try {
            customer = (Customer) runner.query(sql, new BeanHandler<Customer>(Customer.class), new Object[] {id});
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public HashMap<Integer, Customer> findByProp(HashMap<String, String> prop) {
        return null;
    }

    /**
     * @param u：username
     * @param p:password
     * @return ：customer
     */
    public Customer findByUandP(String u, String p) {
        Customer customer = null;
        // 创建queryRunner 查询器
        QueryRunner runner = new QueryRunner(getDataSource());
        String sql = "SELECT  *  from customer where username=? and pass=?";
        // 调用方法
        try {
            customer = (Customer) runner.query(sql, new BeanHandler<Customer>(Customer.class), new Object[] { u, p });
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return customer;
    }

}
