package abrs.system.web.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Edifi_000 on 2016-04-20.
 */
public class FormTypeTag extends TagSupport {

    public String getFormtype() {
        return formtype;
    }

    public void setFormtype(String formtype) {
        this.formtype = formtype;
    }
    private String formtype;

    Map<String,String> hash = new HashMap<String, String>(){
        {
            put("autumnFoodExpecPro", "秋收作物产量预计");
            put("autumnWinterPlantsIntention", "秋冬作物播种面积意向调查");
            put("costBenefitOfPig", "出栏肥猪生产成本、收益");
            put("costBenefitProductivityOfPlant", "种植业产品生产成本、收益与劳动生产率");
            put("cropYieldSummary", "农作物产量调查汇总");
            put("manage", "农户基本信息");
            put("productsAndMeansFarmerPrice", "主要农产品和农业生产资料价格监测旬报表(农户售价)");
            put("productsAndMeansMarketPrice", "主要农产品和农业生产资料价格监测旬报表(市场价格)");
            put("summerFoodAndRapeseedExpecPro", "夏粮、夏收油菜籽产量预计");
            put("WholeYearPlantArea", "全年农作物播种面积意向（预计）调查");
        }
    };

    @Override
    public int doStartTag() throws JspException {
        try {
            JspWriter out = this.pageContext.getOut();
            if(hash.containsKey(formtype))
            {
                out.print(hash.get(formtype));
            }
            else
            {
                out.print("");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return super.doStartTag();
    }
}
