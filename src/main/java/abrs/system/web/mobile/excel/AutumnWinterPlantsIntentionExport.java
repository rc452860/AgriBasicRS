package abrs.system.web.mobile.excel;

import abrs.system.dao.Entity.AutumnFoodExpecPro;

/**
 * Created by Edifi_000 on 2016-04-10.
 */
/**
 * 秋冬作物播种面积意向调查表导出实体(农市（基）2表.xls)
 */
public class AutumnWinterPlantsIntentionExport extends BaseExport {

    public AutumnFoodExpecPro[] getList_AutumnFoodExpecPro() {
        return list_AutumnFoodExpecPro;
    }

    public void setList_AutumnFoodExpecPro(AutumnFoodExpecPro[] list_AutumnFoodExpecPro) {
        this.list_AutumnFoodExpecPro = list_AutumnFoodExpecPro;
    }

    private AutumnFoodExpecPro[] list_AutumnFoodExpecPro;
}
