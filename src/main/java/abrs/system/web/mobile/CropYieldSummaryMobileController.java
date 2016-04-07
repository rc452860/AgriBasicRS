package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.CropYieldSummary;
import abrs.system.dao.Entity.ExpectedProductionItem;
import abrs.system.service.CropYieldSummaryService;
import abrs.system.service.ExpectedProductionItemService;
import abrs.system.web.mobile.form.CropYieldSummaryForm;
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
 * Created by EdifierWill on 2016/4/4.
 */
@Controller
@RequestMapping("/mobile/cropYieldSummary")
public class CropYieldSummaryMobileController {

    private static Logger logger = LoggerFactory.getLogger(CropYieldSummaryMobileController.class);

    @Autowired
    CropYieldSummaryService service;

    @Autowired
    ExpectedProductionItemService itemService;

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String Add(ModelMap modelMap){
        CropYieldSummaryForm form = new CropYieldSummaryForm();
        for(int i = 0;i<15;i++)
        {
            form.getList_item()[i] = new ExpectedProductionItem();
        }
        modelMap.addAttribute("CropYieldSummaryForm",form);
        return "mobile/crop_yield_summary_add";
    }

    @Auth(role = Auth.Role.ADMIN)
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object Add(@Valid @ModelAttribute("CropYieldSummaryForm") CropYieldSummaryForm form, Errors errors, ModelMap model){
        Map<String, Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()) {
            map.put("message", errors.getFieldError().getDefaultMessage());
        }else{
            try {
                CropYieldSummary entity = form.getCropYieldSummary();

                entity.setTotal_of_fifteen_itemid(itemService.addItem(form.getTotal_of_fifteen_item()));
                entity.setSimple_average_itemid(itemService.addItem(form.getSimple_average_item()));
                ExpectedProductionItem[] list_item = form.getList_item();
                List<String> list_itemid = new ArrayList<String>();
                for (int i = 0;i<list_item.length;i++)
                {
                    list_itemid.add(itemService.addItem(list_item[i]));
                }
                entity.setList_itemid(list_itemid);

                service.addItem(entity);
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
    public String List(@RequestParam(value = "index",defaultValue = "1") int index ,@RequestParam(value = "size",defaultValue = "20") int size, ModelMap modelMap){
        List<CropYieldSummary> list = service.getItems((index-1)*size,size);
        long count = service.getCount();
        modelMap.addAttribute("list",list);
        modelMap.addAttribute("count",count);
        modelMap.addAttribute("index",index);
        modelMap.addAttribute("size",size);
        modelMap.addAttribute("countpage",Math.floor(count/size));

        return "mobile/crop_yield_summary_list";
    }

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String Edit(@RequestParam(value = "id") String id,ModelMap modelMap){

        CropYieldSummaryForm form = new CropYieldSummaryForm();

        CropYieldSummary entity =  service.getItem(id);
        ExpectedProductionItem total_of_fifteen_item = itemService.getItem(entity.getTotal_of_fifteen_itemid());
        ExpectedProductionItem simple_average_itemid = itemService.getItem(entity.getSimple_average_itemid());
        ExpectedProductionItem[] list_item = new ExpectedProductionItem[15];
        for (int i = 0;i<15;i++)
        {
            list_item[i] = itemService.getItem(entity.getList_itemid().get(i));
        }

        form.setCropYieldSummary(entity);
        form.setTotal_of_fifteen_item(total_of_fifteen_item);
        form.setSimple_average_item(simple_average_itemid);
        form.setList_item(list_item);

        try {
            modelMap.addAttribute("CropYieldSummaryForm", form);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "mobile/crop_yield_summary_edit";
    }

    @ResponseBody
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public Object Edit(@Valid @ModelAttribute("CropYieldSummaryForm") CropYieldSummaryForm form, Errors errors, ModelMap model){
        Map<String,Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()){
            map.put("message",errors.getFieldError().getDefaultMessage());
        }
        try {
            CropYieldSummary entity = form.getCropYieldSummary();
            ExpectedProductionItem total_of_fifteen_item = form.getTotal_of_fifteen_item();
            ExpectedProductionItem simple_average_item = form.getSimple_average_item();

            service.updateItem(entity);
            itemService.updateItem(total_of_fifteen_item);
            itemService.updateItem(simple_average_item);
            for(int z=0;z<form.getList_item().length;z++)
            {
                itemService.updateItem(form.getList_item()[z]);
            }

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
    public Object Delete(@RequestParam("id") String id){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            CropYieldSummary entity =  service.getItem(id);
            service.remove(id);
            itemService.remove(entity.getTotal_of_fifteen_itemid());
            itemService.remove(entity.getSimple_average_itemid());
            for(int z=0;z<entity.getList_itemid().size();z++)
            {
                itemService.remove(entity.getList_itemid().get(z));
            }
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
    public Object DeleteMulit(@RequestParam("ids[]") String[] ids){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            //service.removeMulit(ids);
            for(int i=0;i<ids.length;i++) {
                String id = ids[i];
                CropYieldSummary entity =  service.getItem(id);
                service.remove(id);
                itemService.remove(entity.getTotal_of_fifteen_itemid());
                itemService.remove(entity.getSimple_average_itemid());
                for(int z=0;z<entity.getList_itemid().size();z++)
                {
                    itemService.remove(entity.getList_itemid().get(z));
                }
            }
            map.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }
}
