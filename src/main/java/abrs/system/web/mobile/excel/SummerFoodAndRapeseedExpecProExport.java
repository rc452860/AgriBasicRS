package abrs.system.web.mobile.excel;

import abrs.system.dao.Entity.ExpectedProductionItem;
import abrs.system.dao.Entity.SummerFoodAndRapeseedExpecPro;

/**
 * Created by Edifi_000 on 2016-04-10.
 */
/**
 * 夏粮、夏收油菜籽产量预计表信息导出实体(农市（基）3-1表、3-2表.xls)
 */
public class SummerFoodAndRapeseedExpecProExport extends BaseExport{

    private final String TemplateFileName = "农市（基）3-1表、3-2表.xls";

    public String getTemplateFileName()
    {
        return this.TemplateFileName;
    }

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

    private SummerFoodAndRapeseedExpecPro summerFoodAndRapeseedExpecPro = new SummerFoodAndRapeseedExpecPro();
    private ExpectedProductionItem food_item = new ExpectedProductionItem();
    private ExpectedProductionItem food_xiaomai_food_item = new ExpectedProductionItem();
    private ExpectedProductionItem rapeseed_food_item = new ExpectedProductionItem();
}
