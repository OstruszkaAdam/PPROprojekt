package cz.uhk.ppro.dima;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import java.util.Locale;

@SpringBootApplication
public class DimaApplication {

    public static void main(String[] args) {
        SpringApplication.run(DimaApplication.class, args);
    }


    @Bean
    public LocaleResolver localeResolver() {
        SessionLocaleResolver slr = new SessionLocaleResolver();
        slr.setDefaultLocale(Locale.ENGLISH);
        return slr;
    }
   /* In this case we use the SessionLocaleResolver which stores the selected locale (= language) in the user’s session.
   Also, we set the default locale to be English.
*/


    /* Next, let’s add a way to make the locale selectable via a query parameter in our URL. We can do this by adding a LocaleChangeInterceptor: */
    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
        lci.setParamName("lang");
        return lci;
    }

   // @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());
    }
    /* This interceptor allows us to overwrite the current locale by providing a locale name via the lang parameter, e.g. http://localhost:8080/?lang=de. */
}
