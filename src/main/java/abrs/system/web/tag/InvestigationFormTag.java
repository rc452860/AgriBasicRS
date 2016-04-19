package abrs.system.web.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * Created by Edifi_000 on 2016-04-20.
 */
public class InvestigationFormTag extends TagSupport {
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
            switch (num)
            {
                case 0:
                    out.print("意向调查");
                    break;
                case 1:
                    out.print("预计调查");
                    break;
                default:
                    out.print("");
                    break;
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return super.doStartTag();
    }
}
