package abrs.system.dao.Entity;

/**
 * Created by Edifi_000 on 2016-04-17.
 */

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 调查表工作流状态信息管理
 */
@Document(collection = "RegistrationFormWorkFlow")
public class RegistrationFormWorkFlow {

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getAggregation_id() {
        return aggregation_id;
    }

    public void setAggregation_id(String aggregation_id) {
        this.aggregation_id = aggregation_id;
    }

    public String getRegion_id() {
        return region_id;
    }

    public void setRegion_id(String region_id) {
        this.region_id = region_id;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getResult_content() {
        return result_content;
    }

    public void setResult_content(String result_content) {
        this.result_content = result_content;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    @Id
    private String id;

    private String name;//名称

    private String class_name;//流程类名称

    private int no;//序号

    private String aggregation_id;//流程聚合编号

    private String region_id;//当前处理区域id

    private int result;//处理结果 0为未处理 1为通过 -1为拒绝

    private String result_content;//处理意见内容

    private String user_id;//处理人

    private int flag;//用于逻辑删除流程使用0为正常 -1为删除
}
