package dong.dao;

import dong.model.Cart;

/**
 * Created by Le on 1/24/2016.
 */
public interface OrderHistoryDao {

    void addOrderHistoryByCart(Cart cart);
}
