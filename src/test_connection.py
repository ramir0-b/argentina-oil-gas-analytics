from sqlalchemy import create_engine, text

engine = create_engine(
    "postgresql+psycopg2://postgres@localhost/argentina_oil_gas"
)

with engine.connect() as conn:
    result = conn.execute(text("SELECT version();"))

    print("Connected!")
    print(result.fetchone()[0])