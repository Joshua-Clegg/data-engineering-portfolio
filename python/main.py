from etl.extract import extract_csv
from etl.transform import transform_covid_data
from etl.load import load_to_postgres


def run_etl():
    file_path =  r"C:\Users\joshc\data-engineering-portfolio\docs\data\covid_country_daily.csv"
    target_table = "covid_country_daily_stats"

    df = extract_csv(file_path)
    df = transform_covid_data(df)
    load_to_postgres(df, target_table)


if __name__ == "__main__":
    run_etl()
