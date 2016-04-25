package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.ExpectedProductionItem;
import abrs.system.dao.Entity.AutumnFoodExpecPro;
import abrs.system.dao.Entity.Farmer;
import abrs.system.service.ExpectedProductionItemService;
import abrs.system.service.AutumnFoodExpecProService;
import abrs.system.web.mobile.excel.*;
import abrs.system.web.mobile.form.AutumnFoodExpecProForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Edifi_000 on 2016-03-31.
 */
@Controller
@RequestMapping("/mobile/autumnFoodExpecPro")
public class AutumnFoodExpecProMobileController {

    private static Logger logger = LoggerFactory.getLogger(AutumnFoodExpecProMobileController.class);

    @Autowired
    AutumnFoodExpecProService service;

    @Autowired
    ExpectedProductionItemService itemService;

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String Add(ModelMap modelMap){
        modelMap.addAttribute("AutumnFoodExpecProForm",new AutumnFoodExpecProForm());
        return "mobile/autumn_food_expec_pro_add";
    }

    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object Add(@Valid @ModelAttribute("AutumnFoodExpecProForm") AutumnFoodExpecProForm form, Errors errors, ModelMap model){
        Map<String, Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()) {
            map.put("message", errors.getFieldError().getDefaultMessage());
        }else{
            try {
                AutumnFoodExpecPro autumnFoodExpecPro = form.getAutumnFoodExpecPro();

                ExpectedProductionItem food_item = form.getFood_item(); //秋粮(ItemID)
                ExpectedProductionItem food_zhongdaoyijidao_item = form.getFood_zhongdaoyijidao_item();//其中：中稻及一季稻
                ExpectedProductionItem food_shuangjiwandao_item = form.getFood_shuangjiwandao_item();//双季晚稻
                ExpectedProductionItem food_yumi_item = form.getFood_yumi_item();//玉米
                ExpectedProductionItem food_dadou_item = form.getFood_dadou_item();//大豆

                ExpectedProductionItem rapeseed_item = form.getRapeseed_item();//油料
                ExpectedProductionItem rapeseed_huasheng_item = form.getRapeseed_huasheng_item();//其中：花生

                ExpectedProductionItem cotton_item = form.getCotton_item();//棉花

                ExpectedProductionItem sugar_item = form.getSugar_item();//糖料（甘蔗）

                //TODO 需要进行单亩计算后再进行添加
                food_item.RefreshData();
                food_zhongdaoyijidao_item.RefreshData();
                food_shuangjiwandao_item.RefreshData();
                food_yumi_item.RefreshData();
                food_dadou_item.RefreshData();

                rapeseed_item.RefreshData();
                rapeseed_huasheng_item.RefreshData();

                cotton_item.RefreshData();

                sugar_item.RefreshData();

                autumnFoodExpecPro.setFood_itemid(itemService.addItem(food_item));
                autumnFoodExpecPro.setFood_zhongdaoyijidao_itemid(itemService.addItem(food_zhongdaoyijidao_item));
                autumnFoodExpecPro.setFood_shuangjiwandao_itemid(itemService.addItem(food_shuangjiwandao_item));
                autumnFoodExpecPro.setFood_yumi_itemid(itemService.addItem(food_yumi_item));
                autumnFoodExpecPro.setFood_dadou_itemid(itemService.addItem(food_dadou_item));

                autumnFoodExpecPro.setRapeseed_itemid(itemService.addItem(rapeseed_item));
                autumnFoodExpecPro.setRapeseed_huasheng_itemid(itemService.addItem(rapeseed_huasheng_item));

                autumnFoodExpecPro.setCotton_itemid(itemService.addItem(cotton_item));

                autumnFoodExpecPro.setSugar_itemid(itemService.addItem(sugar_item));

                service.addItem(autumnFoodExpecPro);
                map.put("message","添加成功");
            }catch (Exception e){
                e.printStackTrace();
                map.put("message", e.getMessage());
            }
        }
        return map;
    }

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String List(@RequestParam(value = "index",defaultValue = "1") int index ,@RequestParam(value = "size",defaultValue = "20") int size, ModelMap modelMap){
        List<AutumnFoodExpecPro> list = service.getItems((index-1)*size,size);
        long count = service.getCount();
        modelMap.addAttribute("list",list);
        modelMap.addAttribute("count",count);
        modelMap.addAttribute("index",index);
        modelMap.addAttribute("size",size);
        modelMap.addAttribute("countpage",Math.floor(count/size));

        return "mobile/autumn_food_expec_pro_list";
    }

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String Edit(@RequestParam(value = "id") String id,ModelMap modelMap){

        AutumnFoodExpecPro entity =  service.getItem(id);
        ExpectedProductionItem food_item = itemService.getItem(entity.getFood_itemid()); //秋粮(ItemID)
        ExpectedProductionItem food_zhongdaoyijidao_item = itemService.getItem(entity.getFood_zhongdaoyijidao_itemid());//其中：中稻及一季稻
        ExpectedProductionItem food_shuangjiwandao_item = itemService.getItem(entity.getFood_shuangjiwandao_itemid());//双季晚稻
        ExpectedProductionItem food_yumi_item = itemService.getItem(entity.getFood_yumi_itemid());//玉米
        ExpectedProductionItem food_dadou_item = itemService.getItem(entity.getFood_dadou_itemid());//大豆

        ExpectedProductionItem rapeseed_item = itemService.getItem(entity.getRapeseed_itemid());//油料
        ExpectedProductionItem rapeseed_huasheng_item = itemService.getItem(entity.getRapeseed_huasheng_itemid());//其中：花生

        ExpectedProductionItem cotton_item = itemService.getItem(entity.getCotton_itemid());//棉花

        ExpectedProductionItem sugar_item = itemService.getItem(entity.getSugar_itemid());//糖料（甘蔗）

        AutumnFoodExpecProForm form = new AutumnFoodExpecProForm();
        form.setAutumnFoodExpecPro(entity);
        form.setFood_item(food_item);
        form.setFood_zhongdaoyijidao_item(food_zhongdaoyijidao_item);
        form.setFood_shuangjiwandao_item(food_shuangjiwandao_item);
        form.setFood_yumi_item(food_yumi_item);
        form.setFood_dadou_item(food_dadou_item);

        form.setRapeseed_item(rapeseed_item);
        form.setRapeseed_huasheng_item(rapeseed_huasheng_item);

        form.setCotton_item(cotton_item);

        form.setSugar_item(sugar_item);
        try {
            modelMap.addAttribute("AutumnFoodExpecProForm",form);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "mobile/autumn_food_expec_pro_edit";
    }

    @ResponseBody
    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public Object Edit(@Valid @ModelAttribute("AutumnFoodExpecProForm") AutumnFoodExpecProForm form, Errors errors, ModelMap model){
        Map<String,Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()){
            map.put("message",errors.getFieldError().getDefaultMessage());
        }
        try {
            AutumnFoodExpecPro autumnFoodExpecPro = form.getAutumnFoodExpecPro();
            ExpectedProductionItem food_item = form.getFood_item(); //秋粮(ItemID)
            ExpectedProductionItem food_zhongdaoyijidao_item = form.getFood_zhongdaoyijidao_item();//其中：中稻及一季稻
            ExpectedProductionItem food_shuangjiwandao_item = form.getFood_shuangjiwandao_item();//双季晚稻
            ExpectedProductionItem food_yumi_item = form.getFood_yumi_item();//玉米
            ExpectedProductionItem food_dadou_item = form.getFood_dadou_item();//大豆

            ExpectedProductionItem rapeseed_item = form.getRapeseed_item();//油料
            ExpectedProductionItem rapeseed_huasheng_item = form.getRapeseed_huasheng_item();//其中：花生

            ExpectedProductionItem cotton_item = form.getCotton_item();//棉花

            ExpectedProductionItem sugar_item = form.getSugar_item();//糖料（甘蔗）

            //TODO 需要进行单亩计算后再进行添加
            food_item.RefreshData();
            food_zhongdaoyijidao_item.RefreshData();
            food_shuangjiwandao_item.RefreshData();
            food_yumi_item.RefreshData();
            food_dadou_item.RefreshData();

            rapeseed_item.RefreshData();
            rapeseed_huasheng_item.RefreshData();

            cotton_item.RefreshData();

            sugar_item.RefreshData();

            service.updateItem(autumnFoodExpecPro);
            itemService.updateItem(food_item);
            itemService.updateItem(food_zhongdaoyijidao_item);
            itemService.updateItem(food_shuangjiwandao_item);
            itemService.updateItem(food_yumi_item);
            itemService.updateItem(food_dadou_item);

            itemService.updateItem(rapeseed_item);
            itemService.updateItem(rapeseed_huasheng_item);

            itemService.updateItem(cotton_item);

            itemService.updateItem(sugar_item);

            map.put("message","修改成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }

    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public Object Delete(@RequestParam("id") String id){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            AutumnFoodExpecPro entity =  service.getItem(id);

            service.remove(id);
            itemService.remove(entity.getFood_itemid()); //秋粮(ItemID)
            itemService.remove(entity.getFood_zhongdaoyijidao_itemid());//其中：中稻及一季稻
            itemService.remove(entity.getFood_shuangjiwandao_itemid());//双季晚稻
            itemService.remove(entity.getFood_yumi_itemid());//玉米
            itemService.remove(entity.getFood_dadou_itemid());//大豆

            itemService.remove(entity.getRapeseed_itemid());//油料
            itemService.remove(entity.getRapeseed_huasheng_itemid());//其中：花生

            itemService.remove(entity.getCotton_itemid());//棉花

            itemService.remove(entity.getSugar_itemid());//糖料（甘蔗）

            map.put("message", "删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }
    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "/deleteMulit",method = RequestMethod.POST)
    public Object DeleteMulit(@RequestParam("ids[]") String[] ids){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            for(int i=0;i<ids.length;i++)
            {
                String id = ids[i];
                AutumnFoodExpecPro entity =  service.getItem(id);
                service.remove(id);
                itemService.remove(entity.getFood_itemid()); //秋粮(ItemID)
                itemService.remove(entity.getFood_zhongdaoyijidao_itemid());//其中：中稻及一季稻
                itemService.remove(entity.getFood_shuangjiwandao_itemid());//双季晚稻
                itemService.remove(entity.getFood_yumi_itemid());//玉米
                itemService.remove(entity.getFood_dadou_itemid());//大豆

                itemService.remove(entity.getRapeseed_itemid());//油料
                itemService.remove(entity.getRapeseed_huasheng_itemid());//其中：花生

                itemService.remove(entity.getCotton_itemid());//棉花

                itemService.remove(entity.getSugar_itemid());//糖料（甘蔗）
            }
            //service.removeMulit(ids);
            map.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/export",method = RequestMethod.GET)
    public String Export(HttpServletRequest request,HttpServletResponse response){

        //DemoData
//        AutumnFoodExpecProExport needExport = new AutumnFoodExpecProExport();
//        needExport.setRealPath(request.getRealPath("mobile/exceltemplate"));
//        needExport.setIncreaseType(0);
//        needExport.setIncreaseCount(10);
//
//        needExport.getAutumnFoodExpecPro().setId("888");
//        needExport.getAutumnFoodExpecPro().setSurvey_village_num(5);
//        needExport.getAutumnFoodExpecPro().setSurvey_family_num(10);
//        needExport.getFood_item().setSeededarea_lastyear(100.0);
//        needExport.getFood_item().setSeededarea_thisyear(180.0);
//        needExport.getFood_item().setTotal_lastyear(130.0);
//        needExport.getFood_item().setTotal_thisyear(260.0);

//        AutumnWinterPlantsIntentionExport needExport = new AutumnWinterPlantsIntentionExport();
//        needExport.setRealPath(request.getRealPath("mobile/exceltemplate"));
//        needExport.setIncreaseType(2);
//        needExport.setIncreaseCount(5);
//        List<AutumnWinterPlantsIntention> list = new ArrayList<AutumnWinterPlantsIntention>();
//        for(int i = 0;i<5;i++)
//        {
//            AutumnWinterPlantsIntention aa= new AutumnWinterPlantsIntention();
//            aa.setFarmer_id(i+"");
//            list.add(aa);
//        }
//        final int size =  list.size();
//        AutumnWinterPlantsIntention[] asd = list.toArray(new AutumnWinterPlantsIntention[size]);
//        needExport.setList_AutumnFoodExpecPro(asd);

        FarmerExport needExport = new FarmerExport();
        needExport.setRealPath(request.getRealPath("mobile/exceltemplate"));
        needExport.setIncreaseType(1);
        needExport.setIncreaseCount(5);
        List<Farmer> list = new ArrayList<Farmer>();
        for(int i = 0;i<5;i++)
        {
            Farmer aa= new Farmer();
            aa.setNo(i);
            aa.setName(i+""+i);
            aa.setAge(i + 1);
            list.add(aa);
        }
        final int size =  list.size();
        Farmer[] asd = list.toArray(new Farmer[size]);
        needExport.setList_Farmer(asd);

        try{
            byte[] content = needExport.Export();
            ResponseUtils.MakeDownLoadFile(content,response,needExport.getTemplateFileName());
            return null;
        }
        catch (Exception ex){
            System.out.print(ex.toString());
        }

        return null;
    }
}
