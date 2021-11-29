package dao;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;
    // 数据库连接池
public class Db {
    public static DataSource getDataSource() {
        // 利用c3p0实现连接池
        // 读取src/c3p0-config 文件
        // ComboPooledDataSource() 无参数时，方法读取的是 c3p0-config 文件的缺省信息
        ComboPooledDataSource cpds = new ComboPooledDataSource();
        return cpds;
    }

    public static  void main(String[] args){
        System.out.println(getDataSource());
    }
}
