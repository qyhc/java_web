package pur;

//本类记载商品和属性项的多多映射，类似成绩表
public class Goods_propitem {
    int id;//商品ID
    Goods goods;//所属商品
    PropertyItem propertyItem;//所属属性项

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public PropertyItem getPropertyItem() {
        return propertyItem;
    }

    public void setPropertyItem(PropertyItem propertyItem) {
        this.propertyItem = propertyItem;
    }

    @Override
    public String toString() {
        return "Goods_propitem{" +
                "id=" + id +
                ", goods=" + goods +
                ", propertyItem=" + propertyItem +
                '}';
    }
}
