# Project Development Journal

## Project Information

**Project Title:** Enterprise Business Intelligence Suite for a Multi-Region Company: AdventureWorks  
**Organization:** Nexvia Technologies  
**Internship:** Data Analytics Internship  
**Source Database:** AdventureWorks2025  
**Warehouse Database:** `EnterpriseBI_DW`

### Technology Stack

- SQL Server 2025
- SQL Server Management Studio
- SQL and T-SQL
- Azure Data Factory
- Self-Hosted Integration Runtime
- Power Query
- Power BI Desktop
- DAX
- Git and GitHub
- Markdown

This document consolidates the major development activities, implementation outcomes, and technical challenges encountered throughout the project.

---

## 1. Project Setup and Source Selection

The project began with the selection of AdventureWorks2025 as the operational source database.

A separate custom analytical database named `EnterpriseBI_DW` was created to support enterprise reporting.

The SQL project was organized into folders for:

- Data profiling.
- Database restoration.
- Warehouse development.
- ETL development.

Four major reporting domains were established:

1. Sales.
2. Finance.
3. Human Resources.
4. Supply Chain.

## 2. Data Profiling and Preparation

Source data profiling was performed to understand the completeness and validity of important business attributes.

The following observations were recorded:

| Attribute | Recorded Result |
|---|---|
| Customer Key | 100% valid across 19,820 records |
| Person ID | Approximately 96% valid |
| Product Key | 100% valid across 4,504 records |
| Product Colour | Approximately 51% populated/valid |
| Sales Person Key | 100% valid; 17 distinct values |
| Sales Territory Key | 100% valid; 10 distinct values |

These results refer to specific fields and profiling checks. They are not an overall data-quality score.

## 3. Enterprise Data Warehouse Development

The custom SQL Server database `EnterpriseBI_DW` was developed using AdventureWorks2025 as the operational source.

Major activities included:

- Creating analytical fact tables.
- Creating dimension tables.
- Organizing data for the four business domains.
- Developing SQL scripts for warehouse objects.
- Developing data-loading procedures.
- Performing SQL validation.
- Checking warehouse row counts.

### Recorded Supply Chain Results

| Fact Table | Recorded Rows |
|---|---:|
| Inventory Transaction Fact | 113,443 |
| Work Order Fact | 72,591 |

These counts were recorded during the project implementation.

## 4. Azure Data Factory and ETL Development

Azure Data Factory was implemented as the data integration and orchestration layer.

Major activities included:

1. Configuring the self-hosted integration runtime.
2. Establishing SQL Server connectivity.
3. Configuring linked services.
4. Creating datasets.
5. Developing four departmental ETL pipelines.
6. Incorporating stored procedure activities.
7. Developing the master orchestration pipeline.
8. Configuring pipeline dependencies.
9. Executing and monitoring the pipelines.

### Departmental Pipelines

- Sales ETL.
- Finance ETL.
- HR ETL.
- Supply Chain ETL.

The master orchestration pipeline coordinates departmental execution.

All four departmental pipelines and the master orchestration workflow were successfully executed and validated.

## 5. Power BI Data Modelling and DAX Development

Power BI Desktop was connected to the `EnterpriseBI_DW` database.

Major activities included:

- Importing warehouse data.
- Preparing and transforming data using Power Query.
- Developing relationships between fact and dimension tables.
- Creating a dedicated measures table.
- Organizing measures into departmental folders.
- Developing business KPIs.
- Implementing time-based calculations.
- Formatting measures for reporting.

### Measures Table Structure

```text
_Measures
│
├── 01_Sales
├── 02_Finance
├── 03_HR
├── 04_Supply_Chain
└── 05_Enterprise
```

Sales measures were developed across revenue, profitability, time intelligence, and business analytics.

Finance, HR, and Supply Chain measures were also developed to support their respective dashboards.

DAX and filter-context behaviour required troubleshooting during development. Individual measure results should be treated as verified only where confirmed in the final report and supporting test evidence.

## 6. Departmental Dashboard Development

Four departmental dashboards were developed in Power BI Desktop.

### 6.1 Sales KPI Dashboard

The Sales dashboard provides:

- Revenue analysis.
- Profitability analysis.
- Order metrics.
- Customer performance.
- Product performance.
- Regional sales analysis.
- Sales trend analysis.

### 6.2 Finance KPI Dashboard

The Finance dashboard provides:

- Purchasing expenditure analysis.
- Purchasing trends.
- Vendor performance.
- Purchase order analysis.

### 6.3 HR KPI Dashboard

The HR dashboard provides:

- Workforce analysis.
- Employee information.
- Department-wise workforce distribution.
- Compensation-related analysis.

### 6.4 Supply Chain KPI Dashboard

The Supply Chain dashboard provides:

- Inventory transaction analysis.
- Production performance.
- Work order analysis.
- Supply chain operational monitoring.

## 7. Drill-through and Interactive Reporting

Interactive filters and slicers were incorporated into the dashboards.

Drill-through functionality was developed to allow users to move from summarized business information to detailed records.

### Product Details

The Product Details page includes sales transaction information such as:

- Sales Order ID.
- Full Date.
- Customer Name.
- Order Quantity.
- Unit Price.
- Unit Price Discount.
- Line Total.

### Purchase Order Details

The Purchase Order Details page provides detailed purchasing information, including purchase order, vendor, and date-related information where available in the model.

## 8. Row-Level Security Implementation

Row-Level Security was implemented to support controlled access to business information.

### Final Recorded Status

| Department | Status |
|---|---|
| Sales | Regional RLS implemented and validated |
| Finance | Regional RLS implemented and validated |
| HR | Regional mapping covers 14 of 290 employees; incomplete |
| Supply Chain | Global authorized-user access tested; geographical regional mapping incomplete |

### HR Limitation

The current HR regional mapping covers only 14 out of 290 employees. Complete geographical regional security has not been implemented.

### Supply Chain Limitation

Global authorized-user access was tested. However, geographical regional mapping remains incomplete because operational production locations were not verified as geographical facilities.

These limitations were documented rather than presenting incomplete security as fully implemented.

## 9. Technical Challenges and Troubleshooting

### 9.1 HR Date Dimension Mismatch

The date ranges in HR employee department history and employee pay history did not align with the existing date dimension.

**Resolution:**

- Updated/extended the date dimension.
- Revised the relevant HR fact-loading SQL.
- Checked the resulting date coverage.

### 9.2 SQL Server Collation Conflict

A collation conflict occurred during inventory transaction development.

**Resolution:**

Used `COLLATE DATABASE_DEFAULT` where appropriate to resolve the reported string comparison conflict.

### 9.3 Power BI Model Synchronization

Power Query date-dimension changes were not consistently reflected in the Power BI model and related HR fact tables.

**Resolution:**

- Refreshed the model.
- Synchronized the updated data.
- Verified the updated tables and relationships.

### 9.4 DAX and Filter-Context Troubleshooting

Several DAX measures required investigation, particularly time-intelligence calculations and filter-context behaviour.

These investigations covered Sales, Finance, HR, and Supply Chain reporting.

Final measure values should be verified against the completed PBIX and available test evidence. This journal does not claim that every earlier measure issue was independently proven resolved.

## 10. Power BI Refresh and Deployment

A local refresh in Power BI Desktop was completed without an error.

Power BI Service publishing was part of the initial deployment plan but was not completed.

As a result:

- The completed reporting environment is Power BI Desktop.
- Publishing to Power BI Service was not completed.
- Gateway configuration for a published service model was not completed.
- Cloud scheduled refresh was not configured or validated.

## 11. Final Presentation and Working Demo

The final project presentation and complete working demonstration video were prepared as part of the project submission.

Both deliverables are hosted externally on Google Drive to avoid uploading large presentation and video files directly into the GitHub repository.

The Google Drive access links are maintained in the `Final Project Deliverables` section of the main README.

The working demonstration covers the major implementation components, including the SQL Server warehouse, Azure Data Factory pipelines, Power BI dashboards, drill-through functionality, and the implemented Row-Level Security scope.

## 12. Final Project Outcome

The completed project includes:

- AdventureWorks2025 operational source.
- Custom SQL Server warehouse `EnterpriseBI_DW`.
- Fact and dimension structures for four business domains.
- Azure Data Factory integration.
- Self-hosted integration runtime.
- Four departmental ETL pipelines.
- Master orchestration pipeline.
- Power BI semantic model.
- DAX measures.
- Four departmental KPI dashboards.
- Interactive filtering.
- Drill-through reporting.
- Sales and Finance regional RLS.
- Documented HR and Supply Chain RLS limitations.
- Final presentation.
- Working demo materials.
- Project documentation.

Power BI Service publishing, cloud scheduled refresh, complete HR geographical RLS, and complete Supply Chain geographical RLS remain outside the completed implementation scope.