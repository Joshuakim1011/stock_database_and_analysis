Create table date_conversion(
	date DATE NOT NULL,
	year smallint,
	month smallint,
	day smallint,
	PRIMARY KEY (date));

CREATE table symbols(
	symbol VARCHAR(5) NOT NULL,
	Name VARCHAR(50),
	PRIMARY KEY(symbol));


Create table daily_stock(
	daily_id INT NOT NULL,
	symbol VARCHAR(5) NOT NULL,
	date DATE NOT NULL,
	d_open DECIMAL(8,4),
	d_close DECIMAL(8,4),
	d_high DECIMAL(8,4),
	d_low DECIMAL(8,4),
	d_volume BIGINT,
	d_adjusted_close DECIMAL(8,4),
	d_dividend DECIMAL(8,4),
	split DECIMAL(8,4),
	PRIMARY KEY (daily_id),
	FOREIGN KEY (date) REFERENCES date_conversion(date),
	FOREIGN KEY (symbol) REFERENCES symbols(symbol));

Create table technical_analysis(
	ta_id INT NOT NULL,
	symbol VARCHAR(5) NOT NULL,
	date DATE NOT NULL,
	sma10 DECIMAL(8,4),
	sma30 DECIMAL(8,4),
	sma50 DECIMAL(8,4),
	ema10 DECIMAL(8,4),
	ema30 DECIMAL(8,4),
	ema50 DECIMAL(8,4),
	macd DECIMAL(8,4),
	macd_signal DECIMAL(8,4),
	PRIMARY KEY (ta_id),
	FOREIGN KEY (ta_id) REFERENCES daily_stock(daily_id),
	FOREIGN KEY (date) REFERENCES date_conversion(date),
	FOREIGN KEY (symbol) REFERENCES symbols(symbol));

Create table monthly_macro(
	date DATE,
	year smallint,
	month smallint,
	unemployment DECIMAL(3,1),
	fed_funds DECIMAL(4,2),
	cpi DECIMAL(12,8),
	trade_balance INT,
	PRIMARY KEY (date),
	FOREIGN KEY (date) REFERENCES date_conversion(date));

Create table gdp_q(
	date DATE,
	year smallint,
	month smallint,
	gdp DECIMAL(10,3),
	gdp_percentage DECIMAL(3,1),
	PRIMARY KEY (date),
	FOREIGN KEY (date) REFERENCES date_conversion(date));


ALTER TABLE daily_stock
add column s_adj smallint(3) not null
default 1;

ALTER TABLE daily_stock
ADD CONSTRAINT no_duplicates UNIQUE(symbol,date);


CREATE VIEW s_ratio as(
(SELECT daily_id, split,date,symbol
From daily_stock
Where daily_id=(Select max(daily_id) From daily_stock where s_adj=0)));


CREATE VIEW m_adj as (
select symbol, d_adjusted_close, MAX(date) as date
from daily_stock
group by symbol, year(date), month(date));

