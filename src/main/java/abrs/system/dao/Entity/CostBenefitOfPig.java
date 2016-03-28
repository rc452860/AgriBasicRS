package abrs.system.dao.Entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by Edifi_000 on 2016-03-28.
 */
/**
 * 出栏肥猪生产成本、收益调查表
 */
@Document(collection = "CostBenefitOfPig")
public class CostBenefitOfPig {
    @Id
    private String id;

    private int county_num;//调查县数
    private int family_num;//调查户数
    private double head_num;//调查头数
    private double average_feeding_time;//平均饲养时间

    //region 成本与收益

    //region 每头
    private double costbenefit_perhead_main_product_output;//主产品产量
    private double costbenefit_perhead_by_product_output;//副产品产量

    private double costbenefit_perhead_total_product_output_value;//总产值合计(costbenefit_perhead_main_product_output_value + costbenefit_perhead_by_product_output_value)
    private double costbenefit_perhead_main_product_output_value;//主产品产值(costbenefit_perhead_by_product_output * costbenefit_percentummainproduct_average_sale_price / 100)
    private double costbenefit_perhead_by_product_output_value;//副产品产值

    private double costbenefit_perhead_material_cost;//物质费用(material_cost_total / head_num)

    private double costbenefit_perhead_employee_total;//用工作价(costbenefit_perhead_employee_num * costbenefit_perhead_employee_price)
    private double costbenefit_perhead_employee_num;//标准用工量
    private double costbenefit_perhead_employee_price;//劳动日工价

    private double costbenefit_perhead_production_cost;//总生产成本(costbenefit_perhead_material_cost + costbenefit_perhead_employee_total)

    private double costbenefit_perhead_tax;//税金

    private double costbenefit_perhead_net_production_value;//净产值(costbenefit_perhead_total_product_output_value - costbenefit_perhead_material_cost)

    private double costbenefit_perhead_net_income_without_tax;//减税纯收益(costbenefit_perhead_total_product_output_value - costbenefit_perhead_production_cost -costbenefit_perhead_tax)

    private double costbenefit_perhead_net_income;//成本纯收益率(costbenefit_perhead_net_income_without_tax / costbenefit_perhead_production_cost * 100)

    private double costbenefit_perhead_fine_feed_grain;//精饲料折粮(note_concentrated_feed_grain / head_num)
    //endregion

    //region 每百元产值
    private double costbenefit_percentumoutput_material_cost;//物质费用(costbenefit_perhead_material_cost / costbenefit_perhead_total_product_output_value * 100)
    private double costbenefit_percentumoutput_production_cost;//生产成本(costbenefit_perhead_production_cost / costbenefit_perhead_total_product_output_value * 100)
    //endregion

    //region 每百斤主产品
    private double costbenefit_percentummainproduct_production_cost;//生产成本(costbenefit_perhead_production_cost / costbenefit_perhead_main_product_output * 100)
    private double costbenefit_percentummainproduct_production_cost_with_tax;//含税生产成本(costbenefit_perhead_tax / costbenefit_perhead_main_product_output * 100 + costbenefit_percentummainproduct_production_cost)
    private double costbenefit_percentummainproduct_average_sale_price;//平均出售价格
    private double costbenefit_percentummainproduct_consumption_grain;//耗粮数量(costbenefit_perhead_fine_feed_grain / costbenefit_perhead_main_product_output * 100)
    //endregion

    //region 每一劳动日
    private double costbenefit_perworkday_main_product_output;//主产品产量(costbenefit_perhead_main_product_output / costbenefit_perhead_employee_num)
    private double costbenefit_perworkday_net_production_value;//净产值(costbenefit_perhead_net_production_value / costbenefit_perhead_employee_num)
    //endregion

    //region 附记
    private double costbenefit_note_perhead_ext_cost;// 附记1:每头成本外支出
    //endregion

    //endregion

    //region 物质费用
    private double material_cost_total;//物质费用

    //region 直接生产费用
    private double material_cost_total_direct_cost;//直接生产费用
    private double material_cost_total_direct_pigletsprice;//仔猪进价
    private double material_cost_total_direct_concentratedfeed;//精饲料费
    private double material_cost_total_direct_coarsefeed;//青粗饲料费
    private double material_cost_total_direct_feedprocessing;//饲料加工费
    private double material_cost_total_direct_fuelpower;//燃料动力费
    private double material_cost_total_direct_medical;//医疗防疫费
    private double material_cost_total_direct_death;//死亡损失费
    private double material_cost_total_direct_toolmaterial;//工具材料费
    private double material_cost_total_direct_other;//其它直接费用
    //endregion

    //region 间接生产费用
    private double material_cost_total_indirect_cost;//间接生产费用
    private double material_cost_total_indirect_cost_depreciation;//固定资产折旧费
    private double material_cost_total_indirect_cost_sale;//销售费用
    private double material_cost_total_indirect_cost_fix;//修理费
    private double material_cost_total_indirect_cost_management;//管理费
    private double material_cost_total_indirect_cost_other;//其它间接生产费

    //endregion

    //endregion

    //region 附报
    private double note_piglet_weight;//仔猪重量
    private double note_concentrated_feed_num;//精饲料用量
    private double note_concentrated_feed_grain;//精饲料折粮
    private double note_perhead_ext_cost;//每头成本外支出
    //endregion

    public CostBenefitOfPig(){}
}
