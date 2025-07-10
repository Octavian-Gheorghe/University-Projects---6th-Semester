package org.example.features.login;


import net.serenitybdd.junit.runners.SerenityParameterizedRunner;
import net.thucydides.core.annotations.Issue;
import net.thucydides.core.annotations.Managed;
import net.thucydides.core.annotations.Steps;
import net.thucydides.junit.annotations.Qualifier;
import net.thucydides.junit.annotations.UseTestDataFrom;
import org.example.steps.serenity.MagentoEndUserSteps;
import org.junit.Assume;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.openqa.selenium.WebDriver;

import java.util.Objects;

@RunWith(SerenityParameterizedRunner.class)
@UseTestDataFrom("src/test/resources/MagentoInvalidLoginData.csv")
public class InvalidLoginStory {

    @Managed(uniqueSession = true)
    public WebDriver webdriver;

    @Steps
    public MagentoEndUserSteps endUser;

    public String email;
    public String password;

    @Qualifier
    public String getEmail() {
        return email;
    }

    @Qualifier
    public String getPasssword() {
        return password;
    }

    @Issue("#WIKI-1")
    @Test
    public void attempting_to_login_with_invalid_data() {
        endUser.is_the_home_page();
        endUser.attempt_to_login();
        endUser.should_be_on_right_login_page();
        endUser.attempt_to_insert_login_data(getEmail(), getPasssword());
        endUser.attempt_to_click_login_button();
        endUser.should_see_login_error_message();
    }
}
