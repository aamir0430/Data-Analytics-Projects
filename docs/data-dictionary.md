# Data Dictionary — Enterprise Business Intelligence Suite

## 1. Purpose

This document describes the logical data model developed for the Enterprise Business Intelligence Suite using AdventureWorks2025.

The analytical warehouse is implemented in SQL Server under the database name:

`EnterpriseBI_DW`

The warehouse supports four major business domains:

- Sales
- Finance
- Human Resources
- Supply Chain

The purpose of this document is to describe the logical entities, business attributes, fact and dimension structures, and their roles in the reporting environment.

**Note:** This is a logical project-level data dictionary. Exact physical table names, schemas, column names, data types, and relationships should be verified against the deployed SQL Server database and final Power BI model.

## 2. Data Modelling Approach

The warehouse follows dimensional modelling principles.

### Fact Tables

Fact tables store measurable business activities and transactions.

Examples include:

- Sales transactions.
- Purchase orders.
- Inventory transactions.
- Production work orders.
- Employee department history.
- Employee pay history.

### Dimension Tables

Dimension tables provide descriptive information used to filter, group, and analyse facts.

Examples include:

- Date.
- Product.
- Customer.
- Employee.
- Vendor.
- Sales Territory.
- Department.

Power BI relationships connect the relevant dimensions and facts to support cross-functional analysis.

## 3. Sales Domain

The Sales domain supports revenue, profitability, customer, product, and regional analysis.

| Logical Entity | Description | Example Attributes |
|---|---|---|
| Sales Fact | Stores sales transaction information | Order ID, Customer Key, Product Key, Date, Quantity, Unit Price, Discount, Line Total |
| Date Dimension | Provides calendar information | Full Date, Year, Quarter, Month |
| Product Dimension | Provides product information | Product Key, Product Name, Colour, Category |
| Customer Dimension | Provides customer information | Customer Key, Person ID, Customer Attributes |
| Sales Territory Dimension | Provides territory information | Territory Key, Territory Name, Group |
| Employee/Salesperson Dimension or Mapping | Provides salesperson context where implemented | Employee Key, Salesperson Key, Employee Attributes |

### Sales Analytical Measures

The project includes Sales measures covering:

**Revenue**
- Total Sales
- Total Quantity Sold
- Total Orders
- Total Customers
- Average Order Value

**Profitability**
- Total Profit
- Total Cost
- Profit Margin Percentage
- Average Profit per Order

**Time Intelligence**
- 30-Day Rolling Sales
- Average Sales
- MTD Sales
- Previous Year Sales
- QTD Sales
- YOY Growth Percentage
- Sales YOY Growth Amount
- Sales YTD

**Business Analytics**
- 90-Day Rolling Sales Average
- Customer Revenue Contribution Percentage
- Discount Rate Percentage
- Product Revenue Contribution Percentage
- Regional Sales Contribution Percentage
- Revenue per Customer
- Total Discount Amount

The final Power BI report is the authoritative source for exact measure definitions and formulas.

## 4. Finance Domain

The Finance domain focuses on procurement and purchasing analysis.

| Logical Entity | Description | Example Attributes |
|---|---|---|
| Purchasing/Purchase Order Fact | Stores procurement activity | Purchase Order ID, Vendor Key, Order Date, Due Date, Quantity, Monetary Values |
| Date Dimension | Provides calendar context | Full Date, Year, Quarter, Month |
| Vendor Dimension | Provides supplier information | Vendor Key, Vendor Name, Vendor Attributes |
| Product Dimension | Provides product context where related | Product Key, Product Name, Product Attributes |

### Finance Reporting Areas

- Purchasing expenditure.
- Purchasing trends.
- Vendor performance.
- Purchase order analysis.
- Time-based purchasing analysis.

The final Power BI report is the authoritative source for exact Finance measure names and calculations.

## 5. Human Resources Domain

The HR domain supports workforce and employee-related reporting.

| Logical Entity | Description | Example Attributes |
|---|---|---|
| Employee Dimension | Stores employee descriptive information | Employee Key, Employee Attributes |
| Department Dimension | Stores department information | Department ID, Department Name |
| Employee Department History Fact/Bridge | Represents employee department assignment history | Employee Key, Department Key, Start Date, End Date |
| Employee Pay History Fact | Represents employee compensation history | Employee Key, Effective Date, Pay Rate |
| Date Dimension | Provides calendar context | Full Date, Year, Month, Quarter |

### HR Reporting Areas

- Workforce analysis.
- Department-wise employee distribution.
- Employee information.
- Compensation analysis.
- Employee department history.

Historical assignments and compensation records must be interpreted using their effective dates.

## 6. Supply Chain Domain

The Supply Chain domain supports inventory and production analysis.

| Logical Entity | Description | Example Attributes |
|---|---|---|
| Inventory Transaction Fact | Stores inventory transaction information | Product Key, Date, Transaction Type, Quantity |
| Work Order Fact | Stores production work-order information | Work Order ID, Product Key, Dates, Order Quantity, Scrap Quantity |
| Product Dimension | Provides product information | Product Key, Product Name, Product Attributes |
| Date Dimension | Provides calendar context | Full Date, Year, Quarter, Month |
| Other Operational Dimensions | Provide additional context where modelled | Attributes available in the deployed model |

### Recorded Supply Chain Fact Counts

| Fact Table | Recorded Rows |
|---|---:|
| Inventory Transaction Fact | 113,443 |
| Work Order Fact | 72,591 |

These are recorded development results and may vary if the source data or ETL process changes.

## 7. Important Attributes and Profiling Results

The following observations were recorded during data profiling.

| Attribute | Domain | Description | Recorded Observation |
|---|---|---|---|
| Customer Key | Sales | Identifies a customer record | 100% valid across 19,820 records |
| Person ID | Sales | Person identifier associated with customer records where available | Approximately 96% valid |
| Product Key | Sales/Supply Chain | Identifies a product record | 100% valid across 4,504 records |
| Colour | Product | Descriptive product attribute | Approximately 51% populated/valid |
| Sales Person Key | Sales | Identifies a salesperson record or mapping | 100% valid; 17 distinct values |
| Sales Territory Key | Sales | Identifies a sales territory | 100% valid; 10 distinct values |
| Full Date | Multiple | Calendar date used for reporting | Date coverage reviewed and adjusted during HR integration |
| Line Total | Sales | Sales line monetary amount | Used in Sales reporting |
| Unit Price | Sales | Price per unit | Used in transaction detail |
| Unit Price Discount | Sales | Discount associated with a sales line | Used in discount analysis |
| Order Quantity | Sales | Quantity associated with a sales line | Used in Sales analysis |

These observations refer to specific fields and checks. They must not be interpreted as an overall data-quality percentage.

Missing descriptive attributes, such as product colour, should not automatically be considered invalid business keys.

## 8. Power BI Semantic Model

The Power BI semantic model uses the warehouse tables and relationships for reporting.

Data preparation is performed using Power Query, while analytical calculations are developed using DAX.

The measures table is organized into the following folders:

```text
_Measures
│
├── 01_Sales
├── 02_Finance
├── 03_HR
├── 04_Supply_Chain
└── 05_Enterprise
```

The final PBIX file is the authoritative source for:

- Exact measure names.
- DAX formulas.
- Measure formatting.
- Table relationships.
- Report page names.
- Drill-through configurations.

## 9. Power BI Report Pages

The four primary dashboards are:

1. Sales KPI Dashboard.
2. Finance KPI Dashboard.
3. HR KPI Dashboard.
4. Supply Chain KPI Dashboard.

Detailed reporting pages include:

- Product Details.
- Purchase Order Details.

Customer Details and Vendor Details should be treated as implemented only where they are present and functional in the final Power BI report.

## 10. Security and Data Access

Regional Row-Level Security is implemented and validated for Sales and Finance.

HR regional mapping covers 14 of 290 employees and is incomplete.

Supply Chain global authorized-user access was tested, but complete geographical regional mapping remains incomplete because production locations were not verified as geographical facilities.

This data dictionary does not imply complete geographical RLS across all four departments.

## 11. Source of Truth

For exact implementation details, refer to:

1. The deployed SQL Server database `EnterpriseBI_DW`.
2. The committed SQL table-creation scripts.
3. The committed SQL ETL scripts.
4. The final Power BI PBIX file.
5. The Azure Data Factory pipeline definitions and execution history.

This document should be updated whenever the physical database schema or final Power BI model changes.