package abrs.system.web.tag;


import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class MapTag  extends TagSupport {


    @Override
    public int doStartTag() throws JspException {
        JspWriter out = this.pageContext.getOut();
        try {
            out.print("MapTag doStartTag");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return super.doStartTag();
    }
}
