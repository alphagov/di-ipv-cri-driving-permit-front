@mock-api:dl-success @success @DVA
Feature: DVA Driving licence CRI Error Validations

  Background:
    Given Authenticatable Anita is using the system
    And they have provided their details
    And they have started the DL journey
    And I click on DVA radio button and Continue
    And I should be on the DVA details entry page Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login

  @mock-api:dva-invalidDrivingLicenceNumber @validation-regression @build @staging
  Scenario Outline: DVA - User enters licence number with less than 8 characters
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    When User clicks on continue
    Then I see the DVA licence number error in the summary as Your licence number should be 8 characters long
    And I can see the DVA licence number error in the field as Your licence number should be 8 characters long
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidLicenceNumber|
      |DrivingLicenceSubjectHappyBilly|5566778             |

  @mock-api:dva-invalidDrivingLicenceNumber @validation-regression @build @staging
  Scenario Outline: DVA - User enters licence number with special characters and spaces
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    When User clicks on continue
    Then I see the DVA licence number error in the summary as Your licence number should not include any symbols or spaces
    And I can see the DVA licence number error in the field as Your licence number should not include any symbols or spaces
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidLicenceNumber|
      |DrivingLicenceSubjectHappyBilly|55667^&*            |

###### DrivingLicenceNumberWithAlphaNumericChar, DrivingLicenceNumberWithAlphaChar, NoDrivingLicenceNumber #####
  @mock-api:dva-invalidDrivingLicenceNumber @validation-regression @build @staging
  Scenario Outline: DVA - User enters licence number with numeric/alpha/null characters
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    When User clicks on continue
    Then I see the DVA licence number error in the summary as Enter the number exactly as it appears on your driving licence
    And I can see the DVA licence number error in the field as Enter the number exactly as it appears on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidLicenceNumber|
      |DrivingLicenceSubjectHappyBilly|55667ABC            |
      |DrivingLicenceSubjectHappyBilly|XYZabdAB            |
      |DrivingLicenceSubjectHappyBilly|                    |

  @mock-api:dva-invalidPostcode @validation-regression @build @staging
  Scenario Outline: DVA - User enters postcode number with less than 5 characters
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Your postcode should be between 5 and 7 characters
    And I see the postcode error in field as Your postcode should be between 5 and 7 characters
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidPostcode   |
      |DrivingLicenceSubjectHappyBilly|E20A              |

  @mock-api:dva-invalidPostcode @validation-regression @build @staging
  Scenario Outline: DVA - User enters no postcode in the postcode field
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Enter your postcode
    And I see the postcode error in field as Enter your postcode
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidPostcode   |
      |DrivingLicenceSubjectHappyBilly|                  |

  @mock-api:dva-invalidPostcode @validation-regression @build @staging
  Scenario Outline: DVA - User enters international postcode and returns enter a UK postcode error
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Enter a UK postcode
    And I see the postcode error in field as Enter a UK postcode
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidPostcode   |
      |DrivingLicenceSubjectHappyBilly|CA 95128          |

##### PostcodeWithSpecialChar #####
  @mock-api:dva-invalidPostcode @validation-regression @build @staging
  Scenario Outline: DVA - User enters invalid postcode with special characters
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Your postcode should only include numbers and letters
    And I see the postcode error in field as Your postcode should only include numbers and letters
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidPostcode   |
      |DrivingLicenceSubjectHappyBilly|NW* ^%G           |

####### PostcodeWithNumericChar, PostcodeWithAlphaChar #####
  @mock-api:dva-invalidPostcode @validation-regression @build @staging
  Scenario Outline: DVA - User enters postcode with alpha/numeric characters
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Your postcode should include numbers and letters
    And I see the postcode error in field as Your postcode should include numbers and letters
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidPostcode   |
      |DrivingLicenceSubjectHappyBilly|123 456           |
      |DrivingLicenceSubjectHappyBilly|ABC XYZ           |

######  InvalidLastNameWithNumbers, InvalidLastNameWithSpecialCharacters, NoLastName #####
  @mock-api:dva-invalidLastName @validation-regression @build @staging
  Scenario Outline: DVA - User enters last name with alpha/numeric/special/null characters
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters last name as <InvalidLastName>
    When User clicks on continue
    Then I see the Lastname error in the error summary as Enter your last name as it appears on your driving licence
    And I see the Lastname error in the error field as Enter your last name as it appears on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidLastName |
      |DrivingLicenceSubjectHappyBilly|KYLE123         |
      |DrivingLicenceSubjectHappyBilly|KYLE^&(         |
      |DrivingLicenceSubjectHappyBilly|                |

######  InvalidFirstNameWithNumbers, InvalidFirstNameWithSpecialCharacters, NoFirstName, firstName exceeds maxlength #####
  @mock-api:dva-invalidFirstName @validation-regression @build @staging
  Scenario Outline: DVA - User enters first name with alpha/numeric/special/null characters
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters first name as <InvalidFirstName>
    When User clicks on continue
    Then I see the Firstname error summary as Enter your first name as it appears on your driving licence
    And I see the Firstname error in the error field as Enter your first name as it appears on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      | DVADrivingLicenceSubject        | InvalidFirstName                           |
      | DrivingLicenceSubjectHappyBilly | aasdfghjklasdfghjklasdfghjklasdfghjklasdfg |
      | DrivingLicenceSubjectHappyBilly | SELINA987                                  |
      | DrivingLicenceSubjectHappyBilly | SELINA%$@                                  |
      | DrivingLicenceSubjectHappyBilly |                                            |

#######  InvalidMiddleNamesWithNumbers, InvalidMiddleNamesWithSpecialCharacters #####
  @mock-api:dva-invalidMiddleNames @validation-regression @build @staging
  Scenario Outline: DVA - User enters middle nams with alpha/numeric/special/null characters
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters middle names as <InvalidMiddleNames>
    When User clicks on continue
    Then I see the middlenames error summary as Enter any middle names as they appear on your driving licence
    And I see the middlenames error in the error field as Enter any middle names as they appear on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject          |InvalidMiddleNames|
      |DrivingLicenceSubjectHappyBilly|SELINA987       |
      |DrivingLicenceSubjectHappyBilly|SELINA%$@       |

#####  DateOfBirthNotReal, DateOfBirthWithSpecialCharacters, NoDateOfBirth #####
  @mock-api:dva-invalidDateOfBirth @validation-regression @build @staging
  Scenario Outline: DVA - User enters dob that are not real or with special characters or no issue date error validation or year provided is two digits
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA user re-enters day of birth as <InvalidDayOfBirth>
    And DVA user re-enters month of birth as <InvalidMonthOfBirth>
    And DVA user re-enters year of birth as <InvalidYearOfBirth>
    When User clicks on continue
    Then DVA user can see the date of birth error summary as Enter your date of birth as it appears on your driving licence
    And DVA user can see the date of birth error in the field as Enter your date of birth as it appears on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidDayOfBirth|InvalidMonthOfBirth|InvalidYearOfBirth|
      |DrivingLicenceSubjectHappyBilly|         51      |     71            |         198      |
      |DrivingLicenceSubjectHappyBilly|         @       |     *&            |         19 7     |
      |DrivingLicenceSubjectHappyBilly|                 |                   |                  |
      |DrivingLicenceSubjectHappyBilly|         05      |     12            |         29       |

  @mock-api:dva-invalidDateOfBirth @validation-regression @build @staging
  Scenario Outline: DVA - User enters future date of birth
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA user re-enters day of birth as <InvalidDayOfBirth>
    And DVA user re-enters month of birth as <InvalidMonthOfBirth>
    And DVA user re-enters year of birth as <InvalidYearOfBirth>
    When User clicks on continue
    Then DVA user can see the date of birth error summary as Your date of birth must be in the past
    And DVA user can see the date of birth error in the field as Your date of birth must be in the past
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidDayOfBirth|InvalidMonthOfBirth|InvalidYearOfBirth|
      |DrivingLicenceSubjectHappyBilly|         10      |     10            |         2042     |

#####  IssueDateWithAlphaCharacters, IssueDateWithSpecialCharacters, NoIssueDate #####
  @mock-api:dva-invalidIssueDate @validation-regression @build @staging
  Scenario Outline: DVA - User enters issue date that are not real or with special characters or no issue date error validation or year provided is two digits
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA user re-enters day of issue as <InvalidDayOfIssue>
    And DVA user re-enters month of issue as <InvalidMonthOfIssue>
    And DVA user re-enters year of issue as <InvalidYearOfIssue>
    When User clicks on continue
    Then I see DVA issue date error in summary as Enter the date as it appears on your driving licence
    And I see DVA invalid issue date field error as Enter the date as it appears on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject          |InvalidDayOfIssue|InvalidMonthOfIssue|InvalidYearOfIssue|
      |DrivingLicenceSubjectHappyBilly|         AA      |     BB            |         AABC     |
      |DrivingLicenceSubjectHappyBilly|         &       |     ^%            |         £$ ^     |
      |DrivingLicenceSubjectHappyBilly|                 |                   |                  |
      |DrivingLicenceSubjectHappyBilly|         05      |     12            |         19       |

  @mock-api:dva-invalidIssueDate @validation-regression @build @staging
  Scenario Outline: DVA - User enters issue date in the future
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA user re-enters day of issue as <InvalidDayOfIssue>
    And DVA user re-enters month of issue as <InvalidMonthOfIssue>
    And DVA user re-enters year of issue as <InvalidYearOfIssue>
    When User clicks on continue
    Then I see DVA issue date error in summary as The issue date must be in the past
    And I see DVA issue date error in summary as The issue date must be in the past
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject          |InvalidDayOfIssue|InvalidMonthOfIssue|InvalidYearOfIssue|
      |DrivingLicenceSubjectHappyBilly|         01      |     10            |         2043     |

#####  InvalidValidToDate, ValidToDateWithSpecialCharacters, NoValidToDate  #####
  @mock-api:dva-invalidExpiryDate @validation-regression @build @staging
  Scenario Outline: DVA - User enters valid to dates that are invalid or contain special characters or year provided is two digits or are not real
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters valid to day as <InvalidValidToDay>
    And User re-enters valid to month as <InvalidValidToMonth>
    And User re-enters valid to year <InvalidValidToYear>
    When User clicks on continue
    Then I can see the valid to date error in the error summary as Enter the date as it appears on your driving licence
    And I can see the Valid to date field error as Enter the date as it appears on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject          |InvalidValidToDay|InvalidValidToMonth|InvalidValidToYear|
      |DrivingLicenceSubjectHappyBilly|         AA      |     BC            |         AABD     |
      |DrivingLicenceSubjectHappyBilly|         !@      |     £$            |         %^ *     |
      |DrivingLicenceSubjectHappyBilly|                 |                   |                  |
      |DrivingLicenceSubjectHappyBilly|         05      |     12            |         29       |

  @mock-api:dva-invalidExpiryDate @validation-regression @build @staging
  Scenario Outline: DVA - User enters valid to date in the past
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters valid to day as <InvalidValidToDay>
    And User re-enters valid to month as <InvalidValidToMonth>
    And User re-enters valid to year <InvalidValidToYear>
    When User clicks on continue
    Then I can see the valid to date error in the error summary as You cannot use an expired driving licence
    And I can see the Valid to date field error as You cannot use an expired driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      |DVADrivingLicenceSubject       |InvalidValidToDay|InvalidValidToMonth|InvalidValidToYear|
      |DrivingLicenceSubjectHappyBilly|         10      |     01            |         2010     |

  @mock-api:dva-ConsentError @validation-regression @build @staging
  Scenario Outline: DVA - User attempts journey without selecting consent checkbox
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And DVA consent checkbox is unselected
    When User clicks on continue
    Then I can see the DVA consent error summary as You must give your consent to continue
    And I can see the DVA consent error on the checkbox as You must give your consent to continue
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – Prove your identity – GOV.UK One Login
    Examples:
      | DVADrivingLicenceSubject        |
      | DrivingLicenceSubjectHappyBilly |

  @mock-api:DVA-success
  Scenario: DVA - Check support link validation
    Given The Support link in the footer reads Support (opens in new tab) and assert the url is correct and live
    When I view the beta banner
    Then the beta banner reads This is a new service – your feedback (opens in new tab) will help us to improve it.
    And I assert the link in the banner is correct and live
    Then I delete the session cookie
    And User clicks on continue
    Then they should see an error page
    And I see Contact the One Login team link reads Contact the GOV.UK One Login team (opens in a new tab)
    And I assert the link on the error page is correct and live
    Then I go to page not found
    And I assert the link on the page not found page is correct and live

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVA - User enters last name 25 characters long
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters last name as <InvalidLastName>
    When User clicks on continue
    Examples:
      | DVADrivingLicenceSubject        | InvalidLastName           |
      | DrivingLicenceSubjectHappyBilly | abcdefghijklmnopqrstuvwxy |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVA - User enters last name 26 characters long
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters last name as <InvalidLastName>
    When User clicks on continue
    Examples:
      | DVADrivingLicenceSubject        | InvalidLastName            |
      | DrivingLicenceSubjectHappyBilly | abcdefghijklmnopqrstuvwxyz |


  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVA - User enters first name 18 characters long
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters first name as <InvalidFirstName>
    When User clicks on continue
    Examples:
      | DVADrivingLicenceSubject        | InvalidFirstName   |
      | DrivingLicenceSubjectHappyBilly | abcdefghijklmnopqr |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVA - User enters first name 19 characters long
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters first name as <InvalidFirstName>
    When User clicks on continue
    Examples:
      | DVADrivingLicenceSubject        | InvalidFirstName   |
      | DrivingLicenceSubjectHappyBilly | abcdefghijklmnopqr |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVA - User enters middle names 18 characters long
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters first name as <InvalidFirstName>
    And User re-enters middle names as <InvalidMiddleNames>
    When User clicks on continue
    Then I see the Firstname error summary as Enter your first name as it appears on your driving licence
    And I see the Firstname error in the error field as Enter your first name as it appears on your driving licence
    Examples:
      | DVADrivingLicenceSubject        | InvalidFirstName | InvalidMiddleNames |
      | DrivingLicenceSubjectHappyBilly |                  | abcdefghijklmnopqr |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVA - User enters middle names 19 characters long
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters first name as <InvalidFirstName>
    And User re-enters middle names as <InvalidMiddleNames>
    When User clicks on continue
    Then I see the Firstname error summary as Enter your first name as it appears on your driving licence
    And I see the Firstname error in the error field as Enter your first name as it appears on your driving licence
    Examples:
      | DVADrivingLicenceSubject        | InvalidFirstName | InvalidMiddleNames |
      | DrivingLicenceSubjectHappyBilly |                  | abcdefghijklmnopqrs |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVA - User enters first and last names so that it reaches max length but doesn't go over the limit
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters last name as <InvalidLastName>
    And User re-enters first name as <InvalidFirstName>
    When User clicks on continue
    Examples:
      | DVADrivingLicenceSubject        | InvalidLastName           | InvalidFirstName   |
      | DrivingLicenceSubjectHappyBilly | abcdefghijklmnopqrstuvwxy | abcdefghijklmnopqr |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVA - User enters last and middle names so that it reaches max length but doesn't go over the limit
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters last name as <InvalidLastName>
    And User re-enters first name as <InvalidFirstName>
    And User re-enters middle names as <InvalidMiddleNames>
    When User clicks on continue
    Then I see the Firstname error summary as Enter your first name as it appears on your driving licence
    And I see the Firstname error in the error field as Enter your first name as it appears on your driving licence
    Examples:
      | DVADrivingLicenceSubject        | InvalidLastName           | InvalidFirstName | InvalidMiddleNames                    |
      | DrivingLicenceSubjectHappyBilly | abcdefghijklmnopqrstuvwxy |                  | abcdefghijklmnopqr |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVA - User enters names longer than allowed character limit
    Given User enters DVA data as a <DVADrivingLicenceSubject>
    And User re-enters last name as <InvalidLastName>
    And User re-enters middle names as <InvalidMiddleNames>
    When User clicks on continue
    Then I see the middlenames error summary as Enter any middle names as they appear on your driving licence
    And I see the middlenames error in the error field as Enter any middle names as they appear on your driving licence
    Examples:
      | DVADrivingLicenceSubject        | InvalidLastName           | InvalidMiddleNames  |
      | DrivingLicenceSubjectHappyBilly | abcdefghijklmnopqrstuvwxy | abcdefghijklmnopqrs |

  @mock-api:dva-ConsentSection @validation-regression @build @staging
  Scenario: DVA Driving Licence privacy notice link to consent
    Given I see the consent title section Allow DVA to check your driving licence details
    And I see the DVA Consent first sentence DVA needs your consent to check your driving licence details before you can continue. They will make sure your licence has not been cancelled or reported as lost or stolen.
    And I see the DVA Consent second sentence To find out more about how your driving licence details will be used, you can read:
    And I see DVA One Login privacy notice link the GOV.UK One Login privacy notice (opens in a new tab)
    Then I see DVA privacy notice link the DVA privacy notice (opens in a new tab)
