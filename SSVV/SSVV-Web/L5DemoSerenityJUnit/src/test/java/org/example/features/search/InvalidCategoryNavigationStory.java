package org.example.features.search;

import net.serenitybdd.junit.runners.SerenityParameterizedRunner;
import net.thucydides.core.annotations.Steps;
import net.thucydides.junit.annotations.Qualifier;
import net.thucydides.junit.annotations.UseTestDataFrom;
import org.example.steps.serenity.MagentoEndUserSteps;
import org.junit.Assume;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(SerenityParameterizedRunner.class)
@UseTestDataFrom("src/test/resources/MagentoInvalidSearchCategory.csv")
public class InvalidCategoryNavigationStory {

    private String topMenu;
    private String subMenu;
    private String category;
    private String searchResult;

    @Qualifier
    public String getTopMenu() {
        return topMenu;
    }

    @Qualifier
    public String getCategory() {
        return category;
    }

    @Qualifier
    public String getSubMenu() {
        return subMenu;
    }

    @Qualifier
    public String getSearchResult() {
        return searchResult;
    }

    @Steps
    public MagentoEndUserSteps endUser;

    @Test
    public void user_should_be_able_to_navigate_to_given_category_invalid() {
        endUser.is_the_home_page();
        endUser.navigate_to_category(getTopMenu(), getSubMenu(), getCategory());
        endUser.should_not_see_product_with_title(getSearchResult());
        //endUser.should_see_the_first_product_with_expoected_name(getSearchResult());
    }
}