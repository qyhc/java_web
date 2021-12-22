package dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import dao.Db;
import dao.IBaseDao;
import pur.Region;

public class RegionDaoImpl extends Db implements IBaseDao<Region> {
    PreparedStatement ps = null;//带占位符参数？的操作
    ResultSet rs = null;//结果集
    Connection conn = null;

    @Override
    public boolean add(Region region) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean modify(Region region) {
        return false;
    }

    @Override
    public Region findById(int id) {
        Region region = null;
        // 创建queryRunner 查询器
        String sql = "SELECT  *  from Region where id=?";
        // 调用方法
        try {
            conn = getDataSource().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                region = new Region();
                region.setId(rs.getInt("id"));
                region.setName(rs.getString("name"));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return region;
    }

    @Override
    public HashMap<Integer, Region> findByProp(HashMap<String, Object> prop) {
        return null;
    }
}
