package org.example.pages;

import net.serenitybdd.core.annotations.findby.FindBy;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.Issue;
import net.thucydides.core.pages.PageObject;
import org.junit.Test;
import org.openqa.selenium.*;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.awt.Robot;
import java.awt.MouseInfo;
import java.awt.Point;


import java.time.Duration;
import java.util.List;
import java.util.stream.Collectors;

import static io.vavr.API.$;
import static net.thucydides.core.webdriver.ThucydidesWebDriverSupport.getDriver;

@DefaultUrl("https://magento.softwaretestingboard.com/")
public class Magento extends PageObject
{
    @FindBy(id="email")
    private WebElementFacade emailLogin;

    @FindBy(id="pass")
    private WebElementFacade passwordLogin;

    @FindBy(id="send2")
    private WebElementFacade loginButton;

    @FindBy(css = "a.product-item-link")
    private WebElementFacade firstProductTitle;

    public String getFirstProductTitle() {
        return firstProductTitle.getText().trim();
    }

    public void waitForProductsToLoad() {
        WebDriver driver = getDriver();
        WebDriverWait wait = new WebDriverWait(driver, 15);
        By productTitleSelector = By.cssSelector("a.product-item-link");

        // Wait for product elements to exist
        wait.until(ExpectedConditions.numberOfElementsToBeMoreThan(productTitleSelector, 0));

        // Wait until all have non-empty text (means DOM + JS rendering complete)
        wait.until(driver1 -> {
            List<WebElement> elements = driver1.findElements(productTitleSelector);
            return elements.stream().allMatch(e -> {
                try {
                    return !e.getText().trim().isEmpty();
                } catch (StaleElementReferenceException ex) {
                    return false;
                }
            });
        });

        System.out.println("Product grid is stable and fully populated.");
    }

    public List<String> getAllProductTitles() {
        By productTitleSelector = By.cssSelector("a.product-item-link");
        WebDriver driver = getDriver();

        for (int i = 0; i < 3; i++) {
            try {
                List<WebElement> products = driver.findElements(productTitleSelector);
                return products.stream()
                        .map(e -> e.getText().trim())
                        .filter(s -> !s.isEmpty())
                        .collect(Collectors.toList());
            } catch (StaleElementReferenceException e) {
                System.out.println("⚠️ Caught stale element, retrying... Attempt " + (i + 1));
                try { Thread.sleep(1000); } catch (InterruptedException ignored) {}
            }
        }
        throw new RuntimeException("Failed to get stable product titles after 3 attempts.");
    }


    public void moveRealMouseOffScreen() {
        try {
            Robot robot = new Robot();
            robot.mouseMove(0, 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void press_sing_in_Button() {
        $(By.cssSelector("li.authorization-link a")).click();
    }

    public String get_current_url() {
        String currentUrl = getDriver().getCurrentUrl();
        return currentUrl;
    }

    public void enter_login_data(String email, String password) {
        emailLogin.type(email);
        passwordLogin.type(password);
    }

    public void press_login_button()
    {
        loginButton.click();
    }

    public String getErrorMessage() {
        return $(By.cssSelector(".message-error")).getText();
    }

    public void hover_and_click_on_submenus(String topLevelMenu, String subMenu, String finalCategory) {
        moveRealMouseOffScreen();
        WebDriver driver = getDriver();
        Actions actions = new Actions(driver);
        WebDriverWait wait = new WebDriverWait(driver, 10);

        // Wait for and hover over top-level menu
        WebElement topMenu = wait.until(ExpectedConditions.visibilityOfElementLocated(By.linkText(topLevelMenu)));
        actions.moveToElement(topMenu).perform();
        System.out.println("Hovvered over top menu..");

        // Wait for and hover over sub-menu
        WebElement subMenuElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.linkText(subMenu)));
        actions.moveToElement(subMenuElement).perform();
        System.out.println("Hovvered over sub menu..");

        // Wait for and click final category
        WebElement categoryElement = wait.until(ExpectedConditions.elementToBeClickable(By.linkText(finalCategory)));
        System.out.println("clicked the button!");
        actions.moveToElement(categoryElement).click().perform();
    }

}
