package dong.service;

import dong.model.Cart;

/**
 * Created by Le on 1/24/2016.
 */
public interface OrderHistoryService {

    void addOrderHistoryByCart(Cart cart);
}
