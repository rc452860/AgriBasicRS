package abrs.system.aspect;

import abrs.system.web.context.SessionContext;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.Map;

@Component
@Aspect
public class MobileAuth {

    @Autowired
    HttpSession session;

    private static Logger logger = LoggerFactory.getLogger(MobileAuth.class);

    @Around("execution(String *.*(..)) && @annotation(auth)")
    public Object checkAuth(ProceedingJoinPoint point, Auth auth) throws Throwable {
        if (auth.role() != Auth.Role.NONE) {
            if (session.getAttribute(SessionContext.CURRENT_USER) == null) {
                return "redirect:/mobile/login";
            } else {
                Auth.Role role = (Auth.Role) session.getAttribute(SessionContext.CURRENT_USER_ROLE);
                if (role.ordinal() >= auth.role().ordinal()) {
                    return point.proceed();
                } else {
                    return "redirect:/mobile/login";
                }
            }
        } else {
            return point.proceed();
        }
    }

    @Around("execution(java.util.Map<String, Object> *.*(..)) && @annotation(auth)")
    public Object checkAuthAjax(ProceedingJoinPoint point, Auth auth) throws Throwable {
        Map<String, Object> map = new HashMap<String, Object>();
        if (auth.role() != Auth.Role.NONE) {
            if (session.getAttribute(SessionContext.CURRENT_USER) == null) {
                map.put("message", "权限不足");
                return map;
            } else {
                Auth.Role role = (Auth.Role) session.getAttribute(SessionContext.CURRENT_USER_ROLE);
                if (role.ordinal() >= auth.role().ordinal()) {
                    return point.proceed();
                } else {
                    map.put("message", "权限不足");
                    return map;
                }
            }
        } else {
            return point.proceed();
        }
    }
}
