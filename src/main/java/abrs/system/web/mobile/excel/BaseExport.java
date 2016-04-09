package abrs.system.web.mobile.excel;

import abrs.system.dao.Entity.RegistrationForm;

/**
 * Created by Edifi_000 on 2016-04-09.
 */
public class BaseExport {

    private RegistrationForm registrationForm;

    public String getClassName()
    {
        return this.getClass().getName();
    }
}
