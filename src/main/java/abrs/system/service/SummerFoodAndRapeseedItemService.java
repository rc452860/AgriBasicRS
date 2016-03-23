package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.SummerFoodAndRapeseedItem;
import abrs.system.dao.SummerFoodAndRapeseedItemDao;
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
public class SummerFoodAndRapeseedItemService {
    private static Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private SummerFoodAndRapeseedItemDao summerFoodAndRapeseedItemDao;


    public boolean addItem(double seededarea_lastyear,double seededarea_thisyear,double seededarea_Increasedecrease_absolute,double seededarea_Increasedecrease_relative
            ,double perunit_lastyear,double perunit_thisyear,double perunit_Increasedecrease_absolute,double perunit_Increasedecrease_relative
            ,double total_lastyear,double total_thisyear,double total_Increasedecrease_absolute,double total_Increasedecrease_relative)
    {
        SummerFoodAndRapeseedItem summerFoodAndRapeseedItem = new SummerFoodAndRapeseedItem();

        summerFoodAndRapeseedItem.setSeededarea_lastyear(seededarea_lastyear);
        summerFoodAndRapeseedItem.setSeededarea_thisyear(seededarea_thisyear);
        summerFoodAndRapeseedItem.setSeededarea_Increasedecrease_absolute(seededarea_Increasedecrease_absolute);
        summerFoodAndRapeseedItem.setSeededarea_Increasedecrease_relative(seededarea_Increasedecrease_relative);

        summerFoodAndRapeseedItem.setPerunit_lastyear(perunit_lastyear);
        summerFoodAndRapeseedItem.setPerunit_thisyear(perunit_thisyear);
        summerFoodAndRapeseedItem.setPerunit_Increasedecrease_absolute(perunit_Increasedecrease_absolute);
        summerFoodAndRapeseedItem.setPerunit_Increasedecrease_relative(perunit_Increasedecrease_relative);

        summerFoodAndRapeseedItem.setTotal_lastyear(total_lastyear);
        summerFoodAndRapeseedItem.setTotal_thisyear(total_thisyear);
        summerFoodAndRapeseedItem.setTotal_Increasedecrease_absolute(total_Increasedecrease_absolute);
        summerFoodAndRapeseedItem.setTotal_Increasedecrease_relative(total_Increasedecrease_relative);

        summerFoodAndRapeseedItemDao.save(summerFoodAndRapeseedItem);
        logger.info("Add SummerFoodAndRapeseedItem");
        return true;
    }

    public SummerFoodAndRapeseedItem getItem(String id)
    {
        return summerFoodAndRapeseedItemDao.queryById(id);
    }

    public SummerFoodAndRapeseedItem getItemByNo(String no)
    {
        Query query = new Query();
        query.addCriteria(Criteria.where("no").is(no));
        SummerFoodAndRapeseedItem summerFoodAndRapeseedItem = summerFoodAndRapeseedItemDao.queryOne(query);
        return summerFoodAndRapeseedItem;
    }

    public long getCount() {
        return summerFoodAndRapeseedItemDao.getCount(new Query());
    }

    public boolean updateItem(SummerFoodAndRapeseedItem summerFoodAndRapeseedItem)
    {
        summerFoodAndRapeseedItemDao.save(summerFoodAndRapeseedItem);
        logger.info("Update SummerFoodAndRapeseedItem");
        return true;
    }

    public void remove(String id)
    {
        summerFoodAndRapeseedItemDao.deleteById(id);
    }

    public List<SummerFoodAndRapeseedItem> getItems(int start, int size){
        return summerFoodAndRapeseedItemDao.getPage(new Query(), start, size);
    }
}
