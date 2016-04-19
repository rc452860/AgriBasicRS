package abrs.system.web.tag;

import abrs.system.dao.Entity.RegistrationForm;
import abrs.system.service.RegistrationFormService;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import javax.servlet.jsp.JspWriter;

/**
 * Created by rc452 on 2016/4/19.
 */
public class CTR extends RequestContextAwareTag {

    String code;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    RegistrationFormService registrationFormService;

    @Override
    protected int doStartTagInternal() throws Exception {
        registrationFormService = (RegistrationFormService)getRequestContext().getWebApplicationContext().getBean(RegistrationFormService.class);
        RegistrationForm registrationForm = registrationFormService.getByCode(code);
        JspWriter jspWriter = pageContext.getOut();
        try{
            if(registrationForm!=null)
                jspWriter.write(registrationForm.getName());
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }
}
