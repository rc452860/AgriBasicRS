package abrs.system.util;

import java.util.List;

/**
 * Created by rc452 on 2016/4/12.
 */
public class Combotree {
    String id;
    String text;
    String state;
    List<Combotree> children;

    public List<Combotree> getChildren() {
        return children;
    }

    public void setChildren(List<Combotree> children) {
        this.children = children;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

}
