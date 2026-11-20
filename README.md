# Data Analytics Projects

A collection of end-to-end Data Analytics, Business Intelligence, Customer Analytics, Marketing Attribution, and Enterprise Reporting projects built using modern data engineering, analytics, and visualization technologies.

This repository brings together two comprehensive data analytics projects, demonstrating practical experience in data integration, data transformation, analytical modelling, business intelligence, customer segmentation, marketing performance measurement, enterprise reporting, and data visualization.

---

## Projects Overview

| Project | Domain | Primary Technologies |
|---|---|---|
| Customer 360 & Marketing Attribution Programme | Customer Analytics & Marketing Intelligence | Google BigQuery, dbt, Python, SQL, GA4, Tableau |
| Enterprise Business Intelligence Suite – AdventureWorks | Enterprise BI & Multi-Department Analytics | SQL Server 2025, Azure Data Factory, Power BI, DAX, Power Query, SQL |

---

# 1. Customer 360 & Marketing Attribution Programme

### Project Overview

The Customer 360 & Marketing Attribution Programme is an end-to-end customer analytics and marketing intelligence solution designed to integrate customer, website interaction, transaction, and marketing campaign data into a unified analytical environment.

The project focuses on developing a consolidated customer view, resolving customer identities across different data sources, analysing customer purchasing behaviour, calculating Customer Lifetime Value (CLV), performing RFM segmentation, and evaluating marketing campaign effectiveness through multiple attribution models.

The solution combines Google Analytics 4 (GA4) data, CRM information, identity mapping, and synthetic advertising datasets to develop customer-level insights and marketing performance reports.

### Key Objectives

- Build a unified Customer 360 analytical view.
- Integrate website interaction and CRM customer information.
- Perform identity resolution to connect anonymous and identified customer activity.
- Develop analytical data models using dbt.
- Perform RFM analysis and Customer Lifetime Value (CLV) analysis.
- Implement multiple marketing attribution models.
- Evaluate campaign performance, conversion efficiency, and marketing ROI.
- Develop interactive Tableau dashboards for business decision-making.

### Technology Stack

- Google BigQuery – Cloud data warehouse.
- dbt Core – Data transformation and analytical modelling.
- Python – Data preparation, analysis, and supporting workflows.
- SQL – Data extraction, transformation, modelling, and validation.
- Google Analytics 4 (GA4) – Website and e-commerce behavioural data.
- Segment – Customer identity and event-data context.
- Tableau – Interactive dashboards and visualization.

### Data Architecture

The project follows a layered analytical architecture.

**1. Data Sources**

- GA4 sessions and event data.
- CRM customer records.
- Customer identity mapping data.
- Advertising campaign and marketing spend data.

**2. Data Warehouse – Google BigQuery**

Raw and curated datasets are maintained in BigQuery.

Key source tables include:

- ga4_sessions
- ga4_events
- crm_customers
- identity_mapping
- identity_resolved_sessions

**3. Data Transformation – dbt**

The dbt project follows a modular transformation architecture:

- Staging models – Standardization and preparation of source datasets.
- Intermediate models – Business logic and transformation workflows.
- Mart models – Analytics-ready fact and dimension tables.

Major analytical models include:

- Fact Sessions
- Fact Orders
- Dimension Customer Profile
- Fact Customer RFM
- Dimension Customer Segments

**4. Analytics and Visualization**

The transformed data supports customer segmentation, lifetime value analysis, marketing attribution, campaign performance measurement, and Tableau reporting.

### Major Implementations

**Customer Identity Resolution**

- Integrated GA4 behavioural data with CRM customer information.
- Used identity mapping to associate customer activity across data sources.
- Developed a unified customer analytical view.
- Preserved identity mapping lineage and synthetic mapping indicators.

**Customer Segmentation and RFM Analysis**

- Implemented Recency, Frequency, and Monetary analysis.
- Developed customer-level RFM scoring.
- Created customer segments for behavioural and revenue analysis.
- Incorporated Customer Lifetime Value (CLV) analysis.

**Marketing Attribution**

Implemented four attribution approaches:

1. First-Touch Attribution
2. Last-Touch Attribution
3. Linear Attribution
4. Time-Decay Attribution

These models provide different perspectives on how marketing touchpoints contribute to customer conversions.

**Marketing Performance Analysis**

Analysed campaign-level metrics, including:

- Advertising impressions.
- Clicks and conversions.
- Advertising spend.
- Cost per Acquisition (CPA).
- Return on Investment (ROI).
- Campaign performance and marketing efficiency.

### Project Results and Validation

The analytical implementation includes the following recorded metrics:

| Metric | Result |
|---|---:|
| GA4 Sessions | 360,129 |
| Identified Customers | 10,246 |
| CRM Customer Records | 5,000 |
| Identity Mapping Records | 3,500 |
| Marketing Campaigns | 8 |
| Advertising Impressions | 9,246,272 |
| Advertising Clicks | 186,706 |
| Simulated Conversions | 6,231 |
| Advertising Spend | $126,552.23 |
| Simulated Cost per Acquisition | $20.31 |

**Testing and Validation**

- 21 schema tests passed.
- 5 singular dbt tests passed.
- 10 ROI validation checks passed.
- Advertising spend reconciliation difference: $0.

**Data and Analytical Limitations**

- CRM customer records, identity mappings, and advertising datasets include synthetic data.
- Marketing conversions are simulated rather than independently verified production conversions.
- Campaign attribution coverage is limited by the available source/medium mapping.
- Google / CPC is mapped, while six other source/medium combinations remain unmapped.

These limitations are documented to distinguish measured source data from synthetic and simulated analytical results.

### Tableau Dashboards

The project includes four interactive Tableau dashboards:

1. Customer 360 Executive Overview
2. Marketing Attribution & Conversion Insights
3. Campaign Performance
4. Marketing Efficiency & Budget Recommendations

These dashboards provide customer-level insights, campaign comparisons, attribution analysis, and marketing performance recommendations.

---

# 2. Enterprise Business Intelligence Suite for a Multi-Region Company: AdventureWorks

### Project Overview

The Enterprise Business Intelligence Suite for a Multi-Region Company is an integrated business intelligence solution developed using the AdventureWorks database.

The project brings together Sales, Finance, Human Resources, and Supply Chain data into a centralized enterprise data warehouse and reporting environment.

The primary objective is to develop a structured, scalable, and secure business intelligence solution that enables management to monitor operational performance, evaluate departmental KPIs, analyse business trends, and make data-driven decisions across multiple regions.

The project was developed as part of a Data Analytics Internship at Nexvia Technologies.

### Key Objectives

- Develop an enterprise data warehouse using AdventureWorks data.
- Integrate Sales, Finance, HR, and Supply Chain datasets.
- Design dimensional models and fact/dimension tables.
- Implement automated ETL workflows using Azure Data Factory.
- Develop analytical measures using DAX.
- Build departmental Power BI dashboards.
- Implement drill-through reporting and interactive filtering.
- Develop and validate Row-Level Security (RLS).
- Document architecture, implementation, testing, and deployment procedures.

### Technology Stack

**Database and Data Engineering**
- Microsoft SQL Server 2025
- SQL Server Management Studio (SSMS)
- SQL
- Azure Data Factory (ADF)
- Self-Hosted Integration Runtime

**Data Transformation and Business Intelligence**
- Power Query
- Power BI Desktop
- DAX (Data Analysis Expressions)

**Reporting and Documentation**
- Power BI dashboards
- SQL validation scripts
- Architecture documentation
- User guides and deployment documentation

### Data Architecture

The solution follows an enterprise data warehouse architecture.

**1. Source Database**

AdventureWorks2025 serves as the primary operational data source.

**2. Enterprise Data Warehouse**

A centralized Enterprise BI Data Warehouse was developed using SQL Server.

The warehouse integrates departmental data through dimensional modelling and fact/dimension structures.

**3. ETL – Azure Data Factory**

Azure Data Factory was configured to automate data integration and loading.

Major implementation components include:

- Self-Hosted Integration Runtime.
- Linked Services.
- Source and destination datasets.
- Four departmental ETL pipelines.
- Stored procedure activities.
- Master orchestration pipeline.

The pipelines support the integration of Sales, Finance, HR, and Supply Chain data.

**4. Business Intelligence – Power BI**

Power BI connects to the enterprise warehouse to support analytical modelling, DAX calculations, departmental KPIs, and interactive reporting.

### Major Implementations

**Enterprise Data Warehouse**

- Restored and profiled the AdventureWorks2025 source database.
- Created the EnterpriseBI_DW warehouse.
- Designed fact and dimension tables.
- Implemented dimensional data modelling.
- Performed data preparation and validation.
- Integrated departmental datasets.

**Automated ETL Development**

Implemented Azure Data Factory workflows with:

- Self-Hosted Integration Runtime.
- Configured linked services and datasets.
- Departmental ETL pipelines.
- Stored procedure execution.
- Master pipeline orchestration.

All four departmental pipelines completed successfully during the recorded implementation.

**Power BI Data Modelling and DAX**

Developed departmental analytical measures and KPI calculations.

Sales analytics includes 24 measures across four categories:

- Revenue.
- Profitability.
- Time Intelligence.
- Business Analytics.

Additional analytical measures were developed for Finance, HR, Supply Chain, and enterprise reporting.

### Departmental Dashboards

The Power BI solution includes four departmental KPI dashboards.

**1. Sales KPI Dashboard**

Focuses on:

- Total revenue.
- Sales quantity.
- Order performance.
- Customer performance.
- Profitability.
- Regional sales.
- Sales trends.
- Year-over-year performance.

**2. Finance KPI Dashboard**

Focuses on:

- Purchasing performance.
- Purchase trends.
- Vendor performance.
- Financial KPIs.
- Purchasing analysis.

**3. HR KPI Dashboard**

Focuses on:

- Employee distribution.
- Departmental workforce analysis.
- Employee compensation.
- HR performance indicators.
- Workforce-related reporting.

**4. Supply Chain KPI Dashboard**

Focuses on:

- Inventory transactions.
- Work order analysis.
- Supply chain operational performance.
- Inventory and production-related reporting.

### Row-Level Security (RLS)

A dynamic security framework was developed to control access to regional and departmental business data.

The implementation includes:

- Security user and region access mapping.
- User Principal Name (UPN)-based access control.
- Dynamic RLS logic.
- Regional access validation.
- Department-specific security testing.

**Implementation Scope and Documented Limitations**

The final implementation has different levels of geographical security coverage across departments:

- Sales: Regional RLS implemented and validated.
- Finance: Regional RLS implemented and validated.
- HR: Regional mapping covers 14 of 290 employees; full employee-level geographical coverage remains incomplete.
- Supply Chain: Global authorized-user access was implemented and tested. Geographical regional mapping remains incomplete because operational production locations have not been verified as geographical facilities.

These limitations are explicitly documented. The implementation should therefore not be interpreted as complete geographical RLS coverage across all four departments.

### ETL and Warehouse Validation

The completed ETL implementation includes the following recorded warehouse row counts:

| Fact Table | Records |
|---|---:|
| Fact Inventory Transaction | 113,443 |
| Fact Work Order | 72,591 |

All four departmental ETL pipelines completed successfully during the recorded execution.

Additional SQL validation, Power BI measure testing, dashboard verification, and RLS testing were performed throughout the implementation.

---

# 3. Repository Structure

The repository contains both projects in separate directories.

```text
Data-Analytics-Projects/
│
├── README.md
│
├── Customer_360_Marketing_Attribution/
│   │
│   ├── README.md
│   ├── docs/
│   ├── data/
│   ├── models/
│   ├── macros/
│   ├── seeds/
│   ├── snapshots/
│   ├── tests/
│   ├── SQL/
│   ├── Tableau/
│   └── Other project files
│
└── Enterprise_BI_AdventureWorks/
    │
    ├── README.md
    ├── SQL/
    ├── PowerBI/
    ├── Tableau/
    ├── ADF/
    ├── Documentation/
    ├── Architecture/
    └── Other project files
```

Note: The directory structure above provides an overview of the projects. Refer to the individual project directories for their complete implementation and documentation.

---

# 4. Project Demonstrations and Presentations

The working demonstrations and final presentation videos for both projects are hosted on Google Drive.

The videos are maintained separately from the GitHub repository.

## Project 1: Customer 360 & Marketing Attribution Programme

**Working Demo Video**

[(https://drive.google.com/drive/folders/1NqOojnF4_8HDE4aNvNmXU2YxDmdKSVYP?usp=drive_link)]

**Final Presentation Video**

[(https://drive.google.com/drive/folders/1NqOojnF4_8HDE4aNvNmXU2YxDmdKSVYP?usp=drive_link)]

## Project 2: Enterprise Business Intelligence Suite – AdventureWorks

**Working Demo Video**

[https://drive.google.com/drive/folders/1NqOojnF4_8HDE4aNvNmXU2YxDmdKSVYP?usp=drive_link]

**Final Presentation Video**

[(https://drive.google.com/drive/folders/1NqOojnF4_8HDE4aNvNmXU2YxDmdKSVYP?usp=drive_link)]

---

# 5. Documentation

Each project directory contains its own documentation covering the respective implementation.

Documentation includes:

- Project overview and objectives.
- Technical architecture.
- Data sources and data modelling.
- ETL and transformation workflows.
- Analytical implementation.
- Dashboard documentation.
- Testing and validation.
- Security implementation and limitations.
- Deployment and operational guidance.

Refer to the individual project README files for detailed technical documentation.

---

# 6. Key Skills Demonstrated

Through these two projects, the repository demonstrates practical implementation experience across the following areas:

**Data Analytics**
- Exploratory Data Analysis.
- Customer Analytics.
- RFM Analysis.
- Customer Lifetime Value.
- Marketing Attribution.
- Campaign Performance Analysis.
- Business KPI Analysis.

**Data Engineering**
- ETL Pipeline Development.
- Data Integration.
- Data Cleaning and Transformation.
- Data Warehouse Development.
- Dimensional Modelling.
- Analytical Data Modelling.

**Business Intelligence**
- Power BI Dashboard Development.
- Tableau Dashboard Development.
- DAX Measures.
- Power Query.
- Interactive Reporting.
- Drill-Through Analysis.
- Row-Level Security.

**Cloud and Data Platforms**
- Google BigQuery.
- dbt Core.
- Azure Data Factory.
- Microsoft SQL Server.

**Programming and Query Languages**
- Python.
- SQL.
- DAX.

---

# 7. Repository Purpose

This repository serves as a consolidated portfolio of practical data analytics and business intelligence implementations.

The two projects demonstrate different but complementary aspects of modern data analytics:

- Customer 360 focuses on customer intelligence, identity resolution, customer segmentation, marketing attribution, and campaign performance.
- Enterprise BI focuses on centralized data warehousing, automated ETL, departmental business intelligence, enterprise reporting, and access control.

Together, they demonstrate the application of data engineering, analytical modelling, business intelligence, and visualization techniques to solve business-oriented analytical problems.

---

## Author

**Aamir Sohail**

B.Tech – Computer Science and Engineering

Data Analytics | Business Intelligence | Data Engineering | SQL | Python | Power BI | Tableau

---

**Note:** Project-specific datasets, implementation details, synthetic data usage, testing evidence, and documented limitations are maintained in the respective project directories.# Data Analytics Projects
