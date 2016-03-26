package abrs.system.dao.Entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by Edifi_000 on 2016-03-25.
 */
/**
 * 秋收作物产量预计主表信息
 */
@Document(collection = "AutumnFoodExpecPro")
public class AutumnFoodExpecPro {
    @Id
    private String id;

    private int survey_village_num; //调查村数

    private int survey_family_num;//调查户数

    private String food_itemid; //秋粮(ItemID)
    private String food_zhongdaoyijidao_itemid; //其中：中稻及一季稻
    private String food_shuangjiwandao_itemid; //双季晚稻
    private String food_yumi_itemid; //玉米
    private String food_dadou_itemid; //大豆

    private String rapeseed_itemid; //油料
    private String rapeseed_huasheng_itemid; //其中：花生

    private String cotton_itemid; //棉花

    private String sugar_itemid;//糖料（甘蔗）

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getSurvey_village_num() {
        return survey_village_num;
    }

    public void setSurvey_village_num(int survey_village_num) {
        this.survey_village_num = survey_village_num;
    }

    public int getSurvey_family_num() {
        return survey_family_num;
    }

    public void setSurvey_family_num(int survey_family_num) {
        this.survey_family_num = survey_family_num;
    }

    public String getFood_itemid() {
        return food_itemid;
    }

    public void setFood_itemid(String food_itemid) {
        this.food_itemid = food_itemid;
    }

    public String getFood_zhongdaoyijidao_itemid() {
        return food_zhongdaoyijidao_itemid;
    }

    public void setFood_zhongdaoyijidao_itemid(String food_zhongdaoyijidao_itemid) {
        this.food_zhongdaoyijidao_itemid = food_zhongdaoyijidao_itemid;
    }

    public String getFood_shuangjiwandao_itemid() {
        return food_shuangjiwandao_itemid;
    }

    public void setFood_shuangjiwandao_itemid(String food_shuangjiwandao_itemid) {
        this.food_shuangjiwandao_itemid = food_shuangjiwandao_itemid;
    }

    public String getFood_yumi_itemid() {
        return food_yumi_itemid;
    }

    public void setFood_yumi_itemid(String food_yumi_itemid) {
        this.food_yumi_itemid = food_yumi_itemid;
    }

    public String getFood_dadou_itemid() {
        return food_dadou_itemid;
    }

    public void setFood_dadou_itemid(String food_dadou_itemid) {
        this.food_dadou_itemid = food_dadou_itemid;
    }

    public String getRapeseed_itemid() {
        return rapeseed_itemid;
    }

    public void setRapeseed_itemid(String rapeseed_itemid) {
        this.rapeseed_itemid = rapeseed_itemid;
    }

    public String getRapeseed_huasheng_itemid() {
        return rapeseed_huasheng_itemid;
    }

    public void setRapeseed_huasheng_itemid(String rapeseed_huasheng_itemid) {
        this.rapeseed_huasheng_itemid = rapeseed_huasheng_itemid;
    }

    public String getCotton_itemid() {
        return cotton_itemid;
    }

    public void setCotton_itemid(String cotton_itemid) {
        this.cotton_itemid = cotton_itemid;
    }

    public String getSugar_itemid() {
        return sugar_itemid;
    }

    public void setSugar_itemid(String sugar_itemid) {
        this.sugar_itemid = sugar_itemid;
    }
}
