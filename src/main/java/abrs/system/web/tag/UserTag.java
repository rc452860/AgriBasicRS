package abrs.system.web.tag;

import abrs.system.dao.Entity.User;
import abrs.system.service.UserService;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import javax.servlet.jsp.JspWriter;

/**
 * Created by Edifi_000 on 2016-04-20.
 */
public class UserTag extends RequestContextAwareTag {

    String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    UserService service;

    @Override
    protected int doStartTagInternal() throws Exception {
        service = (UserService)getRequestContext().getWebApplicationContext().getBean(UserService.class);
        User user = service.getItem(id);
        JspWriter jspWriter = pageContext.getOut();
        try{
            if(user!=null)
                jspWriter.write(user.getName());
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }
}
