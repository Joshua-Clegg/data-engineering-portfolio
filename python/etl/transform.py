import pandas as pd


def transform_covid_data(df: pd.DataFrame) -> pd.DataFrame:
    """
    Clean and transform COVID data for loading.
    """
    print("Transforming data...")

    # Normalize column names
    df.columns = (
        df.columns
        .str.lower()
        .str.strip()
        .str.replace(" ", "_")
        .str.replace("/", "_")
    )

    # Convert date column
    if "date" in df.columns:
        df["date"] = pd.to_datetime(df["date"], dayfirst=True)

    # Replace NaNs in numeric columns with 0
    numeric_cols = df.select_dtypes(include="number").columns
    df[numeric_cols] = df[numeric_cols].fillna(0)

    # Basic data quality check
    assert df.isnull().sum().sum() == 0, "Null values found after transformation"

    print("Transformation complete")
    return df
