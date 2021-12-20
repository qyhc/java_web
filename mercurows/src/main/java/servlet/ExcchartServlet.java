package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
// import com.alibaba.fastjson.JSONObject; //没有 fromObject方法
import pur.OrderItem;
import pur.Region;
import service.impl.DataServiceImpl;
import service.impl.GoodsServicelmpl;
import service.impl.OrdersItemServicelmpl;
import service.impl.OrdersServicelmpl;

/**
 * JSON的语法规则：
 * 数据在名称/值对中 "key":"value"
 * 数据由逗号分隔
 * {} 保存对象
 * [] 保存数组
 */
@WebServlet("/exc")
public class ExcchartServlet extends HttpServlet {
    OrdersServicelmpl osi = new OrdersServicelmpl();
    OrdersItemServicelmpl ois = new OrdersItemServicelmpl();
    GoodsServicelmpl gsi = new GoodsServicelmpl();
    DataServiceImpl dsi = new DataServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");  //这里不设置编码会有乱码
        resp.setContentType("text/html;charset=utf-8");
        resp.setHeader("Cache-Control", "no-cache");
        String select = req.getParameter("select");
        if (select.equals("zutu")) {
            HashMap<Integer, Integer> cnt = new HashMap<Integer, Integer>();
            HashMap<Integer, OrderItem> orderitme = ois.findByProp(null);
            // 计数商品 key：商品id，value：商品出现次数
            // 遍历订单详情哈希表，统计商品出现次数
            for (Map.Entry<Integer, OrderItem> entry : orderitme.entrySet()) {
                cnt.put(entry.getValue().getGoods_id().getId(),
                        cnt.getOrDefault(entry.getValue().getGoods_id().getId(), 0) + entry.getValue().getBuyNum());
            }
            // 生成两个列表，本别存放关键字与其对应出现的频率
            List<String> s1 = new ArrayList<String>();
            List<String> s2 = new ArrayList<String>();
            for (Map.Entry<Integer, Integer> entry : cnt.entrySet()) {
                // 字符串拼接，提取前四个关键字
                s1.add(gsi.findById(entry.getKey()).getKeywords().substring(0, 4));
                s2.add(String.valueOf(entry.getValue()));
            }
            Map map = new HashMap<>();
            map.put("data1", s1.toArray());
            map.put("data2", s2.toArray());
            JSONObject object = JSONObject.fromObject(map); //创建Json对象
            //把json数据返回给浏览器：
            System.out.print(object.toString());
            resp.getWriter().write(object.toString());

        }
        else if (select.equals("bingtu")) {
            // 哈希表计数器
            HashMap<String, Integer> cnt = new HashMap<String, Integer>();
            // 获取购买了商品的顾客的对应的所在地区
            HashMap<Integer, Region> restRegion = dsi.findRegionOnOrderitem();
            // 统计地区的频率
            for (Map.Entry<Integer, Region> entry : restRegion.entrySet()) {
                cnt.put(entry.getValue().getName(), cnt.getOrDefault(entry.getValue().getName(), 0) + 1);
            }
            List list = new ArrayList<>();
            for (Map.Entry<String, Integer> entry : cnt.entrySet()) {
                Map cache = new HashMap<>();
                cache.put("value", entry.getValue());
                cache.put("name",entry.getKey());
                list.add(cache);
            }
            JSONArray object2 = JSONArray.fromObject(list); //创建Json对象
            //把json数据返回给浏览器：
            System.out.print(object2.toString());
            resp.getWriter().write(object2.toString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
