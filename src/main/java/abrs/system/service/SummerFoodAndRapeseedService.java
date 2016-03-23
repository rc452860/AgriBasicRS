package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.SummerFoodAndRapeseed;
import abrs.system.dao.Entity.SummerFoodAndRapeseedItem;
import abrs.system.dao.SummerFoodAndRapeseedDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Edifi_000 on 2016-03-24.
 */

@Service
public class SummerFoodAndRapeseedService {
    private static Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private SummerFoodAndRapeseedDao summerFoodAndRapeseedDao;

    private int survey_village_num; //调查村数

    private int survey_family_num;//调查户数

    private String food_itemid; //夏粮(ItemID)

    private String food_xiaomai_food_itemid;//其中：小麦(ItemID)

    private String rapeseed_food_itemid; //油菜籽(ItemID)

    public boolean addItem(int survey_village_num,int survey_family_num,SummerFoodAndRapeseedItem food_item,SummerFoodAndRapeseedItem food_xiaomai_food_item,SummerFoodAndRapeseedItem rapeseed_food_item)
    {
        addItem(survey_village_num,survey_family_num,food_item.getId(),food_xiaomai_food_item.getId(),rapeseed_food_item.getId());
        return true;
    }

    public boolean addItem(int survey_village_num,int survey_family_num,String food_itemid,String food_xiaomai_food_itemid,String rapeseed_food_itemid)
    {
        SummerFoodAndRapeseed summerFoodAndRapeseed = new SummerFoodAndRapeseed();
        summerFoodAndRapeseed.setFood_itemid(food_itemid);
        summerFoodAndRapeseed.setFood_xiaomai_food_itemid(food_xiaomai_food_itemid);
        summerFoodAndRapeseed.setRapeseed_food_itemid(rapeseed_food_itemid);
        summerFoodAndRapeseedDao.save(summerFoodAndRapeseed);
        logger.info("Add SummerFoodAndRapeseed: " + survey_village_num + "/" + survey_family_num);
        return true;
    }

    public SummerFoodAndRapeseed getItem(String id)
    {
        return summerFoodAndRapeseedDao.queryById(id);
    }

    public SummerFoodAndRapeseed getItemByNo(String no)
    {
        Query query = new Query();
        query.addCriteria(Criteria.where("no").is(no));
        SummerFoodAndRapeseed summerFoodAndRapeseed = summerFoodAndRapeseedDao.queryOne(query);
        return summerFoodAndRapeseed;
    }

    public long getCount() {
        return summerFoodAndRapeseedDao.getCount(new Query());
    }

    public boolean updateItem(SummerFoodAndRapeseed region)
    {
        summerFoodAndRapeseedDao.save(region);
        logger.info("Update SummerFoodAndRapeseed");
        return true;
    }

    public void remove(String id)
    {
        summerFoodAndRapeseedDao.deleteById(id);
    }

    public List<SummerFoodAndRapeseed> getItems(int start, int size){
        return summerFoodAndRapeseedDao.getPage(new Query(), start, size);
    }
}
