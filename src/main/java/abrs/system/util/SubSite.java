package abrs.system.util;


import java.util.*;

/**
 * 分支机构站点列表
 */
public class SubSite {
    public static Map<String, String> getMap()
    {
        Map<String, String> sites = new HashMap<String, String>();
        sites.put(""," ");
        sites.put("WMO","WMO");
        sites.put("学校","学校");
        return sites;
    }
}
