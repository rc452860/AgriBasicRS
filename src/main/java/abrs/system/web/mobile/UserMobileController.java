package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.service.UserService;
import abrs.system.util.SubSite;
import abrs.system.web.mobile.form.UserForm;
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
@RequestMapping("/mobile/user")
public class UserMobileController {

    private static Logger logger = LoggerFactory.getLogger(UserMobileController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private HttpSession session;

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap model) {
        model.addAttribute("AddUserForm", new UserForm());
        model.addAttribute("sites", SubSite.getMap());
        return "mobile/user_add";
    }

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public String info(ModelMap model) {
//        User user = (User) session.getAttribute(SessionContext.CURRENT_USER);
//        model.addAttribute("user", user);
//        model.addAttribute("money", userService.getMoney(user.getId()));
        return "mobile/user_info";
    }

    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Map<String, Object> doAdd(@Valid @ModelAttribute("AddUserForm") UserForm form, Errors errors, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
//        if (errors.hasErrors()) {
//            map.put("message", errors.getFieldError().getDefaultMessage());
//        } else {
//            try {
//                User user = userService.getItem(form.getUsername(), form.getInstitution());
//                if(user == null) {
//                    boolean result = userService.addItem(form.getUsername(), form.getPassword(), form.getName(),
//                            form.getInstitution(), Auth.Role.NONE, form.getEmail(), form.getPhone(), form.getTeam(),
//                            form.getSchool(), form.getGrade());
//                    if (result) map.put("message", "提交成功");
//                    else map.put("message", "提交失败");
//                } else{
//                    map.put("message", "用户已存在");
//                }
//            } catch (Exception e) {
//                map.put("message", e.getMessage());
//            }
//        }
        return map;
    }

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/list/{start}", method = RequestMethod.GET)
    public String list(@PathVariable int start, ModelMap model) {
        long count = userService.getCount();
        long previous = (start - 20) < 0 ? 0 : (start - 20);
        long next = ((start + 20) > (count - 20) ? (count - 20) : (start + 20));
        next = next < 0 ? 0 : next;
        model.addAttribute("list", userService.getItems(start, 20));
        model.addAttribute("previous", previous);
        model.addAttribute("next", next);
        model.addAttribute("start", start);
        return "mobile/user_list";
    }
}
