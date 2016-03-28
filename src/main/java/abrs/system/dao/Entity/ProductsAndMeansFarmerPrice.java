package abrs.system.dao.Entity;

/**
 * Created by Edifi_000 on 2016-03-29.
 */

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 主要农产品和农业生产资料价格监测旬报表(农民售价)
 */
@Document(collection = "ProductsAndMeansFarmerPrice")
public class ProductsAndMeansFarmerPrice {
    @Id
    private String id;

    private String townships;//乡镇名称

    //region 原粮
    private double raw_grain_zaoxiandao;//早籼稻
    private double raw_grain_zhongxiandao;//中籼稻
    private double raw_grain_wanxiandao;//晚籼稻
    private double raw_grain_jingdao;//粳稻
    private double raw_grain_xiaomai;//小麦
    private double raw_grain_yumi;//玉米
    private double raw_grain_dadou;//大豆
    //endregion

    //region 经养产品
    private double raised_product_daikehuasheng;//带壳花生
    private double raised_product_huashengmi;//花生米
    private double raised_product_youcaizi;//油菜籽
    private double raised_product_shengzhu;//生猪
    private double raised_product_zaizhu;//仔猪
    private double raised_product_huoji;//活鸡
    private double raised_product_jidan;//鸡蛋
    private double raised_product_zimian;//籽棉
    private double raised_product_ganze;//甘蔗
    private double raised_product_liyu;//鲤鱼
    private double raised_product_lianyu;//鲢鱼
    private double raised_product_caoyu;//草鱼
    private double raised_product_baicai;//白菜
    private double raised_product_xihongshi;//西红柿
    private double raised_product_huanggua;//黄瓜
    private double raised_product_caijiao;//菜椒
    private double raised_product_tudou;//土豆
    //endregion

    public ProductsAndMeansFarmerPrice(){}

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTownships() {
        return townships;
    }

    public void setTownships(String townships) {
        this.townships = townships;
    }

    public double getRaw_grain_zaoxiandao() {
        return raw_grain_zaoxiandao;
    }

    public void setRaw_grain_zaoxiandao(double raw_grain_zaoxiandao) {
        this.raw_grain_zaoxiandao = raw_grain_zaoxiandao;
    }

    public double getRaw_grain_zhongxiandao() {
        return raw_grain_zhongxiandao;
    }

    public void setRaw_grain_zhongxiandao(double raw_grain_zhongxiandao) {
        this.raw_grain_zhongxiandao = raw_grain_zhongxiandao;
    }

    public double getRaw_grain_wanxiandao() {
        return raw_grain_wanxiandao;
    }

    public void setRaw_grain_wanxiandao(double raw_grain_wanxiandao) {
        this.raw_grain_wanxiandao = raw_grain_wanxiandao;
    }

    public double getRaw_grain_jingdao() {
        return raw_grain_jingdao;
    }

    public void setRaw_grain_jingdao(double raw_grain_jingdao) {
        this.raw_grain_jingdao = raw_grain_jingdao;
    }

    public double getRaw_grain_xiaomai() {
        return raw_grain_xiaomai;
    }

    public void setRaw_grain_xiaomai(double raw_grain_xiaomai) {
        this.raw_grain_xiaomai = raw_grain_xiaomai;
    }

    public double getRaw_grain_yumi() {
        return raw_grain_yumi;
    }

    public void setRaw_grain_yumi(double raw_grain_yumi) {
        this.raw_grain_yumi = raw_grain_yumi;
    }

    public double getRaw_grain_dadou() {
        return raw_grain_dadou;
    }

    public void setRaw_grain_dadou(double raw_grain_dadou) {
        this.raw_grain_dadou = raw_grain_dadou;
    }

    public double getRaised_product_daikehuasheng() {
        return raised_product_daikehuasheng;
    }

    public void setRaised_product_daikehuasheng(double raised_product_daikehuasheng) {
        this.raised_product_daikehuasheng = raised_product_daikehuasheng;
    }

    public double getRaised_product_huashengmi() {
        return raised_product_huashengmi;
    }

    public void setRaised_product_huashengmi(double raised_product_huashengmi) {
        this.raised_product_huashengmi = raised_product_huashengmi;
    }

    public double getRaised_product_youcaizi() {
        return raised_product_youcaizi;
    }

    public void setRaised_product_youcaizi(double raised_product_youcaizi) {
        this.raised_product_youcaizi = raised_product_youcaizi;
    }

    public double getRaised_product_shengzhu() {
        return raised_product_shengzhu;
    }

    public void setRaised_product_shengzhu(double raised_product_shengzhu) {
        this.raised_product_shengzhu = raised_product_shengzhu;
    }

    public double getRaised_product_zaizhu() {
        return raised_product_zaizhu;
    }

    public void setRaised_product_zaizhu(double raised_product_zaizhu) {
        this.raised_product_zaizhu = raised_product_zaizhu;
    }

    public double getRaised_product_huoji() {
        return raised_product_huoji;
    }

    public void setRaised_product_huoji(double raised_product_huoji) {
        this.raised_product_huoji = raised_product_huoji;
    }

    public double getRaised_product_jidan() {
        return raised_product_jidan;
    }

    public void setRaised_product_jidan(double raised_product_jidan) {
        this.raised_product_jidan = raised_product_jidan;
    }

    public double getRaised_product_zimian() {
        return raised_product_zimian;
    }

    public void setRaised_product_zimian(double raised_product_zimian) {
        this.raised_product_zimian = raised_product_zimian;
    }

    public double getRaised_product_ganze() {
        return raised_product_ganze;
    }

    public void setRaised_product_ganze(double raised_product_ganze) {
        this.raised_product_ganze = raised_product_ganze;
    }

    public double getRaised_product_liyu() {
        return raised_product_liyu;
    }

    public void setRaised_product_liyu(double raised_product_liyu) {
        this.raised_product_liyu = raised_product_liyu;
    }

    public double getRaised_product_lianyu() {
        return raised_product_lianyu;
    }

    public void setRaised_product_lianyu(double raised_product_lianyu) {
        this.raised_product_lianyu = raised_product_lianyu;
    }

    public double getRaised_product_caoyu() {
        return raised_product_caoyu;
    }

    public void setRaised_product_caoyu(double raised_product_caoyu) {
        this.raised_product_caoyu = raised_product_caoyu;
    }

    public double getRaised_product_baicai() {
        return raised_product_baicai;
    }

    public void setRaised_product_baicai(double raised_product_baicai) {
        this.raised_product_baicai = raised_product_baicai;
    }

    public double getRaised_product_xihongshi() {
        return raised_product_xihongshi;
    }

    public void setRaised_product_xihongshi(double raised_product_xihongshi) {
        this.raised_product_xihongshi = raised_product_xihongshi;
    }

    public double getRaised_product_huanggua() {
        return raised_product_huanggua;
    }

    public void setRaised_product_huanggua(double raised_product_huanggua) {
        this.raised_product_huanggua = raised_product_huanggua;
    }

    public double getRaised_product_caijiao() {
        return raised_product_caijiao;
    }

    public void setRaised_product_caijiao(double raised_product_caijiao) {
        this.raised_product_caijiao = raised_product_caijiao;
    }

    public double getRaised_product_tudou() {
        return raised_product_tudou;
    }

    public void setRaised_product_tudou(double raised_product_tudou) {
        this.raised_product_tudou = raised_product_tudou;
    }

}
