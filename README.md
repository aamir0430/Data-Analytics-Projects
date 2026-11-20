# Enterprise Business Intelligence Suite for a Multi-Region Company: AdventureWorks

**Organization:** Nexvia Technologies  
**Internship:** Data Analytics Internship  
**Source Database:** AdventureWorks2025  
**SQL Server Warehouse:** `EnterpriseBI_DW`  
**Reporting Platform:** Power BI Desktop

---

## 1. Project Overview

The Enterprise Business Intelligence Suite is an integrated analytics solution developed using the AdventureWorks2025 dataset.

The project brings together four major business functions:

- Sales
- Finance
- Human Resources (HR)
- Supply Chain

The primary objective is to develop a centralized enterprise data warehouse and an integrated reporting environment that transforms operational data into meaningful business insights.

The solution uses SQL Server for data warehousing, Azure Data Factory for ETL orchestration, and Power BI Desktop for data modelling, DAX calculations, and interactive dashboards.

This project demonstrates how data from multiple business departments can be integrated, transformed, analysed, and presented through a unified business intelligence environment.

## 2. Business Objectives

The major objectives of this project are:

1. Integrate operational data from multiple business departments.
2. Develop a centralized enterprise data warehouse.
3. Implement structured ETL workflows using Azure Data Factory.
4. Apply dimensional modelling using fact and dimension tables.
5. Develop analytical measures using DAX.
6. Build interactive departmental KPI dashboards.
7. Implement row-level security for controlled data access.
8. Provide detailed reporting through drill-through functionality.
9. Establish a reusable and maintainable business intelligence architecture.

## 3. Project Architecture

The implemented architecture follows this data flow:

```text
AdventureWorks2025
   (Source OLTP Database)
            |
            v
    Azure Data Factory
            |
   Self-Hosted Integration
         Runtime
            |
            v
    Departmental ETL
       Pipelines
            |
   +--------+--------+
   |        |        |
 Sales   Finance    HR
            |
       Supply Chain
            |
            v
   Master Orchestration
        Pipeline
            |
            v
      EnterpriseBI_DW
       (SQL Server)
            |
            v
     Power BI Data Model
            |
     Power Query + DAX
            |
            v
    Enterprise BI Reports
            |
   +--------+--------+
   |        |        |
 Sales   Finance    HR
            |
       Supply Chain
```

### Architecture Components

**1. Operational Data Source**

AdventureWorks2025 serves as the primary operational database.

**2. Data Integration**

Azure Data Factory manages the extraction and loading workflows. A self-hosted integration runtime establishes connectivity between Azure Data Factory and the locally hosted SQL Server environment.

**3. ETL Processing**

Four departmental ETL pipelines handle Sales, Finance, HR, and Supply Chain data. A master orchestration pipeline coordinates their execution and dependencies.

**4. Enterprise Data Warehouse**

The custom SQL Server database `EnterpriseBI_DW` provides the centralized analytical data foundation.

**5. Reporting and Analytics**

Power BI Desktop connects to the warehouse and provides data transformation, semantic modelling, DAX calculations, interactive dashboards, and drill-through reporting.

## 4. Technology Stack

| Layer | Technologies |
|---|---|
| Source Database | AdventureWorks2025 |
| Database Management | SQL Server 2025, SQL Server Management Studio |
| Query Language | SQL, T-SQL |
| Data Warehouse | Custom SQL Server Database |
| ETL and Orchestration | Azure Data Factory |
| Connectivity | Self-Hosted Integration Runtime |
| Data Transformation | Power Query |
| Business Intelligence | Power BI Desktop |
| Analytical Calculations | DAX |
| Version Control | Git, GitHub |
| Documentation | Markdown |

## 5. Enterprise Data Warehouse

The project uses a custom SQL Server database named:

`EnterpriseBI_DW`

The warehouse follows a dimensional modelling approach, organizing analytical data into fact and dimension tables.

### Business Domains

**Sales**

- Sales transactions
- Revenue analysis
- Profitability analysis
- Customer performance
- Product performance
- Regional sales performance
- Time-based sales analysis

**Finance**

- Purchasing expenditure
- Purchasing trends
- Vendor performance
- Purchase order analysis

**Human Resources**

- Employee information
- Department-wise workforce distribution
- Compensation-related analysis
- Employee history

**Supply Chain**

- Inventory transactions
- Production activities
- Work order analysis
- Inventory and production monitoring

## 6. Azure Data Factory Implementation

Azure Data Factory was used to implement the ETL and orchestration layer.

### Implemented Components

- Self-hosted integration runtime
- Linked services
- Datasets
- Four departmental ETL pipelines
- Stored procedure activities
- Master orchestration pipeline
- Pipeline dependencies
- Pipeline monitoring and execution validation

### Departmental Pipelines

1. Sales ETL Pipeline
2. Finance ETL Pipeline
3. HR ETL Pipeline
4. Supply Chain ETL Pipeline

The master orchestration pipeline coordinates departmental pipeline execution.

All four departmental pipelines and the master orchestration workflow were successfully executed and validated during development.

## 7. Power BI Implementation

Power BI Desktop was used to build the semantic model and reporting environment.

### Data Modelling

- Connected Power BI to `EnterpriseBI_DW`.
- Prepared and transformed data using Power Query.
- Developed relationships between fact and dimension tables.
- Created a dedicated measures table.
- Organized measures into departmental folders.

### DAX Measures Organization

The measures table contains the following folders:

```text
_Measures
│
├── 01_Sales
├── 02_Finance
├── 03_HR
├── 04_Supply_Chain
└── 05_Enterprise
```

### Departmental Dashboards

**1. Sales KPI Dashboard**

Provides insights into revenue, profitability, orders, customers, products, sales trends, and regional performance.

**2. Finance KPI Dashboard**

Provides insights into purchasing expenditure, purchasing trends, and vendor performance.

**3. HR KPI Dashboard**

Provides insights into workforce distribution, employee information, and compensation-related metrics.

**4. Supply Chain KPI Dashboard**

Provides insights into inventory transactions and production/work-order activities.

### Drill-through Functionality

Detailed reporting pages include:

- Product Details
- Purchase Order Details

These pages allow users to navigate from summarized dashboard information to relevant detailed records.

Customer Details and Vendor Details should be considered implemented only where present and functional in the final Power BI report.

## 8. Data Validation and Recorded Results

The following validation observations were recorded during development.

| Validation Area | Recorded Result |
|---|---|
| ADF Departmental Pipelines | Successful execution |
| ADF Master Orchestration | Successful execution |
| Inventory Transaction Fact | 113,443 rows |
| Work Order Fact | 72,591 rows |
| Customer Key | 100% valid across 19,820 records |
| Person ID | Approximately 96% valid |
| Product Key | 100% valid across 4,504 records |
| Product Colour | Approximately 51% populated/valid |
| Sales Person Key | 100% valid; 17 distinct values |
| Sales Territory Key | 100% valid; 10 distinct values |
| Power BI Desktop Refresh | Completed without an error |

The profiling percentages refer to specific columns and validation checks. They should not be interpreted as an overall warehouse data-quality score.

No verified benchmark values were recorded for ADF execution duration, SQL query latency, dashboard loading time, Power BI refresh duration, or end-to-end processing time. Therefore, no performance figures are claimed.

## 9. Row-Level Security (RLS)

Row-Level Security was implemented to control access to business information according to authorized user permissions.

### Implementation Status

| Department | RLS Status |
|---|---|
| Sales | Regional RLS implemented and validated |
| Finance | Regional RLS implemented and validated |
| HR | Regional mapping covers 14 of 290 employees; incomplete |
| Supply Chain | Global authorized-user access tested; geographical regional mapping incomplete |

### Documented Limitations

**Sales:** Regional row-level security was implemented and validated.

**Finance:** Regional row-level security was implemented and validated.

**HR:** The current regional mapping covers only 14 of 290 employees. Complete geographical regional coverage has not been implemented.

**Supply Chain:** Global authorized-user access was tested. Complete geographical regional mapping remains incomplete because operational production locations were not verified as geographical facilities.

These limitations are documented and should not be represented as complete regional RLS across all four departments.

## 10. Technical Challenges and Resolutions

Several technical challenges were encountered and addressed during development.

| Challenge | Resolution |
|---|---|
| HR date ranges did not align with the existing date dimension | Updated/extended the date dimension and revised HR fact-loading SQL |
| SQL Server collation conflict during inventory transaction development | Resolved using `COLLATE DATABASE_DEFAULT` where appropriate |
| Power BI model synchronization issues following date dimension changes | Refreshed and synchronized the model and verified updated tables and relationships |
| DAX time-intelligence and filter-context issues | Investigated measure logic and filter context; individual final results should be confirmed against the final report and test evidence |
| Incomplete geographical RLS mapping | Validated Sales and Finance regional RLS and documented HR and Supply Chain limitations |

## 11. Power BI Service Publishing Limitation

My initial plan was to publish the Power BI report to Power BI Service.

However, I could not complete this step because I was unable to obtain or use a working email/account suitable for the Power BI publishing sign-in process.

As a result, the completed reporting solution is available through Power BI Desktop, and the local Desktop refresh was successfully validated.

The following activities were not completed:

- Publishing the report to Power BI Service.
- Configuring a gateway for the published service model.
- Configuring and validating cloud-based scheduled refresh.

These are deployment improvements and are not represented as completed project functionality.

## 12. Repository Structure

The project repository is organized to separate source scripts, documentation, and project deliverables.

```text
enterprise-bi-suite-adventureworks/
│
├── README.md
│
├── docs/
│   ├── data_dictionary.md
│   ├── decisions.md
│   ├── journal.md
│   └── requirements.md
│
├── sql/
│   ├── 00_profiling/
│   ├── 001_restore/
│   ├── 02_warehouse/
│   └── 03_etl/
│
├── azure-data-factory/
│   └── ADF project artifacts (if exported)
│
└── powerbi/
    └── Power BI report and related files
```

The final project presentation and working demonstration video are hosted externally on Google Drive. Their access links are provided in the **Final Project Deliverables** section at the end of this README.

## 13. Project Review and Reproduction

To review the project:

1. Read this README.
2. Review `docs/requirements.md`.
3. Review `docs/decisions.md`.
4. Review `docs/data_dictionary.md`.
5. Review `docs/journal.md`.
6. Inspect the SQL scripts.
7. Review the Azure Data Factory artifacts, if exported.
8. Open the Power BI report using Power BI Desktop.
9. Access the final project presentation and working demonstration using the Google Drive links provided at the end of this README.

To reproduce the implementation, a compatible SQL Server environment, AdventureWorks2025 source database, warehouse scripts, and relevant ADF and Power BI artifacts are required.

Environment-specific connection settings, server names, integration runtime configuration, and credentials must be configured for the target environment.

Passwords, API keys, access tokens, and personal account credentials must never be committed to GitHub.

## 14. Final Project Status

The following components were completed:

- AdventureWorks2025 operational source integration.
- Custom SQL Server enterprise data warehouse.
- Fact and dimension structures for four business domains.
- Azure Data Factory ETL implementation.
- Four departmental ETL pipelines.
- Master orchestration pipeline.
- Power BI semantic model.
- DAX measures.
- Four departmental KPI dashboards.
- Interactive filtering and drill-through reporting.
- Sales and Finance regional RLS.
- Documented HR and Supply Chain security limitations.
- Final project presentation.
- Working demonstration materials.
- Project documentation.

Power BI Service publishing, cloud scheduled refresh, complete HR regional RLS, and complete geographical Supply Chain RLS remain outside the completed implementation scope.

---

**Project:** Enterprise Business Intelligence Suite for a Multi-Region Company: AdventureWorks  
**Organization:** Nexvia Technologies  
**Source Database:** AdventureWorks2025  
**Warehouse:** `EnterpriseBI_DW`

## 15. Final Project Deliverables

The final presentation and complete working demonstration video for the Enterprise Business Intelligence Suite are available through the following Google Drive links.

### Final Project Presentation

The presentation covers the project introduction, business objectives, system architecture, technology stack, enterprise data warehouse, ETL implementation, Power BI dashboards, validation results, security implementation, technical challenges, and individual project reflection.

**Google Drive Link:** (https://drive.google.com/drive/folders/1NqOojnF4_8HDE4aNvNmXU2YxDmdKSVYP?usp=drive_link)

### Complete Working Demo Video

The working demonstration provides a practical walkthrough of the implemented solution, including:

- System architecture.
- SQL Server Enterprise Data Warehouse.
- Azure Data Factory ETL pipelines.
- Successful pipeline execution history.
- Sales KPI Dashboard.
- Finance KPI Dashboard.
- HR KPI Dashboard.
- Supply Chain KPI Dashboard.
- Drill-through functionality.
- Sales and Finance Row-Level Security.
- Documented security limitations.

**Google Drive Link:** (https://drive.google.com/drive/folders/1NqOojnF4_8HDE4aNvNmXU2YxDmdKSVYP?usp=drive_link)

**Note:** Access to both deliverables depends on the Google Drive sharing permissions configured for the links.