const { expect: expect } = require("chai");

module.exports = class PlaywrightDevPage {
  /**
   * @param {import('@playwright/test').Page} page
   */
  constructor(page) {
    this.page = page;
    this.url = "http://localhost:5030/licence-issuer";
    this.radioBtnDVLA = this.page.getByLabel("DVLA");
    this.radioBtnDVA = this.page.getByLabel("DVA");
    this.radioBtnNoDrivingLicence = this.page.locator(
      'xpath=//*[@id="licenceIssuer-noLicence"]'
    );
    this.CTButton = this.page.locator('xpath=//*[@id="submitButton"]');
    this.betaBanner = this.page.locator("xpath=/html/body/div[2]/div");
    this.betaBannerText = this.page.locator(
      "xpath=/html/body/div[2]/div/p/span"
    );
    this.betaBannerFeedbackLink = this.page.locator(
      "xpath=/html/body/div[2]/div/p/span/a"
    );
    this.feedbackPageTitle = this.page.locator(
      'xpath=//*[@id="main-content"]/div/div/h1'
    );
    this.cookieBanner = this.page.locator(
      'xpath=//*[@id="cookies-banner-main"]'
    );
    this.cookieAcceptButton = this.page.locator(
      'xpath=//*[@id="cookies-banner-main"]/div[2]/button[1]'
    );
    this.cookieRejectButton = this.page.locator(
      'xpath=//*[@id="cookies-banner-main"]/div[2]/button[2]'
    );
    this.cookieAcceptedTestDisplayed = this.page.locator(
      'xpath=//*[@id="cookies-accepted"]/div[1]/div/div/p'
    );
    this.cookieRejectedTestDisplayed = this.page.locator(
      'xpath=//*[@id="cookies-rejected"]/div[1]'
    );
    this.hideThisMessageAcceptedButton = this.page.locator(
      'xpath=//*[@id="cookies-accepted"]/div[2]/a'
    );
    this.hideThisMessageRejectedButton = this.page.locator(
      'xpath=//*[@id="cookies-rejected"]/div[2]/a'
    );
    this.viewCookiesLink = this.page.locator(
      'xpath=//*[@id="cookies-banner-main"]/div[2]/a'
    );
    this.cookiesPageTitle = this.page.locator(
      'xpath=//*[@id="main-content"]/div/div/h1'
    );
    this.changeYourCookiesSettingsLink = this.page.locator(
      'xpath=//*[@id="cookies-accepted"]/div[1]/div/div/p/a'
    );
    this.dvlaRadioLabelText = this.page.locator(
      'xpath=//*[@id="licenceIssuer-DVLA-label"]'
    );
    this.dvlaRadioLabelHintText = this.page.locator(
      'xpath=//*[@id="licenceIssuer-item-hint"]'
    );
    this.dvaRadioLabelHintText = this.page.locator(
      'xpath=//*[@id="licenceIssuer-DVA-item-hint"]'
    );
    this.dvaRadioLabelText = this.page.locator(
      'xpath=//*[@id="licenceIssuer-DVA-label"]'
    );
    this.doNotHaveDrivingLicenceRadioLabelText = this.page.locator(
      'xpath=//*[@id="licenceIssuer-noLicence-label"]'
    );
    this.whyWeNeedToSeeThisDropDownLink = this.page.locator(
      'xpath=//*[@id="main-content"]/div/div/form/details/summary/span'
    );
    this.whyWeNeedToSeeThisDropDownText = this.page.locator(
      'xpath=//*[@id="main-content"]/div/div/form/details/div'
    );
    this.accessibilityStatementLink = this.page.locator(
      "xpath=/html/body/footer/div/div/div[1]/ul/li[1]/a"
    );
    this.accessibilityStatementPageTitle = this.page.locator(
      'xpath=//*[@id="main-content"]/div/div/h1'
    );
    this.cookiesLink = this.page.locator(
      "xpath=/html/body/footer/div/div/div[1]/ul/li[2]/a"
    );
    this.termsAndConditionsLink = this.page.locator(
      "xpath=/html/body/footer/div/div/div[1]/ul/li[3]/a"
    );
    this.termsAndConditionsPageTitle = this.page.locator(
      'xpath=//*[@id="main-content"]/div/div/h1'
    );
    this.privacyNoticeLink = this.page.locator(
      "xpath=/html/body/footer/div/div/div[1]/ul/li[4]/a"
    );
    this.privacyNoticePageTitle = this.page.locator(
      'xpath=//*[@id="main-content"]/div/div/h1'
    );
    this.supportLink = this.page.locator(
      "xpath=/html/body/footer/div/div/div[1]/ul/li[5]/a"
    );
    this.supportPageTitle = this.page.locator(
      'xpath=//*[@id="main-content"]/div/div/h1'
    );
    this.crownCopyrightLink = this.page.locator(
      "xpath=/html/body/footer/div/div/div[2]/a"
    );
    this.crownCopyrightPageTitle = this.page.locator(
      'xpath=//*[@id="primary"]/div/div[1]/div/div/article/div[1]/h1'
    );
    this.openGovernmentLicenceLinkText = this.page.locator(
      "xpath=/html/body/footer/div/div/div[1]/span"
    );
    this.openGovernmentLicenceLink = this.page.locator(
      "xpath=/html/body/footer/div/div/div[1]/span/a"
    );
    this.openGovernmentLicencePageTitle = this.page.locator(
      'xpath=//*[@id="open-licence-logo"]'
    );
    this.govUkLink = this.page.locator(
      "xpath=/html/body/header/div/div/a/span/span"
    );
    this.govUkPageTitle = this.page.locator(
      'xpath=//*[@id="content"]/header/div/div[1]/h1/span[1]'
    );
    this.dlLandingPageTitle = this.page.locator('xpath=//*[@id="header"]');
    this.dlLandingPageTitleSummary = this.page.locator(
      'xpath=//*[@id="licenceIssuer-hint"]'
    );

    this.dlLandingPageErrorTitle = this.page.locator(
      'xpath=//*[@id="main-content"]/div[1]/div/h2'
    );
    this.dlLandingPageErrorTitleSummary = this.page.locator(
      'xpath=//*[@id="main-content"]/div[1]/div/div/ul/li/a'
    );
    this.dlLandingPageErrorHintSummary = this.page.locator(
      'xpath=//*[@id="licenceIssuer-error"]'
    );
  }

  isCurrentPage() {
    return this.page.url() === this.url;
  }

  async clickOnDVLARadioButton() {
    expect(await this.page.title()).to.equal(
      "Was your UK photocard driving licence issued by DVLA or DVA? – Prove your identity – GOV.UK One Login"
    );
    await this.radioBtnDVLA.click();
    await this.CTButton.click();
  }

  async continue() {
    await this.CTButton.click();
  }

  async clickOnDVARadioButton() {
    expect(await this.page.title()).to.equal(
      "Was your UK photocard driving licence issued by DVLA or DVA? – Prove your identity – GOV.UK One Login"
    );
    await this.radioBtnDVA.click();
    await this.CTButton.click();
  }

  async betaBannerDisplayed() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.betaBanner.isVisible();
  }

  async cookieBannerDisplayed() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.cookieBanner.isVisible();
  }

  async clickCookieAcceptButton() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.cookieAcceptButton.click();
  }

  async clickCookieRejectButton() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.cookieRejectButton.click();
  }

  async clickViewCookiesLink() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.viewCookiesLink.click();
  }

  async clickChangeCookieSettingsLink() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.page.evaluate(() => {
      const linkElement = document.querySelector(
        'div.govuk-cookie-banner__message > a.govuk-link[href="https://signin.account.gov.uk/cookies"]'
      );
      if (linkElement) {
        linkElement.click();
      }
    });
  }

  async selectDVLARadioButton() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.radioBtnDVLA.click();
  }

  async dvlaRadioButtonLabel(firstRadioButton) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.dvlaRadioLabelText.textContent()).to.contains(
      firstRadioButton
    );
  }

  async dvlaRadioButtonLabelHintText(firstRadioButtonHintText) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.dvlaRadioLabelHintText.textContent()).to.contains(
      firstRadioButtonHintText
    );
  }

  async dvaRadioButtonLabelHintText(secondRadioButtonHintText) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.dvaRadioLabelHintText.textContent()).to.contains(
      secondRadioButtonHintText
    );
  }

  async selectDVARadioButton() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.radioBtnDVA.click();
  }

  async dvaRadioButtonLabel(secondRadioButton) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.dvaRadioLabelText.textContent()).to.contains(
      secondRadioButton
    );
  }

  async selectNoDrivingLicenceRadioButton() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.radioBtnNoDrivingLicence.click();
  }

  async noDrivingLicenceRadioButtonLabel(thirdRadioButton) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(
      await this.doNotHaveDrivingLicenceRadioLabelText.textContent()
    ).to.contains(thirdRadioButton);
  }

  async dropDownSummaryLinkText(dropDownSummaryLinkText) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.whyWeNeedToSeeThisDropDownLink.textContent()).to.contains(
      dropDownSummaryLinkText
    );
  }

  async clickDropDownSummaryLink() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.whyWeNeedToSeeThisDropDownLink.click();
  }

  async assertDropDownLinkText(dropDownLinkText) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.whyWeNeedToSeeThisDropDownText.textContent()).to.contains(
      dropDownLinkText
    );
  }

  async assertCookieBannerAcceptText(cookieAcceptSummaryText) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.cookieAcceptedTestDisplayed.isVisible(cookieAcceptSummaryText);
  }

  async assertCookieBannerRejectText(cookieRejectSummaryText) {
    await this.page.waitForLoadState("domcontentloaded");
    this.cookieRejectedTestDisplayed.isVisible(cookieRejectSummaryText);
  }

  async assertBetaBannerText(betaBannerText) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.betaBannerText.innerText()).to.equal(betaBannerText);
  }

  async clickHideThisMessageCookieButton() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.page.evaluate(() => {
      const hiddenButton = document.querySelector(".cookie-hide-button");
      if (hiddenButton) {
        hiddenButton.click();
      }
    });
  }

  async assertCookiesPolicyPageTitle(cookiesPageTitle) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.cookiesPageTitle.isVisible(cookiesPageTitle);
  }

  async assertFeedbackPageTitle(feedbackPageTitle) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.feedbackPageTitle.isVisible(feedbackPageTitle);
  }

  async assertAccessibilityStatementPageTitle(accessibilityStatementPageTitle) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.accessibilityStatementPageTitle.isVisible(
      accessibilityStatementPageTitle
    );
  }

  async assertAccessibilityStatementLinkText(accessibilityStatementLinkText) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.accessibilityStatementLink.innerText()).to.equal(
      accessibilityStatementLinkText
    );
  }

  async clickAccessibilityStatementLink() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.accessibilityStatementLink.click();
  }

  async clickBetaBannerFeedbackLink() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.betaBannerFeedbackLink.click();
  }

  async assertCookiesLinkText(cookiesLinkText) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.cookiesLink.innerText()).to.equal(cookiesLinkText);
  }

  async clickCookiesLink() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.cookiesLink.click();
  }

  async assertTermsAndConditionsLinkText(termsAndConditionsLinkText) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.termsAndConditionsLink.innerText()).to.equal(
      termsAndConditionsLinkText
    );
  }

  async clickTermsAndConditionsLink() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.termsAndConditionsLink.click();
  }

  async assertTermsAndConditionsPageTitle(termsAndConditionsPageTitle) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.accessibilityStatementPageTitle.isVisible(
      termsAndConditionsPageTitle
    );
  }

  async assertPrivacyNoticeLinkText(privacyNoticeLinkText) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.privacyNoticeLink.innerText()).to.equal(
      privacyNoticeLinkText
    );
  }

  async clickPrivacyNoticeLink() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.privacyNoticeLink.click();
  }

  async assertPrivacyNoticePageTitle(privacyNoticePageTitle) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.privacyNoticePageTitle.isVisible(privacyNoticePageTitle);
  }

  async assertSupportLinkText(supportLinkText) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.supportLink.innerText()).to.equal(supportLinkText);
  }

  async clickSupportLink() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.supportLink.click();
  }

  async assertSupportPageTitle(supportPageTitle) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.supportPageTitle.isVisible(supportPageTitle);
  }

  async assertCrownCopyrightLinkText(crownCopyrightLinkText) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.crownCopyrightLink.innerText()).to.equal(
      crownCopyrightLinkText
    );
  }

  async clickCrownCopyrightLink() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.crownCopyrightLink.click();
  }

  async assertCrownCopyrightPageTitle(crownCopyrightPageTitle) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.crownCopyrightPageTitle.isVisible(crownCopyrightPageTitle);
  }

  async assertOpenGovernmentLicenceLinkText(openGovernmentLicenceLinkText) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.openGovernmentLicenceLinkText.innerText()).to.equal(
      openGovernmentLicenceLinkText
    );
  }

  async clickOpenGovernmentLicenceLink() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.openGovernmentLicenceLink.click();
  }

  async assertOpenGovernmentLicencePageTitle(openGovernmentLicencePageTitle) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.openGovernmentLicencePageTitle.isVisible(
      openGovernmentLicencePageTitle
    );
  }

  async assertGovUkLinkText(govUkLinkText) {
    await this.page.waitForLoadState("domcontentloaded");
    expect(await this.govUkLink.innerText()).to.equal(govUkLinkText);
  }

  async clickGovUkLink() {
    await this.page.waitForLoadState("domcontentloaded");
    await this.govUkLink.click();
  }

  async assertGovUkPageTitle(govUkPageTitle) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.govUkPageTitle.isVisible(govUkPageTitle);
  }

  async assertDlLandingPageTitle(dlLandingPageTitle) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.dlLandingPageTitle.isVisible(dlLandingPageTitle);
  }

  async assertDlLandingPageTitleSummary(dlLandingPageTitleSummary) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.dlLandingPageTitleSummary.isVisible(dlLandingPageTitleSummary);
  }

  async assertTitleError(noRadioButtonSelectTitleError) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.dlLandingPageErrorTitle.isVisible(noRadioButtonSelectTitleError);
  }

  async assertTitleErrorSummary(noRadioButtonSelectTitleSummaryError) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.dlLandingPageErrorTitleSummary.isVisible(
      noRadioButtonSelectTitleSummaryError
    );
  }

  async assertHintErrorSummary(noRadioButtonSelectHintSummaryError) {
    await this.page.waitForLoadState("domcontentloaded");
    await this.dlLandingPageErrorHintSummary.isVisible(
      noRadioButtonSelectHintSummaryError
    );
  }
};
