package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.ProductsAndMeansFarmerPrice;
import abrs.system.service.ProductsAndMeansFarmerPriceService;
import abrs.system.web.mobile.form.ProductsAndMeansFarmerPriceForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by EdifierWill on 2016/4/3.
 */
@Controller
@RequestMapping("/mobile/productsAndMeansFarmerPrice")
public class ProductsAndMeansFarmerPriceMobileController {

    private static Logger logger = LoggerFactory.getLogger(ProductsAndMeansFarmerPriceMobileController.class);

    @Autowired
    ProductsAndMeansFarmerPriceService service;

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String Add(ModelMap modelMap){
        modelMap.addAttribute("ProductsAndMeansFarmerPriceForm",new ProductsAndMeansFarmerPriceForm());
        return "mobile/products_and_means_farmer_price_add";
    }

    @Auth(role = Auth.Role.ADMIN)
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object Add(@Valid @ModelAttribute("ProductsAndMeansFarmerPriceForm") ProductsAndMeansFarmerPriceForm form, Errors errors, ModelMap model){
        Map<String, Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()) {
            map.put("message", errors.getFieldError().getDefaultMessage());
        }else{
            try {
                ProductsAndMeansFarmerPrice costBenefitOfPig = form.getProductsAndMeansFarmerPrice();

                service.addItem(costBenefitOfPig);
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
        List<ProductsAndMeansFarmerPrice> list = service.getItems((index-1)*size,size);
        long count = service.getCount();
        modelMap.addAttribute("list",list);
        modelMap.addAttribute("count",count);
        modelMap.addAttribute("index",index);
        modelMap.addAttribute("size",size);
        modelMap.addAttribute("countpage",Math.floor(count/size));

        return "mobile/products_and_means_farmer_price_list";
    }

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String Edit(@RequestParam(value = "id") String id,ModelMap modelMap){

        ProductsAndMeansFarmerPriceForm form = new ProductsAndMeansFarmerPriceForm();
        form.setProductsAndMeansFarmerPrice(service.getItem(id));
        try {
            modelMap.addAttribute("ProductsAndMeansFarmerPriceForm",form);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "mobile/products_and_means_farmer_price_edit";
    }

    @ResponseBody
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public Object Edit(@Valid @ModelAttribute("ProductsAndMeansFarmerPriceForm") ProductsAndMeansFarmerPriceForm form, Errors errors, ModelMap model){
        Map<String,Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()){
            map.put("message",errors.getFieldError().getDefaultMessage());
        }
        try {
            ProductsAndMeansFarmerPrice productsAndMeansFarmerPrice = form.getProductsAndMeansFarmerPrice();

            service.updateItem(productsAndMeansFarmerPrice);

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
            service.remove(id);
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
            service.removeMulit(ids);
            map.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }
}
