package org.example.steps.serenity;

import net.thucydides.core.annotations.Step;
import org.example.pages.Magento;

import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

public class MagentoEndUserSteps
{
    Magento magento;

    @Step
    public void is_the_home_page() {
        magento.open();
    }

    @Step
    public void attempt_to_login() {
        magento.press_sing_in_Button();
    }

    @Step
    public void attempt_to_insert_login_data(String email, String password) {
        magento.enter_login_data(email, password);
    }

    @Step
    public void attempt_to_click_login_button() {
        magento.press_login_button();
    }

    @Step
    public void should_be_on_right_login_page() {
        String currentUrl = magento.get_current_url();
        assertThat(currentUrl, containsString("login"));
    }

    @Step
    public void should_be_on_the_main_page() {
        String currentUrl = magento.get_current_url();
        assertThat(currentUrl, comparesEqualTo("https://magento.softwaretestingboard.com/"));
    }

    @Step
    public void should_see_login_error_message() {
        String actualMessage = magento.getErrorMessage();
        assertThat(actualMessage, containsString("incorrect"));
    }

    @Step
    public void navigate_to_category(String topMenu, String subMenu, String category) {
        magento.hover_and_click_on_submenus(topMenu, subMenu, category);
    }

    @Step
    public void should_see_product_with_title(String expectedTitle) {
        // Wait until product grid is loaded before proceeding
        magento.waitForProductsToLoad();

        List<String> actualTitles = magento.getAllProductTitles();
        boolean exists = false;
        for (String actualTitle : actualTitles) {
            System.out.println(actualTitle + " ---- " + expectedTitle);
            if (actualTitle.contains(expectedTitle)) {
                assertThat(actualTitle, containsString(expectedTitle));
                exists = true;
                break;
            }
        }
        if (!exists) {
            assertThat("Expected title not found", actualTitles.get(actualTitles.size() - 1), containsString(expectedTitle));
        }
    }

    @Step
    public void should_not_see_product_with_title(String expectedTitle) {
        // Wait until product grid is loaded before proceeding
        magento.waitForProductsToLoad();

        List<String> actualTitles = magento.getAllProductTitles();
        boolean exists = false;
        for (String actualTitle : actualTitles) {
            System.out.println(actualTitle + " ---- " + expectedTitle);
            if (actualTitle.contains(expectedTitle)) {
                exists = true;
                break;
            }
        }
        if (exists) {
            assertThat("Expected title not found", actualTitles.get(actualTitles.size() - 1), containsString(expectedTitle));
        }
    }

    @Step
    public void should_see_the_first_product_with_expoected_name(String expectedTitle) {
        String actualTitle = magento.getFirstProductTitle();
        assertThat(actualTitle, containsString(expectedTitle));
    }
}
