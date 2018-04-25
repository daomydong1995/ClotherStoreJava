package dong.service;

import dong.model.Cart;

/**
 * Created by Le on 1/23/2016.
 */
public interface CartService {

    Cart getCartById(int cartId);

    void update(Cart cart);
}
