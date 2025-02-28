@mock-api:dl-failed @mock-api:dl-success @success @DVA
Feature: DVA Driving licence CRI Error Validations - Welsh Translation

  Background:
    Given Authenticatable Anita is using the system
    And they have provided their details
    And they have started the DL journey
    And I click on DVA radio button and Continue
    And I add a cookie to change the language to Welsh

  @mock-api:dva-PageHeading @language-regression
  Scenario:User Selects DVA and landed in DVA page and Page title and sub-text
    Given I check the page title Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Then I see the heading Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru
    And I see sentence Os nad oes gennych drwydded yrru y DU neu os na allwch gofio'ch manylion, gallwch brofi pwy ydych chi mewn ffordd arall yn lle.

  @mock-api:dva-WelshBetaBanner @language-regression
  Scenario: Beta Banner
    Given I view the beta banner
    And the beta banner reads Mae hwn yn wasanaeth newydd – bydd eich adborth (agor mewn tab newydd) yn ein helpu i'w wella.

  @mock-api:dva-WelshBetaBanner @language-regression
  Scenario: Footer Links and Text
    Given I see the accessibility statement link Datganiad hygyrchedd
    And I see the cookies link Cwcis
    And I see the terms and conditions link Telerau ac amodau
    And I see the privacy notice link Hysbysiad preifatrwydd
    And I see the support link Cymorth (agor mewn tab newydd)
    And I see the OLG link Trwydded Llywodraeth Agored v3.0
    And I see the crown copyright link © Hawlfraint y goron

  @mock-api:dva-NameFiled @language-regression
  Scenario: DVA Name fields
    Given I can see the lastname as Enw olaf
    And I can see the givenName as Enwau a roddwyd
    And I can see the firstName as Enw cyntaf
    And I can see the middleName as Enwau canol
    And I can see the first name sentence Mae hwn yn adran 2 o'ch trwydded. Nid oes angen i chi gynnwys eich teitl.
    And I can see the middle name sentence Gadewch hyn yn wag os nad oes gennych unrhyw enwau canol

  @mock-api:dva-DoBField @language-regression
  Scenario: DVA DoB Field
    Given I can see the DVA DoB fields titled Dyddiad geni
    Then I can see DVA DoB example DVA as Er enghraifft, 5 9 1973
     Then I can see DVA day as Diwrnod
     And I can see DVA month as Mis
     And I can see DVA year as Blwyddyn

  @mock-api:dva-IssueField @language-regression
  Scenario: DVA Issue date field
    Given I see the DVA Issue date field titled Dyddiad cyhoeddi
    Then I see DVA date section example as Dyma'r dyddiad yn adran 4a o'ch trwydded, er enghraifft 27 5 2019
    Then I can see DVA Issue day as Diwrnod
    And I can see DVA issue month as Mis
    And I can see DVA issue year as Blwyddyn

  @mock-api:dva-ValidToDateField @language-regression
  Scenario: DVLA Valid to date field
    Given I can see the Valid to date field titled Yn ddilys tan
    And I can see Valid to date sentence as Dyma'r dyddiad yn adran 4b o'ch trwydded, er enghraifft 27 5 2019
    Then I can see Valid To day as Diwrnod
    And I can see Valid To month as Mis
    Then I can see Valid To year as Blwyddyn

  @mock-api:dva-LicenceField @language-regression
  Scenario: DVA Licence number
    Given I can see DVA licence number field titled as Rhif trwydded
    And I see the DVA licence sentence as Dyma'r rhif hir yn adran 5 ar eich trwydded

  @mock-api:dva-PostcodeField @language-regression
  Scenario: DVA Postcode
    Given I can see the postcode field titled Cod post
    Then I can see postcode sentence as Rhowch y cod post yn y cyfeiriad yn adran 8 o'ch trwydded

  @mock-api:dva-ConsentSection @validation-regression @Language-regression
  Scenario: DVA Driving Licence privacy notice link to consent
    Given I see the consent title section Caniatau DVA i wirio eich manylion trwydded yrru
    And I see the DVA Consent first sentence Mae DVA angen eich caniatâd i wirio eich manylion trwydded yrru cyn y gallwch barhau. Byddant yn sicrhau nad yw eich trwydded wedi cael ei chanslo na'i hadrodd fel un sydd ar goll neu wedi'i dwyn.
    And I see the DVA Consent second sentence I ddarganfod mwy am sut bydd eich manylion trwydded yrru yn cael eu defnyddio, gallwch ddarllen:
    And I see DVA One Login privacy notice link hysbysiad preifatrwydd GOV.UK One Login (agor mewn tab newydd)
    Then I see DVA privacy notice link hysbysiad preifatrwydd DVA (agor mewn tab newydd)

    ##### Summary Error Validation ######

  @mock-api:dva-invalidDrivingLicenceNumber @language-regression
  Scenario Outline: DVA Driving Licence number less than 8 characters error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    When User clicks on continue
    Then I see the DVA licence number error in the summary as Dylai rhif eich trwydded fod yn 8 nod o hyd
    And I can see the DVA licence number error in the field as Dylai rhif eich trwydded fod yn 8 nod o hyd
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidLicenceNumber|
      |DrivingLicenceSubjectHappyBilly|5566778             |

  @mock-api:dva-invalidDrivingLicenceNumber @language-regression
  Scenario Outline: DVA Driving Licence number with special characters and spaces error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    When User clicks on continue
    Then I see the DVA licence number error in the summary as Ni ddylai rhif eich trwydded gynnwys unrhyw symbolau neu ofodau
    And I can see the DVA licence number error in the field as Ni ddylai rhif eich trwydded gynnwys unrhyw symbolau neu ofodau
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidLicenceNumber|
      |DrivingLicenceSubjectHappyBilly|55667^&*            |

##### DrivingLicenceNumberWithAlphaNumericChar, DrivingLicenceNumberWithAlphaChar, NoDrivingLicenceNumber #####
  @mock-api:dva-invalidDrivingLicenceNumber @language-regression
  Scenario Outline: DVA Driving Licence number with alpha numeric characters or alpha characters or no licence number error validation
    Given DVA User re-enters drivingLicenceNumber as <DVADrivingLicenceSubject>
    And DVA User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    When User clicks on continue
    Then I see the DVA licence number error in the summary as Rhowch y rhif yn union fel mae’n ymddangos ar eich trwydded yrru
    And I can see the DVA licence number error in the field as Rhowch y rhif yn union fel mae’n ymddangos ar eich trwydded yrru
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidLicenceNumber|
#      |DrivingLicenceSubjectHappyBilly|55667ABC            | - bug raised
#      |DrivingLicenceSubjectHappyBilly|XYZabdAB            | - bug raised
       |DrivingLicenceSubjectHappyBilly |                   |

  @mock-api:dva-invalidPostcode @language-regression
  Scenario Outline: DVA Driving Licence Postcode less than 5 characters error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Dylai eich rhowch eich cod post fod rhwng 5 a 7 nod
    And I see the postcode error in field as Dylai eich rhowch eich cod post fod rhwng 5 a 7 nod
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidPostcode   |
      |DrivingLicenceSubjectHappyBilly|E20A              |

  @mock-api:dva-invalidPostcode @language-regression
  Scenario Outline: DVA Driving Licence - No Postcode in the Postcode field error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Rhowch eich cod post
    And I see the postcode error in field as Rhowch eich cod post
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidPostcode   |
      |DrivingLicenceSubjectHappyBilly|                  |

  @mock-api:dva-invalidPostcode @language-regression
  Scenario Outline: DVA Driving Licence International Postcode error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Rhowch god post yn y DU
    And I see the postcode error in field as Rhowch god post yn y DU
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidPostcode   |
      |DrivingLicenceSubjectHappyBilly|CA 95128          |

###### PostcodeWithSpecialChar #####
  @mock-api:dva-invalidPostcode @language-regression
  Scenario Outline: DVA Driving Licence Postcode with special characters error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Dylai eich rhowch eich cod post ond cynnwys rhifau a llythrennau yn unig
    And I see the postcode error in field as Dylai eich rhowch eich cod post ond cynnwys rhifau a llythrennau yn unig
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidPostcode   |
      |DrivingLicenceSubjectHappyBilly|NW* ^%G           |

####### PostcodeWithNumericChar, PostcodeWithAlphaChar #####
  @mock-api:dva-invalidPostcode @language-regression
  Scenario Outline: DVA Driving Licence Postcode with numeric characters or alpha characters error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Dylai eich rhowch eich cod post ond cynnwys rhifau a llythrennau
    And I see the postcode error in field as Dylai eich rhowch eich cod post ond cynnwys rhifau a llythrennau
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidPostcode   |
     # |DrivingLicenceSubjectHappyBilly|123 456          |  Bug raised -LIME-750
      |DrivingLicenceSubjectHappyBilly|ABC XYZ           |

######  InvalidLastNameWithNumbers, InvalidLastNameWithSpecialCharacters, NoLastName #####
  @mock-api:dva-invalidLastName @language-regression
  Scenario Outline: DVA Driving Licence Last name with numbers or special characters or no last name error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters last name as <InvalidLastName>
    When User clicks on continue
    Then I see the Lastname error in the error summary as Rhowch eich enw olaf fel y mae'n ymddangos ar eich trwydded yrru
    And I see the Lastname error in the error field as Rhowch eich enw olaf fel y mae'n ymddangos ar eich trwydded yrru
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidLastName |
      |DrivingLicenceSubjectHappyBilly|KYLE123         |
      |DrivingLicenceSubjectHappyBilly|KYLE^&(         |
      |DrivingLicenceSubjectHappyBilly|                |

######  InvalidFirstNameWithNumbers, InvalidFirstNameWithSpecialCharacters, NoFirstName #####
  @mock-api:dva-invalidFirstName @language-regression
  Scenario Outline: DVA Driving Licence First name with numbers or special characters or no first name error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters first name as <InvalidFirstName>
    When User clicks on continue
    Then I see the Firstname error summary as Rhowch eich enw cyntaf fel y mae'n ymddangos ar eich trwydded yrru
    And I see the Firstname error in the error field as Rhowch eich enw cyntaf fel y mae'n ymddangos ar eich trwydded yrru
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidFirstName|
      |DrivingLicenceSubjectHappyBilly|SELINA987       |
      |DrivingLicenceSubjectHappyBilly|SELINA%$@       |
      |DrivingLicenceSubjectHappyBilly|                |

#######  InvalidMiddleNamesWithNumbers, InvalidMiddleNamesWithSpecialCharacters #####
  @mock-api:dva-invalidMiddleNames @language-regression
  Scenario Outline: DVA Driving Licence Middle names with numbers or special characters error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters middle names as <InvalidMiddleNames>
    When User clicks on continue
    Then I see the middlenames error summary as Rhowch unrhyw enwau canol fel y maent yn ymddangos ar eich trwydded yrru
    And I see the middlenames error in the error field as Rhowch unrhyw enwau canol fel y maent yn ymddangos ar eich trwydded yrru
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject          |InvalidMiddleNames|
      |DrivingLicenceSubjectHappyBilly|SELINA987       |
      |DrivingLicenceSubjectHappyBilly|SELINA%$@       |

#####  DateOfBirthNotReal, DateOfBirthWithSpecialCharacters, NoDateOfBirth ##### Need confirmation with summary
  @mock-api:dva-invalidDateOfBirth @language-regression
  Scenario Outline: DVA Driving Licence Date of birth that are not real or with special characters or no date of birth error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA user re-enters day of birth as <InvalidDayOfBirth>
    And DVA user re-enters month of birth as <InvalidMonthOfBirth>
    And DVA user re-enters year of birth as <InvalidYearOfBirth>
    When User clicks on continue
    Then DVA user can see the date of birth error summary as Rhowch eich dyddiad geni fel y mae'n ymddangos ar eich trwydded yrru
    And DVA user can see the date of birth error in the field as Rhowch eich dyddiad geni fel y mae'n ymddangos ar eich trwydded yrru
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidDayOfBirth|InvalidMonthOfBirth|InvalidYearOfBirth|
      |DrivingLicenceSubjectHappyBilly|         51      |     71            |         198      |
      |DrivingLicenceSubjectHappyBilly|         @       |     *&            |         19 7     |
      |DrivingLicenceSubjectHappyBilly|                 |                   |                  |

  @mock-api:dva-invalidDateOfBirth @language-regression
  Scenario Outline: DVA Driving Licence Date of birth in the future error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA user re-enters day of birth as <InvalidDayOfBirth>
    And DVA user re-enters month of birth as <InvalidMonthOfBirth>
    And DVA user re-enters year of birth as <InvalidYearOfBirth>
    When User clicks on continue
    Then DVA user can see the date of birth error summary as Rhaid i'ch dyddiad geni fod yn y gorffennol
    And DVA user can see the date of birth error in the field as Rhaid i'ch dyddiad geni fod yn y gorffennol
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidDayOfBirth|InvalidMonthOfBirth|InvalidYearOfBirth|
      |DrivingLicenceSubjectHappyBilly|         10      |     10            |         2042     |

#####  IssueDateWithAlphaCharacters, IssueDateWithSpecialCharacters, NoIssueDate #####
  @mock-api:dva-invalidIssueDate @language-regression
  Scenario Outline: DVA Driving Licence Issue date that are not real or with special characters or no issue date error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA user re-enters day of issue as <InvalidDayOfIssue>
    And DVA user re-enters month of issue as <InvalidMonthOfIssue>
    And DVA user re-enters year of issue as <InvalidYearOfIssue>
    When User clicks on continue
    Then I see DVA issue date error in summary as Rhowch y dyddiad fel y mae'n ymddangos ar eich trwydded yrru
    And I see DVA invalid issue date field error as Rhowch y dyddiad fel y mae'n ymddangos ar eich trwydded yrru
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject          |InvalidDayOfIssue|InvalidMonthOfIssue|InvalidYearOfIssue|
      |DrivingLicenceSubjectHappyBilly|         AA      |     BB            |         AABC     |
      |DrivingLicenceSubjectHappyBilly|         &       |     ^%            |         £$ ^     |
      |DrivingLicenceSubjectHappyBilly|                 |                   |                  |

  @mock-api:dva-invalidIssueDate @language-regression
  Scenario Outline: DVA Driving Licence Issue date in the future error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA user re-enters day of issue as <InvalidDayOfIssue>
    And DVA user re-enters month of issue as <InvalidMonthOfIssue>
    And DVA user re-enters year of issue as <InvalidYearOfIssue>
    When User clicks on continue
    Then I see DVA issue date error in summary as Rhaid i ddyddiad cyhoeddi fod yn y gorffennol
    And I see DVA issue date error in summary as Rhaid i ddyddiad cyhoeddi fod yn y gorffennol
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject          |InvalidDayOfIssue|InvalidMonthOfIssue|InvalidYearOfIssue|
      |DrivingLicenceSubjectHappyBilly|         01      |     10            |         2043     |

#####  InvalidValidToDate, ValidToDateWithSpecialCharacters, NoValidToDate  #####
  @mock-api:dva-invalidExpiryDate @language-regression
  Scenario Outline: DVA Driving Licence Valid to date that are not real or with special characters or no valid to date error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters valid to day as <InvalidValidToDay>
    And User re-enters valid to month as <InvalidValidToMonth>
    And User re-enters valid to year <InvalidValidToYear>
    When User clicks on continue
    Then I can see the valid to date error in the error summary as Rhowch y dyddiad fel y mae'n ymddangos ar eich trwydded yrru
    And I can see the Valid to date field error as Rhowch y dyddiad fel y mae'n ymddangos ar eich trwydded yrru
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject          |InvalidValidToDay|InvalidValidToMonth|InvalidValidToYear|
      |DrivingLicenceSubjectHappyBilly|         AA      |     BC            |         AABD     |
      |DrivingLicenceSubjectHappyBilly|         !@      |     £$            |         %^ *     |
      |DrivingLicenceSubjectHappyBilly|                 |                   |                  |

  @mock-api:dva-invalidExpiryDate @language-regression
  Scenario Outline: DVA Driving Licence Valid to date in the past error validation
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters valid to day as <InvalidValidToDay>
    And User re-enters valid to month as <InvalidValidToMonth>
    And User re-enters valid to year <InvalidValidToYear>
    When User clicks on continue
    Then I can see the valid to date error in the error summary as Ni allwch ddefnyddio trwydded yrru sydd wedi dod i ben
    And I can see the Valid to date field error as Ni allwch ddefnyddio trwydded yrru sydd wedi dod i ben
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidValidToDay|InvalidValidToMonth|InvalidValidToYear|
      |DrivingLicenceSubjectHappyBilly|         10      |     01            |         2010     |

  @mock-api:dva-ConsentError @language-regression
  Scenario Outline:  DVA Driving Licence error validation when DVA consent checkbox is unselected
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA consent checkbox is unselected
    When User clicks on continue
    Then I can see the DVA consent error summary as Mae'n rhaid i chi roi eich caniatâd i barhau
    And I can see the DVA consent error on the checkbox as Mae'n rhaid i chi roi eich caniatâd i barhau
    And I check the page Title Gwall: Rhowch eich manylion yn union fel maent yn ymddangos ar eich trwydded yrru – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject             |
      |DrivingLicenceSubjectHappyBilly|

  @mock-api:dl-failed @language-regression
  Scenario Outline: DVA Retry Message
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    When User clicks on continue
    And I can see Check your details as Gwiriwch bod eich manylion yn paru gyda beth sydd ar eich trwydded yrru y DU
    Then I see error word as Gwall
    Then Proper error message is displayed as Nid oeddem yn gallu dod o hyd i'ch manylion
    And I see Check your details as Roedd yna broblem wrth i ni wirio eich manylion gyda'r DVA.
    Examples:
      |DVADrivingLicenceSubject       |InvalidLicenceNumber|
      |DrivingLicenceSubjectHappyBilly|55667778             |

  @mock-api:DVA-success-supportLinks @language-regression
  Scenario: Check support links
    Given The Support link in the footer reads Cymorth (agor mewn tab newydd) and assert the url is correct and live
    When I view the beta banner
    Then the beta banner reads Mae hwn yn wasanaeth newydd – bydd eich adborth (agor mewn tab newydd) yn ein helpu i'w wella.
    And I assert the link in the banner is correct and live
    Then I delete the session cookie
    And User clicks on continue
    Then I see the heading Mae'n ddrwg gennym, mae problem
    And I see Contact the One Login team link reads Cysylltu â thîm GOV.UK One Login (agor mewn tab newydd)
    And I assert the link on the error page is correct and live
    Then I go to page not found
    And I assert the link on the page not found page is correct and live
