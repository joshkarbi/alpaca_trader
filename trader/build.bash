# Run using bash build.bash
# Add new .cpp files to link line below
# TODO: use CMake

# MAIN APPLICATION EXECUTABLE
# signing with gdb: https://www.thomasvitale.com/how-to-setup-gdb-and-eclipse-to-debug-c-files-on-macos-sierra/
echo "Main executable"
g++ -g -O main.cpp -std=c++11 -o trader.exe trading/Order.cpp trading/Strategy.cpp tools/OutputOptions.cpp trading/Holding.cpp trading/Trader.cpp tools/FileReadingUtilities.cpp tools/FileWritingUtilities.cpp tools/JSONUtilities.cpp tools/NetworkingUtilities.cpp tools/MarketData.cpp tools/SentimentAnalysis.cpp tools/AccountData.cpp tools/Authentication.cpp -lcurl -I /usr/local/lib/boost_1_68_0/ -I/usr/local/lib/


# For TEST files (ie. using Boost Test) 
# add compiler flag "-I /usr/local/lib/boost_1_68_0"
# add linker flag "-L /usr/local/lib/boost_1_68_0/stage/lib"
# add flag -lboost_unit_test_framework
# RUN test files with --log_level=all argument
echo "TestNetworkingUtilities"
g++ tests/TestNetworkingUtilities.cpp -std=c++11 -o TestNetworkingUtilities.exe tools/OutputOptions.cpp tools/JSONUtilities.cpp tools/FileReadingUtilities.cpp tools/NetworkingUtilities.cpp -I /usr/local/lib/boost_1_68_0/ -L /usr/local/lib/boost_1_68_0/stage/lib/ -I/usr/local/lib/ -lboost_unit_test_framework -lcurl

echo "TestStrategy"
g++ tests/TestStrategy.cpp -std=c++11 -o TestStrategy.exe tools/SentimentAnalysis.cpp trading/Holding.cpp tools/AccountData.cpp tools/OutputOptions.cpp trading/Strategy.cpp tools/NetworkingUtilities.cpp tools/Authentication.cpp tools/FileWritingUtilities.cpp tools/MarketData.cpp trading/Order.cpp tools/FileReadingUtilities.cpp tools/JSONUtilities.cpp -I /usr/local/lib/boost_1_68_0/ -L /usr/local/lib/boost_1_68_0/stage/lib/ -lboost_unit_test_framework -lcurl -I /usr/local/lib/boost_1_68_0/ -I/usr/local/lib/

echo "TestFileReadingUtilities"
g++ tests/TestFileReadingUtilities.cpp -std=c++11 -o TestFileReadingUtilities.exe tools/FileReadingUtilities.cpp -I /usr/local/lib/boost_1_68_0/ -L /usr/local/lib/boost_1_68_0/stage/lib/ -lboost_unit_test_framework -lcurl

echo "TestJSONUtilities"
g++ tests/TestJSONUtilities.cpp -std=c++11 -o TestJSONUtilities.exe tools/JSONUtilities.cpp -I /usr/local/lib/boost_1_68_0/ -I/usr/local/lib/ -L /usr/local/lib/boost_1_68_0/stage/lib/ -lboost_unit_test_framework -lcurl

echo "TestMarketData"
g++ tests/TestMarketData.cpp -std=c++11 -o TestMarketData.exe tools/MarketData.cpp tools/FileWritingUtilities.cpp tools/OutputOptions.cpp tools/Authentication.cpp tools/JSONUtilities.cpp tools/NetworkingUtilities.cpp tools/FileReadingUtilities.cpp -I /usr/local/lib/boost_1_68_0/ -I/usr/local/lib/ -L /usr/local/lib/boost_1_68_0/stage/lib/ -lboost_unit_test_framework -lcurl

echo "TestOrder"
g++ tests/TestOrder.cpp -std=c++11 -o TestOrder.exe tools/Authentication.cpp tools/FileWritingUtilities.cpp tools/OutputOptions.cpp tools/FileReadingUtilities.cpp tools/JSONUtilities.cpp tools/NetworkingUtilities.cpp trading/Order.cpp trading/Holding.cpp -I /usr/local/lib/boost_1_68_0/ -I/usr/local/lib/ -L /usr/local/lib/boost_1_68_0/stage/lib/ -lboost_unit_test_framework -lcurl

echo "TestAccountData"
g++ tests/TestAccountData.cpp -std=c++11 -o TestAccountData.exe tools/Authentication.cpp tools/OutputOptions.cpp tools/FileWritingUtilities.cpp tools/FileReadingUtilities.cpp tools/AccountData.cpp tools/JSONUtilities.cpp tools/NetworkingUtilities.cpp trading/Order.cpp trading/Holding.cpp -I /usr/local/lib/boost_1_68_0/ -I/usr/local/lib/ -L /usr/local/lib/boost_1_68_0/stage/lib/ -lboost_unit_test_framework -lcurl

echo "TestTrader"
g++ tests/TestTrader.cpp -std=c++11 -o TestTrader.exe trading/Order.cpp trading/Strategy.cpp tools/OutputOptions.cpp trading/Holding.cpp trading/Trader.cpp tools/FileReadingUtilities.cpp tools/FileWritingUtilities.cpp tools/JSONUtilities.cpp tools/NetworkingUtilities.cpp tools/MarketData.cpp tools/AccountData.cpp tools/Authentication.cpp tools/SentimentAnalysis.cpp -I /usr/local/lib/boost_1_68_0/ -I/usr/local/lib/ -L /usr/local/lib/boost_1_68_0/stage/lib/ -lboost_unit_test_framework -lcurl

echo "TestSentimentAnalysis"
g++ tests/TestSentimentAnalysis.cpp -std=c++11 -o TestSentimentAnalysis.exe trading/Order.cpp tools/OutputOptions.cpp trading/Strategy.cpp trading/Holding.cpp trading/Trader.cpp tools/FileReadingUtilities.cpp tools/FileWritingUtilities.cpp tools/JSONUtilities.cpp tools/NetworkingUtilities.cpp tools/MarketData.cpp tools/AccountData.cpp tools/Authentication.cpp tools/SentimentAnalysis.cpp -I /usr/local/lib/boost_1_68_0/ -I/usr/local/lib/ -L /usr/local/lib/boost_1_68_0/stage/lib/ -lboost_unit_test_framework -lcurl
