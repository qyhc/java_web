package dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import dao.Db;
import dao.IBaseDao;
import pur.Product;

public class ProductDaoImpl extends Db implements IBaseDao<Product> {
    PreparedStatement ps = null;//带占位符参数？的操作
    ResultSet rs = null;//结果集

    @Override
    public boolean add(Product Product) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean modify(Product Product) {
        return false;
    }

    @Override
    public Product findById(int id) {
        Product Product = null;//定义订单类对象
        // 创建queryRunner 查询器
        QueryRunner runner = new QueryRunner(getDataSource());
        String sql = "SELECT  *  from Product where id=?";
        // 调用方法
        try {
            Product = (Product) runner.query(sql, new BeanHandler<Product>(Product.class), new Object[] {id});
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return Product;
    }

    @Override
    public HashMap<Integer, Product> findByProp(HashMap<String, String> prop) {
        return null;
    }

}
