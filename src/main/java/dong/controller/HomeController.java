package dong.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home() {
        return "home";
    }

    @RequestMapping("/about")
    public String about() {
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

        return "login";
    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response){
        Authentication authenticator = SecurityContextHolder.getContext().getAuthentication();
        if (authenticator != null){
            new SecurityContextLogoutHandler().logout(request,response,authenticator);
        }
        return "redirect:/login";
    }
}
