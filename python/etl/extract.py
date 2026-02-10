import pandas as pd


def extract_csv(file_path: str) -> pd.DataFrame:
    """
    Extract data from a CSV file into a DataFrame.
    """
    print(f"Extracting data from {file_path}")
    df = pd.read_csv(file_path)
    print(f"Extracted {len(df)} rows")
    return df
