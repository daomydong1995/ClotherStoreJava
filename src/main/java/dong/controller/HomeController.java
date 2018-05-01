package dong.controller;

import dong.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    @Autowired
    private ProductService productService;

    @RequestMapping("/")
    public String home(Model model) {
        model.addAttribute("ProductsMen",productService.findAll(0,8));
        model.addAttribute("ProductsWomen",productService.findAll(0,8));
        model.addAttribute("ProductsBag",productService.findAll(0,8));
        model.addAttribute("ProductsFootwear",productService.findAll(0,8));
        return "home";
    }

    @RequestMapping("/about")
    public String about(Model model) {
        return "about";
    }

    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required = false) String error,
                        @RequestParam(value="logout", required = false) String logout, Model model
    ) {

        if(error != null) {
            model.addAttribute("error", "Invalid username and password!");
        }

        if(logout!= null) {
            model.addAttribute("msg", "You have been logged out successfully.");
        }
        return  "home";
    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response,Model model){
        Authentication authenticator = SecurityContextHolder.getContext().getAuthentication();
        if (authenticator != null){
            new SecurityContextLogoutHandler().logout(request,response,authenticator);
        }
        return "redirect:";
    }
}
