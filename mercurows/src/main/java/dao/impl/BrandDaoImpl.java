package dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import dao.Db;
import dao.IBaseDao;
import pur.Brand;

public class BrandDaoImpl extends Db implements IBaseDao<Brand> {
    PreparedStatement ps = null;//带占位符参数？的操作
    ResultSet rs = null;//结果集

    @Override
    public boolean add(Brand Brand) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean modify(Brand Brand) {
        return false;
    }

    @Override
    public Brand findById(int id) {
        Brand Brand = null;//定义订单类对象
        // 创建queryRunner 查询器
        QueryRunner runner = new QueryRunner(getDataSource());
        String sql = "SELECT  *  from Brand where id=?";
        // 调用方法
        try {
            Brand = (Brand) runner.query(sql, new BeanHandler<Brand>(Brand.class), new Object[] {id});
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return Brand;
    }

    @Override
    public HashMap<Integer, Brand> findByProp(HashMap<String, Object> prop) {
        return null;
    }
}
