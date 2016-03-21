package abrs.system.mobile;

import abrs.system.JUnit4ClassRunner;
import org.junit.*;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;

@RunWith(JUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/mvc-dispatcher-servlet.xml")
public class UserTests {
    private MockMvc mockMvc;

    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Autowired
    protected WebApplicationContext wac;

    @Before
    public void setup() {
        this.mockMvc = webAppContextSetup(this.wac).build();
    }

    @Test
    public void loginOK() throws Exception {
//        MvcResult result = mockMvc.perform(post("/mobile/user/login").param("username", "admin").param("password", "admin"))
//                .andExpect(status().is3xxRedirection())
//                .andExpect(view().name("redirect:/mobile/exam/add"))
//                .andExpect(model().attributeExists("message"))
//                .andDo(MockMvcResultHandlers.print())
//                .andReturn();
//        Map<String, Object> models = result.getModelAndView().getModel();
//        Assert.assertNotNull(models.get("message"));
    }

    @Test
    public void loginFail() throws Exception {
//        MvcResult result = mockMvc.perform(post("/mobile/user/login").param("username", "admin").param("password", ""))
//                .andExpect(status().isOk())
//                .andExpect(view().name("mobile/user"))
//                .andExpect(model().hasErrors())
//                .andDo(MockMvcResultHandlers.print())
//                .andReturn();
    }
}
