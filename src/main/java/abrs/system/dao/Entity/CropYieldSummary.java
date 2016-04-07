package abrs.system.dao.Entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

/**
 * Created by Edifi_000 on 2016-03-27.
 */
/**
 * 农作物产量调查汇总表
 */
@Document(collection = "CropYieldSummary")
public class CropYieldSummary {
    @Id
    private String id;

    private String registration_form_id;//调查表编号

    private String corp_name;//作物名称

    private String total_of_fifteen_itemid;//15基点户合计

    private List<String> list_itemid;//农作物产量明细

    private String simple_average_itemid;//简单平均单产

    public CropYieldSummary(){}

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

    public String getCorp_name() {
        return corp_name;
    }

    public void setCorp_name(String corp_name) {
        this.corp_name = corp_name;
    }

    public String getTotal_of_fifteen_itemid() {
        return total_of_fifteen_itemid;
    }

    public void setTotal_of_fifteen_itemid(String total_of_fifteen_itemid) {
        this.total_of_fifteen_itemid = total_of_fifteen_itemid;
    }

    public List<String> getList_itemid() {
        return list_itemid;
    }

    public void setList_itemid(List<String> list_itemid) {
        this.list_itemid = list_itemid;
    }

    public String getSimple_average_itemid() {
        return simple_average_itemid;
    }

    public void setSimple_average_itemid(String simple_average_itemid) {
        this.simple_average_itemid = simple_average_itemid;
    }
}
