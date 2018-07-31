package cz.uhk.ppro.dima.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

/*vyuziva Spring Web Security*/
@Configuration /* rekne aplikaci, ze se jedna o tridu obsahujici konfigurace. Ty by jinak mohly byt obsazeny jeste v souboru web.xml */
@EnableJpaRepositories
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    UserDetailsService userDetailsService;

    /* Přístupová oprávnění pomocí Security Expressions - lze konfigurovat takto v javě nebo pomocí XML*/
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
            .antMatchers("/registration/**", "/login").anonymous()

                .and()
            .authorizeRequests()
            .antMatchers("/articles/new/**", "/articles/*/edit", "/users/**", "/graph/**").authenticated()

                .and()
            .authorizeRequests()
            .antMatchers("/", "/articles/**").permitAll()

                .and()
            .formLogin()
            .loginPage("/login")
            .defaultSuccessUrl("/")
            .usernameParameter("username")
            .passwordParameter("password")

                .and()
            .logout()
            .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
            .logoutSuccessUrl("/");
        /*By default, a logout request invalidates the session, clears any authentication caches, clears the SecurityContextHolder and redirects to login page.*/
    }





    /* Nastaveni enkoderu hesla. S timto enkoderem pak pracuje UserService.java  pri registraci uzivatele */
    /* BCrypt si sám generuje náhodnou sůl; výsledné Stringy mají délku 60 */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }




    /* Nastaveni enkoderu hesla pro prihlasovani uzivatele - cast 1*/
    @Bean
    public DaoAuthenticationProvider authProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider(); //definovani providera autentizace uzivatelu
        authProvider.setUserDetailsService(userDetailsService); // injektovani nasi implmenetace userDetailsService
        authProvider.setPasswordEncoder(passwordEncoder()); // povoleni enkoderu hesel
        return authProvider;
    }

    /* Nastaveni enkoderu hesla pro prihlasovani uzivatele - cast 2*/
    /* Zde pouze predame nasi aplikaci referenci na authProvider, coz lze udelat takto nebo pres XML */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authProvider());
    }





    /* Ignore any request that starts with .... */
    /* Opet lze nakonfigurovat zde v jave nebo pres XML */
    @Override
    public void configure(WebSecurity web) throws Exception {
        // zdroje dat pro staticke stranky
        web.ignoring().antMatchers("/css/**");
        web.ignoring().antMatchers("/static/**");
        web.ignoring().antMatchers("/scripts/**");
    // zdroje dat pro dynamicke stranky
        web.ignoring().antMatchers("/resources/css/**");
        web.ignoring().antMatchers("/resources/images/**");
        web.ignoring().antMatchers("/resources/graphs/**");
        web.ignoring().antMatchers("/resources/js/**");
        web.ignoring().antMatchers("/resources/lib/**");

    }
}

