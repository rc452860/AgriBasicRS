package abrs.system.web.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class Num2CharTag extends TagSupport {
    private int num;

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Override
    public int doStartTag() throws JspException {
        try {
            JspWriter out = this.pageContext.getOut();
            out.print((char)((int)'A' + num));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return super.doStartTag();
    }
}
