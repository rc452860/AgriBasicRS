package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.AutumnWinterPlantsIntention;
import abrs.system.dao.AutumnWinterPlantsIntentionDao;
import abrs.system.web.context.SessionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Edifi_000 on 2016-03-25.
 */

@Service
public class AutumnWinterPlantsIntentionService {
    private static Logger logger = LoggerFactory.getLogger(AutumnWinterPlantsIntentionService.class);

    @Autowired
    private AutumnWinterPlantsIntentionDao autumnWinterPlantsIntentionDao;
    @Autowired
    HttpSession session;
    public boolean addItem(AutumnWinterPlantsIntention autumnWinterPlantsIntention)
    {
        String farmerId = (String) session.getAttribute(SessionContext.CURRENT_FARMER_ID);
        autumnWinterPlantsIntention.setFarmer_id(farmerId);
        autumnWinterPlantsIntentionDao.save(autumnWinterPlantsIntention);
        logger.info("Add AutumnWinterPlantsIntention" );
        return true;
    }

    public AutumnWinterPlantsIntention getItem(String id)
    {
        return autumnWinterPlantsIntentionDao.queryById(id);
    }

    public long getCount() {
        return autumnWinterPlantsIntentionDao.getCount(new Query());
    }

    public boolean updateItem(AutumnWinterPlantsIntention autumnWinterPlantsIntention)
    {
        autumnWinterPlantsIntentionDao.save(autumnWinterPlantsIntention);
        logger.info("Update AutumnWinterPlantsIntention");
        return true;
    }

    public void remove(String id)
    {
        autumnWinterPlantsIntentionDao.deleteById(id);
    }

    public void removeMulit(String[] ids){
        autumnWinterPlantsIntentionDao.deleteByIdMulit(ids);
    }

    public List<AutumnWinterPlantsIntention> getItems(int start, int size){
        return autumnWinterPlantsIntentionDao.getPage(new Query(), start, size);
    }
}
