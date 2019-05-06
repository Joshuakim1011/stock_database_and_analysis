# This GitHub repo is designed to
1. Set up MySQL database for stock market analysis (createDb.sql)
2. Collect daily stock prices using Alpha Vantage for more than one stock symbol and output it in csv format (DataCollection_API.ipynb)
3. Insert stock market data into MySQL using the csv data files (DataInsertion_mysql.ipynb)
4. Adjust the historical stock prices for stock splits (DataUpdate.ipynb)
5. Calculates and inserts 10, 30, 50 day simple moving averages and exponential moving averages, as well as MACD and MACD signal into MySQL (DataUpdate.ipynb)
6. Use Interactive features of Jupyter notebook to study the stock market. Data is queried from MySQL (Interactive.ipynb)

# Dependencies
- Python 3.7
- MySQL 8.0
- Jupyter Notebook
* Some libraries may need to be installed as you go (the error massage will notify which ones are missing)

# How to set up for the first time

Step 1: Set up MySQL database
- Open MySQL and Create a new database 
- Run CreateDb to create all tables with constraints

Step 2: Data Collection
- Open DataCollection_API.ipynb file in Jupyter notebook
- As noted in the code, you will need to get your own API for Alpha Vantage 
- Run each block of code in the order
- If the code ran succesfully, you will have daily_adjusted.csv file
- In Excel, remove the index column without column name and format the date column to 'yyyy-mm-dd'


Step 3: Data Insertion
- Open DataInsertion_mysql.ipynb in Jupyter notebook
- As noted in the code, you will need to set the host, user, password, and database name according to your mysql
- You can simply run each block of code in the order in DataInsertion_mysql.ipynb to insert
- If the code ran successfully, your MySQL database will be filled with data from csv


Step 4: Data Update 
- Open DataUpdate.ipynb in Jupyter notebook
- As noted in the code, you will need to set the host, user, password, and database name according to your mysql
- Run each block of the code in the order
- If the code ran successfully, daily stock prices should be adjusted for stock splits
- Technical_analysis table should also be filled

## Steps 2-4 can be reused to update the database in the future


# Interactive Platform
- Open Interactive.ipynb in Jupyter notebook
- As noted in the code, you will need to set the host, user, password, and database name according to your mysql
- Running the second block of code will hide all input code
- Run each block of the code in the order following the instructions
	- Choose whatever stock and dates you want! This is where you can explore the stock market
- You will be able to see various graphs of stock prices with respect to other indicators
- You will also be able to see how different trading strategies perform based on different indicators




# Limitations for the project
- Alpha Vantage limits API calls to 5 per minute and 500 per day. DataCollection takes a while to run (waiting 1 min for API limit)
- In order to run different stocks, a csv file with their symbols and compnay names will be required
- If you are repopulating a database, then you will have to manually change the start date in DataInsertion_mysql.ipynb
- You will have to manually find the GDP data and monthly macroeconomic indicators if using for a different range of dates
- DataUpdate.ipynb assumes that the past prices were not adjusted for split. If the data is already adjusted for splits, you need to take some portion of this out
- Performance will decrease for substantially larger data
- I only use Buy and Hold strategy and Long-Short trading based on SMA, EMA, and MACD. Much more complicated trading strategies may be implemented in the future
- Long-Short trading does not take account of dividends and trading costs

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
