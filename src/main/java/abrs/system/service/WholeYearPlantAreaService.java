package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.WholeYearPlantArea;
import abrs.system.dao.WholeYearPlantAreaDao;
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
public class WholeYearPlantAreaService {
    private static Logger logger = LoggerFactory.getLogger(WholeYearPlantAreaService.class);

    @Autowired
    private WholeYearPlantAreaDao wholeYearPlantAreaDao;

    public boolean addItem(WholeYearPlantArea wholeYearPlantArea)
    {
        wholeYearPlantAreaDao.save(wholeYearPlantArea);
        logger.info("Add WholeYearPlantArea");
        return true;
    }

    public boolean addItem(String registration_form_id,
                           int form_tag,
                           double plant_total,
                           double food_total,double food_summerl,
                           double food_grain_daogu_zaodao,double food_grain_daogu_zhongdao,double food_grain_daogu_wandao,double food_grain_xiaomai,double food_grain_yumi,double food_grain_guzi,double food_grain_gaoliang,double food_grain_other,
                           double food_legume, double food_legume_dadou,
                           double food_potato,double food_potato_malingshu,
                           double oilplant_total,double oilplant_huasheng,double oilplant_youcaizi,double oilplant_zhima,
                           double cotton_total,
                           double rawjute_total,double rawjute_hongma,
                           double sugar_total,double sugar_ganzhe,double sugar_tiancai,
                           double tobacco_total,double tobacco_kaoyan,
                           double vegetables_total,
                           double fruit_total,
                           double otherplant_total,double otherplant_qingsiliaol)
    {
        WholeYearPlantArea wholeYearPlantArea = new WholeYearPlantArea();
        wholeYearPlantArea.setRegistration_form_id(registration_form_id);
        wholeYearPlantArea.setForm_tag(form_tag);
        wholeYearPlantArea.setPlant_total(plant_total);

        wholeYearPlantArea.setFood_total(food_total);
        wholeYearPlantArea.setFood_summerl(food_summerl);
        wholeYearPlantArea.setFood_grain(food_grain_daogu_zaodao + food_grain_daogu_zhongdao + food_grain_daogu_wandao + food_grain_xiaomai + food_grain_yumi + food_grain_guzi + food_grain_gaoliang + food_grain_other);
        wholeYearPlantArea.setFood_grain_daogu(food_grain_daogu_zaodao + food_grain_daogu_zhongdao + food_grain_daogu_wandao);
        wholeYearPlantArea.setFood_grain_daogu_zaodao(food_grain_daogu_zaodao);
        wholeYearPlantArea.setFood_grain_daogu_zhongdao(food_grain_daogu_zhongdao);
        wholeYearPlantArea.setFood_grain_daogu_wandao(food_grain_daogu_wandao);
        wholeYearPlantArea.setFood_grain_xiaomai(food_grain_xiaomai);
        wholeYearPlantArea.setFood_grain_yumi(food_grain_yumi);
        wholeYearPlantArea.setFood_grain_guzi(food_grain_guzi);
        wholeYearPlantArea.setFood_grain_gaoliang(food_grain_gaoliang);
        wholeYearPlantArea.setFood_grain_other(food_grain_other);

        wholeYearPlantArea.setFood_legume(food_legume);
        if(food_legume<food_legume_dadou)
            return false;
        wholeYearPlantArea.setFood_legume_dadou(food_legume_dadou);

        wholeYearPlantArea.setFood_potato(food_potato);
        if(food_potato<food_potato_malingshu)
            return false;
        wholeYearPlantArea.setFood_potato_malingshu(food_potato_malingshu);

        wholeYearPlantArea.setOilplant_total(oilplant_total);
        if(oilplant_total<(oilplant_huasheng+oilplant_youcaizi+oilplant_zhima))
            return false;
        wholeYearPlantArea.setOilplant_huasheng(oilplant_huasheng);
        wholeYearPlantArea.setOilplant_youcaizi(oilplant_youcaizi);
        wholeYearPlantArea.setOilplant_zhima(oilplant_zhima);

        wholeYearPlantArea.setCotton_total(cotton_total);

        wholeYearPlantArea.setRawjute_total(rawjute_total);
        wholeYearPlantArea.setRawjute_hongma(rawjute_hongma);

        wholeYearPlantArea.setSugar_total(sugar_total);
        wholeYearPlantArea.setSugar_ganzhe(sugar_ganzhe);
        wholeYearPlantArea.setSugar_tiancai(sugar_tiancai);

        wholeYearPlantArea.setTobacco_total(tobacco_total);
        wholeYearPlantArea.setTobacco_kaoyan(tobacco_kaoyan);

        wholeYearPlantArea.setVegetables_total(vegetables_total);

        wholeYearPlantArea.setFruit_total(fruit_total);

        wholeYearPlantArea.setOtherplant_total(otherplant_total);
        wholeYearPlantArea.setOtherplant_qingsiliaol(otherplant_qingsiliaol);

        wholeYearPlantAreaDao.save(wholeYearPlantArea);
        logger.info("Add WholeYearPlantArea");
        return true;
    }

    public WholeYearPlantArea getItem(String id)
    {
        return wholeYearPlantAreaDao.queryById(id);
    }

    public WholeYearPlantArea getItemByNo(String no)
    {
        Query query = new Query();
        query.addCriteria(Criteria.where("no").is(no));
        WholeYearPlantArea wholeYearPlantArea = wholeYearPlantAreaDao.queryOne(query);
        return wholeYearPlantArea;
    }

    public long getCount() {
        return wholeYearPlantAreaDao.getCount(new Query());
    }

    public boolean updateItem(WholeYearPlantArea wholeYearPlantArea)
    {
        wholeYearPlantAreaDao.save(wholeYearPlantArea);
        logger.info("Update WholeYearPlantArea");
        return true;
    }

    public void remove(String id)
    {
        wholeYearPlantAreaDao.deleteById(id);
    }

    public List<WholeYearPlantArea> getItems(int start, int size){
        return wholeYearPlantAreaDao.getPage(new Query(), start, size);
    }

    public void removeMulit(String[] ids) {
        wholeYearPlantAreaDao.deleteByIdMulit(ids);
    }
}
