# The Person They Were Then

[Data Modeling · Easy · on DataDriven](https://datadriven.io/problems/the_person_they_were_then)

## How it went

| | |
|---|---|
| Solved | 2026-09-01 |
| Accepted | on the 5th submission |
| Time | under a minute |
| Hints | none |
| Concepts | Denormalization, Dimension Tables, Fact Tables, Foreign Keys, Grain Definition, Metric Additivity, One-to-Many, Primary Keys, SCD Strategy, SCD Type 2, Star Schema, Surrogate Keys |

## The design

The accepted design, as it was graded:

```text
TABLE dim_user
  user_id BIGINT
  user_name VARCHAR
  valid_from DATE
  valid_to DATE
  is_current BOOLEAN
  subscription_tier VARCHAR
  country VARCHAR
  [PK] user_uuid UUID

TABLE ad_impression
  [PK] ad_imp_uuid UUID
  [FK] user_uuid UUID
  [FK] date_id UUID
  [FK] ad_uuid UUID
  revenue INT

TABLE date
  [PK] date_id UUID
  date
  MMYY
  YY

TABLE dim_ad
  [PK] ad_uuid
  ad_id
  ad_details

Relationships:
ad_impression.date_id -> date.date_id
dim_user.user_uuid -> ad_impression.user_uuid
ad_impression.ad_uuid -> dim_ad.ad_uuid
```
