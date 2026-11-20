# Architecture and Implementation Decisions

## 1. Purpose

This document records the major technical and architectural decisions made during the development of the Enterprise Business Intelligence Suite for a Multi-Region Company: AdventureWorks.

The project integrates Sales, Finance, Human Resources, and Supply Chain reporting using AdventureWorks2025, SQL Server, Azure Data Factory, and Power BI Desktop.

## 2. Decision Summary

| Area | Decision | Reason |
|---|---|---|
| Operational Source | AdventureWorks2025 | Provides the operational source data |
| Analytical Warehouse | Custom SQL Server database `EnterpriseBI_DW` | Separates analytical reporting structures from operational data |
| Data Modelling | Fact and dimension tables | Supports analytical reporting |
| ETL Orchestration | Azure Data Factory | Provides pipeline-based integration and orchestration |
| SQL Connectivity | Self-hosted integration runtime | Connects ADF to the locally hosted SQL Server |
| Departmental ETL | Four departmental pipelines | Separates Sales, Finance, HR, and Supply Chain processing |
| Pipeline Orchestration | Master orchestration pipeline | Coordinates departmental pipeline execution |
| Warehouse Loading | Stored procedure activities | Encapsulates SQL-side loading logic |
| Reporting | Power BI Desktop | Provides semantic modelling, DAX, and dashboards |
| Data Preparation | Power Query | Supports data transformation and shaping |
| Analytical Calculations | DAX | Supports business KPIs and time intelligence |
| Security | Regional RLS for Sales and Finance | Provides validated regional access control |

## 3. Operational Source and Warehouse Separation

**Decision:** Use AdventureWorks2025 as the operational source and create a separate analytical database named `EnterpriseBI_DW`.

**Reasoning:**

A dedicated warehouse provides a centralized location for analytical structures and reporting transformations.

It also separates operational data from the analytical reporting environment.

**Outcome:**

The Power BI reporting layer uses the custom warehouse as its data foundation.

## 4. Dimensional Modelling

**Decision:** Organize analytical data using fact and dimension tables.

**Reasoning:**

Fact tables represent measurable business activities, while dimension tables provide descriptive context for filtering and grouping.

This approach supports analysis across Sales, Finance, HR, and Supply Chain.

**Outcome:**

The warehouse and Power BI model support reporting across the four business domains.

Exact fact-table grain, physical keys, and relationships are defined by the deployed SQL schema and final semantic model.

## 5. ETL Architecture

**Decision:** Use Azure Data Factory with a self-hosted integration runtime, linked services, datasets, four departmental pipelines, stored procedure activities, and a master orchestration pipeline.

**Reasoning:**

This approach separates departmental data-loading processes while providing a central workflow for coordinating execution.

**Outcome:**

The four departmental pipelines and master orchestration workflow were successfully executed and validated during development.

## 6. Power BI Architecture

**Decision:** Use Power BI Desktop as the reporting and semantic modelling environment.

### Implementation Choices

- Prepare and transform data using Power Query.
- Build relationships between warehouse fact and dimension tables.
- Create a dedicated measures table.
- Organize DAX measures into departmental folders.
- Develop four departmental KPI dashboards.
- Implement interactive filters and slicers.
- Provide drill-through functionality for detailed reporting.

### Measures Organization

```text
_Measures
│
├── 01_Sales
├── 02_Finance
├── 03_HR
├── 04_Supply_Chain
└── 05_Enterprise
```

**Outcome:**

Sales, Finance, HR, and Supply Chain dashboards were developed.

Product Details and Purchase Order Details are among the detailed reporting pages documented in the project.

## 7. Row-Level Security Decisions

**Decision:** Implement regional RLS where sufficiently supported regional access mappings were available. Document incomplete domains explicitly.

| Department | Implementation Status | Decision |
|---|---|---|
| Sales | Regional RLS implemented and validated | Included in validated regional access testing |
| Finance | Regional RLS implemented and validated | Included in validated regional access testing |
| HR | Partial regional mapping | Mapping covers 14 of 290 employees; full geographical coverage not implemented |
| Supply Chain | Global authorized-user access tested | Geographical regional mapping incomplete |

### Reasoning

Security rules should be based on reliable user-to-region and business-entity mappings.

Unverified production locations should not be assumed to represent geographical regions.

**Outcome:**

Sales and Finance regional security were validated. HR and Supply Chain limitations were documented rather than overstating the implementation.

## 8. HR Date Dimension Decision

**Challenge:**

The date ranges in HR employee department history and employee pay history did not align with the existing date dimension.

**Resolution:**

The date dimension was updated/extended, and the relevant HR fact-loading SQL was revised to cover the required HR date range.

Power BI model synchronization was also checked after the date changes.

## 9. SQL Server Collation Decision

**Challenge:**

A collation conflict occurred during inventory transaction development.

**Resolution:**

`COLLATE DATABASE_DEFAULT` was used where appropriate to align string comparisons with the database default collation.

**Outcome:**

The reported collation conflict was resolved.

## 10. Power BI Model Synchronization Decision

**Challenge:**

Changes to the date dimension in Power Query were not consistently reflected in the Power BI model and related HR fact tables.

**Resolution:**

The model was refreshed and synchronized, and the updated tables and relationships were verified.

**Outcome:**

The model synchronization issue was addressed during development.

## 11. Power BI Service Deployment Decision

The initial deployment plan included publishing the Power BI report to Power BI Service.

Publishing was not completed because a working email/account suitable for the Power BI publishing sign-in process could not be obtained or used.

The completed reporting environment therefore remains Power BI Desktop.

A local Desktop refresh was validated without an error.

The following activities were not completed:

- Power BI Service publishing.
- Gateway configuration for a published service model.
- Cloud scheduled refresh configuration and validation.

These activities remain future deployment improvements.

## 12. Performance Measurement Decision

No verified benchmark results were recorded for:

- ADF pipeline duration.
- SQL query execution latency.
- Power BI refresh duration.
- Dashboard loading time.
- End-to-end processing time.

Therefore, no performance figures are invented or reported.

Machine-learning accuracy, precision, recall, and F1 scores are not applicable to this BI reporting implementation because the project does not implement a predictive classification model.

## 13. Documentation and Reproducibility

The repository maintains the following core documentation files:

```text
docs/
│
├── data_dictionary.md
├── decisions.md
├── journal.md
└── requirements.md
```

The final project presentation and complete working demonstration video are hosted externally on Google Drive rather than being maintained as large binary files in the GitHub repository.

Their access links are provided in the `Final Project Deliverables` section of the repository README.

Environment-specific connection settings and credentials must be configured for each deployment environment and must never be committed to source control.