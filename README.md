# Overview
A Linux algorithmic trading application and C++ Alpaca Markets client.

Uses the open IEX API to fetch stock financial information and current prices, as well as the IBM Watson API to use Natural Language Processing of news headlines related to stocks on a watchlist.

# Using this as a C++ Alpaca Markets client library
The lib/ directory includes header-only files. You'll need to clone the folder, then you can include the library as follows:
```C++
#include <AlpacaCPP.h>
```

Setting up Alpaca authentication details:
```C++
trading::Authentication::setKeys("myKeyID", "mySecretKey");
```
Placing orders:
```C++
std::string symbol = "AAPL";
trading::Order* buyOrder = new trading::Order("buy", symbol, numSharesToBuy);
trading::Order* sellOrder = new trading::Order("sell", symbol, numSharesToSell);
```
Querying for market prices:
```C++
std::vector<std::string> stocks = {"AMZN", "AAPL", "BA", "VGT"};
std::vector<double> prices = tools::MarketData::getPrices(stocks);
```
Getting any key stats available from IEX API:
```C++
std::vector<std::string> interestedFields = {"marketcap", "dividendYield", "peRatioHigh"};
std::vector<double> keyStats = tools::MarketData::getKeyStats("AAPL", interestedFields);
```
Note: needs to be compiled with a "-lcurl" flag to link with cURL (see dependencies below).

# Dependencies
Relies on the libcurl, C++ Boost (version 1.68+), and rapidjson libraries.
cURL headers should be installed in /usr/include/curl and Boost in /usr/local/lib/boost_1_68_0.
Refer to: https://github.com/curl/curl and https://www.boost.org/.

# Running the Trader
After revising configuration and authentication settings and building the project (see below).
```bash
cd trader/
./trader.exe
```

# Manual mode
Orders can be manually cancelled or placed via the command-line by running the commands below. Users should then follow the application's on-screen instructions (i.e. will be asked for "buy", "sell", or "cancel", then for order-id (if cancelling) or for symbol and quantity.
```bash
cd trader/
./trader.exe manual
```

# Building
The application can be built by running the following:
```bash
cd trader/
bash build.bash
```

# Settings
A ".key-id" config file must be made under settings/ and formatted as following:
```javascript
{
  "paper-trading-id":"{your Alpaca Markets key}",
  "secret-key":"{your Alpaca Markets secret key}",
  "watson-api-key":"{your Watson NLP credentials}"
}
```
Stocks.config contains the stocks you want to have the algorithm track and potentially buy. 
Here's one line from the file:
```csv
AXP,American Express Co,Financials
```

Strategy.config contains adjustable "sell-when" and "buy-when" parameters.
Here's some of the "buy-when" parameters for reference:
```javascript
"buy-when":{
		"num-tests-met":7,
		"news-sentiment-above":0.4,
		"RSI-below":33,
		//  ...
		"price-above-50-SMA":true
	}
```
Output.config is used to specify the output mode of the trader ("debug", "verbose", or "production").
```javascript
{
   "mode":"debug"
}
```
