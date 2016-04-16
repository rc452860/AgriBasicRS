package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.SummerFoodAndRapeseedExpecPro;
import abrs.system.dao.Entity.ExpectedProductionItem;
import abrs.system.dao.SummerFoodAndRapeseedExpecProDao;
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
public class SummerFoodAndRapeseedExpecProService {
    private static Logger logger = LoggerFactory.getLogger(SummerFoodAndRapeseedExpecProService.class);

    @Autowired
    private SummerFoodAndRapeseedExpecProDao summerFoodAndRapeseedDao;

    private int survey_village_num; //�������

    private int survey_family_num;//���黧��

    private String food_itemid; //����(ItemID)

    private String food_xiaomai_food_itemid;//���У�С��(ItemID)

    private String rapeseed_food_itemid; //�Ͳ���(ItemID)

    public boolean addItem(SummerFoodAndRapeseedExpecPro summerFoodAndRapeseed)
    {
        summerFoodAndRapeseedDao.save(summerFoodAndRapeseed);
        logger.info("Add SummerFoodAndRapeseed");
        return true;
    }

    public boolean addItem(String registration_form_id,int survey_village_num,int survey_family_num,ExpectedProductionItem food_item,ExpectedProductionItem food_xiaomai_food_item,ExpectedProductionItem rapeseed_food_item)
    {
        addItem(registration_form_id, survey_village_num, survey_family_num, food_item.getId(), food_xiaomai_food_item.getId(), rapeseed_food_item.getId());
        return true;
    }

    public boolean addItem(String registration_form_id,int survey_village_num,int survey_family_num,String food_itemid,String food_xiaomai_food_itemid,String rapeseed_youcaizi_itemid)
    {
        SummerFoodAndRapeseedExpecPro summerFoodAndRapeseed = new SummerFoodAndRapeseedExpecPro();
        summerFoodAndRapeseed.setRegistration_form_id(registration_form_id);
        summerFoodAndRapeseed.setFood_itemid(food_itemid);
        summerFoodAndRapeseed.setFood_xiaomai_food_itemid(food_xiaomai_food_itemid);
        summerFoodAndRapeseed.setRapeseed_youcaizi_itemid(rapeseed_youcaizi_itemid);
        summerFoodAndRapeseedDao.save(summerFoodAndRapeseed);
        logger.info("Add SummerFoodAndRapeseed: " + survey_village_num + "/" + survey_family_num);
        return true;
    }

    public SummerFoodAndRapeseedExpecPro getItem(String id)
    {
        return summerFoodAndRapeseedDao.queryById(id);
    }

    public SummerFoodAndRapeseedExpecPro getItemByNo(String no)
    {
        Query query = new Query();
        query.addCriteria(Criteria.where("no").is(no));
        SummerFoodAndRapeseedExpecPro summerFoodAndRapeseed = summerFoodAndRapeseedDao.queryOne(query);
        return summerFoodAndRapeseed;
    }

    public long getCount() {
        return summerFoodAndRapeseedDao.getCount(new Query());
    }

    public boolean updateItem(SummerFoodAndRapeseedExpecPro region)
    {
        summerFoodAndRapeseedDao.save(region);
        logger.info("Update SummerFoodAndRapeseed");
        return true;
    }

    public void remove(String id)
    {
        summerFoodAndRapeseedDao.deleteById(id);
    }

    public void removeMulit(String[] ids){
        summerFoodAndRapeseedDao.deleteByIdMulit(ids);
    }

    public List<SummerFoodAndRapeseedExpecPro> getItems(int start, int size){
        return summerFoodAndRapeseedDao.getPage(new Query(), start, size);
    }
}
