@mock-api:dl-dvla-auth-success @success @DVLA
Feature: DVLA Driving licence - Auth Source

    Background:
        Given Authenticatable Anita is using the system
        And they have provided their details
        When they have started the DL Auth Source journey

    @mock-api:dl-dvla-auth-success @validation-regression @build @staging
    Scenario: DVLA Auth Source - User navigates through the Auth Source Journey - Check Your Details Page
        And I should be on the Driving Licence check your details page Check your UK photocard driving licence details – GOV.UK One Login
        When I click on the Yes radio button
        Then I click on the Confirm and Continue button
        And I should be on the DVLA consent page We need to check your driving licence details – GOV.UK One Login
        And I click on the DVLA consent checkbox
        When I click on the Continue button

    @mock-api:dl-dvla-auth-success @validation-regression @build @staging
    Scenario: DVLA Auth Source - User selects No on the Check Your Details Page
        And I should be on the Driving Licence check your details page Check your UK photocard driving licence details – GOV.UK One Login
        When I click on the No radio button
        Then I click on the Confirm and Continue button

    @mock-api:dl-dvla-auth-success @validation-regression @build @staging
    Scenario: DVLA Auth Source - User fails to provide consent on the Consent Page
        And I should be on the Driving Licence check your details page Check your UK photocard driving licence details – GOV.UK One Login
        When I click on the Yes radio button
        Then I click on the Confirm and Continue button
        And I should be on the DVLA consent page We need to check your driving licence details – GOV.UK One Login
        When I click on the Continue button
        Then I see the No Consent Error Text You must give your consent to continue

    @mock-api:dl-dvla-auth-success @validation-regression
    Scenario: DVLA Auth Source - Formatting Tests - Date fields format values correctly
        Given I can see the check details formatted dob value as 08 07 1965
        And I can see the check details formatted issueDate value as 22 08 2023
        And I can see the check details formatted validTo value as 27 04 2025
