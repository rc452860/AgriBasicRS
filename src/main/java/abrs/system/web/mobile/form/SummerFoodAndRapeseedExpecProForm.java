package abrs.system.web.mobile.form;

/**
 * Created by Edifi_000 on 2016-03-30.
 */

import abrs.system.dao.Entity.ExpectedProductionItem;
import abrs.system.dao.Entity.SummerFoodAndRapeseedExpecPro;

public class SummerFoodAndRapeseedExpecProForm {

    private SummerFoodAndRapeseedExpecPro summerFoodAndRapeseedExpecPro = new SummerFoodAndRapeseedExpecPro();
    private ExpectedProductionItem food_item = new ExpectedProductionItem();
    private ExpectedProductionItem food_xiaomai_food_item = new ExpectedProductionItem();
    private ExpectedProductionItem rapeseed_food_item = new ExpectedProductionItem();

    public SummerFoodAndRapeseedExpecPro getSummerFoodAndRapeseedExpecPro() {
        return summerFoodAndRapeseedExpecPro;
    }

    public void setSummerFoodAndRapeseedExpecPro(SummerFoodAndRapeseedExpecPro summerFoodAndRapeseedExpecPro) {
        this.summerFoodAndRapeseedExpecPro = summerFoodAndRapeseedExpecPro;
    }

    public ExpectedProductionItem getFood_item() {
        return food_item;
    }

    public void setFood_item(ExpectedProductionItem food_item) {
        this.food_item = food_item;
    }

    public ExpectedProductionItem getFood_xiaomai_food_item() {
        return food_xiaomai_food_item;
    }

    public void setFood_xiaomai_food_item(ExpectedProductionItem food_xiaomai_food_item) {
        this.food_xiaomai_food_item = food_xiaomai_food_item;
    }

    public ExpectedProductionItem getRapeseed_food_item() {
        return rapeseed_food_item;
    }

    public void setRapeseed_food_item(ExpectedProductionItem rapeseed_food_item) {
        this.rapeseed_food_item = rapeseed_food_item;
    }
}
