package cz.uhk.ppro.dima.model;
import org.junit.Test;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.sql.Timestamp;
import java.util.Locale;
import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;

public class ValidatorTests {

    private Validator createValidator() {
        LocalValidatorFactoryBean localValidatorFactoryBean = new LocalValidatorFactoryBean();
        localValidatorFactoryBean.afterPropertiesSet();
        return localValidatorFactoryBean;
    }

    // mel by uspesne probehnout nasledujic 1 test (ve vypisu bude Tests run: 3)
    @Test
    public void shouldNotValidateWhenUsernameEmpty() {
        LocaleContextHolder.setLocale(Locale.ENGLISH);
        User user = new User();
        user.setUsername("");
        user.setFirstname("Test");
        user.setSurname("Test");
        user.setPassword("test");
        user.setEmail("test@test.test");
        user.setPhone("456798123");
        user.setCreationTime(new Timestamp(System.currentTimeMillis()));

        Validator validator = createValidator();
        Set<ConstraintViolation<User>> constraintViolations = validator.validate(user);

        assertThat(constraintViolations.size()).isEqualTo(1);
        ConstraintViolation<User> violation = constraintViolations.iterator().next();
        assertThat(violation.getPropertyPath().toString()).isEqualTo("username");
        assertThat(violation.getMessage()).isEqualTo("may not be empty");
    }

    @Test
    public void shouldNotValidateWhenEmailEmpty() {
        LocaleContextHolder.setLocale(Locale.ENGLISH);
        User user = new User();
        user.setUsername("Test");
        user.setFirstname("Test");
        user.setSurname("Test");
        user.setPassword("test");
        user.setEmail("");
        user.setPhone("456798123");
        user.setCreationTime(new Timestamp(System.currentTimeMillis()));

        Validator validator = createValidator();
        Set<ConstraintViolation<User>> constraintViolations = validator.validate(user);

        assertThat(constraintViolations.size()).isEqualTo(1);
        ConstraintViolation<User> violation = constraintViolations.iterator().next();
        assertThat(violation.getPropertyPath().toString()).isEqualTo("email");
        assertThat(violation.getMessage()).isEqualTo("may not be empty");
    }

    @Test
    public void shouldNotValidateWhenPasswordEmpty() {
        LocaleContextHolder.setLocale(Locale.ENGLISH);
        User user = new User();
        user.setUsername("Test");
        user.setFirstname("Test");
        user.setSurname("Test");
        user.setPassword("");
        user.setEmail("test@test.test");
        user.setPhone("456798123");
        user.setCreationTime(new Timestamp(System.currentTimeMillis()));

        Validator validator = createValidator();
        Set<ConstraintViolation<User>> constraintViolations = validator.validate(user);

        assertThat(constraintViolations.size()).isEqualTo(1);
        ConstraintViolation<User> violation = constraintViolations.iterator().next();
        assertThat(violation.getPropertyPath().toString()).isEqualTo("password");
        assertThat(violation.getMessage()).isEqualTo("may not be empty");
    }

}