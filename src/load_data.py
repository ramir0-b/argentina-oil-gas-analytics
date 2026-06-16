import pandas as pd
from sqlalchemy import create_engine

# Read CSV
df = pd.read_csv(
    "data/processed/argentina_oil_gas_clean.csv"
)

# Connect
engine = create_engine(
    "postgresql+psycopg2://postgres@localhost/argentina_oil_gas"
)

# Load
df.to_sql(
    "oil_gas_production",
    engine,
    if_exists="append",
    index=False
)

print(f"{len(df)} rows loaded.")