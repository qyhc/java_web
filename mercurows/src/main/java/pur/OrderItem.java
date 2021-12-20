package pur;

public class OrderItem {
    int id;//订单详情编号
    Orders orders_id;//关联订单，表中通过订单编号外键关联到订单，多对一关系
    Goods goods_id;////关联商品，表中通过商品编号外键关联到商品，一对一关系
    double buyPrice;//会员价
    int buyNum;//购买数量
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Orders getOrders_id() {
		return orders_id;
	}
	public void setOrders_id(Orders orders_id) {
		this.orders_id = orders_id;
	}
	public Goods getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(Goods goods_id) {
		this.goods_id = goods_id;
	}
	public double getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(double buyPrice) {
		this.buyPrice = buyPrice;
	}
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}

}
