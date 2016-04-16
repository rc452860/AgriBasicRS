package abrs.system.aspect;

import java.lang.annotation.*;

/**
 * 权限注解
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Auth {
    Role role() default Role.NONE;

    public enum Role{ NONE, USER, ADMIN,SUPERADMIN};
}
