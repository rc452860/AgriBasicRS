package abrs.system.dao.Entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by Edifi_000 on 2016-03-23.
 */
/**
 * 夏粮、夏收油菜籽产量预计主表信息
 */
@Document(collection = "SummerFoodAndRapeseedExpecPro")
public class SummerFoodAndRapeseedExpecPro {
    @Id
    private String id;

    private int survey_village_num; //调查村数

    private int survey_family_num;//调查户数

    private String food_itemid; //夏粮(ItemID)

    private String food_xiaomai_food_itemid;//其中：小麦(ItemID)

    private String rapeseed_youcaizi_itemid; //油菜籽(ItemID)

    public SummerFoodAndRapeseedExpecPro(){}

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

    public String getFood_xiaomai_food_itemid() {
        return food_xiaomai_food_itemid;
    }

    public void setFood_xiaomai_food_itemid(String food_xiaomai_food_itemid) {
        this.food_xiaomai_food_itemid = food_xiaomai_food_itemid;
    }

    public String getRapeseed_youcaizi_itemid() {
        return rapeseed_youcaizi_itemid;
    }

    public void setRapeseed_youcaizi_itemid(String rapeseed_youcaizi_itemid) {
        this.rapeseed_youcaizi_itemid = rapeseed_youcaizi_itemid;
    }
}
