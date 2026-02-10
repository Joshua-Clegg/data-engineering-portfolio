import psycopg2
from psycopg2.extras import execute_values
from db_config import DB_CONFIG


def load_to_postgres(df, table_name: str):
    """
    Load DataFrame into PostgreSQL table.
    """
    print(f"Loading data into {table_name}")

    conn = psycopg2.connect(**DB_CONFIG)
    cur = conn.cursor()

    columns = list(df.columns)
    values = [tuple(x) for x in df.to_numpy()]

    insert_query = f"""
        INSERT INTO {table_name} ({', '.join(columns)})
        VALUES %s
        ON CONFLICT DO NOTHING;
    """

    execute_values(cur, insert_query, values)

    conn.commit()
    cur.close()
    conn.close()

    print(f"Loaded {len(values)} rows into {table_name}")
