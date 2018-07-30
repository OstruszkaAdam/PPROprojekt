package cz.uhk.ppro.dima.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;


@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(classes={DimaApplication.class})
//@WebMvcTest(value = RegistrationController.class, secure = false)
@SpringBootTest
@AutoConfigureMockMvc
public class RegistrationControllerTests {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private RegistrationController registrationController;

    @Before
    public void setup() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/jsp/");
        viewResolver.setSuffix(".jsp");

        this.mockMvc = MockMvcBuilders.standaloneSetup(registrationController).setViewResolvers(viewResolver).build();
    }

    // mely by uspesne probehnout nasledujici 3 testy (ve vypisu bude Tests run: 3)
    @Test
    public void contextLoads() throws Exception {
        assertThat(registrationController).isNotNull();
    }

    @Test
    public void testInitRegistrationForm() throws Exception {
        mockMvc.perform(get("/registration"))
                .andExpect(status().isOk())
                .andExpect(model().attributeExists("user"))
                .andExpect(view().name("userRegistration"));
    }

    @Test
    public void testProcessRegistrationFormSuccess() throws Exception {
        mockMvc.perform(post("/registration")
                .param("username", UUID.randomUUID().toString())
                .param("password", "123456")
                .param("passwordRepeat", "123456")
                .param("email", "test@test.test")
                .param("firstName", "Pokud tohle vidis")
                .param("lastName", "Pak je vsechno OK")
        )
                .andExpect(status().is3xxRedirection())
                .andExpect(view().name("redirect:/login"));
    }

}
