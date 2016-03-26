package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.CropYieldSummary;
import abrs.system.dao.CropYieldSummaryDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Edifi_000 on 2016-03-27.
 */

@Service
public class CropYieldSummaryService {
    private static Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private CropYieldSummaryDao cropYieldSummaryDao;

    public boolean addItem(String village, String corp_name,
                           String total_of_fifteen_itemid,
                           List<String> list_itemid,
                           String simple_average_itemid)
    {
        CropYieldSummary cropYieldSummary = new CropYieldSummary();
        cropYieldSummary.setVillage(village);
        cropYieldSummary.setCorp_name(corp_name);
        cropYieldSummary.setTotal_of_fifteen_itemid(total_of_fifteen_itemid);
        cropYieldSummary.setList_itemid(list_itemid);
        cropYieldSummary.setSimple_average_itemid(simple_average_itemid);

        cropYieldSummaryDao.save(cropYieldSummary);
        logger.info("Add CropYieldSummary");
        return true;
    }

    public CropYieldSummary getItem(String id)
    {
        return cropYieldSummaryDao.queryById(id);
    }

    public long getCount() {
        return cropYieldSummaryDao.getCount(new Query());
    }

    public boolean updateItem(CropYieldSummary cropYieldSummary)
    {
        cropYieldSummaryDao.save(cropYieldSummary);
        logger.info("Update CropYieldSummary");
        return true;
    }

    public void remove(String id)
    {
        cropYieldSummaryDao.deleteById(id);
    }

    public List<CropYieldSummary> getItems(int start, int size){
        return cropYieldSummaryDao.getPage(new Query(), start, size);
    }
}
