# stock_database_and_analysis
From data collection to the analysis of trading strategies

### Project Organization

    ├── data
    │   ├── gdp_q.csv              <- CSV file. quarterly gdp data
    │   ├── monthly_macro.csv      <- CSV file. monthly unemployment rate, consumer price index, trade balance, and federal funda rate
    │   └── sp100_csv.csv          <- CSV file. the list of S&P100 stocks with their symbols and names (as of Jan 2019)
    │          
    │
    ├── DataCollection_API.ipynb   <- Jupyter notebook. Collects daily stock data from Alpha Vantage for the list of stocks. Output in csv.
    │                                 Need an Alpha Vantage key to run it. 
    │
    ├── DataInsertion_mysql.ipynb  <- Jupyter notebook. Inserts csv data files into mySQL
    │          
    │
    ├── DataUpdate.ipynb           <- Jupyter notebook. Adjusts the current mySQL database for stock splits. Technical indicators are also
    │                                 calculated then inserted into mySQL database.
    │
    ├── Interactive.ipynb          <- Jupyter notebook. Interactive platform to study the stock market and different trading strategies
    │
    ├── README.md                  <- README for users
    │
    ├── createDb.sql               <- SQL file for creating database. Includes all create tables and views
