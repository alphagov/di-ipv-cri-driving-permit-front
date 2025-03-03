const commonExpress = require("@govuk-one-login/di-ipv-cri-common-express");
const { getGTM, getLanguageToggle } = commonExpress.lib.locals;
const setScenarioHeaders = commonExpress.lib.scenarioHeaders;
const setAxiosDefaults = commonExpress.lib.axios;

const steps = require("./app/drivingLicence/steps");
const fields = require("./app/drivingLicence/fields");
const featureSets = require("./app/drivingLicence/featureSets");

const wizard = require("hmpo-form-wizard");

const init = (router) => {

  router.use(getGTM);
  router.use(getLanguageToggle);
  router.use(setScenarioHeaders);
  router.use(setAxiosDefaults);
  router.use(featureSets);

  router.use("/oauth2", commonExpress.routes.oauth2);

  const wizardOptions = {
    name: "cri-driving-licence-front",
    journeyName: "drivingLicence",
    templatePath: "drivingLicence"
  };

  router.use(wizard(steps, fields, wizardOptions));

  router.use(commonExpress.lib.errorHandling.redirectAsErrorToCallback);
};

module.exports = { init };
