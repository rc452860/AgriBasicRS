package abrs.system.web.mobile.excel;

import abrs.system.dao.Entity.AutumnFoodExpecPro;
import abrs.system.dao.Entity.ExpectedProductionItem;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Edifi_000 on 2016-04-10.
 */
public class EntiyToMapHelper {


    private  Object entity = null;

    public EntiyToMapHelper(Object _entity)
    {
        entity = _entity;
    }

    public Map<String,String> GetStringInfoMap()
    {
        Map<String,String> dicStringInfo = new HashMap<String, String>();
        List entityListProp = getFiledsInfo(entity,"");
        for (int i=0;i<entityListProp.size();i++)
        {
            Map infoMap = (Map)entityListProp.get(i);
            String type = infoMap.get("type").toString();
            if(type.equals("class java.lang.String"))
            {
                if(infoMap.get("value")!=null)
                {
                    dicStringInfo.put("@{"+infoMap.get("name").toString()+"}",infoMap.get("value").toString());
                }
            }
        }
        return dicStringInfo;
    }

    public Map<String,Double> GetDoubleInfoMap()
    {
        Map<String,Double> dicDoubleInfo = new HashMap<String,Double>();
        List entityListProp = getFiledsInfo(entity,"");
        for (int i=0;i<entityListProp.size();i++)
        {
            Map infoMap = (Map)entityListProp.get(i);
            String type = infoMap.get("type").toString();
            if(type.equals("class java.lang.Double")||type.equals("class java.lang.Integer")
                    ||type.equals("int")||type.equals("double"))
            {
                if(infoMap.get("value")!=null)
                    dicDoubleInfo.put("@{"+infoMap.get("name").toString()+"}",Double.valueOf(infoMap.get("value").toString()));
            }
        }
        return dicDoubleInfo;
    }

    /**
     * 根据属性名获取属性值
     * */
    private Object getFieldValueByName(String fieldName, Object o) {
        try {
            String firstLetter = fieldName.substring(0, 1).toUpperCase();
            String getter = "get" + firstLetter + fieldName.substring(1);
            Method method = o.getClass().getMethod(getter, new Class[] {});
            Object value = method.invoke(o, new Object[] {});
            return value;
        } catch (Exception e) {
            //log.error(e.getMessage(),e);
            return null;
        }
    }


    /**
     * 获取属性类型(type)，属性名(name)，属性值(value)的map组成的list
     * */
    private List getFiledsInfo(Object o,String FiledsHead){
        Field[] fields=o.getClass().getDeclaredFields();
        List list = new ArrayList();
        Map infoMap=null;
        for(int i=0;i<fields.length;i++){

            infoMap = new HashMap();
            infoMap.put("type", fields[i].getType().toString());
            infoMap.put("name", FiledsHead+fields[i].getName());
            infoMap.put("value", getFieldValueByName(fields[i].getName(), o));


            if((infoMap.get("type").equals(AutumnFoodExpecPro.class.toString())//数据实体类型的节点
                    ||infoMap.get("type").equals(ExpectedProductionItem.class.toString()))
                    &&infoMap.get("value")!=null)
            {
                List childList = getFiledsInfo(infoMap.get("value"), infoMap.get("name")+".");
                list.addAll(childList);
            }
            else if(infoMap.get("type").equals(ExpectedProductionItem[].class.toString())&&infoMap.get("value")!=null)//列表类型的节点
            {
                ExpectedProductionItem[] li = (ExpectedProductionItem[])infoMap.get("value");
                for (int z=0;z<li.length;z++)
                {
                    if(li[z]!=null) {
                        List childList = getFiledsInfo(li[z], infoMap.get("name") + "[" + z + "].");
                        list.addAll(childList);
                    }
                }
            }
            else//叶子节点进行记录
            {
                list.add(infoMap);
            }
        }
        return list;
    }
}
