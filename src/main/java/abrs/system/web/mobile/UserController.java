package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.SummerFoodAndRapeseedExpecPro;
import abrs.system.dao.Entity.User;
import abrs.system.service.UserService;
import abrs.system.web.mobile.form.SummerFoodAndRapeseedExpecProForm;
import abrs.system.web.mobile.form.UserForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Role;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rc452 on 2016/4/14.
 */

@Controller
@RequestMapping(value = "/mobile/user")
public class UserController {

    @Autowired
    UserService userService;

    private static Logger logger = LoggerFactory.getLogger(UserController.class);

    @Auth(role = Auth.Role.SUPERADMIN)
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(ModelMap modelMap){
        modelMap.addAttribute("UserForm",new UserForm());
        return "mobile/user_add";
    }

    @Auth(role = Auth.Role.SUPERADMIN)
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object add(@Valid @ModelAttribute("UserForm") UserForm form, Errors errors, ModelMap model){
        Map<String,Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()) {
            map.put("message", errors.getFieldError().getDefaultMessage());
        }else {
            User user = form.GetUser();
            user.setRole(Auth.Role.ADMIN.name());
            userService.addItem(user);
            map.put("message", "添加成功");
        }
        return map;
    }

    @Auth(role = Auth.Role.SUPERADMIN)
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(@RequestParam(value = "index",defaultValue = "1") int index ,@RequestParam(value = "size",defaultValue = "20") int size, ModelMap modelMap){
        List<User> list = userService.getItems((index-1)*size,size);
        long count = userService.getCount();
        modelMap.addAttribute("list",list);
        modelMap.addAttribute("count",count);
        modelMap.addAttribute("index",index);
        modelMap.addAttribute("size",size);
        modelMap.addAttribute("countpage",Math.floor(count/size));
        return "mobile/user_list";
    }

    @Auth(role = Auth.Role.SUPERADMIN)
    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String edit(@RequestParam(value = "id") String id,ModelMap modelMap){
        User user = userService.getItem(id);
        user.setPassword("");
        modelMap.addAttribute("UserForm",UserForm.GetUserForm(user));
        return "mobile/user_edit";
    }

    @Auth(role = Auth.Role.SUPERADMIN)
    @ResponseBody
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public Object edit(@Valid @ModelAttribute("UserForm") UserForm form, Errors errors, ModelMap model){
        Map<String,Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()) {
            map.put("message", errors.getFieldError().getDefaultMessage());
        }else {
            User user = form.GetUser();
            userService.update(user);
            map.put("message", "修改成功");
        }
        return map;
    }

    @Auth(role = Auth.Role.SUPERADMIN)
    @ResponseBody
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public Object Delete(@RequestParam("id") String id){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            User user =  userService.getItem(id);
            userService.remove(id);
            map.put("message", "删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }
    @Auth(role = Auth.Role.SUPERADMIN)
    @ResponseBody
    @RequestMapping(value = "/deleteMulit",method = RequestMethod.POST)
    public Object DeleteMulit(@RequestParam("ids[]") String[] ids){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            userService.removeMulit(ids);
            map.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }
}
