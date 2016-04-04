package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.ProductsAndMeansMarketPrice;
import abrs.system.service.ProductsAndMeansMarketPriceService;
import abrs.system.web.mobile.form.ProductsAndMeansMarketPriceForm;
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
 * Created by EdifierWill on 2016/4/4.
 */
@Controller
@RequestMapping("/mobile/productsAndMeansMarketPrice")
public class ProductsAndMeansMarketPriceMobileController {

    private static Logger logger = LoggerFactory.getLogger(ProductsAndMeansMarketPriceMobileController.class);

    @Autowired
    ProductsAndMeansMarketPriceService service;

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String Add(ModelMap modelMap){
        modelMap.addAttribute("ProductsAndMeansMarketPriceForm",new ProductsAndMeansMarketPriceForm());
        return "mobile/products_and_means_market_price_add";
    }

    @Auth(role = Auth.Role.ADMIN)
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object Add(@Valid @ModelAttribute("ProductsAndMeansMarketPriceForm") ProductsAndMeansMarketPriceForm form, Errors errors, ModelMap model){
        Map<String, Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()) {
            map.put("message", errors.getFieldError().getDefaultMessage());
        }else{
            try {
                ProductsAndMeansMarketPrice costBenefitOfPig = form.getProductsAndMeansMarketPrice();

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
        List<ProductsAndMeansMarketPrice> list = service.getItems((index-1)*size,size);
        long count = service.getCount();
        modelMap.addAttribute("list",list);
        modelMap.addAttribute("count",count);
        modelMap.addAttribute("index",index);
        modelMap.addAttribute("size",size);
        modelMap.addAttribute("countpage",Math.floor(count/size));

        return "mobile/products_and_means_market_price_list";
    }

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String Edit(@RequestParam(value = "id") String id,ModelMap modelMap){

        ProductsAndMeansMarketPriceForm form = new ProductsAndMeansMarketPriceForm();
        form.setProductsAndMeansMarketPrice(service.getItem(id));
        try {
            modelMap.addAttribute("ProductsAndMeansMarketPriceForm", form);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "mobile/products_and_means_market_price_edit";
    }

    @ResponseBody
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public Object Edit(@Valid @ModelAttribute("ProductsAndMeansMarketPriceForm") ProductsAndMeansMarketPriceForm form, Errors errors, ModelMap model){
        Map<String,Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()){
            map.put("message",errors.getFieldError().getDefaultMessage());
        }
        try {
            ProductsAndMeansMarketPrice productsAndMeansMarketPrice = form.getProductsAndMeansMarketPrice();

            service.updateItem(productsAndMeansMarketPrice);

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
