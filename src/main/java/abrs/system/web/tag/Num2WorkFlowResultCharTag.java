package abrs.system.web.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * Created by Edifi_000 on 2016-04-20.
 */
public class Num2WorkFlowResultCharTag extends TagSupport {
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
            String result = "";
            switch (num)
            {
                case -1:
                    result = "拒绝";
                    break;
                case 0:
                    result = "未处理";
                    break;
                case 1:
                    result = "通过";
                    break;
            }
            out.print(result);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return super.doStartTag();
    }
}
