# Enterprise Business Intelligence Suite
## User Guide

**Project:** Enterprise Business Intelligence Suite for a Multi-Region Company  
**Data source:** AdventureWorks2025  
**Platform:** Microsoft Power BI  
**Data warehouse:** EnterpriseBI_DW

### 1. Project Overview
The Enterprise BI Suite integrates Sales, Finance, Human Resources, and Supply Chain data into a unified reporting environment. It provides interactive dashboards, business KPIs, drill-through analysis, and role-based data access.

### 2. Dashboard Navigation

| Dashboard | Purpose |
|---|---|
| Sales KPI | Revenue, orders, profitability, customer and product performance |
| Finance KPI | Purchasing expenditure, vendor performance and purchasing trends |
| HR KPI | Employee distribution, departmental workforce and compensation |
| Supply Chain KPI | Inventory, production and work-order performance |
| Enterprise KPI | Consolidated organizational performance |

### 3. Drill-through Analysis
Users can right-click supported visual elements and select **Drill through** to access detailed records.

Available detail pages include:
- Customer Details
- Product Details
- Sales Order Details
- Vendor Details
- Purchase Order Details
- Employee Details
- Department Details

Use the Back button to return to the previous report page.

### 4. Understanding KPIs
- Revenue and Purchase Amount represent financial transaction values.
- Profit and Profit Margin measure sales profitability.
- Order and Customer counts indicate business activity.
- Employee KPIs describe workforce distribution and compensation.
- Inventory and Work Order KPIs monitor operational performance.

Use slicers, date filters and visual interactions to explore different reporting periods and business segments.

### 5. Data Security
The project implements dynamic regional access for Sales and Finance. HR regional mapping is currently limited to 14 of 290 employees. Supply Chain uses global authorized-user access rather than geographical regional restrictions.

These limitations must be considered when interpreting security coverage.

### 6. Data Refresh
The Power BI Desktop report can be refreshed using **Home → Refresh**.

Power BI Service scheduled refresh requires:
- Successful publication of the report.
- An operational on-premises data gateway for local SQL Server.
- Matching SQL Server connection details and valid credentials.
- A configured refresh schedule.

**Service publishing and scheduled refresh are pending account and gateway configuration.**

### 7. Support and Troubleshooting
If visuals do not display expected results:
1. Check report filters and slicers.
2. Refresh the semantic model.
3. Verify SQL Server connectivity.
4. Check data refresh history when using Power BI Service.
5. Verify the user's assigned security role and region access.

**Project deliverable:** Enterprise_BI_Suite_Final.pbix