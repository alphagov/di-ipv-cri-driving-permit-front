@mock-api:dl-failed @success @DVLA
Feature: DVLA Driving licence CRI Error Validations

  Background:
    Given Authenticatable Anita is using the system
    And they have provided their details
    And they have started the DL journey
    And I click on DVLA radio button and Continue
    And I should be on the DVLA details entry page Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters driving licence number date format and does not match with user's date of birth
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters day of birth as <InvalidDayOfBirth>
    And User re-enters month of birth as <InvalidMonthOfBirth>
    And User re-enters year of birth as <InvalidYearOfBirth>
    When User clicks on continue
    Then I see the licence number error in the summary as Enter the number exactly as it appears on your driving licence
    And I can see the licence number error in the field as Enter the number exactly as it appears on your driving licence
    Then I see the date of birth error summary as Check you have entered your date of birth correctly
    And  I see the date of birth error in the field as Check you have entered your date of birth correctly
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidDayOfBirth | InvalidMonthOfBirth | InvalidYearOfBirth |
      | DrivingLicenceSubjectHappyPeter | 12                | 08                  | 1985               |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters licence number with less than 16 characters
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    When User clicks on continue
    Then I see the licence number error in the summary as Your licence number should be 16 characters long
    And I can see the licence number error in the field as Your licence number should be 16 characters long
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidLicenceNumber |
      | DrivingLicenceSubjectHappyPeter | PARKE610112PBF       |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters licence number with special characters and spaces
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    When User clicks on continue
    Then I see the licence number error in the summary as Your licence number should not include any symbols or spaces
    And I can see the licence number error in the field as Your licence number should not include any symbols or spaces
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidLicenceNumber |
      | DrivingLicenceSubjectHappyPeter | 12345678901112@@     |

####### DrivingLicenceNumberWithNumericChar, DrivingLicenceNumberWithAlphaChar, NoDrivingLicenceNumber #######
  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters licence number with numeric/alpha/null characters
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    When User clicks on continue
    Then I see the licence number error in the summary as Enter the number exactly as it appears on your driving licence
    And I can see the licence number error in the field as Enter the number exactly as it appears on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidLicenceNumber |
      | DrivingLicenceSubjectHappyPeter | 1234567890111213     |
      | DrivingLicenceSubjectHappyPeter | abcdefghijklomnp     |
      | DrivingLicenceSubjectHappyPeter |                      |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters licence issue number with less than 2 characters
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters issue number as <InvalidIssueNumber>
    When User clicks on continue
    Then I see the issue number error in summary as Your issue number should be 2 numbers long
    And I see the issue number error in field as Your issue number should be 2 numbers long
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidIssueNumber |
      | DrivingLicenceSubjectHappyPeter | 1                  |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters licence issue number with special characters
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters issue number as <InvalidIssueNumber>
    When User clicks on continue
    Then I see the issue number error in summary as Your issue number should not include any symbols or spaces
    And I see the issue number error in field as Your issue number should not include any symbols or spaces
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidIssueNumber |
      | DrivingLicenceSubjectHappyPeter | A@                 |

##### IssueNumberWithAlphanumericChar, IssueNumberWithAlphaChar, NoIssueNumber #####
  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters licence issue number with alpha/numeric/null characters
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters issue number as <InvalidIssueNumber>
    When User clicks on continue
    Then I see the issue number error in summary as Enter the issue number as it appears on your driving licence
    And I see the issue number error in field as Enter the issue number as it appears on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidIssueNumber |
      | DrivingLicenceSubjectHappyPeter | A1                 |
      | DrivingLicenceSubjectHappyPeter | AB                 |
      | DrivingLicenceSubjectHappyPeter |                    |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters invalid postcode with less than 5 characters
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Your postcode should be between 5 and 7 characters
    And I see the postcode error in field as Your postcode should be between 5 and 7 characters
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidPostcode |
      | DrivingLicenceSubjectHappyPeter | E20A            |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters no postcode and returns enter your postcode error
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Enter your postcode
    And I see the postcode error in field as Enter your postcode
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidPostcode |
      | DrivingLicenceSubjectHappyPeter |                 |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters international postcode and returns enter a UK postcode error
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Enter a UK postcode
    And I see the postcode error in field as Enter a UK postcode
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidPostcode |
      | DrivingLicenceSubjectHappyPeter | CA 95128        |

##### PostcodeWithSpecialChar #####
  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters invalid postcode with special characters
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Your postcode should only include numbers and letters
    And I see the postcode error in field as Your postcode should only include numbers and letters
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidPostcode |
      | DrivingLicenceSubjectHappyPeter | NW* ^%G         |

###### PostcodeWithNumericChar, PostcodeWithAlphaChar #####
  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters invalid postcode with special characters
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters postcode as <InvalidPostcode>
    When User clicks on continue
    Then I see the postcode error in summary as Your postcode should include numbers and letters
    And I see the postcode error in field as Your postcode should include numbers and letters
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidPostcode |
      | DrivingLicenceSubjectHappyPeter | 123 456         |
      | DrivingLicenceSubjectHappyPeter | ABC XYZ         |

######  InvalidLastNameWithNumbers, InvalidLastNameWithSpecialCharacters, NoLastName #####
  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters last name with alpha/numeric/special/null characters
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters last name as <InvalidLastName>
    When User clicks on continue
    Then I see the Lastname error in the error summary as Enter your last name as it appears on your driving licence
    And I see the Lastname error in the error field as Enter your last name as it appears on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidLastName |
      | DrivingLicenceSubjectHappyPeter | KYLE123         |
      | DrivingLicenceSubjectHappyPeter | KYLE^&(         |
      | DrivingLicenceSubjectHappyPeter |                 |

######  InvalidFirstNameWithNumbers, InvalidFirstNameWithSpecialCharacters, NoFirstName #####
  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters first name with alpha/numeric/special/null characters
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters first name as <InvalidFirstName>
    When User clicks on continue
    Then I see the Firstname error summary as Enter your first name as it appears on your driving licence
    And I see the Firstname error in the error field as Enter your first name as it appears on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidFirstName |
      | DrivingLicenceSubjectHappyPeter | SELINA987        |
      | DrivingLicenceSubjectHappyPeter | SELINA%$@        |
      | DrivingLicenceSubjectHappyPeter |                  |

    ######  InvalidMiddleNamesWithNumbers, InvalidMiddleNamesWithSpecialCharacters #####
  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters middle name with alpha/numeric/special characters
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters middle names as <InvalidMiddleNames>
    When User clicks on continue
    Then I see the middlenames error summary as Enter any middle names as they appear on your driving licence
    And I see the middlenames error in the error field as Enter any middle names as they appear on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidMiddleNames |
      | DrivingLicenceSubjectHappyPeter | SELINA987          |
      | DrivingLicenceSubjectHappyPeter | SELINA%$@          |

#####  DateOfBirthWithSpecialCharacters, DateOfBirthNotReal, NoDateOfBirth #####
  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters dob that are not real or with special characters or no issue date error validation or year provided is two digits
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters day of birth as <InvalidDayOfBirth>
    And User re-enters month of birth as <InvalidMonthOfBirth>
    And User re-enters year of birth as <InvalidYearOfBirth>
    When User clicks on continue
    Then I see the date of birth error summary as Enter your date of birth as it appears on your driving licence
    And I see the date of birth error in the field as Enter your date of birth as it appears on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidDayOfBirth | InvalidMonthOfBirth | InvalidYearOfBirth |
      | DrivingLicenceSubjectHappyPeter | @                 | *&                  | 19 7               |
      | DrivingLicenceSubjectHappyPeter | 51                | 71                  | 198                |
      | DrivingLicenceSubjectHappyPeter | 05                | 08                  | 66                 |
#      DVLA Driving licence with no date of birth scenario is not displaying the expected error message and has been raised as a bug LIME-694
#      |DrivingLicenceSubjectHappyPeter|                 |                   |                |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters future date of birth
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters day of birth as <InvalidDayOfBirth>
    And User re-enters month of birth as <InvalidMonthOfBirth>
    And User re-enters year of birth as <InvalidYearOfBirth>
    When User clicks on continue
    Then I see the date of birth error summary as Your date of birth must be in the past
    And I see the date of birth error in the field as Your date of birth must be in the past
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidDayOfBirth | InvalidMonthOfBirth | InvalidYearOfBirth |
      | DrivingLicenceSubjectHappyPeter | 10                | 10                  | 2042               |

#####  InvalidIssueDate, NoIssueDate #####
  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters issue date that are not real or with special characters or no issue date error validation or year provided is two digits
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters day of issue as <InvalidDayOfIssue>
    And User re-enters month of issue as <InvalidMonthOfIssue>
    And User re-enters year of issue as <InvalidYearOfIssue>
    When User clicks on continue
    Then I see issue date error in summary as Enter the date as it appears on your driving licence
    And I see invalid issue date field error as Enter the date as it appears on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidDayOfIssue | InvalidMonthOfIssue | InvalidYearOfIssue |
      | DrivingLicenceSubjectHappyPeter | AA                | BB                  | AABC               |
      | DrivingLicenceSubjectHappyPeter | &                 | ^%                  | £$ ^               |
      | DrivingLicenceSubjectHappyPeter |                   |                     |                    |
      | DrivingLicenceSubjectHappyPeter | 7                 | 8                   | 18                 |

  @mock-api:dl-success @validation-regression @build @staging @cat
  #Scenario Outline: DVLA Driving Licence Issue date that is previous days gets through successfully
  Scenario Outline: DVLA - User enters issue date a few days before current day
    Given User enters DVLA data as a DrivingLicenceSubjectHappyPeter
    Then User enters date of issue as current date
    And User enters day of issue as current day minus <daysToSubtract>
    When User clicks on continue
    Then Proper error message is displayed as We could not find your details
    Examples:
      | daysToSubtract |
      | 1              |
      | 3              |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario: DVLA - User enters issue date older than 10 years
    Given User enters DVLA data as a DrivingLicenceSubjectHappyPeter
    Then User enters date of issue as current date
    And User enters day of issue as current day minus 1
    And User enters year of issue as current year minus 10
    When User clicks on continue
    Then I see issue date error in summary as Enter the date as it appears on your driving licence
    And I see invalid issue date field error as Enter the date as it appears on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login

  @mock-api:dl-success @validation-regression @build @staging
  Scenario: DVLA - User enters issue date exactly 10 years old
    Given User enters DVLA data as a DrivingLicenceSubjectHappyPeter
    Then User enters date of issue as current date
    And User enters year of issue as current year minus 10
    When User clicks on continue
    Then Proper error message is displayed as We could not find your details

  @mock-api:dl-success @validation-regression @build @staging
  Scenario: DVLA - User enters issue date that is 1 day under 10 years old
    Given User enters DVLA data as a DrivingLicenceSubjectHappyPeter
    Then User enters date of issue as current date
    And User enters year of issue as current year minus 10 plus 1 day
    When User clicks on continue
    Then Proper error message is displayed as We could not find your details

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters issue date in the future
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters day of issue as <InvalidDayOfIssue>
    And User re-enters month of issue as <InvalidMonthOfIssue>
    And User re-enters year of issue as <InvalidYearOfIssue>
    When User clicks on continue
    Then I see issue date error in summary as The issue date must be in the past
    And I see invalid issue date field error as The issue date must be in the past
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidDayOfIssue | InvalidMonthOfIssue | InvalidYearOfIssue |
      | DrivingLicenceSubjectHappyPeter | 01                | 10                  | 2043               |

#####  InvalidValidToDate, ValidToDateWithSpecialCharacters, NoValidToDate  #####
  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters valid to dates that are invalid or contain special characters or year provided is two digits or are not real
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters valid to day as <InvalidValidToDay>
    And User re-enters valid to month as <InvalidValidToMonth>
    And User re-enters valid to year <InvalidValidToYear>
    When User clicks on continue
    Then I can see the valid to date error in the error summary as Enter the date as it appears on your driving licence
    And I can see the Valid to date field error as Enter the date as it appears on your driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidValidToDay | InvalidValidToMonth | InvalidValidToYear |
      | DrivingLicenceSubjectHappyPeter | AA                | BC                  | AABD               |
      | DrivingLicenceSubjectHappyPeter | !@                | £$                  | %^ *               |
      | DrivingLicenceSubjectHappyPeter |                   |                     |                    |
      | DrivingLicenceSubjectHappyPeter | 5                 | 8                   | 29                 |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters valid to date in the past
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters valid to day as <InvalidValidToDay>
    And User re-enters valid to month as <InvalidValidToMonth>
    And User re-enters valid to year <InvalidValidToYear>
    When User clicks on continue
    Then I can see the valid to date error in the error summary as You cannot use an expired driving licence
    And I can see the Valid to date field error as You cannot use an expired driving licence
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           | InvalidValidToDay | InvalidValidToMonth | InvalidValidToYear |
      | DrivingLicenceSubjectHappyPeter | 10                | 01                  | 2010               |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User attempts journey without selecting consent checkbox
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And DVLA consent checkbox is unselected
    When User clicks on continue
    And I can see the DVLA consent error on the checkbox as You must give your consent to continue
    Then I can see the DVLA consent error summary as You must give your consent to continue
    And I check the page Title Error: Enter your details exactly as they appear on your UK driving licence – GOV.UK One Login
    Examples:
      | DrivingLicenceSubject           |
      | DrivingLicenceSubjectHappyPeter |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVLA - User enters invalid driving licence
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    When User clicks on continue
    Then Proper error message is displayed as We could not find your details
    Examples:
      | DrivingLicenceSubject             | InvalidLicenceNumber |
      | DrivingLicenceSubjectHappyKenneth | DECER657085K99LN     |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVLA - Driving Licence number validation test - (VALID, female licenceNumber DOB Jan)
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    And User re-enters day of birth as <InvalidDayOfBirth>
    And User re-enters month of birth as <InvalidMonthOfBirth>
    And User re-enters year of birth as <InvalidYearOfBirth>
    When User clicks on continue
    Then Proper error message is displayed as We could not find your details
    Examples:
      | DrivingLicenceSubject             | InvalidLicenceNumber | InvalidDayOfBirth | InvalidMonthOfBirth | InvalidYearOfBirth |
      | DrivingLicenceSubjectHappyKenneth | DECER651085K99LN     | 08                | 01                  | 1965               |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVLA - Driving Licence number validation test - (VALID, female licenceNumber DOB Dec)
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    And User re-enters day of birth as <InvalidDayOfBirth>
    And User re-enters month of birth as <InvalidMonthOfBirth>
    And User re-enters year of birth as <InvalidYearOfBirth>
    When User clicks on continue
    Then Proper error message is displayed as We could not find your details
    Examples:
      | DrivingLicenceSubject             | InvalidLicenceNumber | InvalidDayOfBirth | InvalidMonthOfBirth | InvalidYearOfBirth |
      | DrivingLicenceSubjectHappyKenneth | DECER662085K99LN     | 08                | 12                  | 1965               |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVLA - Driving Licence number validation test - (VALID, licenceNumber DOB Dec)
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    And User re-enters day of birth as <InvalidDayOfBirth>
    And User re-enters month of birth as <InvalidMonthOfBirth>
    And User re-enters year of birth as <InvalidYearOfBirth>
    When User clicks on continue
    Then Proper error message is displayed as We could not find your details
    Examples:
      | DrivingLicenceSubject             | InvalidLicenceNumber | InvalidDayOfBirth | InvalidMonthOfBirth | InvalidYearOfBirth |
      | DrivingLicenceSubjectHappyKenneth | DECER612085KE9LN     | 08                | 12                  | 1965               |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVLA - Driving Licence number validation test - (VALID, 1 forename)
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    And User re-enters last name as <InvalidLastName>
    And User re-enters first name as <InvalidFirstName>
    When User clicks on continue
    Then Proper error message is displayed as We could not find your details
    Examples:
      | DrivingLicenceSubject             | InvalidLicenceNumber | InvalidLastName | InvalidFirstName |
      | DrivingLicenceSubjectHappyKenneth | AB999607085J9AAA     | JOHN            | SMITH            |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVLA - Driving Licence number validation test - (VALID, surname < 5)
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    And User re-enters last name as <InvalidLastName>
    And User re-enters first name as <InvalidFirstName>
    When User clicks on continue
    Then Proper error message is displayed as We could not find your details
    Examples:
      | DrivingLicenceSubject             | InvalidLicenceNumber | InvalidLastName | InvalidFirstName |
      | DrivingLicenceSubjectHappyKenneth | AB999607085J9AAA     | JOHN            | AB               |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVLA - Driving Licence number validation test - (VALID, 2 forenames)
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters drivingLicenceNumber as <InvalidLicenceNumber>
    And User re-enters last name as <InvalidLastName>
    And User re-enters first name as <InvalidFirstName>
    And User re-enters middle names as <InvalidMiddleNames>
    When User clicks on continue
    Then Proper error message is displayed as We could not find your details
    Examples:
      | DrivingLicenceSubject             | InvalidLicenceNumber | InvalidLastName | InvalidFirstName | InvalidMiddleNames |
      | DrivingLicenceSubjectHappyKenneth | AB999607085JAAAA     | JOHN            | SMITH            | A                  |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters last name 43 characters long
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters last name as <InvalidLastName>
    When User clicks on continue
    Examples:
      | DrivingLicenceSubject             | InvalidLastName                             |
      | DrivingLicenceSubjectHappyKenneth | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopq |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters last name 44 characters long
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters last name as <InvalidLastName>
    When User clicks on continue
    Examples:
      | DrivingLicenceSubject             | InvalidLastName                              |
      | DrivingLicenceSubjectHappyKenneth | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqr |


  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters first name 38 characters long
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters first name as <InvalidFirstName>
    When User clicks on continue
    Examples:
      | DrivingLicenceSubject             | InvalidFirstName                       |
      | DrivingLicenceSubjectHappyKenneth | abcdefghijklmnopqrstuvwxyzabcdefghijkl |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters first name 39 characters long
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters first name as <InvalidFirstName>
    When User clicks on continue
    Examples:
      | DrivingLicenceSubject             | InvalidFirstName                        |
      | DrivingLicenceSubjectHappyKenneth | abcdefghijklmnopqrstuvwxyzabcdefghijklm |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVLA - User enters middle name 38 characters long
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters first name as <InvalidFirstName>
    And User re-enters middle names as <InvalidMiddleNames>
    When User clicks on continue
    Then I see the Firstname error summary as Enter your first name as it appears on your driving licence
    And I see the Firstname error in the error field as Enter your first name as it appears on your driving licence
    Examples:
      | DrivingLicenceSubject             | InvalidFirstName | InvalidMiddleNames                     |
      | DrivingLicenceSubjectHappyKenneth |                  | abcdefghijklmnopqrstuvwxyzabcdefghijkl |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVLA - User enters middle name 39 characters long
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters first name as <InvalidFirstName>
    And User re-enters middle names as <InvalidMiddleNames>
    When User clicks on continue
    Then I see the Firstname error summary as Enter your first name as it appears on your driving licence
    And I see the Firstname error in the error field as Enter your first name as it appears on your driving licence
    Examples:
      | DrivingLicenceSubject             | InvalidFirstName | InvalidMiddleNames                      |
      | DrivingLicenceSubjectHappyKenneth |                  | abcdefghijklmnopqrstuvwxyzabcdefghijklm |

  @mock-api:dl-success @validation-regression @build @staging
  Scenario Outline: DVLA - User enters first and last names so that it reaches max length but doesn't go over the limit
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters last name as <InvalidLastName>
    And User re-enters first name as <InvalidFirstName>
    When User clicks on continue
    Examples:
      | DrivingLicenceSubject             | InvalidLastName                             | InvalidFirstName                       |
      | DrivingLicenceSubjectHappyKenneth | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopq | abcdefghijklmnopqrstuvwxyzabcdefghijkl |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVLA - User enters last and middle names so that it reaches max length but doesn't go over the limit
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters last name as <InvalidLastName>
    And User re-enters first name as <InvalidFirstName>
    And User re-enters middle names as <InvalidMiddleNames>
    When User clicks on continue
    Then I see the Firstname error summary as Enter your first name as it appears on your driving licence
    And I see the Firstname error in the error field as Enter your first name as it appears on your driving licence
    Examples:
      | DrivingLicenceSubject             | InvalidLastName                             | InvalidFirstName | InvalidMiddleNames                    |
      | DrivingLicenceSubjectHappyKenneth | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopq |                  | abcdefghijklmnopqrstuvwxyzabcdefghijk |

  @mock-api:dl-failed @validation-regression @build @staging
  Scenario Outline: DVLA - User enters names longer than allowed character limit
    Given User enters DVLA data as a <DrivingLicenceSubject>
    And User re-enters last name as <InvalidLastName>
    And User re-enters middle names as <InvalidMiddleNames>
    When User clicks on continue
    Then I see the Firstname error summary as Enter your first name as it appears on your driving licence
    And I see the Firstname error in the error field as Enter your first name as it appears on your driving licence
    Then I see the middlenames error summary as Enter any middle names as they appear on your driving licence
    And I see the middlenames error in the error field as Enter any middle names as they appear on your driving licence
    Examples:
      | DrivingLicenceSubject             | InvalidLastName                             | InvalidMiddleNames                      |
      | DrivingLicenceSubjectHappyKenneth | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopq | abcdefghijklmnopqrstuvwxyzabcdefghijklm |

  @mock-api:dvla-ConsentSection @validation-regression @build @staging
  Scenario: DVLA Driving Licence privacy notice link to consent
    Given I see the consent title section Allow DVLA to check your driving licence details
    And I see the DVLA Consent first sentence DVLA needs your consent to check your driving licence details before you can continue. They will make sure your licence has not been cancelled or reported as lost or stolen.
    And I see the DVLA Consent second sentence To find out more about how your driving licence details will be used, you can read:
    And I see One Login privacy notice link the GOV.UK One Login privacy notice (opens in a new tab)
    Then I see DVLA privacy notice link the DVLA privacy notice (opens in a new tab)
