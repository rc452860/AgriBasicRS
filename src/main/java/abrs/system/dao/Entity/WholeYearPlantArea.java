package abrs.system.dao.Entity;

/**
 * Created by Edifi_000 on 2016-03-22.
 */

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 全年农作物播种面积意向（预计）调查(单一明细配合RegistrationForm查询成汇总表)
 */
@Document(collection = "WholeYearPlantArea")
public class WholeYearPlantArea {
    @Id
    private String id;

    private String farmer_id;//农户id

    private int form_tag;//当为0为意向调查 当为1预计调查

    private double plant_total;//农作物总面积

    //region 粮食
    private double food_total;//粮食合计
    private double food_summerl;//其中：夏粮

    //谷物
    private double food_grain;//谷物 合计（food_grain_daogu_zaodao+food_grain_daogu_zhongdao+food_grain_daogu_wandao+food_grain_xiaomai+food_grain_yumi+food_grain_guzi+food_grain_gaoliang+food_grain_other）
    private double food_grain_daogu;//稻谷（food_grain_daogu_zaodao+food_grain_daogu_zhongdao+food_grain_daogu_wandao）
    private double food_grain_daogu_zaodao;//早稻
    private double food_grain_daogu_zhongdao;//中稻
    private double food_grain_daogu_wandao;//双季晚稻
    private double food_grain_xiaomai;//小麦
    private double food_grain_yumi;//玉米
    private double food_grain_guzi;//谷子
    private double food_grain_gaoliang;//高粱
    private double food_grain_other;//其他
    //endregion

    //region 豆类
    private double food_legume;//豆类 合计
    private double food_legume_dadou;//其中：大豆(不大于food_legume)
    //endregion

    //region 折粮薯类
    private double food_potato;//薯类 合计
    private double food_potato_malingshu;// 其中：马铃薯(不大于food_potato)
    //endregion

    //region 油料作物
    private double oilplant_total;//油料作物 合计(不小于food_oilplant_huasheng+food_oilplant_youcaizi+food_oilplant_zhima)
    private double oilplant_huasheng;//其中：花生
    private double oilplant_youcaizi;//油菜籽
    private double oilplant_zhima;//芝麻
    //endregion

    //region 棉花
    private double cotton_total;//棉花
    //endregion

    //region 生麻
    private double rawjute_total;//生麻
    private double rawjute_hongma;//其中：生黄红麻
    //endregion

    //region 糖类合计
    private double sugar_total;//糖类
    private double sugar_ganzhe;//甘蔗
    private double sugar_tiancai;//甜菜
    //endregion

    //region 烟叶
    private double tobacco_total;//烟叶
    private double tobacco_kaoyan;//其中：烤烟
    //endregion

    //region 蔬菜
    private double vegetables_total;//蔬菜
    //endregion

    //region 瓜果类
    private double fruit_total;//瓜果
    //endregion

    //region 其他作物
    private double otherplant_total;//其他作物
    private double otherplant_qingsiliaol;//其中：青饲料
    //endregion

    public WholeYearPlantArea(){}

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getForm_tag() {
        return form_tag;
    }

    public void setForm_tag(int form_tag) {
        this.form_tag = form_tag;
    }

    public double getPlant_total() {
        return plant_total;
    }

    public void setPlant_total(double plant_total) {
        this.plant_total = plant_total;
    }

    public double getFood_total() {
        return food_total;
    }

    public void setFood_total(double food_total) {
        this.food_total = food_total;
    }

    public double getFood_summerl() {
        return food_summerl;
    }

    public void setFood_summerl(double food_summerl) {
        this.food_summerl = food_summerl;
    }

    public double getFood_grain() {
        return food_grain;
    }

    public void setFood_grain(double food_grain) {
        this.food_grain = food_grain;
    }

    public double getFood_grain_daogu() {
        return food_grain_daogu;
    }

    public void setFood_grain_daogu(double food_grain_daogu) {
        this.food_grain_daogu = food_grain_daogu;
    }

    public double getFood_grain_daogu_zaodao() {
        return food_grain_daogu_zaodao;
    }

    public void setFood_grain_daogu_zaodao(double food_grain_daogu_zaodao) {
        this.food_grain_daogu_zaodao = food_grain_daogu_zaodao;
    }

    public double getFood_grain_daogu_zhongdao() {
        return food_grain_daogu_zhongdao;
    }

    public void setFood_grain_daogu_zhongdao(double food_grain_daogu_zhongdao) {
        this.food_grain_daogu_zhongdao = food_grain_daogu_zhongdao;
    }

    public double getFood_grain_daogu_wandao() {
        return food_grain_daogu_wandao;
    }

    public void setFood_grain_daogu_wandao(double food_grain_daogu_wandao) {
        this.food_grain_daogu_wandao = food_grain_daogu_wandao;
    }

    public double getFood_grain_xiaomai() {
        return food_grain_xiaomai;
    }

    public void setFood_grain_xiaomai(double food_grain_xiaomai) {
        this.food_grain_xiaomai = food_grain_xiaomai;
    }

    public double getFood_grain_yumi() {
        return food_grain_yumi;
    }

    public void setFood_grain_yumi(double food_grain_yumi) {
        this.food_grain_yumi = food_grain_yumi;
    }

    public double getFood_grain_guzi() {
        return food_grain_guzi;
    }

    public void setFood_grain_guzi(double food_grain_guzi) {
        this.food_grain_guzi = food_grain_guzi;
    }

    public double getFood_grain_gaoliang() {
        return food_grain_gaoliang;
    }

    public void setFood_grain_gaoliang(double food_grain_gaoliang) {
        this.food_grain_gaoliang = food_grain_gaoliang;
    }

    public double getFood_grain_other() {
        return food_grain_other;
    }

    public void setFood_grain_other(double food_grain_other) {
        this.food_grain_other = food_grain_other;
    }

    public double getFood_legume() {
        return food_legume;
    }

    public void setFood_legume(double food_legume) {
        this.food_legume = food_legume;
    }

    public double getFood_legume_dadou() {
        return food_legume_dadou;
    }

    public void setFood_legume_dadou(double food_legume_dadou) {
        this.food_legume_dadou = food_legume_dadou;
    }

    public double getFood_potato() {
        return food_potato;
    }

    public void setFood_potato(double food_potato) {
        this.food_potato = food_potato;
    }

    public double getFood_potato_malingshu() {
        return food_potato_malingshu;
    }

    public void setFood_potato_malingshu(double food_potato_malingshu) {
        this.food_potato_malingshu = food_potato_malingshu;
    }

    public double getOilplant_total() {
        return oilplant_total;
    }

    public void setOilplant_total(double oilplant_total) {
        this.oilplant_total = oilplant_total;
    }

    public double getOilplant_huasheng() {
        return oilplant_huasheng;
    }

    public void setOilplant_huasheng(double oilplant_huasheng) {
        this.oilplant_huasheng = oilplant_huasheng;
    }

    public double getOilplant_youcaizi() {
        return oilplant_youcaizi;
    }

    public void setOilplant_youcaizi(double oilplant_youcaizi) {
        this.oilplant_youcaizi = oilplant_youcaizi;
    }

    public double getOilplant_zhima() {
        return oilplant_zhima;
    }

    public void setOilplant_zhima(double oilplant_zhima) {
        this.oilplant_zhima = oilplant_zhima;
    }

    public double getCotton_total() {
        return cotton_total;
    }

    public void setCotton_total(double cotton_total) {
        this.cotton_total = cotton_total;
    }

    public double getRawjute_total() {
        return rawjute_total;
    }

    public void setRawjute_total(double rawjute_total) {
        this.rawjute_total = rawjute_total;
    }

    public double getRawjute_hongma() {
        return rawjute_hongma;
    }

    public void setRawjute_hongma(double rawjute_hongma) {
        this.rawjute_hongma = rawjute_hongma;
    }

    public double getSugar_total() {
        return sugar_total;
    }

    public void setSugar_total(double sugar_total) {
        this.sugar_total = sugar_total;
    }

    public double getSugar_ganzhe() {
        return sugar_ganzhe;
    }

    public void setSugar_ganzhe(double sugar_ganzhe) {
        this.sugar_ganzhe = sugar_ganzhe;
    }

    public double getSugar_tiancai() {
        return sugar_tiancai;
    }

    public void setSugar_tiancai(double sugar_tiancai) {
        this.sugar_tiancai = sugar_tiancai;
    }

    public double getTobacco_total() {
        return tobacco_total;
    }

    public void setTobacco_total(double tobacco_total) {
        this.tobacco_total = tobacco_total;
    }

    public double getTobacco_kaoyan() {
        return tobacco_kaoyan;
    }

    public void setTobacco_kaoyan(double tobacco_kaoyan) {
        this.tobacco_kaoyan = tobacco_kaoyan;
    }

    public double getVegetables_total() {
        return vegetables_total;
    }

    public void setVegetables_total(double vegetables_total) {
        this.vegetables_total = vegetables_total;
    }

    public double getFruit_total() {
        return fruit_total;
    }

    public void setFruit_total(double fruit_total) {
        this.fruit_total = fruit_total;
    }

    public double getOtherplant_total() {
        return otherplant_total;
    }

    public void setOtherplant_total(double otherplant_total) {
        this.otherplant_total = otherplant_total;
    }

    public double getOtherplant_qingsiliaol() {
        return otherplant_qingsiliaol;
    }

    public void setOtherplant_qingsiliaol(double otherplant_qingsiliaol) {
        this.otherplant_qingsiliaol = otherplant_qingsiliaol;
    }
}
