package abrs.system.service;

import abrs.system.dao.Entity.AutumnFoodExpecPro;
import abrs.system.dao.Entity.ExpectedProductionItem;
import abrs.system.dao.AutumnFoodExpecProDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Edifi_000 on 2016-03-25.
 */
@Service
public class AutumnFoodExpecProService {
    private static Logger logger = LoggerFactory.getLogger(AutumnFoodExpecProService.class);

    @Autowired
    private AutumnFoodExpecProDao autumnFoodExpecProDao;

    public boolean addItem(AutumnFoodExpecPro autumnFoodExpecPro)
    {
        autumnFoodExpecProDao.save(autumnFoodExpecPro);
        return true;
    }

    public boolean addItem(String registration_form_id,int survey_village_num,int survey_family_num,
                           ExpectedProductionItem food_item,ExpectedProductionItem food_zhongdaoyijidao_item,ExpectedProductionItem food_shuangjiwandao_item,ExpectedProductionItem food_yumi_item,ExpectedProductionItem food_dadou_item,
                           ExpectedProductionItem rapeseed_item,ExpectedProductionItem rapeseed_huasheng_item,
                           ExpectedProductionItem cotton_item,
                           ExpectedProductionItem sugar_item)
    {
        addItem(registration_form_id,survey_village_num,survey_family_num,
                food_item.getId(),food_zhongdaoyijidao_item.getId(),food_shuangjiwandao_item.getId(),food_yumi_item.getId(),food_dadou_item.getId(),
                rapeseed_item.getId(),rapeseed_huasheng_item.getId(),
                cotton_item.getId(),
                sugar_item.getId());
        return true;
    }

    public boolean addItem(String registration_form_id,int survey_village_num,int survey_family_num,
                           String food_itemid,String food_zhongdaoyijidao_itemid,String food_shuangjiwandao_itemid,String food_yumi_itemid,String food_dadou_itemid,
                           String rapeseed_itemid,String rapeseed_huasheng_itemid,
                           String cotton_itemid,
                           String sugar_itemid)
    {
        AutumnFoodExpecPro autumnFoodExpecPro = new AutumnFoodExpecPro();
        autumnFoodExpecPro.setRegistration_form_id(registration_form_id);
        autumnFoodExpecPro.setSurvey_village_num(survey_village_num);
        autumnFoodExpecPro.setSurvey_family_num(survey_family_num);

        autumnFoodExpecPro.setFood_itemid(food_itemid);
        autumnFoodExpecPro.setFood_zhongdaoyijidao_itemid(food_zhongdaoyijidao_itemid);
        autumnFoodExpecPro.setFood_shuangjiwandao_itemid(food_shuangjiwandao_itemid);
        autumnFoodExpecPro.setFood_yumi_itemid(food_yumi_itemid);
        autumnFoodExpecPro.setFood_dadou_itemid(food_dadou_itemid);

        autumnFoodExpecPro.setRapeseed_itemid(rapeseed_itemid);
        autumnFoodExpecPro.setRapeseed_huasheng_itemid(rapeseed_huasheng_itemid);

        autumnFoodExpecPro.setCotton_itemid(cotton_itemid);

        autumnFoodExpecPro.setSugar_itemid(sugar_itemid);

        autumnFoodExpecProDao.save(autumnFoodExpecPro);
        return true;
    }

    public AutumnFoodExpecPro getItem(String id)
    {
        return autumnFoodExpecProDao.queryById(id);
    }

    public long getCount() {
        return autumnFoodExpecProDao.getCount(new Query());
    }

    public boolean updateItem(AutumnFoodExpecPro autumnFoodExpecPro)
    {
        autumnFoodExpecProDao.save(autumnFoodExpecPro);
        logger.info("Update autumnFoodExpecPro");
        return true;
    }

    public void remove(String id)
    {
        autumnFoodExpecProDao.deleteById(id);
    }

    public List<AutumnFoodExpecPro> getItems(int start, int size){
        return autumnFoodExpecProDao.getPage(new Query(), start, size);
    }
}
