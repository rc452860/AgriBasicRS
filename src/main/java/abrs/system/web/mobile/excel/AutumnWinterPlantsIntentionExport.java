package abrs.system.web.mobile.excel;

import abrs.system.dao.Entity.AutumnWinterPlantsIntention;

/**
 * Created by Edifi_000 on 2016-04-10.
 */
/**
 * 秋冬作物播种面积意向调查表导出实体(农市（基）2表.xls)
 */
public class AutumnWinterPlantsIntentionExport extends BaseExport {

    private final String TemplateFileName = "农市（基）2表.xls";

    public String getTemplateFileName()
    {
        return this.TemplateFileName;
    }

    public AutumnWinterPlantsIntention[] getList_AutumnWinterPlantsIntention() {
        return list_AutumnWinterPlantsIntention;
    }

    public void setList_AutumnFoodExpecPro(AutumnWinterPlantsIntention[] list_AutumnWinterPlantsIntention) {
        this.list_AutumnWinterPlantsIntention = list_AutumnWinterPlantsIntention;
    }

    private AutumnWinterPlantsIntention[] list_AutumnWinterPlantsIntention;
}
