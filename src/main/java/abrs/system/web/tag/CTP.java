package abrs.system.web.tag;

import abrs.system.service.RegionService;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import javax.servlet.jsp.JspWriter;

/**
 * Created by rc452 on 2016/4/13.
 */
//RequestContextAwareTag tagSupport
public class CTP extends RequestContextAwareTag {
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    String code;


    RegionService regionService;




    @Override
    protected int doStartTagInternal() throws Exception {
        JspWriter jspWriter = pageContext.getOut();
        try {
            regionService = (RegionService)getRequestContext().getWebApplicationContext().getBean(RegionService.class);
            jspWriter.print(regionService.getByCode(code).getName());

        }catch (Exception e){
            e.printStackTrace();
        }

        return 0;
    }
}
