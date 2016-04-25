package abrs.system.dao.Entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by Edifi_000 on 2016-03-27.
 */
/**
 * 种植业产品生产成本、收益与劳动生产率
 */
@Document(collection = "CostBenefitProductivityOfPlant")
public class CostBenefitProductivityOfPlant {
    @Id
    private String id;

    private String registration_form_id;//调查表编号

    private String farmer_id;//农户id

    private int county_num;//调查县数
    private int family_num;//调查户数
    private double area_num;//调查面积

    //region 成本与收益

    //region 每亩
    private double costbenefit_permu_main_product_output;//主产品产量
    private double costbenefit_permu_by_product_output;//副产品产量

    private double costbenefit_permu_total_product_output_value;//总产值合计(costbenefit_permu_main_product_output_value + costbenefit_permu_by_product_output_value)
    private double costbenefit_permu_main_product_output_value;//主产品产值
    private double costbenefit_permu_by_product_output_value;//副产品产值

    private double costbenefit_permu_total_cost;//总成本(costbenefit_permu_production_cost + costbenefit_permu_production_land_cost)
    private double costbenefit_permu_production_cost;//生产成本(costbenefit_permu_production_material_cost + costbenefit_permu_production_person_cost)
    private double costbenefit_permu_production_material_cost;//物质费用
    private double costbenefit_permu_production_person_cost;//人工成本(costbenefit_permu_production_person_family_total + costbenefit_permu_production_person_employee_total)
    private double costbenefit_permu_production_person_family_total;//家庭用工作价(costbenefit_permu_production_person_family_num * costbenefit_permu_production_person_family_price)
    private double costbenefit_permu_production_person_family_num;//家庭用工数量(permu_family_cost_total)
    private double costbenefit_permu_production_person_family_price;//家庭用工日工价
    private double costbenefit_permu_production_person_employee_total;//雇工费用(costbenefit_permu_production_person_employee_num * costbenefit_permu_production_person_employee_price)
    private double costbenefit_permu_production_person_employee_num;//雇工数量
    private double costbenefit_permu_production_person_employee_price;//雇工工价
    private double costbenefit_permu_production_land_cost;//土地成本(costbenefit_permu_production_land_self_cost + costbenefit_permu_production_land_other_cost)
    private double costbenefit_permu_production_land_self_cost;//自营地折租
    private double costbenefit_permu_production_land_other_cost;//流转地租金

    private double costbenefit_permu_net_production_value;//净产值(costbenefit_permu_total_product_output_value - costbenefit_permu_production_material_cost)

    private double costbenefit_permu_net_income;//纯收益(costbenefit_permu_total_product_output_value - costbenefit_permu_total_cost)

    private double costbenefit_permu_cost_net_income_rate;//成本纯收益率(costbenefit_permu_net_income / costbenefit_permu_total_cost * 100)
    //endregion

    //region 每50公斤主产品
    private double costbenefit_perfiftykgmainproducts_average_selling_price;//平均出售价格(costbenefit_permu_net_production_sale_value / costbenefit_permu_main_product_sale_num * 50)
    private double costbenefit_perfiftykgmainproducts_total_cost;//总成本(costbenefit_permu_total_cost / costbenefit_permu_main_product_output * 50)
    private double costbenefit_perfiftykgmainproducts_production_cost;//生产成本(costbenefit_permu_production_cost / costbenefit_permu_main_product_output * 50)
    private double costbenefit_perfiftykgmainproducts_material_cost;//物质费用(costbenefit_permu_production_material_cost / costbenefit_permu_main_product_output * 50)
    private double costbenefit_perfiftykgmainproducts_net_production_value;//净产值(costbenefit_permu_net_production_value / costbenefit_permu_main_product_output * 50)
    private double costbenefit_perfiftykgmainproducts_net_income;//纯收益(costbenefit_permu_net_income / costbenefit_permu_main_product_output * 50)
    //endregion

    //region 每一劳动日
    private double costbenefit_perworkday_main_product_output;//主产品产量(costbenefit_permu_main_product_output / (costbenefit_permu_production_person_family_num + costbenefit_permu_production_person_employee_num))
    private double costbenefit_perworkday_net_production_value;//净产值(costbenefit_permu_net_production_value / (costbenefit_permu_production_person_family_num + costbenefit_permu_production_person_employee_num))
    //endregion

    //region 每亩
    private double costbenefit_permu_main_product_sale_num;// 主产品出售量
    private double costbenefit_permu_net_production_sale_value;//主产品出售价值
    //endregion

    //region 附记
    private double costbenefit_note_permu_ext_cost;// 附记1:每亩成本外支出
    private double costbenefit_note_permu_subsidy_income;//附记2:每亩补贴收入
    //endregion

    //endregion

    //region 每亩物质费用合计
    private double permu_material_cost_total;//每亩物质费用合计

    //region 直接生产费用小计
    private double permu_material_cost_total_direct_cost_subtotal;//直接生产费用小计
    private double permu_material_cost_total_direct_cost_seedsseedlings;//种籽、种苗费
    private double permu_material_cost_total_direct_cost_farmmanure;//农家肥费
    private double permu_material_cost_total_direct_cost_fertilizer;//化肥费
    private double permu_material_cost_total_direct_cost_plasticsheeting;//农膜费
    private double permu_material_cost_total_direct_cost_pesticide;//农药费
    private double permu_material_cost_total_direct_cost_animal;//畜力费
    private double permu_material_cost_total_direct_cost_mechanical;//机械作业费
    private double permu_material_cost_total_direct_cost_irrigation;//排灌费
    private double permu_material_cost_total_direct_cost_irrigation_water;//其中：水费
    private double permu_material_cost_total_direct_cost_fuelpower;//燃料动力费
    private double permu_material_cost_total_direct_cost_toolmaterial;//工具材料费
    private double permu_material_cost_total_direct_cost_technicalservice;//技术服务费
    private double permu_material_cost_total_direct_cost_other;//其他直接生产费用
    //endregion

    //region 间接生产费用小计
    private double permu_material_cost_total_indirect_cost_subtotal;//间接生产费用小计
    private double permu_material_cost_total_indirect_cost_depreciation;//固定资产折旧费
    private double permu_material_cost_total_indirect_cost_insurance;//保险费
    private double permu_material_cost_total_indirect_cost_management;//管理费
    private double permu_material_cost_total_indirect_cost_finance;//财务费
    private double permu_material_cost_total_indirect_cost_sale;//销售费
    //endregion

    private double permu_material_cost_total_note_mixed_application_rate;//附记: 每亩化肥混合施用量

    //endregion

    //region 每亩家庭用工合计
    private double permu_family_cost_total;//每亩家庭用工合计(permu_family_cost_total_direct_employ_subtotal + permu_family_cost_total_indirect_employ_subtotal)

    //region 直接费用工用小计
    private double permu_family_cost_total_direct_employ_subtotal;//直接用工费用小计
    private double permu_family_cost_total_direct_employ_beforesowing;//播种前翻耕整地用工
    private double permu_family_cost_total_direct_employ_preparationsowing;//种籽准备与播种用工
    private double permu_family_cost_total_direct_employ_fertilizer;//施肥用工
    private double permu_family_cost_total_direct_employ_irrigation;//排灌用工
    private double permu_family_cost_total_direct_employ_fieldmanagement;//田间管理用工
    private double permu_family_cost_total_direct_employ_harvest;//收获用工
    private double permu_family_cost_total_direct_employ_primaryprocessing;//初制加工用工
    private double permu_family_cost_total_direct_employ_other;//其他直接生产用工
    //endregion

    //region 间接用工费用小计
    private double permu_family_cost_total_indirect_employ_subtotal;//间接用工费用小计
    private double permu_family_cost_total_indirect_employ_initialproduction;//初期生产用工分摊
    private double permu_family_cost_total_indirect_employ_compost;//积肥用工
    private double permu_family_cost_total_indirect_employ_managementl;//经营管理用工
    private double permu_family_cost_total_indirect_employ_oneone;//一事一议酬劳
    private double permu_family_cost_total_indirect_employ_other;//其他间接生产用工
    private double permu_family_cost_total_indirect_employ_sale;//销售用工
    //endregion

    //endregion

    public CostBenefitProductivityOfPlant(){}

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

    public String getFarmer_id() {
        return farmer_id;
    }

    public void setFarmer_id(String farmer_id) {
        this.farmer_id = farmer_id;
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

    public double getArea_num() {
        return area_num;
    }

    public void setArea_num(double area_num) {
        this.area_num = area_num;
    }

    public double getCostbenefit_permu_main_product_output() {
        return costbenefit_permu_main_product_output;
    }

    public void setCostbenefit_permu_main_product_output(double costbenefit_permu_main_product_output) {
        this.costbenefit_permu_main_product_output = costbenefit_permu_main_product_output;
    }

    public double getCostbenefit_permu_by_product_output() {
        return costbenefit_permu_by_product_output;
    }

    public void setCostbenefit_permu_by_product_output(double costbenefit_permu_by_product_output) {
        this.costbenefit_permu_by_product_output = costbenefit_permu_by_product_output;
    }

    public double getCostbenefit_permu_total_product_output_value() {
        return costbenefit_permu_total_product_output_value;
    }

    public void setCostbenefit_permu_total_product_output_value(double costbenefit_permu_total_product_output_value) {
        this.costbenefit_permu_total_product_output_value = costbenefit_permu_total_product_output_value;
    }

    public double getCostbenefit_permu_main_product_output_value() {
        return costbenefit_permu_main_product_output_value;
    }

    public void setCostbenefit_permu_main_product_output_value(double costbenefit_permu_main_product_output_value) {
        this.costbenefit_permu_main_product_output_value = costbenefit_permu_main_product_output_value;
    }

    public double getCostbenefit_permu_by_product_output_value() {
        return costbenefit_permu_by_product_output_value;
    }

    public void setCostbenefit_permu_by_product_output_value(double costbenefit_permu_by_product_output_value) {
        this.costbenefit_permu_by_product_output_value = costbenefit_permu_by_product_output_value;
    }

    public double getCostbenefit_permu_total_cost() {
        return costbenefit_permu_total_cost;
    }

    public void setCostbenefit_permu_total_cost(double costbenefit_permu_total_cost) {
        this.costbenefit_permu_total_cost = costbenefit_permu_total_cost;
    }

    public double getCostbenefit_permu_production_cost() {
        return costbenefit_permu_production_cost;
    }

    public void setCostbenefit_permu_production_cost(double costbenefit_permu_production_cost) {
        this.costbenefit_permu_production_cost = costbenefit_permu_production_cost;
    }

    public double getCostbenefit_permu_production_material_cost() {
        return costbenefit_permu_production_material_cost;
    }

    public void setCostbenefit_permu_production_material_cost(double costbenefit_permu_production_material_cost) {
        this.costbenefit_permu_production_material_cost = costbenefit_permu_production_material_cost;
    }

    public double getCostbenefit_permu_production_person_cost() {
        return costbenefit_permu_production_person_cost;
    }

    public void setCostbenefit_permu_production_person_cost(double costbenefit_permu_production_person_cost) {
        this.costbenefit_permu_production_person_cost = costbenefit_permu_production_person_cost;
    }

    public double getCostbenefit_permu_production_person_family_total() {
        return costbenefit_permu_production_person_family_total;
    }

    public void setCostbenefit_permu_production_person_family_total(double costbenefit_permu_production_person_family_total) {
        this.costbenefit_permu_production_person_family_total = costbenefit_permu_production_person_family_total;
    }

    public double getCostbenefit_permu_production_person_family_num() {
        return costbenefit_permu_production_person_family_num;
    }

    public void setCostbenefit_permu_production_person_family_num(double costbenefit_permu_production_person_family_num) {
        this.costbenefit_permu_production_person_family_num = costbenefit_permu_production_person_family_num;
    }

    public double getCostbenefit_permu_production_person_family_price() {
        return costbenefit_permu_production_person_family_price;
    }

    public void setCostbenefit_permu_production_person_family_price(double costbenefit_permu_production_person_family_price) {
        this.costbenefit_permu_production_person_family_price = costbenefit_permu_production_person_family_price;
    }

    public double getCostbenefit_permu_production_person_employee_total() {
        return costbenefit_permu_production_person_employee_total;
    }

    public void setCostbenefit_permu_production_person_employee_total(double costbenefit_permu_production_person_employee_total) {
        this.costbenefit_permu_production_person_employee_total = costbenefit_permu_production_person_employee_total;
    }

    public double getCostbenefit_permu_production_person_employee_num() {
        return costbenefit_permu_production_person_employee_num;
    }

    public void setCostbenefit_permu_production_person_employee_num(double costbenefit_permu_production_person_employee_num) {
        this.costbenefit_permu_production_person_employee_num = costbenefit_permu_production_person_employee_num;
    }

    public double getCostbenefit_permu_production_person_employee_price() {
        return costbenefit_permu_production_person_employee_price;
    }

    public void setCostbenefit_permu_production_person_employee_price(double costbenefit_permu_production_person_employee_price) {
        this.costbenefit_permu_production_person_employee_price = costbenefit_permu_production_person_employee_price;
    }

    public double getCostbenefit_permu_production_land_cost() {
        return costbenefit_permu_production_land_cost;
    }

    public void setCostbenefit_permu_production_land_cost(double costbenefit_permu_production_land_cost) {
        this.costbenefit_permu_production_land_cost = costbenefit_permu_production_land_cost;
    }

    public double getCostbenefit_permu_production_land_self_cost() {
        return costbenefit_permu_production_land_self_cost;
    }

    public void setCostbenefit_permu_production_land_self_cost(double costbenefit_permu_production_land_self_cost) {
        this.costbenefit_permu_production_land_self_cost = costbenefit_permu_production_land_self_cost;
    }

    public double getCostbenefit_permu_production_land_other_cost() {
        return costbenefit_permu_production_land_other_cost;
    }

    public void setCostbenefit_permu_production_land_other_cost(double costbenefit_permu_production_land_other_cost) {
        this.costbenefit_permu_production_land_other_cost = costbenefit_permu_production_land_other_cost;
    }

    public double getCostbenefit_permu_net_production_value() {
        return costbenefit_permu_net_production_value;
    }

    public void setCostbenefit_permu_net_production_value(double costbenefit_permu_net_production_value) {
        this.costbenefit_permu_net_production_value = costbenefit_permu_net_production_value;
    }

    public double getCostbenefit_permu_net_income() {
        return costbenefit_permu_net_income;
    }

    public void setCostbenefit_permu_net_income(double costbenefit_permu_net_income) {
        this.costbenefit_permu_net_income = costbenefit_permu_net_income;
    }

    public double getCostbenefit_permu_cost_net_income_rate() {
        return costbenefit_permu_cost_net_income_rate;
    }

    public void setCostbenefit_permu_cost_net_income_rate(double costbenefit_permu_cost_net_income_rate) {
        this.costbenefit_permu_cost_net_income_rate = costbenefit_permu_cost_net_income_rate;
    }

    public double getCostbenefit_perfiftykgmainproducts_average_selling_price() {
        return costbenefit_perfiftykgmainproducts_average_selling_price;
    }

    public void setCostbenefit_perfiftykgmainproducts_average_selling_price(double costbenefit_perfiftykgmainproducts_average_selling_price) {
        this.costbenefit_perfiftykgmainproducts_average_selling_price = costbenefit_perfiftykgmainproducts_average_selling_price;
    }

    public double getCostbenefit_perfiftykgmainproducts_total_cost() {
        return costbenefit_perfiftykgmainproducts_total_cost;
    }

    public void setCostbenefit_perfiftykgmainproducts_total_cost(double costbenefit_perfiftykgmainproducts_total_cost) {
        this.costbenefit_perfiftykgmainproducts_total_cost = costbenefit_perfiftykgmainproducts_total_cost;
    }

    public double getCostbenefit_perfiftykgmainproducts_production_cost() {
        return costbenefit_perfiftykgmainproducts_production_cost;
    }

    public void setCostbenefit_perfiftykgmainproducts_production_cost(double costbenefit_perfiftykgmainproducts_production_cost) {
        this.costbenefit_perfiftykgmainproducts_production_cost = costbenefit_perfiftykgmainproducts_production_cost;
    }

    public double getCostbenefit_perfiftykgmainproducts_material_cost() {
        return costbenefit_perfiftykgmainproducts_material_cost;
    }

    public void setCostbenefit_perfiftykgmainproducts_material_cost(double costbenefit_perfiftykgmainproducts_material_cost) {
        this.costbenefit_perfiftykgmainproducts_material_cost = costbenefit_perfiftykgmainproducts_material_cost;
    }

    public double getCostbenefit_perfiftykgmainproducts_net_production_value() {
        return costbenefit_perfiftykgmainproducts_net_production_value;
    }

    public void setCostbenefit_perfiftykgmainproducts_net_production_value(double costbenefit_perfiftykgmainproducts_net_production_value) {
        this.costbenefit_perfiftykgmainproducts_net_production_value = costbenefit_perfiftykgmainproducts_net_production_value;
    }

    public double getCostbenefit_perfiftykgmainproducts_net_income() {
        return costbenefit_perfiftykgmainproducts_net_income;
    }

    public void setCostbenefit_perfiftykgmainproducts_net_income(double costbenefit_perfiftykgmainproducts_net_income) {
        this.costbenefit_perfiftykgmainproducts_net_income = costbenefit_perfiftykgmainproducts_net_income;
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

    public double getCostbenefit_permu_main_product_sale_num() {
        return costbenefit_permu_main_product_sale_num;
    }

    public void setCostbenefit_permu_main_product_sale_num(double costbenefit_permu_main_product_sale_num) {
        this.costbenefit_permu_main_product_sale_num = costbenefit_permu_main_product_sale_num;
    }

    public double getCostbenefit_permu_net_production_sale_value() {
        return costbenefit_permu_net_production_sale_value;
    }

    public void setCostbenefit_permu_net_production_sale_value(double costbenefit_permu_net_production_sale_value) {
        this.costbenefit_permu_net_production_sale_value = costbenefit_permu_net_production_sale_value;
    }

    public double getCostbenefit_note_permu_ext_cost() {
        return costbenefit_note_permu_ext_cost;
    }

    public void setCostbenefit_note_permu_ext_cost(double costbenefit_note_permu_ext_cost) {
        this.costbenefit_note_permu_ext_cost = costbenefit_note_permu_ext_cost;
    }

    public double getCostbenefit_note_permu_subsidy_income() {
        return costbenefit_note_permu_subsidy_income;
    }

    public void setCostbenefit_note_permu_subsidy_income(double costbenefit_note_permu_subsidy_income) {
        this.costbenefit_note_permu_subsidy_income = costbenefit_note_permu_subsidy_income;
    }

    public double getPermu_material_cost_total() {
        return permu_material_cost_total;
    }

    public void setPermu_material_cost_total(double permu_material_cost_total) {
        this.permu_material_cost_total = permu_material_cost_total;
    }

    public double getPermu_material_cost_total_direct_cost_subtotal() {
        return permu_material_cost_total_direct_cost_subtotal;
    }

    public void setPermu_material_cost_total_direct_cost_subtotal(double permu_material_cost_total_direct_cost_subtotal) {
        this.permu_material_cost_total_direct_cost_subtotal = permu_material_cost_total_direct_cost_subtotal;
    }

    public double getPermu_material_cost_total_direct_cost_seedsseedlings() {
        return permu_material_cost_total_direct_cost_seedsseedlings;
    }

    public void setPermu_material_cost_total_direct_cost_seedsseedlings(double permu_material_cost_total_direct_cost_seedsseedlings) {
        this.permu_material_cost_total_direct_cost_seedsseedlings = permu_material_cost_total_direct_cost_seedsseedlings;
    }

    public double getPermu_material_cost_total_direct_cost_farmmanure() {
        return permu_material_cost_total_direct_cost_farmmanure;
    }

    public void setPermu_material_cost_total_direct_cost_farmmanure(double permu_material_cost_total_direct_cost_farmmanure) {
        this.permu_material_cost_total_direct_cost_farmmanure = permu_material_cost_total_direct_cost_farmmanure;
    }

    public double getPermu_material_cost_total_direct_cost_fertilizer() {
        return permu_material_cost_total_direct_cost_fertilizer;
    }

    public void setPermu_material_cost_total_direct_cost_fertilizer(double permu_material_cost_total_direct_cost_fertilizer) {
        this.permu_material_cost_total_direct_cost_fertilizer = permu_material_cost_total_direct_cost_fertilizer;
    }

    public double getPermu_material_cost_total_direct_cost_plasticsheeting() {
        return permu_material_cost_total_direct_cost_plasticsheeting;
    }

    public void setPermu_material_cost_total_direct_cost_plasticsheeting(double permu_material_cost_total_direct_cost_plasticsheeting) {
        this.permu_material_cost_total_direct_cost_plasticsheeting = permu_material_cost_total_direct_cost_plasticsheeting;
    }

    public double getPermu_material_cost_total_direct_cost_pesticide() {
        return permu_material_cost_total_direct_cost_pesticide;
    }

    public void setPermu_material_cost_total_direct_cost_pesticide(double permu_material_cost_total_direct_cost_pesticide) {
        this.permu_material_cost_total_direct_cost_pesticide = permu_material_cost_total_direct_cost_pesticide;
    }

    public double getPermu_material_cost_total_direct_cost_animal() {
        return permu_material_cost_total_direct_cost_animal;
    }

    public void setPermu_material_cost_total_direct_cost_animal(double permu_material_cost_total_direct_cost_animal) {
        this.permu_material_cost_total_direct_cost_animal = permu_material_cost_total_direct_cost_animal;
    }

    public double getPermu_material_cost_total_direct_cost_mechanical() {
        return permu_material_cost_total_direct_cost_mechanical;
    }

    public void setPermu_material_cost_total_direct_cost_mechanical(double permu_material_cost_total_direct_cost_mechanical) {
        this.permu_material_cost_total_direct_cost_mechanical = permu_material_cost_total_direct_cost_mechanical;
    }

    public double getPermu_material_cost_total_direct_cost_irrigation() {
        return permu_material_cost_total_direct_cost_irrigation;
    }

    public void setPermu_material_cost_total_direct_cost_irrigation(double permu_material_cost_total_direct_cost_irrigation) {
        this.permu_material_cost_total_direct_cost_irrigation = permu_material_cost_total_direct_cost_irrigation;
    }

    public double getPermu_material_cost_total_direct_cost_irrigation_water() {
        return permu_material_cost_total_direct_cost_irrigation_water;
    }

    public void setPermu_material_cost_total_direct_cost_irrigation_water(double permu_material_cost_total_direct_cost_irrigation_water) {
        this.permu_material_cost_total_direct_cost_irrigation_water = permu_material_cost_total_direct_cost_irrigation_water;
    }

    public double getPermu_material_cost_total_direct_cost_fuelpower() {
        return permu_material_cost_total_direct_cost_fuelpower;
    }

    public void setPermu_material_cost_total_direct_cost_fuelpower(double permu_material_cost_total_direct_cost_fuelpower) {
        this.permu_material_cost_total_direct_cost_fuelpower = permu_material_cost_total_direct_cost_fuelpower;
    }

    public double getPermu_material_cost_total_direct_cost_toolmaterial() {
        return permu_material_cost_total_direct_cost_toolmaterial;
    }

    public void setPermu_material_cost_total_direct_cost_toolmaterial(double permu_material_cost_total_direct_cost_toolmaterial) {
        this.permu_material_cost_total_direct_cost_toolmaterial = permu_material_cost_total_direct_cost_toolmaterial;
    }

    public double getPermu_material_cost_total_direct_cost_technicalservice() {
        return permu_material_cost_total_direct_cost_technicalservice;
    }

    public void setPermu_material_cost_total_direct_cost_technicalservice(double permu_material_cost_total_direct_cost_technicalservice) {
        this.permu_material_cost_total_direct_cost_technicalservice = permu_material_cost_total_direct_cost_technicalservice;
    }

    public double getPermu_material_cost_total_direct_cost_other() {
        return permu_material_cost_total_direct_cost_other;
    }

    public void setPermu_material_cost_total_direct_cost_other(double permu_material_cost_total_direct_cost_other) {
        this.permu_material_cost_total_direct_cost_other = permu_material_cost_total_direct_cost_other;
    }

    public double getPermu_material_cost_total_indirect_cost_subtotal() {
        return permu_material_cost_total_indirect_cost_subtotal;
    }

    public void setPermu_material_cost_total_indirect_cost_subtotal(double permu_material_cost_total_indirect_cost_subtotal) {
        this.permu_material_cost_total_indirect_cost_subtotal = permu_material_cost_total_indirect_cost_subtotal;
    }

    public double getPermu_material_cost_total_indirect_cost_depreciation() {
        return permu_material_cost_total_indirect_cost_depreciation;
    }

    public void setPermu_material_cost_total_indirect_cost_depreciation(double permu_material_cost_total_indirect_cost_depreciation) {
        this.permu_material_cost_total_indirect_cost_depreciation = permu_material_cost_total_indirect_cost_depreciation;
    }

    public double getPermu_material_cost_total_indirect_cost_insurance() {
        return permu_material_cost_total_indirect_cost_insurance;
    }

    public void setPermu_material_cost_total_indirect_cost_insurance(double permu_material_cost_total_indirect_cost_insurance) {
        this.permu_material_cost_total_indirect_cost_insurance = permu_material_cost_total_indirect_cost_insurance;
    }

    public double getPermu_material_cost_total_indirect_cost_management() {
        return permu_material_cost_total_indirect_cost_management;
    }

    public void setPermu_material_cost_total_indirect_cost_management(double permu_material_cost_total_indirect_cost_management) {
        this.permu_material_cost_total_indirect_cost_management = permu_material_cost_total_indirect_cost_management;
    }

    public double getPermu_material_cost_total_indirect_cost_finance() {
        return permu_material_cost_total_indirect_cost_finance;
    }

    public void setPermu_material_cost_total_indirect_cost_finance(double permu_material_cost_total_indirect_cost_finance) {
        this.permu_material_cost_total_indirect_cost_finance = permu_material_cost_total_indirect_cost_finance;
    }

    public double getPermu_material_cost_total_indirect_cost_sale() {
        return permu_material_cost_total_indirect_cost_sale;
    }

    public void setPermu_material_cost_total_indirect_cost_sale(double permu_material_cost_total_indirect_cost_sale) {
        this.permu_material_cost_total_indirect_cost_sale = permu_material_cost_total_indirect_cost_sale;
    }

    public double getPermu_material_cost_total_note_mixed_application_rate() {
        return permu_material_cost_total_note_mixed_application_rate;
    }

    public void setPermu_material_cost_total_note_mixed_application_rate(double permu_material_cost_total_note_mixed_application_rate) {
        this.permu_material_cost_total_note_mixed_application_rate = permu_material_cost_total_note_mixed_application_rate;
    }

    public double getPermu_family_cost_total() {
        return permu_family_cost_total;
    }

    public void setPermu_family_cost_total(double permu_family_cost_total) {
        this.permu_family_cost_total = permu_family_cost_total;
    }

    public double getPermu_family_cost_total_direct_employ_subtotal() {
        return permu_family_cost_total_direct_employ_subtotal;
    }

    public void setPermu_family_cost_total_direct_employ_subtotal(double permu_family_cost_total_direct_employ_subtotal) {
        this.permu_family_cost_total_direct_employ_subtotal = permu_family_cost_total_direct_employ_subtotal;
    }

    public double getPermu_family_cost_total_direct_employ_beforesowing() {
        return permu_family_cost_total_direct_employ_beforesowing;
    }

    public void setPermu_family_cost_total_direct_employ_beforesowing(double permu_family_cost_total_direct_employ_beforesowing) {
        this.permu_family_cost_total_direct_employ_beforesowing = permu_family_cost_total_direct_employ_beforesowing;
    }

    public double getPermu_family_cost_total_direct_employ_preparationsowing() {
        return permu_family_cost_total_direct_employ_preparationsowing;
    }

    public void setPermu_family_cost_total_direct_employ_preparationsowing(double permu_family_cost_total_direct_employ_preparationsowing) {
        this.permu_family_cost_total_direct_employ_preparationsowing = permu_family_cost_total_direct_employ_preparationsowing;
    }

    public double getPermu_family_cost_total_direct_employ_fertilizer() {
        return permu_family_cost_total_direct_employ_fertilizer;
    }

    public void setPermu_family_cost_total_direct_employ_fertilizer(double permu_family_cost_total_direct_employ_fertilizer) {
        this.permu_family_cost_total_direct_employ_fertilizer = permu_family_cost_total_direct_employ_fertilizer;
    }

    public double getPermu_family_cost_total_direct_employ_irrigation() {
        return permu_family_cost_total_direct_employ_irrigation;
    }

    public void setPermu_family_cost_total_direct_employ_irrigation(double permu_family_cost_total_direct_employ_irrigation) {
        this.permu_family_cost_total_direct_employ_irrigation = permu_family_cost_total_direct_employ_irrigation;
    }

    public double getPermu_family_cost_total_direct_employ_fieldmanagement() {
        return permu_family_cost_total_direct_employ_fieldmanagement;
    }

    public void setPermu_family_cost_total_direct_employ_fieldmanagement(double permu_family_cost_total_direct_employ_fieldmanagement) {
        this.permu_family_cost_total_direct_employ_fieldmanagement = permu_family_cost_total_direct_employ_fieldmanagement;
    }

    public double getPermu_family_cost_total_direct_employ_harvest() {
        return permu_family_cost_total_direct_employ_harvest;
    }

    public void setPermu_family_cost_total_direct_employ_harvest(double permu_family_cost_total_direct_employ_harvest) {
        this.permu_family_cost_total_direct_employ_harvest = permu_family_cost_total_direct_employ_harvest;
    }

    public double getPermu_family_cost_total_direct_employ_primaryprocessing() {
        return permu_family_cost_total_direct_employ_primaryprocessing;
    }

    public void setPermu_family_cost_total_direct_employ_primaryprocessing(double permu_family_cost_total_direct_employ_primaryprocessing) {
        this.permu_family_cost_total_direct_employ_primaryprocessing = permu_family_cost_total_direct_employ_primaryprocessing;
    }

    public double getPermu_family_cost_total_direct_employ_other() {
        return permu_family_cost_total_direct_employ_other;
    }

    public void setPermu_family_cost_total_direct_employ_other(double permu_family_cost_total_direct_employ_other) {
        this.permu_family_cost_total_direct_employ_other = permu_family_cost_total_direct_employ_other;
    }

    public double getPermu_family_cost_total_indirect_employ_subtotal() {
        return permu_family_cost_total_indirect_employ_subtotal;
    }

    public void setPermu_family_cost_total_indirect_employ_subtotal(double permu_family_cost_total_indirect_employ_subtotal) {
        this.permu_family_cost_total_indirect_employ_subtotal = permu_family_cost_total_indirect_employ_subtotal;
    }

    public double getPermu_family_cost_total_indirect_employ_initialproduction() {
        return permu_family_cost_total_indirect_employ_initialproduction;
    }

    public void setPermu_family_cost_total_indirect_employ_initialproduction(double permu_family_cost_total_indirect_employ_initialproduction) {
        this.permu_family_cost_total_indirect_employ_initialproduction = permu_family_cost_total_indirect_employ_initialproduction;
    }

    public double getPermu_family_cost_total_indirect_employ_compost() {
        return permu_family_cost_total_indirect_employ_compost;
    }

    public void setPermu_family_cost_total_indirect_employ_compost(double permu_family_cost_total_indirect_employ_compost) {
        this.permu_family_cost_total_indirect_employ_compost = permu_family_cost_total_indirect_employ_compost;
    }

    public double getPermu_family_cost_total_indirect_employ_managementl() {
        return permu_family_cost_total_indirect_employ_managementl;
    }

    public void setPermu_family_cost_total_indirect_employ_managementl(double permu_family_cost_total_indirect_employ_managementl) {
        this.permu_family_cost_total_indirect_employ_managementl = permu_family_cost_total_indirect_employ_managementl;
    }

    public double getPermu_family_cost_total_indirect_employ_oneone() {
        return permu_family_cost_total_indirect_employ_oneone;
    }

    public void setPermu_family_cost_total_indirect_employ_oneone(double permu_family_cost_total_indirect_employ_oneone) {
        this.permu_family_cost_total_indirect_employ_oneone = permu_family_cost_total_indirect_employ_oneone;
    }

    public double getPermu_family_cost_total_indirect_employ_other() {
        return permu_family_cost_total_indirect_employ_other;
    }

    public void setPermu_family_cost_total_indirect_employ_other(double permu_family_cost_total_indirect_employ_other) {
        this.permu_family_cost_total_indirect_employ_other = permu_family_cost_total_indirect_employ_other;
    }

    public double getPermu_family_cost_total_indirect_employ_sale() {
        return permu_family_cost_total_indirect_employ_sale;
    }

    public void setPermu_family_cost_total_indirect_employ_sale(double permu_family_cost_total_indirect_employ_sale) {
        this.permu_family_cost_total_indirect_employ_sale = permu_family_cost_total_indirect_employ_sale;
    }
}
