// Strategy.hpp

#pragma once

#include "Order.hpp"
#include "Stock.hpp"

#include <map>
#include <vector>

namespace trading
{
	// TODO: read in JSON formatted parameters for strategy from file
	class Strategy
	{
		public:
			// paths from top-level
			static const std::string PARAM_CONFIG_FILE;
			static const std::string WATCHLIST_CONFIG_FILE;

			// parameter names
			static const std::string SELL_WHEN[];
			static const std::string BUY_WHEN[];

			// @return true if order agrees with strategy
			static bool shouldBuy(const std::string& symbol);

			// @return true if sell agrees with strategy
			static bool shouldSell(const std::string& symbol);

			// @brief fill parameters map and watchlist from config files
			// @return true on success, false on failure (ie. file does not exist)
			// Note: expects param config file to be formatted with <param><space><value>
			// Note: stocks.config should be formatted with <symbol>,<company name>,<industry> on each line
			static bool setup(const std::string& paramFile=PARAM_CONFIG_FILE, const std::string& stockFile=WATCHLIST_CONFIG_FILE);

			// save todays sentiment scores in the todaysSentiment map
			static void updateTodaysSentiment();

			// check map (return -1 if not found)
			static double getParamValue(const std::string& key) {
				auto it = parameters.find(key);
				if (it != parameters.end()) {
					return it->second;
				}
				return -1;
			}

			// check sentiment map
			static double getSentiment(const std::string& symbol) {
				auto it = todaysSentiments.find(symbol);
				if (it != todaysSentiments.end()) {
					return it->second;
				}
				return -1;
			}

			// Note: is reference
			static std::vector<Stock>& getWatchlist() { return watchlist; }

			// reserve level
			static double getMinCash() { return reserveCash; }

			static size_t getStocksToOwn() { return stocksToOwn; }

		private:
			// contains key-value pairs of trading parameters and limits
			// ie. "buyLimit" -> "$500"
			static std::map<std::string, double> parameters;

			// today's sentiment scores.
			// map stock symbol to a score
			// this will be filled on setup() to avoid rate-limiting by the Watson API
			static std::map<std::string, double> todaysSentiments;

			// list of stock symbols to track
			static std::vector<Stock> watchlist;

			// reserve cash
			static double reserveCash;

			// number of shares to own at any one time (cash will be split amongst this)
			static size_t stocksToOwn;

			// price above 200-day and 50-day moving averages
			static bool priceAbove200SMA, priceAbove50SMA;

			// last time we checked if the market was open
			static bool marketOpen;
			
			// for NLP sentiment analysis on news headlines
			static double sentimentMinScore;
			static size_t headlines;
	};
}