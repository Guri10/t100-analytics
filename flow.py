# flow.py
import subprocess
from prefect import flow, task

# ── CONFIG ───────────────────────────────────────────────────────────────────
PROJECT = "t100-analysis"
DATASET = "t100_analytics"
GCS_CSV = "gs://t100-analytics-atharva-data/T_T100_MARKET_ALL_CARRIER_2024.csv"
# ──────────────────────────────────────────────────────────────────────────────

@task
def load_staging():
    cmd = [
        "bq", "--location=US", "load",
        "--autodetect", "--skip_leading_rows=1", "--source_format=CSV",
        f"{PROJECT}:{DATASET}.flights_staging", GCS_CSV
    ]
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        raise RuntimeError(f"Staging load failed:\n{result.stderr}")
    return result.stdout

@task
def run_sql_script(path: str):
    # Uses shell=True so we can pipe the file into bq query
    cmd = f"bq query --use_legacy_sql=false < {path}"
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        raise RuntimeError(f"SQL script {path} failed:\n{result.stderr}")
    return result.stdout

@flow(name="t100-etl")
def etl_flow():
    # 1) reload your staging table from GCS
    load_staging()

    # 2) run each dim-populate script in order
    for script in [
        "sql/populate_dim_date.sql",
        "sql/populate_dim_airport.sql",
        "sql/populate_dim_carrier.sql",
        "sql/populate_dim_route.sql",
    ]:
        run_sql_script(script)

    # 3) finally run the fact-populate
    run_sql_script("sql/populate_fact_flights.sql")

if __name__ == "__main__":
    etl_flow()



# 0 11 * * * cd /Users/atharvagurav/Documents/t100-analytics /Users/atharvagurav/Documents/t100-analytics/venv/bin/python flow.py >> etl.log 2>&1