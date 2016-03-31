package abrs.system.web.mobile.form;

import abrs.system.dao.Entity.AutumnFoodExpecPro;
import abrs.system.dao.Entity.ExpectedProductionItem;

/**
 * Created by Edifi_000 on 2016-03-31.
 */
public class AutumnFoodExpecProForm {

    private AutumnFoodExpecPro autumnFoodExpecPro =new AutumnFoodExpecPro();
    private ExpectedProductionItem food_item = new ExpectedProductionItem(); //秋粮(ItemID)
    private ExpectedProductionItem food_zhongdaoyijidao_item = new ExpectedProductionItem();//其中：中稻及一季稻
    private ExpectedProductionItem food_shuangjiwandao_item = new ExpectedProductionItem();//双季晚稻
    private ExpectedProductionItem food_yumi_item = new ExpectedProductionItem();//玉米
    private ExpectedProductionItem food_dadou_item = new ExpectedProductionItem();//大豆

    private ExpectedProductionItem rapeseed_item = new ExpectedProductionItem();//油料
    private ExpectedProductionItem rapeseed_huasheng_item = new ExpectedProductionItem();//其中：花生

    private ExpectedProductionItem cotton_item = new ExpectedProductionItem();//棉花

    private ExpectedProductionItem sugar_item = new ExpectedProductionItem();//糖料（甘蔗）

    public AutumnFoodExpecPro getAutumnFoodExpecPro() {
        return autumnFoodExpecPro;
    }

    public void setAutumnFoodExpecPro(AutumnFoodExpecPro autumnFoodExpecPro) {
        this.autumnFoodExpecPro = autumnFoodExpecPro;
    }

    public ExpectedProductionItem getFood_item() {
        return food_item;
    }

    public void setFood_item(ExpectedProductionItem food_item) {
        this.food_item = food_item;
    }

    public ExpectedProductionItem getFood_zhongdaoyijidao_item() {
        return food_zhongdaoyijidao_item;
    }

    public void setFood_zhongdaoyijidao_item(ExpectedProductionItem food_zhongdaoyijidao_item) {
        this.food_zhongdaoyijidao_item = food_zhongdaoyijidao_item;
    }

    public ExpectedProductionItem getFood_shuangjiwandao_item() {
        return food_shuangjiwandao_item;
    }

    public void setFood_shuangjiwandao_item(ExpectedProductionItem food_shuangjiwandao_item) {
        this.food_shuangjiwandao_item = food_shuangjiwandao_item;
    }

    public ExpectedProductionItem getFood_yumi_item() {
        return food_yumi_item;
    }

    public void setFood_yumi_item(ExpectedProductionItem food_yumi_item) {
        this.food_yumi_item = food_yumi_item;
    }

    public ExpectedProductionItem getFood_dadou_item() {
        return food_dadou_item;
    }

    public void setFood_dadou_item(ExpectedProductionItem food_dadou_item) {
        this.food_dadou_item = food_dadou_item;
    }

    public ExpectedProductionItem getRapeseed_item() {
        return rapeseed_item;
    }

    public void setRapeseed_item(ExpectedProductionItem rapeseed_item) {
        this.rapeseed_item = rapeseed_item;
    }

    public ExpectedProductionItem getRapeseed_huasheng_item() {
        return rapeseed_huasheng_item;
    }

    public void setRapeseed_huasheng_item(ExpectedProductionItem rapeseed_huasheng_item) {
        this.rapeseed_huasheng_item = rapeseed_huasheng_item;
    }

    public ExpectedProductionItem getCotton_item() {
        return cotton_item;
    }

    public void setCotton_item(ExpectedProductionItem cotton_item) {
        this.cotton_item = cotton_item;
    }

    public ExpectedProductionItem getSugar_item() {
        return sugar_item;
    }

    public void setSugar_item(ExpectedProductionItem sugar_item) {
        this.sugar_item = sugar_item;
    }
}
