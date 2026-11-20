# Enterprise Business Intelligence Suite

## User Guide

**Project:** Enterprise Business Intelligence Suite for a Multi-Region
Company --- AdventureWorks\
**Data source:** AdventureWorks2025\
**Data warehouse:** `EnterpriseBI_DW`\
**Reporting tool:** Power BI Desktop

------------------------------------------------------------------------

## 1. Project overview

The Enterprise Business Intelligence Suite brings together Sales,
Finance, Human Resources (HR), and Supply Chain reporting in a
consolidated Power BI solution. It provides KPI dashboards, interactive
visual analysis, and drill-through pages for more detailed
investigation.

## 2. Dashboard navigation

Use the report page tabs in Power BI Desktop to move between the
dashboards.

  -----------------------------------------------------------------------
  Dashboard                           What it helps users analyse
  ----------------------------------- -----------------------------------
  **Sales KPI**                       Revenue, order volume,
                                      profitability, customer
                                      performance, product performance,
                                      and regional sales

  **Finance KPI**                     Purchasing expenditure, purchasing
                                      trends, and vendor performance

  **HR KPI**                          Workforce and employee-related
                                      measures, including
                                      department-level analysis

  **Supply Chain KPI**                Inventory and production-related
                                      operational performance

  **Enterprise KPI**                  Consolidated, high-level business
                                      performance
  -----------------------------------------------------------------------

The exact visuals and available filters depend on the selected report
page.

## 3. Using filters and visuals

1.  Open the relevant dashboard page.
2.  Use available slicers and filters to select the reporting period,
    region, department, product, or other available category.
3.  Select a chart segment or data point to cross-filter or highlight
    related visuals.
4.  Clear or reset selections when you want to return to the broader
    view.

A filtered visual may change the values shown in KPI cards and other
charts on the page.

## 4. Drill-through and detailed records

Where a drill-through page is available:

1.  Right-click a relevant data point or row.
2.  Select **Drill through**.
3.  Choose the relevant detail page.
4.  Review the filtered records.
5.  Use the report's Back button to return to the previous page.

The project includes detail pages such as Customer Details, Product
Details, Sales Order Details, Vendor Details, Purchase Order Details,
Employee Details, and Department Details, where configured in the
report.

The Product Details table includes Sales Order ID, Full Date, Customer
Name, Order Quantity, Unit Price, Unit Price Discount, and Line Total.

The Purchase Order Details table includes Purchase Order ID, Vendor
Name, Full Date, Due Date, and Key.

## 5. Understanding the KPIs

Use dashboard titles, visual titles, axis labels, legends, and tooltips
to understand each measure. Interpret KPI values in the context of the
active filters and reporting period.

Examples of measures included in the solution are sales revenue, total
orders, total customers, profit, profit margin, purchasing amount,
employee measures, inventory measures, and work-order measures.

## 6. Data refresh

The supplied PBIX was refreshed successfully in Power BI Desktop during
local validation.

To refresh the report locally:

1.  Open `Enterprise_BI_Suite_Final.pbix` in Power BI Desktop.
2.  Confirm that the SQL Server data source is reachable and that the
    required credentials are available.
3.  Select **Home → Refresh**.
4.  Wait for the refresh operation to finish.
5.  Check for refresh errors and review important report pages.

Local refresh is different from scheduled refresh in Power BI Service.
Cloud-based scheduled refresh has not been configured for this project.

## 7. Data security and known limitations

The project has documented security coverage and limitations:

-   **Sales:** Dynamic regional row-level security (RLS) was implemented
    and validated.
-   **Finance:** Regional RLS was implemented and validated.
-   **HR:** Regional mapping currently covers 14 of 290 employees.
    Regional filtering cannot be claimed as complete for all employees.
-   **Supply Chain:** Global authorized-user access was implemented and
    tested. Geographical regional RLS was not completed because verified
    geographical facility assignments were unavailable.

Do not interpret the HR or Supply Chain implementation as complete
geographical regional security. Consult the project's RLS documentation
for the detailed scope and limitations.

## 8. Troubleshooting

-   **Refresh fails:** Check that SQL Server is running, the
    `EnterpriseBI_DW` database is available, and the data-source
    credentials and server/database settings are correct.
-   **A visual appears blank:** Check page filters, slicers,
    cross-selections, and whether the underlying data contains records
    for the selected criteria.
-   **A drill-through option is missing:** Confirm that you are
    right-clicking a supported data point and that the relevant
    drill-through page and fields are configured.
-   **A user sees unexpected data:** Review the applicable RLS role,
    user-to-region access mapping, and the documented limitations. Do
    not use workspace elevated roles to validate consumer RLS behaviour.

------------------------------------------------------------------------

**Primary project file:** `PowerBI/Enterprise_BI_Suite_Final.pbix`\
**Deployment status:** Local Power BI Desktop report validated. Power BI
Service publication and cloud scheduled refresh are not completed.
