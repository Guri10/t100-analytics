## Automated ETL with Prefect Core

We use Prefect Core to orchestrate our daily pipeline:
1. **load_staging**: reloads the latest CSV from GCS into BigQuery staging  
2. **populate_dim_* & dim_route**: upserts dimension tables from staging  
3. **populate_fact_flights**: aggregates into our fact table

### Setup

```bash
git clone … && cd t100-analytics
python3 -m venv venv && source venv/bin/activate
pip install -r requirements.txt  # includes prefect, google-cloud-bigquery
gcloud auth application-default login
