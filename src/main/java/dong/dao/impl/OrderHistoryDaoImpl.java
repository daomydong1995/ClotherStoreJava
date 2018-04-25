package dong.dao.impl;

import dong.dao.OrderHistoryDao;
import dong.model.Cart;
import dong.model.Customer;
import dong.model.OrderHistory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class OrderHistoryDaoImpl implements OrderHistoryDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addOrderHistoryByCart(Cart cart){
        Customer customer = cart.getCustomer();
        int cartId = cart.getCartId();

        OrderHistory orderHistory = new OrderHistory();
        orderHistory.setBillingAddress(customer.getBillingAddress().toString());
        orderHistory.setCartId(cartId);
        orderHistory.setCartItems(cart.getCartItems());
        orderHistory.setCustomerId(customer.getCustomerId());
        orderHistory.setCustomerName(customer.getCustomerName());
        orderHistory.setGrandTotal(cart.getGrandTotal());
        orderHistory.setShippingAddress(customer.getShippingAddress().toString());

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(orderHistory);
        session.flush();
    }
}
