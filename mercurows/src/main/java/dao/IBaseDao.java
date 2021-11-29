package dao;

import java.util.ArrayList;
import java.util.HashMap;

//持久层接口  T:泛型
public interface IBaseDao<T> {
    /**
     * 功能：添加
     * @param t：泛型
     * @return：添加成功与否
     */
    boolean add(T t);

    //    删除
    boolean delete(int id);

    //    修改
    boolean modify(T t);

    //    精确查询
    T findById(int id);

    //    模糊查询{"id="90";"address"='广州';"name"=""}
    HashMap<Integer, T> findByProp(HashMap<String, String> prop);
}
