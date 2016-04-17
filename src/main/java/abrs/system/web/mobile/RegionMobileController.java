package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.Region;
import abrs.system.service.RegionService;
import abrs.system.web.mobile.form.RegionForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Edifi_000 on 2016-03-29.
 */
@Controller
@RequestMapping("/mobile/region")
public class RegionMobileController {

    private static Logger logger = LoggerFactory.getLogger(RegionMobileController.class);

    @Autowired
    RegionService regionService;

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String regionAdd(ModelMap modelMap){
        modelMap.addAttribute("RegionForm",new RegionForm());
        return "mobile/region_add";
    }

    @Auth(role = Auth.Role.ADMIN)
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object regionAdd(@Valid @ModelAttribute("RegionForm") RegionForm form, Errors errors, ModelMap model){
        Map<String, Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()) {
            map.put("message", errors.getFieldError().getDefaultMessage());
        }else{
            try {
                regionService.addItem(form.getRegion());
                map.put("message","添加成功");
            }catch (Exception e){
                e.printStackTrace();
                map.put("message", e.getMessage());
            }
        }
        return map;
    }

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String regionList(@RequestParam(value = "index",defaultValue = "1") int index ,@RequestParam(value = "size",defaultValue = "20") int size, ModelMap modelMap){
        List<Region> list = regionService.getItems((index-1)*size,size);
        long count = regionService.getCount();
        modelMap.addAttribute("list",list);
        modelMap.addAttribute("count",count);
        modelMap.addAttribute("index",index);
        modelMap.addAttribute("size",size);
        modelMap.addAttribute("countpage",Math.floor(count/size));

        return "mobile/region_list";
    }

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String farmerEdit(@RequestParam(value = "id") String id,ModelMap modelMap){
        Region region =  regionService.getItem(id);
        try {
            modelMap.addAttribute("RegionForm",RegionForm.RegionToForm(region));
        }catch (Exception e){
            e.printStackTrace();
        }
        return "mobile/region_edit";
    }

    @ResponseBody
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public Object farmerEdit(@Valid @ModelAttribute("RegionForm") RegionForm form, Errors errors, ModelMap model){
        Map<String,Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()){
            map.put("message",errors.getFieldError().getDefaultMessage());
        }
        try {
            Region region = form.getRegion();
            regionService.updateItem(region);
            map.put("message","修改成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }

    @Auth(role = Auth.Role.ADMIN)
    @ResponseBody
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public Object farmerDelete(@RequestParam("id") String id){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            regionService.remove(id);
            map.put("message", "删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }
    @Auth(role = Auth.Role.ADMIN)
    @ResponseBody
    @RequestMapping(value = "/deleteMulit",method = RequestMethod.POST)
    public Object farmerDeleteMulit(@RequestParam("ids[]") String[] ids){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            regionService.removeMulit(ids);
            map.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }
    //@Auth(role = Auth.Role.ADMIN)
    @ResponseBody
    @RequestMapping(value = "/getRoot",method = RequestMethod.GET)
    public Object getRoot(){
        List<Region> list = regionService.getRoot();
        List<Object> result = new ArrayList<Object>();
        for(final Region item : list){
            result.add(new Object(){
                String id;
                String text;
                String state;
                List<Object> children;
                {
                    id = item.getNo();
                    text = item.getName();
                    state = "closed";
                    children = new ArrayList<Object>();
                }
                public List<Object> getChildren() {
                    return children;
                }

                public void setChildren(List<Object> children) {
                    this.children = children;
                }

                public String getId() {
                    return id;
                }

                public void setId(String id) {
                    this.id = id;
                }

                public String getText() {
                    return text;
                }

                public void setText(String text) {
                    this.text = text;
                }

                public String getState() {
                    return state;
                }

                public void setState(String state) {
                    this.state = state;
                }
            });
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/getChild",method = RequestMethod.GET)
    public Object getChild(@RequestParam("id")String id){
        List<Region> list = regionService.getChild(id);
        List<Object> result = new ArrayList<Object>();
        for(final Region item : list){
            if (item.getNo().equals(id))
                continue;
            result.add(new Object(){
                String id;
                String text;
                String state;
                List<Object> children;
                {
                    id = item.getNo();
                    text = item.getName();
                    state = "closed";
                    children = new ArrayList<Object>();
                }
                public List<Object> getChildren() {
                    return children;
                }

                public void setChildren(List<Object> children) {
                    this.children = children;
                }

                public String getId() {
                    return id;
                }

                public void setId(String id) {
                    this.id = id;
                }

                public String getText() {
                    return text;
                }

                public void setText(String text) {
                    this.text = text;
                }

                public String getState() {
                    return state;
                }

                public void setState(String state) {
                    this.state = state;
                }
            });
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/getRegionByCode",method = RequestMethod.GET)
    public Object getRegionByCode(@RequestParam("code") String code){
        Region region = regionService.getByCode(code);
        return region;
    }

    @ResponseBody
    @RequestMapping(value = "/getRegionParentByCode",method = RequestMethod.GET)
    public Object getRegionParentByCode(@RequestParam("code") String code){
        Region region = regionService.getParent(code);
        return region;
    }
}
