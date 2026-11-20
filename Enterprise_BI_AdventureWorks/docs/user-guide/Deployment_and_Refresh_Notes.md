# Deployment and Refresh Notes

## 1. Project deployment status

**Project:** Enterprise Business Intelligence Suite for a Multi-Region
Company --- AdventureWorks\
**Power BI file:** `Enterprise_BI_Suite_Final.pbix`\
**SQL Server database:** `EnterpriseBI_DW`\
**Source database:** `AdventureWorks2025`

The report has been prepared and validated for local use in Power BI
Desktop. Power BI Service publication and cloud scheduled refresh remain
incomplete because an eligible Microsoft work or school account was not
available during the project deployment.

This is a documented deployment constraint. The project must not be
described as published to Power BI Service or as having a configured
cloud refresh schedule.

## 2. Local deployment

To open the report:

1.  Install and open Power BI Desktop.
2.  Open `PowerBI/Enterprise_BI_Suite_Final.pbix`.
3.  If prompted, configure the SQL Server data source using the server
    and database values already used by the PBIX.
4.  Confirm that the `EnterpriseBI_DW` database is accessible.
5.  Review the report pages and drill-through functionality.

Keep the PBIX, SQL scripts, and supporting documentation together in the
project repository. Do not include passwords, connection secrets, or
personal credentials in the repository.

## 3. Local refresh procedure

A local refresh was performed successfully in Power BI Desktop, with no
refresh error reported during the validation step.

To repeat the refresh:

1.  Start the SQL Server instance hosting `EnterpriseBI_DW`.
2.  Open `Enterprise_BI_Suite_Final.pbix` in Power BI Desktop.
3.  Select **Home → Refresh**.
4.  Wait for the refresh to complete.
5.  Confirm that Power BI Desktop does not report refresh errors.
6.  Review representative dashboard pages to confirm that the report
    remains usable.

**Validation result recorded:** Power BI Desktop refresh completed
without an error being displayed by the user.

This result validates the local refresh operation at the time it was
tested. It does not establish that a recurring refresh schedule exists.

## 4. Power BI Service publication status

The following activities were not completed:

-   Publishing the PBIX to a Power BI Service workspace.
-   Configuring an online semantic model connection.
-   Registering and configuring an on-premises data gateway for the
    local SQL Server source.
-   Configuring scheduled refresh in Power BI Service.
-   Validating RLS using signed-in report consumers in the Service.

The user could not sign in to Power BI Service with the available
college email because Microsoft did not recognise it as an eligible
organisational account. An eligible Microsoft work or school account and
the required Power BI permissions are needed before these cloud
deployment tasks can be completed.

## 5. Requirements if Service deployment is enabled later

If an eligible organisational account becomes available, the remaining
deployment work is:

1.  Sign in to Power BI Service.
2.  Create or select an appropriate workspace.
3.  Publish `Enterprise_BI_Suite_Final.pbix`.
4.  Configure the gateway connection for the on-premises SQL Server
    database.
5.  Ensure the gateway data source uses the same server and database
    names as the PBIX data source.
6.  Configure data-source credentials.
7.  Run an on-demand refresh and inspect refresh history.
8.  Configure a suitable scheduled refresh frequency.
9.  Assign users to the appropriate RLS role and test using
    consumer-level access.
10. Document the outcome and any remaining limitations.

The computer hosting the on-premises gateway must be available and the
gateway service must be running for refreshes that depend on that local
SQL Server.

## 6. Row-level security scope to disclose

The project's Phase 6 security status is **Completed with Documented
Limitations**:

  -----------------------------------------------------------------------
  Department              Implemented scope       Limitation
  ----------------------- ----------------------- -----------------------
  Sales                   Dynamic regional RLS    No additional
                          implemented and         limitation recorded
                          validated               here

  Finance                 Regional RLS            No additional
                          implemented and         limitation recorded
                          validated               here

  HR                      Regional mapping exists 276 of 290 employees do
                          for 14 employees        not have verified
                                                  regional mappings

  Supply Chain            Global authorized-user  Geographical regional
                          access implemented and  mapping was not
                          tested                  completed because
                                                  verified
                                                  facility-to-region
                                                  assignments were
                                                  unavailable
  -----------------------------------------------------------------------

The Supply Chain access list is a global authorization mechanism, not
geographical regional RLS. Do not create or claim regional assignments
without authoritative source data.

## 7. Evidence to retain

Keep the following evidence with the project:

-   Final PBIX file.
-   Screenshot of the successful Power BI Desktop refresh.
-   Screenshots or PDF export of the report pages.
-   Relevant SQL and ETL scripts.
-   RLS validation results and the Phase 6 limitations.
-   This deployment and refresh note.
-   The user guide.

## 8. Final status statement

The Enterprise BI report is available as a Power BI Desktop PBIX and its
local refresh was successfully tested. Power BI Service publication,
gateway configuration, and cloud scheduled refresh were not completed
because an eligible Microsoft organisational account was unavailable.
These items remain future deployment steps rather than completed
deliverables.
