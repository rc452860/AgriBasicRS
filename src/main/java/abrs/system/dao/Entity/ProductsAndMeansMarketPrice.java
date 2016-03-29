package abrs.system.dao.Entity;

/**
 * Created by Edifi_000 on 2016-03-28.
 */

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 主要农产品和农业生产资料价格监测旬报表(市场价格)
 */
@Document(collection = "ProductsAndMeansMarketPrice")
public class ProductsAndMeansMarketPrice {
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

    //region 成品粮
    private double processed_grain_zaoxianmi;//早籼米
    private double processed_grain_zhongwanxianmi;//中晚籼米
    private double processed_grain_jingmi;//粳米
    private double processed_grain_biaozhunfen;//标准粉
    private double processed_grain_jingfen;//精粉
    private double processed_grain_yumimian;//玉米面
    private double processed_grain_xiaomi;//小米
    private double processed_grain_damai;//大麦
    //endregion

    //region 经养产品
    private double raised_product_huashengmi;//花生米
    private double raised_product_youcaizi;//油菜籽
    private double raised_product_shengzhu;//生猪
    private double raised_product_zaizhu;//仔猪
    private double raised_product_jidan;//鸡蛋
    private double raised_product_huashengyou;//花生油
    private double raised_product_caiziyou;//菜籽油
    private double raised_product_douyou;//豆油
    private double raised_product_zimian;//籽棉
    private double raised_product_pimian;//皮棉
    private double raised_product_ganze;//甘蔗
    private double raised_product_zhurou;//猪肉
    private double raised_product_niurou;//牛肉
    private double raised_product_yangrou;//羊肉
    private double raised_product_jirou;//鸡肉
    private double raised_product_liyu;//鲤鱼
    private double raised_product_lianyu;//鲢鱼
    private double raised_product_caoyu;//草鱼
    private double raised_product_daiyu;//带鱼
    private double raised_product_baicai;//白菜
    private double raised_product_xihongshi;//西红柿
    private double raised_product_huanggua;//黄瓜
    private double raised_product_caijiao;//菜椒
    private double raised_product_tudou;//土豆
    //endregion

    //region 生产资料
    private double means_of_production_guochanniaosu;//国产尿素
    private double means_of_production_jinkouniaosu;//进口尿素
    private double means_of_production_tansuanqingan;//碳酸氢铵
    private double means_of_production_guochanlinsuaneran;//国产磷酸二铵
    private double means_of_production_jinkoulinsuaneran;//进口磷酸二铵
    private double means_of_production_putongguolinsuangai;//普通过磷酸钙
    private double means_of_production_gaimeilinfei;//钙镁磷肥
    private double means_of_production_guochanlvhuagai;//国产氯化钾
    private double means_of_production_guochanfuhefei1;//国产复合肥(1)
    private double means_of_production_guochanfuhefei2;//国产复合肥(2)
    private double means_of_production_guochanfuhefei3;//国产复合肥(3)
    private double means_of_production_dimo;//地膜
    private double means_of_production_putongpengmo;//普通棚膜
    private double means_of_production_nongyongchaiyou;//农用柴油
    private double means_of_production_yufeizhupeihesiliao;//育肥猪配合饲料
    private double means_of_production_danjipeihesiliao;//蛋鸡配合饲料
    //endregion

    public ProductsAndMeansMarketPrice(){}

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

    public double getProcessed_grain_zaoxianmi() {
        return processed_grain_zaoxianmi;
    }

    public void setProcessed_grain_zaoxianmi(double processed_grain_zaoxianmi) {
        this.processed_grain_zaoxianmi = processed_grain_zaoxianmi;
    }

    public double getProcessed_grain_zhongwanxianmi() {
        return processed_grain_zhongwanxianmi;
    }

    public void setProcessed_grain_zhongwanxianmi(double processed_grain_zhongwanxianmi) {
        this.processed_grain_zhongwanxianmi = processed_grain_zhongwanxianmi;
    }

    public double getProcessed_grain_jingmi() {
        return processed_grain_jingmi;
    }

    public void setProcessed_grain_jingmi(double processed_grain_jingmi) {
        this.processed_grain_jingmi = processed_grain_jingmi;
    }

    public double getProcessed_grain_biaozhunfen() {
        return processed_grain_biaozhunfen;
    }

    public void setProcessed_grain_biaozhunfen(double processed_grain_biaozhunfen) {
        this.processed_grain_biaozhunfen = processed_grain_biaozhunfen;
    }

    public double getProcessed_grain_jingfen() {
        return processed_grain_jingfen;
    }

    public void setProcessed_grain_jingfen(double processed_grain_jingfen) {
        this.processed_grain_jingfen = processed_grain_jingfen;
    }

    public double getProcessed_grain_yumimian() {
        return processed_grain_yumimian;
    }

    public void setProcessed_grain_yumimian(double processed_grain_yumimian) {
        this.processed_grain_yumimian = processed_grain_yumimian;
    }

    public double getProcessed_grain_xiaomi() {
        return processed_grain_xiaomi;
    }

    public void setProcessed_grain_xiaomi(double processed_grain_xiaomi) {
        this.processed_grain_xiaomi = processed_grain_xiaomi;
    }

    public double getProcessed_grain_damai() {
        return processed_grain_damai;
    }

    public void setProcessed_grain_damai(double processed_grain_damai) {
        this.processed_grain_damai = processed_grain_damai;
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

    public double getRaised_product_jidan() {
        return raised_product_jidan;
    }

    public void setRaised_product_jidan(double raised_product_jidan) {
        this.raised_product_jidan = raised_product_jidan;
    }

    public double getRaised_product_huashengyou() {
        return raised_product_huashengyou;
    }

    public void setRaised_product_huashengyou(double raised_product_huashengyou) {
        this.raised_product_huashengyou = raised_product_huashengyou;
    }

    public double getRaised_product_caiziyou() {
        return raised_product_caiziyou;
    }

    public void setRaised_product_caiziyou(double raised_product_caiziyou) {
        this.raised_product_caiziyou = raised_product_caiziyou;
    }

    public double getRaised_product_douyou() {
        return raised_product_douyou;
    }

    public void setRaised_product_douyou(double raised_product_douyou) {
        this.raised_product_douyou = raised_product_douyou;
    }

    public double getRaised_product_zimian() {
        return raised_product_zimian;
    }

    public void setRaised_product_zimian(double raised_product_zimian) {
        this.raised_product_zimian = raised_product_zimian;
    }

    public double getRaised_product_pimian() {
        return raised_product_pimian;
    }

    public void setRaised_product_pimian(double raised_product_pimian) {
        this.raised_product_pimian = raised_product_pimian;
    }

    public double getRaised_product_ganze() {
        return raised_product_ganze;
    }

    public void setRaised_product_ganze(double raised_product_ganze) {
        this.raised_product_ganze = raised_product_ganze;
    }

    public double getRaised_product_zhurou() {
        return raised_product_zhurou;
    }

    public void setRaised_product_zhurou(double raised_product_zhurou) {
        this.raised_product_zhurou = raised_product_zhurou;
    }

    public double getRaised_product_niurou() {
        return raised_product_niurou;
    }

    public void setRaised_product_niurou(double raised_product_niurou) {
        this.raised_product_niurou = raised_product_niurou;
    }

    public double getRaised_product_yangrou() {
        return raised_product_yangrou;
    }

    public void setRaised_product_yangrou(double raised_product_yangrou) {
        this.raised_product_yangrou = raised_product_yangrou;
    }

    public double getRaised_product_jirou() {
        return raised_product_jirou;
    }

    public void setRaised_product_jirou(double raised_product_jirou) {
        this.raised_product_jirou = raised_product_jirou;
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

    public double getRaised_product_daiyu() {
        return raised_product_daiyu;
    }

    public void setRaised_product_daiyu(double raised_product_daiyu) {
        this.raised_product_daiyu = raised_product_daiyu;
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

    public double getMeans_of_production_guochanniaosu() {
        return means_of_production_guochanniaosu;
    }

    public void setMeans_of_production_guochanniaosu(double means_of_production_guochanniaosu) {
        this.means_of_production_guochanniaosu = means_of_production_guochanniaosu;
    }

    public double getMeans_of_production_jinkouniaosu() {
        return means_of_production_jinkouniaosu;
    }

    public void setMeans_of_production_jinkouniaosu(double means_of_production_jinkouniaosu) {
        this.means_of_production_jinkouniaosu = means_of_production_jinkouniaosu;
    }

    public double getMeans_of_production_tansuanqingan() {
        return means_of_production_tansuanqingan;
    }

    public void setMeans_of_production_tansuanqingan(double means_of_production_tansuanqingan) {
        this.means_of_production_tansuanqingan = means_of_production_tansuanqingan;
    }

    public double getMeans_of_production_guochanlinsuaneran() {
        return means_of_production_guochanlinsuaneran;
    }

    public void setMeans_of_production_guochanlinsuaneran(double means_of_production_guochanlinsuaneran) {
        this.means_of_production_guochanlinsuaneran = means_of_production_guochanlinsuaneran;
    }

    public double getMeans_of_production_jinkoulinsuaneran() {
        return means_of_production_jinkoulinsuaneran;
    }

    public void setMeans_of_production_jinkoulinsuaneran(double means_of_production_jinkoulinsuaneran) {
        this.means_of_production_jinkoulinsuaneran = means_of_production_jinkoulinsuaneran;
    }

    public double getMeans_of_production_putongguolinsuangai() {
        return means_of_production_putongguolinsuangai;
    }

    public void setMeans_of_production_putongguolinsuangai(double means_of_production_putongguolinsuangai) {
        this.means_of_production_putongguolinsuangai = means_of_production_putongguolinsuangai;
    }

    public double getMeans_of_production_gaimeilinfei() {
        return means_of_production_gaimeilinfei;
    }

    public void setMeans_of_production_gaimeilinfei(double means_of_production_gaimeilinfei) {
        this.means_of_production_gaimeilinfei = means_of_production_gaimeilinfei;
    }

    public double getMeans_of_production_guochanlvhuagai() {
        return means_of_production_guochanlvhuagai;
    }

    public void setMeans_of_production_guochanlvhuagai(double means_of_production_guochanlvhuagai) {
        this.means_of_production_guochanlvhuagai = means_of_production_guochanlvhuagai;
    }

    public double getMeans_of_production_guochanfuhefei1() {
        return means_of_production_guochanfuhefei1;
    }

    public void setMeans_of_production_guochanfuhefei1(double means_of_production_guochanfuhefei1) {
        this.means_of_production_guochanfuhefei1 = means_of_production_guochanfuhefei1;
    }

    public double getMeans_of_production_guochanfuhefei2() {
        return means_of_production_guochanfuhefei2;
    }

    public void setMeans_of_production_guochanfuhefei2(double means_of_production_guochanfuhefei2) {
        this.means_of_production_guochanfuhefei2 = means_of_production_guochanfuhefei2;
    }

    public double getMeans_of_production_guochanfuhefei3() {
        return means_of_production_guochanfuhefei3;
    }

    public void setMeans_of_production_guochanfuhefei3(double means_of_production_guochanfuhefei3) {
        this.means_of_production_guochanfuhefei3 = means_of_production_guochanfuhefei3;
    }

    public double getMeans_of_production_dimo() {
        return means_of_production_dimo;
    }

    public void setMeans_of_production_dimo(double means_of_production_dimo) {
        this.means_of_production_dimo = means_of_production_dimo;
    }

    public double getMeans_of_production_putongpengmo() {
        return means_of_production_putongpengmo;
    }

    public void setMeans_of_production_putongpengmo(double means_of_production_putongpengmo) {
        this.means_of_production_putongpengmo = means_of_production_putongpengmo;
    }

    public double getMeans_of_production_nongyongchaiyou() {
        return means_of_production_nongyongchaiyou;
    }

    public void setMeans_of_production_nongyongchaiyou(double means_of_production_nongyongchaiyou) {
        this.means_of_production_nongyongchaiyou = means_of_production_nongyongchaiyou;
    }

    public double getMeans_of_production_yufeizhupeihesiliao() {
        return means_of_production_yufeizhupeihesiliao;
    }

    public void setMeans_of_production_yufeizhupeihesiliao(double means_of_production_yufeizhupeihesiliao) {
        this.means_of_production_yufeizhupeihesiliao = means_of_production_yufeizhupeihesiliao;
    }

    public double getMeans_of_production_danjipeihesiliao() {
        return means_of_production_danjipeihesiliao;
    }

    public void setMeans_of_production_danjipeihesiliao(double means_of_production_danjipeihesiliao) {
        this.means_of_production_danjipeihesiliao = means_of_production_danjipeihesiliao;
    }

}
