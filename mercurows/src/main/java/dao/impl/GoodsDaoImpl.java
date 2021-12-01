package dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.event.PrintEvent;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanMapHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import dao.Db;
import dao.IBaseDao;
import pur.Goods;

public class GoodsDaoImpl extends Db implements IBaseDao<Goods> {
    QueryRunner runner = new QueryRunner(getDataSource());
    Goods goods;

    PreparedStatement ps = null;//带占位符参数？的操作
    ResultSet rs = null;//结果集

    @Override
    public boolean add(Goods Goods) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean modify(Goods Goods) {
        return false;
    }

    /**
     * @param 模糊查询
     *
     */

    @Override
    public HashMap<Integer, Goods> findByProp(HashMap<String, Object> prop) {
        String sql = "select  *  from goods";
        HashMap<Integer, Goods> data = null;

        // try {
        //     List<Map<String, Object>> map = runner.query(sql, new MapListHandler());
        //     for (Map<String, Object> goods : map) {
        //         String sql2 = "SELECT  *  from Goods where id = ?";
        //         Integer id = (Integer) goods.get("id");
        //         data.put(id, (Goods) runner.query(sql2, new BeanHandler<Goods>(Goods.class), "" + id));
        //     }

        try {
            data = (HashMap<Integer, Goods>) runner.query(sql, new BeanMapHandler<Integer, Goods>(Goods.class));
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        // //在连接的基础上执行操作
        // try {
        //     // ps = getConn().prepareStatement(query);//操作
        //     //执行查询操作，返回结果集
        //     rs = ps.executeQuery();
        //     //判断并将结果集转化为对象
        //     //rs!=null
        //     if (rs!=null) {
        //         //若有数据回来，则先生成订单对象，再填充对象
        //         data = new HashMap<Integer, Goods>();
        //         while (rs.next()) {
        //             goods = new Goods();
        //             goods.setId(rs.getInt("id"));
        //             goods.setCh_spec(rs.getString("ch_spec"));
        //             goods.setCode(rs.getString("code"));
        //             goods.setImgUrl(rs.getString("imgUrl"));
        //             goods.setIn_price(rs.getDouble("in_price"));
        //             goods.setKeywords(rs.getString("keywords"));
        //             goods.setOut_price(rs.getDouble("out_price"));
        //             goods.setStock(rs.getInt("stock"));
        //             goods.setProduct(null);
        //             data.put(goods.getId(), goods);
        //         }

        //         //。。。。。。
        //     }
        // } catch (SQLException e) {
        //     System.out.println(e.toString());
        // }
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
