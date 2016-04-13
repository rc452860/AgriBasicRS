package abrs.system.web.mobile.excel;

/**
 * Created by Edifi_000 on 2016-04-10.
 */

import abrs.system.dao.Entity.CropYieldSummary;
import abrs.system.dao.Entity.ExpectedProductionItem;

/**
 * 农作物产量调查汇总表导出实体(农作物产量调查汇总表.xls)
 */
public class CropYieldSummaryExport extends BaseExport {

    private final String TemplateFileName = "农作物产量调查汇总表.xls";

    public String getTemplateFileName()
    {
        return this.TemplateFileName;
    }

    public CropYieldSummary getCropYieldSummary() {
        return cropYieldSummary;
    }

    public void setCropYieldSummary(CropYieldSummary cropYieldSummary) {
        this.cropYieldSummary = cropYieldSummary;
    }

    public ExpectedProductionItem[] getList_item() {
        return list_item;
    }

    public void setList_item(ExpectedProductionItem[] list_item) {
        this.list_item = list_item;
    }

    public ExpectedProductionItem getTotal_of_fifteen_item() {
        return total_of_fifteen_item;
    }

    public void setTotal_of_fifteen_item(ExpectedProductionItem total_of_fifteen_item) {
        this.total_of_fifteen_item = total_of_fifteen_item;
    }

    public ExpectedProductionItem getSimple_average_item() {
        return simple_average_item;
    }

    public void setSimple_average_item(ExpectedProductionItem simple_average_item) {
        this.simple_average_item = simple_average_item;
    }

    private CropYieldSummary cropYieldSummary = new CropYieldSummary();

    private ExpectedProductionItem[]  list_item = new ExpectedProductionItem[15];

    private ExpectedProductionItem total_of_fifteen_item = new ExpectedProductionItem();

    private ExpectedProductionItem simple_average_item = new ExpectedProductionItem();
}
