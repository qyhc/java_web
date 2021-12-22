package dao;

import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;
    // 数据库连接池
public class Db {
    static ComboPooledDataSource cpds = null;
    public static DataSource getDataSource() {
        // 利用c3p0实现连接池
        // 读取src/c3p0-config 文件
        // ComboPooledDataSource() 无参数时，方法读取的是 c3p0-config 文件的缺省信息
        if (cpds == null) {
            cpds  = new ComboPooledDataSource();
        }
        try {
            System.out.print(cpds.getThreadPoolSize());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cpds;
    }

    // public static Connection getConn() {
    //     //构造属性对象
    //     Properties properties = new Properties();
    //     Connection conn = null;//定义连接
    //     try {
    //         //构建输入流，对接配置文件
    //         InputStream fis = Db.class.getClassLoader().getResourceAsStream("db.properties");

    //         //load装载配置文件
    //         try {
    //             properties.load(fis);
    //         } catch (IOException e) {
    //             e.printStackTrace();
    //         }
    //         //读取key对应的值
    //         String u = properties.getProperty("username");//账号
    //         // String u = "jk1909";//账号
    //         // String p = "jk1909";//密码
    //         // String driver = "com.mysql.cj.jdbc.Driver";//驱动类
    //         // String url = "jdbc:mysql://decken.ink:3306/shop?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";//数据库的URL（协议，IP，端口，数据库名）
    //         String p = properties.getProperty("password");//密码\
    //         String driver = properties.getProperty("driver");//驱动类
    //         //jdbc:mysql://localhost:3306/shop
    //         String url = properties.getProperty("url");//数据库的URL（协议，IP，端口，数据库名）
    //         //加载驱动
    //         Class.forName(driver);
    //         //用相关参数创建连接
    //         conn = DriverManager.getConnection(url, u, p);
    //     } catch (ClassNotFoundException e) {
    //         e.printStackTrace();
    //     } catch (SQLException e) {
    //         e.printStackTrace();
    //     }
    //     return conn;
    // }


    public static  void main(String[] args){
        System.out.println(getDataSource());
    }
}
