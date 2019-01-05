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
			static bool setup(const std::string& paramFile="", const std::string& stockFile="");

			// check map (return -1 if not found)
			static double getParamValue(const std::string& key) {
				auto it = parameters.find(key);
				if (it != parameters.end()) {
					return it->second;
				}
				return -1;
			}

			// Note: is reference
			static std::vector<Stock>& getWatchlist() { return watchlist; }

		private:
			// contains key-value pairs of trading parameters and limits
			// ie. "buyLimit" -> "$500"
			static std::map<std::string, double> parameters;

			// list of stock symbols to track
			static std::vector<Stock> watchlist;
	};
}