package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.Region;
import abrs.system.service.RegionService;
import abrs.system.service.UserService;
import abrs.system.util.Util;
import abrs.system.web.mobile.form.LoginForm;
import abrs.system.dao.Entity.User;
import abrs.system.web.context.SessionContext;
import org.mozilla.universalchardet.UniversalDetector;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.support.ServletContextResource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mobile")
public class IndexMobileController {
    private static Logger logger = LoggerFactory.getLogger(IndexMobileController.class);

    @Autowired
    private UserService userService;
    @Autowired
    private HttpSession session;
    @Autowired
    private RegionService regionService;

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
    public String install(ModelMap model, HttpServletRequest request) {
        try{
            User user = new User();
            user.setName("管理员");
            user.setUsername("admin");
            user.setPassword("admin");
            user.setRegionCode("000000000000000");
            user.setRole(Auth.Role.SUPERADMIN.name());
            userService.addItem(user);
            String root = request.getSession().getServletContext().getRealPath("/");
            File file = new File(root+"\\mobile\\install\\region.txt");
            BufferedReader bufferedReader =new BufferedReader(new InputStreamReader(new FileInputStream(file),Util.GetEncoding(file)),65536);
            String tempLine = null;
            String[] nameAndCode = null;
            List<Region> regions = new ArrayList<Region>();
            while((tempLine = bufferedReader.readLine()) != null){
                nameAndCode  = tempLine.split(",");
                regions.add(new Region(nameAndCode[1],nameAndCode[0]));
                if (regions.size()==5000){
                    regionService.addItems(regions);
                    regions.clear();
                }
            }
            regionService.addItems(regions);
            regions.clear();
            bufferedReader.close();
        }catch (DuplicateKeyException e){
            System.out.println("唯一键索引问题");
        }
        catch (Exception e){
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return "redirect:/mobile/login";
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