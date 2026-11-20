# Project Requirements and Completion Status

## 1. Project Objective

The objective of this project is to develop an integrated enterprise business intelligence solution using AdventureWorks2025.

The solution supports four major business functions:

1. Sales.
2. Finance.
3. Human Resources.
4. Supply Chain.

The implementation uses SQL Server for the analytical warehouse, Azure Data Factory for ETL orchestration, and Power BI Desktop for semantic modelling, DAX calculations, and interactive reporting.

## 2. Functional Requirements

| ID | Requirement | Implementation / Evidence | Status |
|---|---|---|---|
| FR-01 | Use AdventureWorks2025 as the operational source | AdventureWorks2025 selected as source OLTP database | Completed |
| FR-02 | Create a separate analytical warehouse | Custom SQL Server database `EnterpriseBI_DW` created | Completed |
| FR-03 | Organize data using dimensional modelling | Fact and dimension structures developed for four business domains | Completed |
| FR-04 | Profile source data | Column-level profiling observations recorded | Completed for recorded checks |
| FR-05 | Develop Sales ETL | Sales departmental ADF pipeline developed and executed | Completed |
| FR-06 | Develop Finance ETL | Finance departmental ADF pipeline developed and executed | Completed |
| FR-07 | Develop HR ETL | HR departmental ADF pipeline developed and executed | Completed |
| FR-08 | Develop Supply Chain ETL | Supply Chain departmental ADF pipeline developed and executed | Completed |
| FR-09 | Orchestrate departmental ETL | Master orchestration pipeline developed and successfully executed | Completed |
| FR-10 | Connect ADF to SQL Server | Self-hosted integration runtime, linked services, and datasets configured | Completed |
| FR-11 | Create a Power BI semantic model | Model developed using Power Query and relationships | Completed |
| FR-12 | Develop Sales analytics | Sales DAX measures and Sales KPI dashboard developed | Completed |
| FR-13 | Develop Finance analytics | Finance measures and Finance KPI dashboard developed | Completed |
| FR-14 | Develop HR analytics | HR measures and HR KPI dashboard developed | Completed |
| FR-15 | Develop Supply Chain analytics | Supply Chain measures and dashboard developed | Completed |
| FR-16 | Provide detailed record analysis | Product Details and Purchase Order Details drill-through pages developed | Completed |
| FR-17 | Provide interactive filtering | Slicers and filters included in departmental reports | Completed |
| FR-18 | Implement regional Sales RLS | Regional RLS implemented and validated | Completed |
| FR-19 | Implement regional Finance RLS | Regional RLS implemented and validated | Completed |
| FR-20 | Implement complete geographical HR RLS | Mapping covers 14 of 290 employees | Partially Completed |
| FR-21 | Implement geographical Supply Chain RLS | Global authorized-user access tested; geographical mapping incomplete | Partially Completed |
| FR-22 | Validate Power BI Desktop refresh | Local refresh completed without an error | Completed |
| FR-23 | Publish report to Power BI Service | Publishing was not completed | Not Completed |
| FR-24 | Configure cloud scheduled refresh | Requires published service model and appropriate gateway/configuration | Not Completed |

## 3. Non-Functional Requirements

| ID | Requirement | Implementation / Evidence | Status |
|---|---|---|---|
| NFR-01 | Separate operational and analytical data | Separate `EnterpriseBI_DW` database | Completed |
| NFR-02 | Support four business functions | Four departmental Power BI dashboards | Completed |
| NFR-03 | Provide repeatable ETL orchestration | Departmental pipelines and master orchestration | Completed |
| NFR-04 | Provide controlled data access | Validated Sales/Finance RLS; HR and Supply Chain limitations documented | Partially Completed |
| NFR-05 | Maintain project documentation | README and four core Markdown documents | Completed |
| NFR-06 | Provide final presentation and working demonstration | Final presentation and working demo video hosted on Google Drive, with access links provided in the repository README | Completed |
| NFR-07 | Measure system performance | No verified benchmark durations recorded | Not Measured |
| NFR-08 | Protect credentials and environment settings | Secrets must be configured locally and excluded from Git | Required Practice |

## 4. Recorded Validation Evidence

The following results were recorded during project development.

| Validation Check | Recorded Result |
|---|---|
| ADF Departmental Pipelines | Successfully executed and validated |
| ADF Master Orchestration | Successfully executed and validated |
| Inventory Transaction Fact | 113,443 rows |
| Work Order Fact | 72,591 rows |
| Customer Key Profiling | 100% valid across 19,820 records |
| Person ID Profiling | Approximately 96% valid |
| Product Key Profiling | 100% valid across 4,504 records |
| Product Colour Profiling | Approximately 51% populated/valid |
| Sales Person Key Profiling | 100% valid; 17 distinct values |
| Sales Territory Key Profiling | 100% valid; 10 distinct values |
| Power BI Desktop Refresh | Completed without an error |
| Sales Regional RLS | Implemented and validated |
| Finance Regional RLS | Implemented and validated |
| HR Regional Mapping | 14 of 290 employees covered |
| Supply Chain Access | Global authorized-user access tested; geographical mapping incomplete |

The profiling observations apply to specific columns and checks. They must not be interpreted as an overall data-quality score.

No verified benchmark results are available for:

- ADF pipeline execution duration.
- SQL query execution latency.
- Power BI refresh duration.
- Dashboard loading time.
- End-to-end processing time.

## 5. Security Acceptance Notes

The project demonstrates regional RLS for Sales and Finance.

The remaining security limitations are:

**HR:** Regional mapping covers only 14 of 290 employees. Complete geographical regional coverage is not implemented.

**Supply Chain:** Global authorized-user access was tested. Complete geographical regional mapping is incomplete because production locations were not verified as geographical facilities.

The solution must not be represented as having complete regional RLS across all four business domains.

## 6. Deployment Acceptance Notes

The Power BI Desktop report was refreshed locally without an error.

The following deployment activities were not completed:

- Power BI Service publishing.
- Gateway configuration for the published service model.
- Cloud scheduled refresh configuration and validation.

The README documents the publishing account/email limitation.

## 7. Final Completion Summary

The following major project components are complete:

- Operational source integration.
- Enterprise SQL Server data warehouse.
- Dimensional modelling.
- Data profiling and validation.
- Azure Data Factory ETL workflows.
- Four departmental ETL pipelines.
- Master orchestration.
- Power BI semantic modelling.
- DAX measure development.
- Four departmental KPI dashboards.
- Interactive reporting and drill-through.
- Sales and Finance regional RLS.
- Documentation of HR and Supply Chain security limitations.
- Final presentation.
- Working demonstration materials.
- Project documentation.

### Remaining Limitations and Future Improvements

1. Complete geographical regional RLS mapping for HR.
2. Complete geographical regional RLS mapping for Supply Chain.
3. Publish the Power BI report to Power BI Service.
4. Configure and validate gateway and cloud scheduled refresh.
5. Perform formal performance benchmarking if required.

These are documented limitations and future improvements, not completed features.