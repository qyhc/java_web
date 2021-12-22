package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.dbutils.QueryRunner;

import dao.Db;
import dao.IBaseDao;
import pur.Customer;

public class CustomerDaoImpl extends Db implements IBaseDao<Customer> {
    PreparedStatement ps = null;//带占位符参数？的操作
    ResultSet rs = null;//结果集
    Connection conn = null;
    QueryRunner runner = new QueryRunner(getDataSource());
    RegionDaoImpl rdi = new RegionDaoImpl();

    @Override
    public boolean add(Customer customer) {
        boolean res = false;
        String sql = " insert into customer(username,pass,tel,region_id) values(?,?,?,?)";
        Object[] potion = new Object[] { customer.getUsername(), customer.getPass(), customer.getTel(),
                customer.getRegion_id().getId() };
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
    public boolean modify(Customer customer) {
        boolean f = false;
        String sql = "update customer set realname = ? ,pass = ? ,intro = ?,tel = ?, email = ?,gender = ?, cardID = ?, region_id = ?  where id = ?";
        // update customer set realname = 666 ,pass = 666 ,intro = 666,email = 666,gender = 1, cardID = 6666  where id = 40025
        Object[] para = new Object[]{
            customer.getRealname(),customer.getPass(),customer.getIntro(),customer.getTel(),
                customer.getEmail(), customer.getGender(), customer.getCardID(), customer.getRegion_id().getId(),
                customer.getId()
        };
        try {
            int i;
            i = runner.update(sql, para);
            if (i > 0) {
                f = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;

    }

    @Override
    public Customer findById(int id) {
        Customer customer = null;
        // 创建queryRunner 查询器
        String sql = "SELECT  *  from customer where id=?";
        // 调用方法
        try {
            conn = getDataSource().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                String p = rs.getString("pass");
                String u = rs.getString("username");
                // 调用下方的根据账号密码查找客户方法
                customer = this.findByUandP(u, p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public HashMap<Integer, Customer> findByProp(HashMap<String, Object> prop) {
        HashMap<Integer, Customer> customeres = new HashMap<Integer, Customer>();
//       基于数据源创建查询器
        String sql = "select * from customer";
        String u = "";
        if (prop.keySet().size() == 0) {
            try {
                conn = getDataSource().getConnection();
                ps = conn.prepareStatement(sql);
                boolean hasResultSet = ps.execute(sql);
                if (hasResultSet) {
                    rs = ps.getResultSet();
                    while (rs.next()) {
                        String passWord = rs.getString("pass");
                        String userName = rs.getString("username");
                        Customer c = this.findByUandP(userName, passWord);
                        customeres.put(c.getId(), c);
                    }
                }
                rs.close();
                ps.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            if (prop.containsKey("username")) {
                u=(String)prop.get("username");
                sql += " where username= '" + u + "'";
            }
            else if (prop.containsKey("tel")) {
                u=(String)prop.get("tel");
                sql += " where tel= '" +  u + "'";
            }
            else if (prop.containsKey("cardID")) {
                u=(String)prop.get("cardID");
                sql += " where cardID= '" +  u + "'";
            }
            else if (prop.containsKey("email")) {
                u = (String) prop.get("email");
                sql += " where email = '" + u + "'";
            }
            try {
                conn = getDataSource().getConnection();
                ps = conn.prepareStatement(sql);
                boolean hasResultSet = ps.execute(sql);
                if (hasResultSet) {
                    rs = ps.getResultSet();
                    while (rs.next()) {
                        String passWord = rs.getString("pass");
                        String userName = rs.getString("username");
                        Customer c = this.findByUandP(userName, passWord);
                        customeres.put(c.getId(), c);
                    }
                }
                rs.close();
                ps.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customeres;

    }

    /**
     * @param u：username
     * @param p:password
     * @return ：customer
     */
    public Customer findByUandP(String u, String p) {
        Customer customer = null;
        // 创建queryRunner 查询器
        String sql = "SELECT  *  from customer where username=? and pass=?";
        // 调用方法
        try {
            conn = getDataSource().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, u);
            ps.setString(2, p);
            rs = ps.executeQuery();
            if (rs.next()) {
                customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setRealname(rs.getString("realname"));
                customer.setUsername(rs.getString("username"));
                customer.setPass(rs.getString("pass"));
                customer.setImgUrl(rs.getString("imgUrl"));
                customer.setIntro(rs.getString("intro"));
                customer.setTel(rs.getString("tel"));
                customer.setEmail(rs.getString("email"));
                customer.setGender(rs.getString("gender"));
                customer.setCardID(rs.getString("cardID"));
                customer.setDetail_address(rs.getString("detail_address"));
                customer.setRegTime(rs.getString("regTime"));
                customer.setState(rs.getString("state"));
                customer.setLevel(rs.getString("level"));
                customer.setRegion_id(rdi.findById(rs.getInt("region_id")));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customer;
    }

}
