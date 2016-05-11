package abrs.system.aspect;

import abrs.system.dao.Entity.User;
import abrs.system.web.context.SessionContext;
import org.apache.poi.ss.formula.functions.Intercept;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by rc452 on 2016/5/10.
 */
@Component
@Aspect
public class ChooseFarmer {

    @Autowired
    HttpSession session;

    private static Logger logger = LoggerFactory.getLogger(MobileAuth.class);

    @Around("execution(String *.*(..)) && @annotation(auth) && @annotation(cfAspect)")
    public Object CF(ProceedingJoinPoint point, Auth auth,CFAspect cfAspect) throws Throwable {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Auth.Role role = (Auth.Role) session.getAttribute(SessionContext.CURRENT_USER_ROLE);
        Integer count = (Integer) session.getAttribute(SessionContext.ACCESS_COUNT);
        if (role.ordinal() > Auth.Role.INFOADMIN.ordinal()
                &&request.getMethod().equals("GET")
                &&(count==null||count==0)){
            String  requireLink= request.getRequestURI()+"?"+request.getQueryString();
            session.setAttribute(SessionContext.ACCESS_LINK,requireLink);
            return "redirect:/mobile/region/getUnderRegionFarmerPage";
        }
        session.setAttribute(SessionContext.ACCESS_COUNT,0);
        return point.proceed();
    }
}
