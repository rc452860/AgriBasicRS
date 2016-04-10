package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.service.UserService;
import abrs.system.web.mobile.form.LoginForm;
import abrs.system.dao.Entity.User;
import abrs.system.web.context.SessionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/mobile")
public class IndexMobileController {
    private static Logger logger = LoggerFactory.getLogger(IndexMobileController.class);

    @Autowired
    private UserService userService;
    @Autowired
    private HttpSession session;

    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap model) {
        return "redirect:/mobile/login";
    }

    @RequestMapping(value = "/{error}",method = RequestMethod.GET)
    public String error(@PathVariable int error,ModelMap model) {
        model.addAttribute("error",error);
        return "mobile/error";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model) {
        model.addAttribute("LoginForm", new LoginForm());
        return "mobile/login";
    }

    @RequestMapping(value = "/install", method = RequestMethod.GET)
    public String install(ModelMap model) {
        userService.addItem("admin", "admin", "管理员", Auth.Role.ADMIN,
                "edifierwill@163.com","");
        model.addAttribute("LoginForm", new LoginForm());
        return "mobile/login";
    }

    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Map<String, Object> login(@Valid @ModelAttribute("LoginForm") LoginForm form, Errors errors, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()) {
            map.put("message", errors.getFieldError().getDefaultMessage());
        } else {
            try {
                User user = userService.getItem(form.getUsername(), form.getPassword());
                if (user != null) {
                    session.setAttribute(SessionContext.CURRENT_USER, user);
                    session.setAttribute(SessionContext.CURRENT_USER_ROLE, userService.getUserRole(user.getId()));
                    map.put("url", "/mobile/admin");
                } else {
                    map.put("message", "用户名或密码不正确");
                }
            }catch (Exception e){
                e.printStackTrace();
                map.put("message", e.getMessage());
            }
        }
        return map;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(ModelMap model) {
        session.removeAttribute(SessionContext.CURRENT_USER);
        return "redirect:/mobile/";
    }
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(){
        return "mobile/admin";
    }
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/left", method = RequestMethod.GET)
    public String left(){
        return "mobile/left";
    }

    @RequestMapping(value = "/footer", method = RequestMethod.GET)
    public String footer(){
        return "mobile/footer";
    }

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(){
        return "mobile/index";
    }
    @RequestMapping(value = "/top", method = RequestMethod.GET)
    public String top(){
        return "mobile/top";
    }

}