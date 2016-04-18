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

    private String registration_form_id;//调查表编号

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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRegistration_form_id() {
        return registration_form_id;
    }

    public void setRegistration_form_id(String registration_form_id) {
        this.registration_form_id = registration_form_id;
    }

    public int getCounty_num() {
        return county_num;
    }

    public void setCounty_num(int county_num) {
        this.county_num = county_num;
    }

    public int getFamily_num() {
        return family_num;
    }

    public void setFamily_num(int family_num) {
        this.family_num = family_num;
    }

    public double getHead_num() {
        return head_num;
    }

    public void setHead_num(double head_num) {
        this.head_num = head_num;
    }

    public double getAverage_feeding_time() {
        return average_feeding_time;
    }

    public void setAverage_feeding_time(double average_feeding_time) {
        this.average_feeding_time = average_feeding_time;
    }

    public double getCostbenefit_perhead_main_product_output() {
        return costbenefit_perhead_main_product_output;
    }

    public void setCostbenefit_perhead_main_product_output(double costbenefit_perhead_main_product_output) {
        this.costbenefit_perhead_main_product_output = costbenefit_perhead_main_product_output;
    }

    public double getCostbenefit_perhead_by_product_output() {
        return costbenefit_perhead_by_product_output;
    }

    public void setCostbenefit_perhead_by_product_output(double costbenefit_perhead_by_product_output) {
        this.costbenefit_perhead_by_product_output = costbenefit_perhead_by_product_output;
    }

    public double getCostbenefit_perhead_total_product_output_value() {
        return costbenefit_perhead_total_product_output_value;
    }

    public void setCostbenefit_perhead_total_product_output_value(double costbenefit_perhead_total_product_output_value) {
        this.costbenefit_perhead_total_product_output_value = costbenefit_perhead_total_product_output_value;
    }

    public double getCostbenefit_perhead_main_product_output_value() {
        return costbenefit_perhead_main_product_output_value;
    }

    public void setCostbenefit_perhead_main_product_output_value(double costbenefit_perhead_main_product_output_value) {
        this.costbenefit_perhead_main_product_output_value = costbenefit_perhead_main_product_output_value;
    }

    public double getCostbenefit_perhead_by_product_output_value() {
        return costbenefit_perhead_by_product_output_value;
    }

    public void setCostbenefit_perhead_by_product_output_value(double costbenefit_perhead_by_product_output_value) {
        this.costbenefit_perhead_by_product_output_value = costbenefit_perhead_by_product_output_value;
    }

    public double getCostbenefit_perhead_material_cost() {
        return costbenefit_perhead_material_cost;
    }

    public void setCostbenefit_perhead_material_cost(double costbenefit_perhead_material_cost) {
        this.costbenefit_perhead_material_cost = costbenefit_perhead_material_cost;
    }

    public double getCostbenefit_perhead_employee_total() {
        return costbenefit_perhead_employee_total;
    }

    public void setCostbenefit_perhead_employee_total(double costbenefit_perhead_employee_total) {
        this.costbenefit_perhead_employee_total = costbenefit_perhead_employee_total;
    }

    public double getCostbenefit_perhead_employee_num() {
        return costbenefit_perhead_employee_num;
    }

    public void setCostbenefit_perhead_employee_num(double costbenefit_perhead_employee_num) {
        this.costbenefit_perhead_employee_num = costbenefit_perhead_employee_num;
    }

    public double getCostbenefit_perhead_employee_price() {
        return costbenefit_perhead_employee_price;
    }

    public void setCostbenefit_perhead_employee_price(double costbenefit_perhead_employee_price) {
        this.costbenefit_perhead_employee_price = costbenefit_perhead_employee_price;
    }

    public double getCostbenefit_perhead_production_cost() {
        return costbenefit_perhead_production_cost;
    }

    public void setCostbenefit_perhead_production_cost(double costbenefit_perhead_production_cost) {
        this.costbenefit_perhead_production_cost = costbenefit_perhead_production_cost;
    }

    public double getCostbenefit_perhead_tax() {
        return costbenefit_perhead_tax;
    }

    public void setCostbenefit_perhead_tax(double costbenefit_perhead_tax) {
        this.costbenefit_perhead_tax = costbenefit_perhead_tax;
    }

    public double getCostbenefit_perhead_net_production_value() {
        return costbenefit_perhead_net_production_value;
    }

    public void setCostbenefit_perhead_net_production_value(double costbenefit_perhead_net_production_value) {
        this.costbenefit_perhead_net_production_value = costbenefit_perhead_net_production_value;
    }

    public double getCostbenefit_perhead_net_income_without_tax() {
        return costbenefit_perhead_net_income_without_tax;
    }

    public void setCostbenefit_perhead_net_income_without_tax(double costbenefit_perhead_net_income_without_tax) {
        this.costbenefit_perhead_net_income_without_tax = costbenefit_perhead_net_income_without_tax;
    }

    public double getCostbenefit_perhead_net_income() {
        return costbenefit_perhead_net_income;
    }

    public void setCostbenefit_perhead_net_income(double costbenefit_perhead_net_income) {
        this.costbenefit_perhead_net_income = costbenefit_perhead_net_income;
    }

    public double getCostbenefit_perhead_fine_feed_grain() {
        return costbenefit_perhead_fine_feed_grain;
    }

    public void setCostbenefit_perhead_fine_feed_grain(double costbenefit_perhead_fine_feed_grain) {
        this.costbenefit_perhead_fine_feed_grain = costbenefit_perhead_fine_feed_grain;
    }

    public double getCostbenefit_percentumoutput_material_cost() {
        return costbenefit_percentumoutput_material_cost;
    }

    public void setCostbenefit_percentumoutput_material_cost(double costbenefit_percentumoutput_material_cost) {
        this.costbenefit_percentumoutput_material_cost = costbenefit_percentumoutput_material_cost;
    }

    public double getCostbenefit_percentumoutput_production_cost() {
        return costbenefit_percentumoutput_production_cost;
    }

    public void setCostbenefit_percentumoutput_production_cost(double costbenefit_percentumoutput_production_cost) {
        this.costbenefit_percentumoutput_production_cost = costbenefit_percentumoutput_production_cost;
    }

    public double getCostbenefit_percentummainproduct_production_cost() {
        return costbenefit_percentummainproduct_production_cost;
    }

    public void setCostbenefit_percentummainproduct_production_cost(double costbenefit_percentummainproduct_production_cost) {
        this.costbenefit_percentummainproduct_production_cost = costbenefit_percentummainproduct_production_cost;
    }

    public double getCostbenefit_percentummainproduct_production_cost_with_tax() {
        return costbenefit_percentummainproduct_production_cost_with_tax;
    }

    public void setCostbenefit_percentummainproduct_production_cost_with_tax(double costbenefit_percentummainproduct_production_cost_with_tax) {
        this.costbenefit_percentummainproduct_production_cost_with_tax = costbenefit_percentummainproduct_production_cost_with_tax;
    }

    public double getCostbenefit_percentummainproduct_average_sale_price() {
        return costbenefit_percentummainproduct_average_sale_price;
    }

    public void setCostbenefit_percentummainproduct_average_sale_price(double costbenefit_percentummainproduct_average_sale_price) {
        this.costbenefit_percentummainproduct_average_sale_price = costbenefit_percentummainproduct_average_sale_price;
    }

    public double getCostbenefit_percentummainproduct_consumption_grain() {
        return costbenefit_percentummainproduct_consumption_grain;
    }

    public void setCostbenefit_percentummainproduct_consumption_grain(double costbenefit_percentummainproduct_consumption_grain) {
        this.costbenefit_percentummainproduct_consumption_grain = costbenefit_percentummainproduct_consumption_grain;
    }

    public double getCostbenefit_perworkday_main_product_output() {
        return costbenefit_perworkday_main_product_output;
    }

    public void setCostbenefit_perworkday_main_product_output(double costbenefit_perworkday_main_product_output) {
        this.costbenefit_perworkday_main_product_output = costbenefit_perworkday_main_product_output;
    }

    public double getCostbenefit_perworkday_net_production_value() {
        return costbenefit_perworkday_net_production_value;
    }

    public void setCostbenefit_perworkday_net_production_value(double costbenefit_perworkday_net_production_value) {
        this.costbenefit_perworkday_net_production_value = costbenefit_perworkday_net_production_value;
    }

    public double getCostbenefit_note_perhead_ext_cost() {
        return costbenefit_note_perhead_ext_cost;
    }

    public void setCostbenefit_note_perhead_ext_cost(double costbenefit_note_perhead_ext_cost) {
        this.costbenefit_note_perhead_ext_cost = costbenefit_note_perhead_ext_cost;
    }

    public double getMaterial_cost_total() {
        return material_cost_total;
    }

    public void setMaterial_cost_total(double material_cost_total) {
        this.material_cost_total = material_cost_total;
    }

    public double getMaterial_cost_total_direct_cost() {
        return material_cost_total_direct_cost;
    }

    public void setMaterial_cost_total_direct_cost(double material_cost_total_direct_cost) {
        this.material_cost_total_direct_cost = material_cost_total_direct_cost;
    }

    public double getMaterial_cost_total_direct_pigletsprice() {
        return material_cost_total_direct_pigletsprice;
    }

    public void setMaterial_cost_total_direct_pigletsprice(double material_cost_total_direct_pigletsprice) {
        this.material_cost_total_direct_pigletsprice = material_cost_total_direct_pigletsprice;
    }

    public double getMaterial_cost_total_direct_concentratedfeed() {
        return material_cost_total_direct_concentratedfeed;
    }

    public void setMaterial_cost_total_direct_concentratedfeed(double material_cost_total_direct_concentratedfeed) {
        this.material_cost_total_direct_concentratedfeed = material_cost_total_direct_concentratedfeed;
    }

    public double getMaterial_cost_total_direct_coarsefeed() {
        return material_cost_total_direct_coarsefeed;
    }

    public void setMaterial_cost_total_direct_coarsefeed(double material_cost_total_direct_coarsefeed) {
        this.material_cost_total_direct_coarsefeed = material_cost_total_direct_coarsefeed;
    }

    public double getMaterial_cost_total_direct_feedprocessing() {
        return material_cost_total_direct_feedprocessing;
    }

    public void setMaterial_cost_total_direct_feedprocessing(double material_cost_total_direct_feedprocessing) {
        this.material_cost_total_direct_feedprocessing = material_cost_total_direct_feedprocessing;
    }

    public double getMaterial_cost_total_direct_fuelpower() {
        return material_cost_total_direct_fuelpower;
    }

    public void setMaterial_cost_total_direct_fuelpower(double material_cost_total_direct_fuelpower) {
        this.material_cost_total_direct_fuelpower = material_cost_total_direct_fuelpower;
    }

    public double getMaterial_cost_total_direct_medical() {
        return material_cost_total_direct_medical;
    }

    public void setMaterial_cost_total_direct_medical(double material_cost_total_direct_medical) {
        this.material_cost_total_direct_medical = material_cost_total_direct_medical;
    }

    public double getMaterial_cost_total_direct_death() {
        return material_cost_total_direct_death;
    }

    public void setMaterial_cost_total_direct_death(double material_cost_total_direct_death) {
        this.material_cost_total_direct_death = material_cost_total_direct_death;
    }

    public double getMaterial_cost_total_direct_toolmaterial() {
        return material_cost_total_direct_toolmaterial;
    }

    public void setMaterial_cost_total_direct_toolmaterial(double material_cost_total_direct_toolmaterial) {
        this.material_cost_total_direct_toolmaterial = material_cost_total_direct_toolmaterial;
    }

    public double getMaterial_cost_total_direct_other() {
        return material_cost_total_direct_other;
    }

    public void setMaterial_cost_total_direct_other(double material_cost_total_direct_other) {
        this.material_cost_total_direct_other = material_cost_total_direct_other;
    }

    public double getMaterial_cost_total_indirect_cost() {
        return material_cost_total_indirect_cost;
    }

    public void setMaterial_cost_total_indirect_cost(double material_cost_total_indirect_cost) {
        this.material_cost_total_indirect_cost = material_cost_total_indirect_cost;
    }

    public double getMaterial_cost_total_indirect_cost_depreciation() {
        return material_cost_total_indirect_cost_depreciation;
    }

    public void setMaterial_cost_total_indirect_cost_depreciation(double material_cost_total_indirect_cost_depreciation) {
        this.material_cost_total_indirect_cost_depreciation = material_cost_total_indirect_cost_depreciation;
    }

    public double getMaterial_cost_total_indirect_cost_sale() {
        return material_cost_total_indirect_cost_sale;
    }

    public void setMaterial_cost_total_indirect_cost_sale(double material_cost_total_indirect_cost_sale) {
        this.material_cost_total_indirect_cost_sale = material_cost_total_indirect_cost_sale;
    }

    public double getMaterial_cost_total_indirect_cost_fix() {
        return material_cost_total_indirect_cost_fix;
    }

    public void setMaterial_cost_total_indirect_cost_fix(double material_cost_total_indirect_cost_fix) {
        this.material_cost_total_indirect_cost_fix = material_cost_total_indirect_cost_fix;
    }

    public double getMaterial_cost_total_indirect_cost_management() {
        return material_cost_total_indirect_cost_management;
    }

    public void setMaterial_cost_total_indirect_cost_management(double material_cost_total_indirect_cost_management) {
        this.material_cost_total_indirect_cost_management = material_cost_total_indirect_cost_management;
    }

    public double getMaterial_cost_total_indirect_cost_other() {
        return material_cost_total_indirect_cost_other;
    }

    public void setMaterial_cost_total_indirect_cost_other(double material_cost_total_indirect_cost_other) {
        this.material_cost_total_indirect_cost_other = material_cost_total_indirect_cost_other;
    }

    public double getNote_piglet_weight() {
        return note_piglet_weight;
    }

    public void setNote_piglet_weight(double note_piglet_weight) {
        this.note_piglet_weight = note_piglet_weight;
    }

    public double getNote_concentrated_feed_num() {
        return note_concentrated_feed_num;
    }

    public void setNote_concentrated_feed_num(double note_concentrated_feed_num) {
        this.note_concentrated_feed_num = note_concentrated_feed_num;
    }

    public double getNote_concentrated_feed_grain() {
        return note_concentrated_feed_grain;
    }

    public void setNote_concentrated_feed_grain(double note_concentrated_feed_grain) {
        this.note_concentrated_feed_grain = note_concentrated_feed_grain;
    }

    public double getNote_perhead_ext_cost() {
        return note_perhead_ext_cost;
    }

    public void setNote_perhead_ext_cost(double note_perhead_ext_cost) {
        this.note_perhead_ext_cost = note_perhead_ext_cost;
    }
}
