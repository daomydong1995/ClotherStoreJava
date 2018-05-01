package dong.controller;

import com.fasterxml.jackson.annotation.JsonView;
import dong.model.CartItem;
import dong.model.Customer;
import dong.service.CartService;
import dong.service.CustomerService;
import dong.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/cart")
public class CartController {

  @Autowired
  private CustomerService customerService;

  @Autowired
  private ProductService productService;

  @RequestMapping
  public String get(@AuthenticationPrincipal User activeUser) {
    Customer customer = customerService.getCustomerByUsername(activeUser.getUsername());
    int cartId = customer.getCart().getCartId();
    return "redirect:/cart/" + cartId;
  }

  @RequestMapping(value = "/{cartId}", method = RequestMethod.GET)
  public String getCart(@PathVariable(value = "cartId") int cartId, Model model) {
    model.addAttribute("cartId", cartId);

    return "cart";
  }

  @RequestMapping(value = "AddToCart", method = RequestMethod.POST)
  public @ResponseBody
  Object AddToCart(HttpSession session, @RequestParam("id") int id) {
    List<CartItem> giohang = null;
    if (session.getAttribute("giohang") == null) {
      giohang = new ArrayList<>();
      giohang.add(new CartItem(productService.getProductById(id), 1, productService.getProductById(id).getProductPrice()));
    } else {
      giohang = (ArrayList<CartItem>) session.getAttribute("giohang");
      CartItem s = null;
      for (CartItem a : giohang) {
        if (a.getProduct().getProductId() == id) {
          s = a;
        }
      }
      if (s != null)//đã có cuốn sách đó trong giỏ hàng
      {
        s.setQuantity(s.getQuantity() + 1);//tăng số lượng lên 1
      } else//chưa có
      {
        giohang.add(new CartItem(productService.getProductById(id), 1, productService.getProductById(id).getProductPrice()));
      }
    }
    session.setAttribute("giohang", giohang);
    Object ItemAmount = giohang.size() ;
    return ItemAmount;
  }
}
