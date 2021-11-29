package zj.com.pojo;

public class OrderItem {
    int id;//订单详情编号
    Orders orders;//关联订单，表中通过订单编号外键关联到订单，多对一关系
    Product product;////关联商品，表中通过商品编号外键关联到商品，一对一关系
    int num;//购买数量

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
