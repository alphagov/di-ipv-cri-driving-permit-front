const details = require("./controllers/details");
const root = require("./controllers/root");
const validate = require("./controllers/validate");
const proveAnotherWay = require("./controllers/prove-another-way");
const licenceIssuer = require("./controllers/licence-issuer")

module.exports = {
  "/": {
    resetJourney: true,
    entryPoint: true,
    skip: true,
    controller: root,
    next: "licence-issuer",
  },
  "/licence-issuer": {
    controller: licenceIssuer,
    fields: ["licenceIssuerRadio"],
    next: licenceIssuer.prototype.next,
  },
  "/details": {
    fields: [
      "surname",
      "firstName",
      "middleNames",
      "dateOfBirth",
      "dvaDateOfBirth",
      "issueDate",
      "dateOfIssue",
      "expiryDate",
      "drivingLicenceNumber",
      "dvaLicenceNumber",
      "issueNumber",
      "postcode",
      "dvlaDependent",
      "dvaDependent",
      "consentDVACheckbox",
    ],
    controller: details,
    next: "validate",
  },
  "/prove-another-way": {
    prereqs: ["/drivingLicence/"],
    controller: proveAnotherWay,
    fields: ["proveAnotherWayRadio"],
    next: proveAnotherWay.prototype.next,
  },
  "/validate": {
    controller: validate,
    skip: true,
    next: validate.prototype.next,
  },
};
