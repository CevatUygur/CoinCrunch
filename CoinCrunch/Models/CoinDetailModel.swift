//
//  CoinDetailModel.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 23.01.2023.
//

import Foundation

// JSON Data
/*
 URL: https://api.coingecko.com/api/v3/coins/bitcoin?localization=false&tickers=true&market_data=false&community_data=false&developer_data=false&sparkline=false
 
 Response:
 {
   "id": "bitcoin",
   "symbol": "btc",
   "name": "Bitcoin",
   "asset_platform_id": null,
   "platforms": {
     "": ""
   },
   "detail_platforms": {
     "": {
       "decimal_place": null,
       "contract_address": ""
     }
   },
   "block_time_in_minutes": 10,
   "hashing_algorithm": "SHA-256",
   "categories": [
     "Cryptocurrency"
   ],
   "public_notice": null,
   "additional_notices": [],
   "description": {
     "en": "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the <a href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\">SHA-256</a> hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as <a href=\"https://www.coingecko.com/en/coins/litecoin\">Litecoin</a>, <a href=\"https://www.coingecko.com/en/coins/peercoin\">Peercoin</a>, <a href=\"https://www.coingecko.com/en/coins/primecoin\">Primecoin</a>, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by <a href=\"https://www.coingecko.com/en/coins/ethereum\">Ethereum</a> which led to the development of other amazing projects such as <a href=\"https://www.coingecko.com/en/coins/eos\">EOS</a>, <a href=\"https://www.coingecko.com/en/coins/tron\">Tron</a>, and even crypto-collectibles such as <a href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\">CryptoKitties</a>."
   },
   "links": {
     "homepage": [
       "http://www.bitcoin.org",
       "",
       ""
     ],
     "blockchain_site": [
       "https://blockchair.com/bitcoin/",
       "https://btc.com/",
       "https://btc.tokenview.io/",
       "",
       "",
       "",
       "",
       "",
       "",
       ""
     ],
     "official_forum_url": [
       "https://bitcointalk.org/",
       "",
       ""
     ],
     "chat_url": [
       "",
       "",
       ""
     ],
     "announcement_url": [
       "",
       ""
     ],
     "twitter_screen_name": "bitcoin",
     "facebook_username": "bitcoins",
     "bitcointalk_thread_identifier": null,
     "telegram_channel_identifier": "",
     "subreddit_url": "https://www.reddit.com/r/Bitcoin/",
     "repos_url": {
       "github": [
         "https://github.com/bitcoin/bitcoin",
         "https://github.com/bitcoin/bips"
       ],
       "bitbucket": []
     }
   },
   "image": {
     "thumb": "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
     "small": "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579",
     "large": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"
   },
   "country_origin": "",
   "genesis_date": "2009-01-03",
   "sentiment_votes_up_percentage": 78.89,
   "sentiment_votes_down_percentage": 21.11,
   "market_cap_rank": 1,
   "coingecko_rank": 1,
   "coingecko_score": 83.151,
   "developer_score": 99.241,
   "community_score": 83.341,
   "liquidity_score": 100.011,
   "public_interest_score": 0.073,
   "public_interest_stats": {
     "alexa_rank": 9440,
     "bing_matches": null
   },
   "status_updates": [],
   "last_updated": "2023-01-22T21:04:52.490Z",
   "tickers": [
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Binance",
         "identifier": "binance",
         "has_trading_incentive": false
       },
       "last": 22442.91,
       "volume": 257737.52743445037,
       "converted_last": {
         "btc": 0.99999332,
         "eth": 13.916563,
         "usd": 22529
       },
       "converted_volume": {
         "btc": 257736,
         "eth": 3586820,
         "usd": 5806560510
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.013595,
       "timestamp": "2023-01-22T21:03:03+00:00",
       "last_traded_at": "2023-01-22T21:03:03+00:00",
       "last_fetch_at": "2023-01-22T21:03:03+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.binance.com/en/trade/BTC_USDT?ref=37754157",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "BUSD",
       "market": {
         "name": "Binance",
         "identifier": "binance",
         "has_trading_incentive": false
       },
       "last": 22534.44,
       "volume": 155977.56714039683,
       "converted_last": {
         "btc": 1.000114,
         "eth": 13.935238,
         "usd": 22541
       },
       "converted_volume": {
         "btc": 155995,
         "eth": 2173585,
         "usd": 3515867663
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.011776,
       "timestamp": "2023-01-22T20:48:48+00:00",
       "last_traded_at": "2023-01-22T20:48:48+00:00",
       "last_fetch_at": "2023-01-22T20:48:48+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.binance.com/en/trade/BTC_BUSD?ref=37754157",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "binance-usd"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Bitforex",
         "identifier": "bitforex",
         "has_trading_incentive": false
       },
       "last": 22425.65,
       "volume": 6366.8758,
       "converted_last": {
         "btc": 0.99922426,
         "eth": 13.891137,
         "usd": 22511
       },
       "converted_volume": {
         "btc": 6362,
         "eth": 88443,
         "usd": 143322894
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.016446,
       "timestamp": "2023-01-22T21:01:50+00:00",
       "last_traded_at": "2023-01-22T21:01:50+00:00",
       "last_fetch_at": "2023-01-22T21:01:50+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitforex.com/en/spot/btc_usdt",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USD",
       "market": {
         "name": "Coinbase Exchange",
         "identifier": "gdax",
         "has_trading_incentive": false
       },
       "last": 22443.22,
       "volume": 26846.41530934,
       "converted_last": {
         "btc": 0.99623479,
         "eth": 13.86278,
         "usd": 22443
       },
       "converted_volume": {
         "btc": 26745,
         "eth": 372166,
         "usd": 602520005
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.018822,
       "timestamp": "2023-01-22T21:02:15+00:00",
       "last_traded_at": "2023-01-22T21:02:15+00:00",
       "last_fetch_at": "2023-01-22T21:02:15+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://pro.coinbase.com/trade/BTC-USD",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USD",
       "market": {
         "name": "Bitfinex",
         "identifier": "bitfinex",
         "has_trading_incentive": false
       },
       "last": 22475,
       "volume": 1628.39026604,
       "converted_last": {
         "btc": 0.99759784,
         "eth": 13.883226,
         "usd": 22475
       },
       "converted_volume": {
         "btc": 1624,
         "eth": 22607,
         "usd": 36598071
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.044563,
       "timestamp": "2023-01-22T21:03:32+00:00",
       "last_traded_at": "2023-01-22T21:03:32+00:00",
       "last_fetch_at": "2023-01-22T21:03:32+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitfinex.com/t/BTCUSD",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "BTCEX",
         "identifier": "btcex",
         "has_trading_incentive": false
       },
       "last": 22443.779,
       "volume": 8207.51867,
       "converted_last": {
         "btc": 1.000032,
         "eth": 13.91562,
         "usd": 22529
       },
       "converted_volume": {
         "btc": 8347,
         "eth": 116156,
         "usd": 188051760
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.013501,
       "timestamp": "2023-01-22T21:02:19+00:00",
       "last_traded_at": "2023-01-22T21:02:19+00:00",
       "last_fetch_at": "2023-01-22T21:02:19+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.btcex.com/spot?target=BTC-USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "MEXC Global",
         "identifier": "mxc",
         "has_trading_incentive": false
       },
       "last": 22469,
       "volume": 52202.439242,
       "converted_last": {
         "btc": 1.001156,
         "eth": 13.932741,
         "usd": 22555
       },
       "converted_volume": {
         "btc": 52263,
         "eth": 727323,
         "usd": 1177434268
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.016857,
       "timestamp": "2023-01-22T21:03:52+00:00",
       "last_traded_at": "2023-01-22T21:03:52+00:00",
       "last_fetch_at": "2023-01-22T21:03:52+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.mexc.com/exchange/BTC_USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Dcoin",
         "identifier": "dcoin",
         "has_trading_incentive": false
       },
       "last": 22423.25,
       "volume": 8025,
       "converted_last": {
         "btc": 0.99911732,
         "eth": 13.889651,
         "usd": 22508
       },
       "converted_volume": {
         "btc": 8018,
         "eth": 111464,
         "usd": 180629114
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.050506,
       "timestamp": "2023-01-22T21:01:59+00:00",
       "last_traded_at": "2023-01-22T21:01:59+00:00",
       "last_fetch_at": "2023-01-22T21:01:59+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.dcoin.com/currencyTrading/BTC_USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDC",
       "market": {
         "name": "BingX",
         "identifier": "bingx",
         "has_trading_incentive": false
       },
       "last": 22450.61,
       "volume": 576.76356,
       "converted_last": {
         "btc": 1.000219,
         "eth": 13.9197,
         "usd": 22534
       },
       "converted_volume": {
         "btc": 586.747,
         "eth": 8166,
         "usd": 13218898
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.104442,
       "timestamp": "2023-01-22T21:03:10+00:00",
       "last_traded_at": "2023-01-22T21:03:10+00:00",
       "last_fetch_at": "2023-01-22T21:03:10+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://bingx.com/en-us/spot/BTCUSDC",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "usd-coin"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "P2B",
         "identifier": "p2pb2b",
         "has_trading_incentive": false
       },
       "last": 22501.9,
       "volume": 14078.19637,
       "converted_last": {
         "btc": 1.002622,
         "eth": 13.951656,
         "usd": 22587
       },
       "converted_volume": {
         "btc": 14115,
         "eth": 196414,
         "usd": 317985708
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.010623,
       "timestamp": "2023-01-22T20:42:23+00:00",
       "last_traded_at": "2023-01-22T20:42:23+00:00",
       "last_fetch_at": "2023-01-22T21:02:38+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": null,
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Gate.io",
         "identifier": "gate",
         "has_trading_incentive": false
       },
       "last": 22445.6,
       "volume": 7719.4491138234,
       "converted_last": {
         "btc": 1.000113,
         "eth": 13.918231,
         "usd": 22532
       },
       "converted_volume": {
         "btc": 7852,
         "eth": 109276,
         "usd": 176901844
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.017564,
       "timestamp": "2023-01-22T21:03:05+00:00",
       "last_traded_at": "2023-01-22T21:03:05+00:00",
       "last_fetch_at": "2023-01-22T21:03:05+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://gate.io/trade/BTC_USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Tidex",
         "identifier": "tidex",
         "has_trading_incentive": false
       },
       "last": 22435.64,
       "volume": 23288.57480629,
       "converted_last": {
         "btc": 0.99966939,
         "eth": 13.897325,
         "usd": 22521
       },
       "converted_volume": {
         "btc": 23281,
         "eth": 323649,
         "usd": 524475888
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.275421,
       "timestamp": "2023-01-22T21:01:55+00:00",
       "last_traded_at": "2023-01-22T21:01:55+00:00",
       "last_fetch_at": "2023-01-22T21:01:55+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": null,
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "BUSD",
       "market": {
         "name": "Tidex",
         "identifier": "tidex",
         "has_trading_incentive": false
       },
       "last": 22450.3474265,
       "volume": 14247.4891749,
       "converted_last": {
         "btc": 0.99626826,
         "eth": 13.850639,
         "usd": 22443
       },
       "converted_volume": {
         "btc": 14194,
         "eth": 197337,
         "usd": 319761274
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.022073,
       "timestamp": "2023-01-22T21:00:33+00:00",
       "last_traded_at": "2023-01-22T21:00:33+00:00",
       "last_fetch_at": "2023-01-22T21:00:33+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": null,
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "binance-usd"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "XT.COM",
         "identifier": "xt",
         "has_trading_incentive": false
       },
       "last": 22446.19,
       "volume": 9315.934831,
       "converted_last": {
         "btc": 1.000139,
         "eth": 13.904458,
         "usd": 22531
       },
       "converted_volume": {
         "btc": 9483,
         "eth": 131835,
         "usd": 213623292
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.010426,
       "timestamp": "2023-01-22T21:00:44+00:00",
       "last_traded_at": "2023-01-22T21:00:44+00:00",
       "last_fetch_at": "2023-01-22T21:00:44+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.xt.com/trade/btc_usdt",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USD",
       "market": {
         "name": "Gate.io",
         "identifier": "gate",
         "has_trading_incentive": false
       },
       "last": 22474.97,
       "volume": 1240.64889553,
       "converted_last": {
         "btc": 0.99759651,
         "eth": 13.883207,
         "usd": 22475
       },
       "converted_volume": {
         "btc": 1257,
         "eth": 17498,
         "usd": 28326098
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.097694,
       "timestamp": "2023-01-22T21:03:28+00:00",
       "last_traded_at": "2023-01-22T21:03:28+00:00",
       "last_fetch_at": "2023-01-22T21:03:28+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://gate.io/trade/BTC_USD",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USD",
       "market": {
         "name": "Bitstamp",
         "identifier": "bitstamp",
         "has_trading_incentive": false
       },
       "last": 22491,
       "volume": 1600.78430241,
       "converted_last": {
         "btc": 0.99830803,
         "eth": 13.893109,
         "usd": 22491
       },
       "converted_volume": {
         "btc": 1598,
         "eth": 22240,
         "usd": 36003240
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.050363,
       "timestamp": "2023-01-22T21:03:52+00:00",
       "last_traded_at": "2023-01-22T21:03:52+00:00",
       "last_fetch_at": "2023-01-22T21:03:52+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitstamp.net/markets/btc/usd/",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDC",
       "market": {
         "name": "ApeX Pro",
         "identifier": "apex_pro",
         "has_trading_incentive": false
       },
       "last": 22487.5,
       "volume": 1634.614,
       "converted_last": {
         "btc": 1.001862,
         "eth": 13.948245,
         "usd": 22492
       },
       "converted_volume": {
         "btc": 1665,
         "eth": 23183,
         "usd": 37382202
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.012223,
       "timestamp": "2023-01-22T21:04:06+00:00",
       "last_traded_at": "2023-01-22T21:04:06+00:00",
       "last_fetch_at": "2023-01-22T21:04:06+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://pro.apex.exchange/trade/BTC-USDC",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "usd-coin"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "WOO Network",
         "identifier": "wootrade",
         "has_trading_incentive": false
       },
       "last": 22418.28,
       "volume": 1094.95606308,
       "converted_last": {
         "btc": 0.99889587,
         "eth": 13.89981,
         "usd": 22503
       },
       "converted_volume": {
         "btc": 1094,
         "eth": 15220,
         "usd": 24639981
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.024051,
       "timestamp": "2023-01-22T21:02:01+00:00",
       "last_traded_at": "2023-01-22T21:02:01+00:00",
       "last_fetch_at": "2023-01-22T21:02:01+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://x.woo.network/spot",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "BUSD",
       "market": {
         "name": "P2B",
         "identifier": "p2pb2b",
         "has_trading_incentive": false
       },
       "last": 22503.45,
       "volume": 12994.555156,
       "converted_last": {
         "btc": 0.99862477,
         "eth": 13.896037,
         "usd": 22497
       },
       "converted_volume": {
         "btc": 12977,
         "eth": 180573,
         "usd": 292339307
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.010623,
       "timestamp": "2023-01-22T20:42:23+00:00",
       "last_traded_at": "2023-01-22T20:42:23+00:00",
       "last_fetch_at": "2023-01-22T21:02:37+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": null,
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "binance-usd"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "OKX",
         "identifier": "okex",
         "has_trading_incentive": false
       },
       "last": 22485.5,
       "volume": 8258.91076589,
       "converted_last": {
         "btc": 1.001891,
         "eth": 13.942972,
         "usd": 22572
       },
       "converted_volume": {
         "btc": 8388,
         "eth": 116735,
         "usd": 188977499
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.010445,
       "timestamp": "2023-01-22T21:03:56+00:00",
       "last_traded_at": "2023-01-22T21:03:56+00:00",
       "last_fetch_at": "2023-01-22T21:03:56+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.okx.com/trade-spot/btc-usdt",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "EUR",
       "market": {
         "name": "Bitstamp",
         "identifier": "bitstamp",
         "has_trading_incentive": false
       },
       "last": 20700,
       "volume": 296.18741453,
       "converted_last": {
         "btc": 0.99852734,
         "eth": 13.896161,
         "usd": 22496
       },
       "converted_volume": {
         "btc": 295.751,
         "eth": 4116,
         "usd": 6663015
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.067198,
       "timestamp": "2023-01-22T21:03:52+00:00",
       "last_traded_at": "2023-01-22T21:03:52+00:00",
       "last_fetch_at": "2023-01-22T21:03:52+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitstamp.net/markets/btc/eur/",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USD",
       "market": {
         "name": "P2B",
         "identifier": "p2pb2b",
         "has_trading_incentive": false
       },
       "last": 22504.73,
       "volume": 10168.619274,
       "converted_last": {
         "btc": 0.99896517,
         "eth": 13.900774,
         "usd": 22505
       },
       "converted_volume": {
         "btc": 10158,
         "eth": 141352,
         "usd": 228842031
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.05767,
       "timestamp": "2023-01-22T20:42:23+00:00",
       "last_traded_at": "2023-01-22T20:42:23+00:00",
       "last_fetch_at": "2023-01-22T21:02:37+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": null,
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "TUSD",
       "market": {
         "name": "WhiteBIT",
         "identifier": "whitebit",
         "has_trading_incentive": false
       },
       "last": 22499.73,
       "volume": 88.255821,
       "converted_last": {
         "btc": 1.001793,
         "eth": 13.941613,
         "usd": 22570
       },
       "converted_volume": {
         "btc": 88.414,
         "eth": 1230,
         "usd": 1991892
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.121638,
       "timestamp": "2023-01-22T21:03:36+00:00",
       "last_traded_at": "2023-01-22T21:03:36+00:00",
       "last_fetch_at": "2023-01-22T21:03:36+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://whitebit.com/trade/BTC_TUSD",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "true-usd"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "BitMart",
         "identifier": "bitmart",
         "has_trading_incentive": false
       },
       "last": 22460.04,
       "volume": 18453.12674,
       "converted_last": {
         "btc": 1.000757,
         "eth": 13.925702,
         "usd": 22545
       },
       "converted_volume": {
         "btc": 18467,
         "eth": 256973,
         "usd": 416027349
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.019749,
       "timestamp": "2023-01-22T21:02:35+00:00",
       "last_traded_at": "2023-01-22T21:02:35+00:00",
       "last_fetch_at": "2023-01-22T21:02:35+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitmart.com/trade/en?layout=basic&symbol=BTC_USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "BKEX",
         "identifier": "bkex",
         "has_trading_incentive": false
       },
       "last": 22481.81,
       "volume": 13164.5122,
       "converted_last": {
         "btc": 1.001727,
         "eth": 13.940684,
         "usd": 22568
       },
       "converted_volume": {
         "btc": 13394,
         "eth": 186400,
         "usd": 301755313
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.010489,
       "timestamp": "2023-01-22T21:03:34+00:00",
       "last_traded_at": "2023-01-22T21:03:34+00:00",
       "last_fetch_at": "2023-01-22T21:03:34+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bkex.com/#/trade/BTC_USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Huobi",
         "identifier": "huobi",
         "has_trading_incentive": false
       },
       "last": 22560,
       "volume": 2268.750442627681,
       "converted_last": {
         "btc": 1.005211,
         "eth": 13.974958,
         "usd": 22645
       },
       "converted_volume": {
         "btc": 2298,
         "eth": 31947,
         "usd": 51765913
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.010044,
       "timestamp": "2023-01-22T21:00:31+00:00",
       "last_traded_at": "2023-01-22T21:00:31+00:00",
       "last_fetch_at": "2023-01-22T21:00:31+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.huobi.com/en-us/exchange/btc_usdt",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "WhiteBIT",
         "identifier": "whitebit",
         "has_trading_incentive": false
       },
       "last": 22477.53,
       "volume": 17476.758664,
       "converted_last": {
         "btc": 1.001536,
         "eth": 13.93803,
         "usd": 22564
       },
       "converted_volume": {
         "btc": 17504,
         "eth": 243592,
         "usd": 394340702
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.020196,
       "timestamp": "2023-01-22T21:03:36+00:00",
       "last_traded_at": "2023-01-22T21:03:36+00:00",
       "last_fetch_at": "2023-01-22T21:03:36+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://whitebit.com/trade/BTC_USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "ETH",
       "target": "BTC",
       "market": {
         "name": "DigiFinex",
         "identifier": "digifinex",
         "has_trading_incentive": false
       },
       "last": 0.07184,
       "volume": 5634.6972,
       "converted_last": {
         "btc": 1,
         "eth": 13.901922,
         "usd": 22528
       },
       "converted_volume": {
         "btc": 404.797,
         "eth": 5627,
         "usd": 9119334
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.014174,
       "timestamp": "2023-01-22T21:01:57+00:00",
       "last_traded_at": "2023-01-22T21:01:57+00:00",
       "last_fetch_at": "2023-01-22T21:01:57+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.digifinex.com/en-ww/trade/BTC/ETH",
       "token_info_url": null,
       "coin_id": "ethereum",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USD",
       "market": {
         "name": "Binance US",
         "identifier": "binance_us",
         "has_trading_incentive": false
       },
       "last": 22435.16,
       "volume": 6180.5096284047,
       "converted_last": {
         "btc": 0.99590506,
         "eth": 13.845589,
         "usd": 22435
       },
       "converted_volume": {
         "btc": 6155,
         "eth": 85573,
         "usd": 138660722
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.035305,
       "timestamp": "2023-01-22T21:00:50+00:00",
       "last_traded_at": "2023-01-22T21:00:50+00:00",
       "last_fetch_at": "2023-01-22T21:00:50+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.binance.us/trade/pro/BTC_USD",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "EUR",
       "market": {
         "name": "Kraken",
         "identifier": "kraken",
         "has_trading_incentive": false
       },
       "last": 20665,
       "volume": 1073.06060925,
       "converted_last": {
         "btc": 0.99688662,
         "eth": 13.871851,
         "usd": 22458
       },
       "converted_volume": {
         "btc": 1070,
         "eth": 14885,
         "usd": 24098693
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.015807,
       "timestamp": "2023-01-22T21:02:03+00:00",
       "last_traded_at": "2023-01-22T21:02:03+00:00",
       "last_fetch_at": "2023-01-22T21:02:03+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://trade.kraken.com/markets/kraken/btc/eur",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "CoinTR Pro",
         "identifier": "cointr",
         "has_trading_incentive": false
       },
       "last": 22476.16,
       "volume": 1613.89956,
       "converted_last": {
         "btc": 1.001475,
         "eth": 13.942851,
         "usd": 22483
       },
       "converted_volume": {
         "btc": 1643,
         "eth": 22881,
         "usd": 36895993
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.017873,
       "timestamp": "2023-01-22T21:04:08+00:00",
       "last_traded_at": "2023-01-22T21:04:08+00:00",
       "last_fetch_at": "2023-01-22T21:04:08+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.cointr.com/en-us/spot/BTC_USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDC",
       "market": {
         "name": "WhiteBIT",
         "identifier": "whitebit",
         "has_trading_incentive": false
       },
       "last": 22537.04,
       "volume": 82.124741,
       "converted_last": {
         "btc": 1.004069,
         "eth": 13.973288,
         "usd": 22621
       },
       "converted_volume": {
         "btc": 82.459,
         "eth": 1148,
         "usd": 1857727
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.318103,
       "timestamp": "2023-01-22T21:03:36+00:00",
       "last_traded_at": "2023-01-22T21:03:36+00:00",
       "last_fetch_at": "2023-01-22T21:03:36+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://whitebit.com/trade/BTC_USDC",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "usd-coin"
     },
     {
       "base": "BTC",
       "target": "USDC",
       "market": {
         "name": "Bitforex",
         "identifier": "bitforex",
         "has_trading_incentive": false
       },
       "last": 22435.26,
       "volume": 3531.9244,
       "converted_last": {
         "btc": 0.9994062,
         "eth": 13.893667,
         "usd": 22515
       },
       "converted_volume": {
         "btc": 3530,
         "eth": 49071,
         "usd": 79520602
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.031943,
       "timestamp": "2023-01-22T21:01:50+00:00",
       "last_traded_at": "2023-01-22T21:01:50+00:00",
       "last_fetch_at": "2023-01-22T21:01:50+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitforex.com/en/spot/btc_usdc",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "usd-coin"
     },
     {
       "base": "ETH",
       "target": "BTC",
       "market": {
         "name": "Bitfinex",
         "identifier": "bitfinex",
         "has_trading_incentive": false
       },
       "last": 0.071862,
       "volume": 1211.1721653,
       "converted_last": {
         "btc": 1,
         "eth": 13.916656,
         "usd": 22529
       },
       "converted_volume": {
         "btc": 87.037,
         "eth": 1211,
         "usd": 1960873
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.083507,
       "timestamp": "2023-01-22T21:03:32+00:00",
       "last_traded_at": "2023-01-22T21:03:32+00:00",
       "last_fetch_at": "2023-01-22T21:03:32+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitfinex.com/t/ETHBTC",
       "token_info_url": null,
       "coin_id": "ethereum",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Dex-Trade",
         "identifier": "dextrade",
         "has_trading_incentive": false
       },
       "last": 22430.9,
       "volume": 3284.71163524,
       "converted_last": {
         "btc": 0.99945818,
         "eth": 13.894987,
         "usd": 22515
       },
       "converted_volume": {
         "btc": 3283,
         "eth": 45641,
         "usd": 73955948
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.09289,
       "timestamp": "2023-01-22T21:00:34+00:00",
       "last_traded_at": "2023-01-22T21:00:34+00:00",
       "last_fetch_at": "2023-01-22T21:00:34+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": null,
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Binance US",
         "identifier": "binance_us",
         "has_trading_incentive": false
       },
       "last": 22475.04,
       "volume": 3589.7625045365735,
       "converted_last": {
         "btc": 1.001425,
         "eth": 13.936486,
         "usd": 22561
       },
       "converted_volume": {
         "btc": 3595,
         "eth": 50029,
         "usd": 80989426
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.034908,
       "timestamp": "2023-01-22T21:03:55+00:00",
       "last_traded_at": "2023-01-22T21:03:55+00:00",
       "last_fetch_at": "2023-01-22T21:03:55+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.binance.us/trade/pro/BTC_USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "ETH",
       "target": "BTC",
       "market": {
         "name": "Binance",
         "identifier": "binance",
         "has_trading_incentive": false
       },
       "last": 0.071902,
       "volume": 39515.216380351034,
       "converted_last": {
         "btc": 1,
         "eth": 13.902519,
         "usd": 22527
       },
       "converted_volume": {
         "btc": 2841,
         "eth": 39500,
         "usd": 64005393
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.01139,
       "timestamp": "2023-01-22T21:00:40+00:00",
       "last_traded_at": "2023-01-22T21:00:40+00:00",
       "last_fetch_at": "2023-01-22T21:00:40+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.binance.com/en/trade/ETH_BTC?ref=37754157",
       "token_info_url": null,
       "coin_id": "ethereum",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USD",
       "market": {
         "name": "Kraken",
         "identifier": "kraken",
         "has_trading_incentive": false
       },
       "last": 22441.8,
       "volume": 3310.33332421,
       "converted_last": {
         "btc": 0.99617176,
         "eth": 13.861903,
         "usd": 22442
       },
       "converted_volume": {
         "btc": 3298,
         "eth": 45888,
         "usd": 74289838
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.010446,
       "timestamp": "2023-01-22T21:02:03+00:00",
       "last_traded_at": "2023-01-22T21:02:03+00:00",
       "last_fetch_at": "2023-01-22T21:02:03+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://trade.kraken.com/markets/kraken/btc/usd",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USD",
       "market": {
         "name": "WhiteBIT",
         "identifier": "whitebit",
         "has_trading_incentive": false
       },
       "last": 22523.87,
       "volume": 220.896222,
       "converted_last": {
         "btc": 0.99976703,
         "eth": 13.913413,
         "usd": 22524
       },
       "converted_volume": {
         "btc": 220.845,
         "eth": 3073,
         "usd": 4975438
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.247297,
       "timestamp": "2023-01-22T21:03:36+00:00",
       "last_traded_at": "2023-01-22T21:03:36+00:00",
       "last_fetch_at": "2023-01-22T21:03:36+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://whitebit.com/trade/BTC_USD",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "WBTC",
       "target": "BTC",
       "market": {
         "name": "DigiFinex",
         "identifier": "digifinex",
         "has_trading_incentive": false
       },
       "last": 0.99811,
       "volume": 300.6247,
       "converted_last": {
         "btc": 1,
         "eth": 13.901922,
         "usd": 22528
       },
       "converted_volume": {
         "btc": 300.057,
         "eth": 4171,
         "usd": 6759729
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.070084,
       "timestamp": "2023-01-22T20:57:43+00:00",
       "last_traded_at": "2023-01-22T20:57:43+00:00",
       "last_fetch_at": "2023-01-22T21:01:57+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.digifinex.com/en-ww/trade/BTC/WBTC",
       "token_info_url": null,
       "coin_id": "wrapped-bitcoin",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Deepcoin",
         "identifier": "deepcoin",
         "has_trading_incentive": false
       },
       "last": 22487.1,
       "volume": 10317.32671802,
       "converted_last": {
         "btc": 1.001962,
         "eth": 13.949638,
         "usd": 22494
       },
       "converted_volume": {
         "btc": 10765,
         "eth": 149870,
         "usd": 241667611
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.017384,
       "timestamp": "2023-01-22T21:04:06+00:00",
       "last_traded_at": "2023-01-22T21:04:06+00:00",
       "last_fetch_at": "2023-01-22T21:04:06+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.deepcoin.com/en/Spot?currentId=BTC",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Bitget",
         "identifier": "bitget",
         "has_trading_incentive": false
       },
       "last": 22437.93,
       "volume": 11357.429,
       "converted_last": {
         "btc": 0.99977142,
         "eth": 13.899341,
         "usd": 22522
       },
       "converted_volume": {
         "btc": 11570,
         "eth": 160852,
         "usd": 260642593
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.012674,
       "timestamp": "2023-01-22T21:00:49+00:00",
       "last_traded_at": "2023-01-22T21:00:49+00:00",
       "last_fetch_at": "2023-01-22T21:00:49+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitget.com/en/spot/BTCUSDT_SPBL",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "ETH",
       "target": "BTC",
       "market": {
         "name": "XT.COM",
         "identifier": "xt",
         "has_trading_incentive": false
       },
       "last": 0.07182,
       "volume": 6112.619,
       "converted_last": {
         "btc": 1,
         "eth": 13.902519,
         "usd": 22527
       },
       "converted_volume": {
         "btc": 436.563,
         "eth": 6069,
         "usd": 9834644
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.015315,
       "timestamp": "2023-01-22T21:00:44+00:00",
       "last_traded_at": "2023-01-22T21:00:44+00:00",
       "last_fetch_at": "2023-01-22T21:00:44+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.xt.com/trade/eth_btc",
       "token_info_url": null,
       "coin_id": "ethereum",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "BingX",
         "identifier": "bingx",
         "has_trading_incentive": false
       },
       "last": 22446.99,
       "volume": 10080.432894,
       "converted_last": {
         "btc": 1.000175,
         "eth": 13.919093,
         "usd": 22533
       },
       "converted_volume": {
         "btc": 10254,
         "eth": 142707,
         "usd": 231022556
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.204075,
       "timestamp": "2023-01-22T21:03:08+00:00",
       "last_traded_at": "2023-01-22T21:03:08+00:00",
       "last_fetch_at": "2023-01-22T21:03:08+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://bingx.com/en-us/spot/BTCUSDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "LTC",
       "target": "BTC",
       "market": {
         "name": "WhiteBIT",
         "identifier": "whitebit",
         "has_trading_incentive": false
       },
       "last": 0.003874,
       "volume": 5704.23,
       "converted_last": {
         "btc": 1,
         "eth": 13.916656,
         "usd": 22529
       },
       "converted_volume": {
         "btc": 22.098187,
         "eth": 307.533,
         "usd": 497853
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.025793,
       "timestamp": "2023-01-22T21:03:36+00:00",
       "last_traded_at": "2023-01-22T21:03:36+00:00",
       "last_fetch_at": "2023-01-22T21:03:36+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://whitebit.com/trade/LTC_BTC",
       "token_info_url": null,
       "coin_id": "litecoin",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "ETH",
       "target": "BTC",
       "market": {
         "name": "Bitforex",
         "identifier": "bitforex",
         "has_trading_incentive": false
       },
       "last": 0.0718539,
       "volume": 45872.2143,
       "converted_last": {
         "btc": 1,
         "eth": 13.901922,
         "usd": 22528
       },
       "converted_volume": {
         "btc": 3296,
         "eth": 45822,
         "usd": 74255097
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.080819,
       "timestamp": "2023-01-22T21:01:50+00:00",
       "last_traded_at": "2023-01-22T21:01:50+00:00",
       "last_fetch_at": "2023-01-22T21:01:50+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitforex.com/en/spot/eth_btc",
       "token_info_url": null,
       "coin_id": "ethereum",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "ETH",
       "target": "BTC",
       "market": {
         "name": "Txbit",
         "identifier": "txbit",
         "has_trading_incentive": false
       },
       "last": 0.07183299,
       "volume": 946.301,
       "converted_last": {
         "btc": 1,
         "eth": 13.902519,
         "usd": 22527
       },
       "converted_volume": {
         "btc": 67.976,
         "eth": 945.032,
         "usd": 1531315
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.011392,
       "timestamp": "2023-01-22T21:00:37+00:00",
       "last_traded_at": "2023-01-22T21:00:37+00:00",
       "last_fetch_at": "2023-01-22T21:00:37+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://txbit.io/Trade/ETH/BTC",
       "token_info_url": null,
       "coin_id": "ethereum",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Bitfinex",
         "identifier": "bitfinex",
         "has_trading_incentive": false
       },
       "last": 22467,
       "volume": 526.68252036,
       "converted_last": {
         "btc": 1.001067,
         "eth": 13.9315,
         "usd": 22553
       },
       "converted_volume": {
         "btc": 527.244,
         "eth": 7337,
         "usd": 11878350
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.044543,
       "timestamp": "2023-01-22T21:03:40+00:00",
       "last_traded_at": "2023-01-22T21:03:40+00:00",
       "last_fetch_at": "2023-01-22T21:03:40+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitfinex.com/t/BTCUST",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "EUR",
       "market": {
         "name": "Bitfinex",
         "identifier": "bitfinex",
         "has_trading_incentive": false
       },
       "last": 20687,
       "volume": 64.73004252,
       "converted_last": {
         "btc": 0.99790025,
         "eth": 13.887434,
         "usd": 22482
       },
       "converted_volume": {
         "btc": 64.594,
         "eth": 898.934,
         "usd": 1455249
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.096479,
       "timestamp": "2023-01-22T21:03:32+00:00",
       "last_traded_at": "2023-01-22T21:03:32+00:00",
       "last_fetch_at": "2023-01-22T21:03:32+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitfinex.com/t/BTCEUR",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "ETH",
       "target": "BTC",
       "market": {
         "name": "Bitstamp",
         "identifier": "bitstamp",
         "has_trading_incentive": false
       },
       "last": 0.0718573,
       "volume": 263.02603802,
       "converted_last": {
         "btc": 1,
         "eth": 13.916656,
         "usd": 22529
       },
       "converted_volume": {
         "btc": 18.900341,
         "eth": 263.03,
         "usd": 425808
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.040661,
       "timestamp": "2023-01-22T21:03:52+00:00",
       "last_traded_at": "2023-01-22T21:03:52+00:00",
       "last_fetch_at": "2023-01-22T21:03:52+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitstamp.net/markets/eth/btc/",
       "token_info_url": null,
       "coin_id": "ethereum",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "BUSD",
       "market": {
         "name": "XT.COM",
         "identifier": "xt",
         "has_trading_incentive": false
       },
       "last": 22454.51,
       "volume": 327.626628,
       "converted_last": {
         "btc": 0.99645298,
         "eth": 13.853207,
         "usd": 22448
       },
       "converted_volume": {
         "btc": 331.561,
         "eth": 4610,
         "usd": 7469210
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.010288,
       "timestamp": "2023-01-22T21:00:47+00:00",
       "last_traded_at": "2023-01-22T21:00:47+00:00",
       "last_fetch_at": "2023-01-22T21:00:47+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.xt.com/trade/btc_busd",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "binance-usd"
     },
     {
       "base": "ETH",
       "target": "BTC",
       "market": {
         "name": "Tidex",
         "identifier": "tidex",
         "has_trading_incentive": false
       },
       "last": 0.0718994,
       "volume": 3572.28359643,
       "converted_last": {
         "btc": 1,
         "eth": 13.901922,
         "usd": 22528
       },
       "converted_volume": {
         "btc": 256.845,
         "eth": 3571,
         "usd": 5786253
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.011386,
       "timestamp": "2023-01-22T21:01:56+00:00",
       "last_traded_at": "2023-01-22T21:01:56+00:00",
       "last_fetch_at": "2023-01-22T21:01:56+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": null,
       "token_info_url": null,
       "coin_id": "ethereum",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "JPY",
       "market": {
         "name": "GMO Japan",
         "identifier": "gmo_japan",
         "has_trading_incentive": false
       },
       "last": 2911836,
       "volume": 285.3211,
       "converted_last": {
         "btc": 0.99851322,
         "eth": 13.881849,
         "usd": 22494
       },
       "converted_volume": {
         "btc": 284.897,
         "eth": 3961,
         "usd": 6417989
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.012029,
       "timestamp": "2023-01-22T21:00:36+00:00",
       "last_traded_at": "2023-01-22T21:00:36+00:00",
       "last_fetch_at": "2023-01-22T21:00:36+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://coin.z.com/jp/corp/information/btc-market/",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "DigiFinex",
         "identifier": "digifinex",
         "has_trading_incentive": false
       },
       "last": 22419.61,
       "volume": 3155.44751,
       "converted_last": {
         "btc": 0.99895513,
         "eth": 13.887396,
         "usd": 22505
       },
       "converted_volume": {
         "btc": 3152,
         "eth": 43821,
         "usd": 71012232
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.013297,
       "timestamp": "2023-01-22T21:01:57+00:00",
       "last_traded_at": "2023-01-22T21:01:57+00:00",
       "last_fetch_at": "2023-01-22T21:01:57+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.digifinex.com/en-ww/trade/USDT/BTC",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Coinsbit",
         "identifier": "coinsbit",
         "has_trading_incentive": false
       },
       "last": 22433.19272542,
       "volume": 12655.63312687,
       "converted_last": {
         "btc": 0.99956034,
         "eth": 13.89581,
         "usd": 22518
       },
       "converted_volume": {
         "btc": 12650,
         "eth": 175860,
         "usd": 284983106
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.025244,
       "timestamp": "2023-01-22T21:01:56+00:00",
       "last_traded_at": "2023-01-22T21:01:56+00:00",
       "last_fetch_at": "2023-01-22T21:01:56+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://coinsbit.io/trade/BTC_USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "GBP",
       "market": {
         "name": "Bitstamp",
         "identifier": "bitstamp",
         "has_trading_incentive": false
       },
       "last": 18129,
       "volume": 82.23734181,
       "converted_last": {
         "btc": 0.99741556,
         "eth": 13.880689,
         "usd": 22471
       },
       "converted_volume": {
         "btc": 82.025,
         "eth": 1142,
         "usd": 1847947
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.069359,
       "timestamp": "2023-01-22T21:03:53+00:00",
       "last_traded_at": "2023-01-22T21:03:53+00:00",
       "last_fetch_at": "2023-01-22T21:03:53+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitstamp.net/markets/btc/gbp/",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDC",
       "market": {
         "name": "MEXC Global",
         "identifier": "mxc",
         "has_trading_incentive": false
       },
       "last": 22445.79,
       "volume": 119.423151,
       "converted_last": {
         "btc": 0.99987527,
         "eth": 13.913438,
         "usd": 22525
       },
       "converted_volume": {
         "btc": 119.408,
         "eth": 1662,
         "usd": 2690034
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.046404,
       "timestamp": "2023-01-22T21:02:04+00:00",
       "last_traded_at": "2023-01-22T21:02:04+00:00",
       "last_fetch_at": "2023-01-22T21:02:04+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.mexc.com/exchange/BTC_USDC",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "usd-coin"
     },
     {
       "base": "BTC",
       "target": "JPY",
       "market": {
         "name": "bitFlyer",
         "identifier": "bitflyer",
         "has_trading_incentive": false
       },
       "last": 2916301,
       "volume": 1433.41807149,
       "converted_last": {
         "btc": 0.99996843,
         "eth": 13.916216,
         "usd": 22528
       },
       "converted_volume": {
         "btc": 1433,
         "eth": 19948,
         "usd": 32292626
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.027295,
       "timestamp": "2023-01-22T21:03:44+00:00",
       "last_traded_at": "2023-01-22T21:03:44+00:00",
       "last_fetch_at": "2023-01-22T21:03:44+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://bitflyer.com/en-jp/ex/simpleex",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "LATOKEN",
         "identifier": "latoken",
         "has_trading_incentive": false
       },
       "last": 22473.6,
       "volume": 1752.1035295721692,
       "converted_last": {
         "btc": 1.001361,
         "eth": 13.935593,
         "usd": 22560
       },
       "converted_volume": {
         "btc": 1754,
         "eth": 24417,
         "usd": 39527063
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.034773,
       "timestamp": "2023-01-22T21:03:31+00:00",
       "last_traded_at": "2023-01-22T21:03:31+00:00",
       "last_fetch_at": "2023-01-22T21:03:31+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://latoken.com/exchange/USDT-BTC",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Coinbase Exchange",
         "identifier": "gdax",
         "has_trading_incentive": false
       },
       "last": 22443.06,
       "volume": 1952.26338606,
       "converted_last": {
         "btc": 1.002691,
         "eth": 13.939346,
         "usd": 22587
       },
       "converted_volume": {
         "btc": 1958,
         "eth": 27213,
         "usd": 44095881
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.05017,
       "timestamp": "2023-01-22T20:59:39+00:00",
       "last_traded_at": "2023-01-22T20:59:39+00:00",
       "last_fetch_at": "2023-01-22T20:59:39+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://pro.coinbase.com/trade/BTC-USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "KuCoin",
         "identifier": "kucoin",
         "has_trading_incentive": false
       },
       "last": 22425.9,
       "volume": 8613.88917955,
       "converted_last": {
         "btc": 0.9992354,
         "eth": 13.891889,
         "usd": 22510
       },
       "converted_volume": {
         "btc": 8607,
         "eth": 119663,
         "usd": 193900230
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.010445,
       "timestamp": "2023-01-22T21:00:02+00:00",
       "last_traded_at": "2023-01-22T21:00:02+00:00",
       "last_fetch_at": "2023-01-22T21:00:02+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.kucoin.com/trade/BTC-USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Bybit",
         "identifier": "bybit_spot",
         "has_trading_incentive": false
       },
       "last": 22443.04,
       "volume": 6648.650101,
       "converted_last": {
         "btc": 0.99999911,
         "eth": 13.915161,
         "usd": 22528
       },
       "converted_volume": {
         "btc": 6649,
         "eth": 92517,
         "usd": 149780940
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.010045,
       "timestamp": "2023-01-22T21:02:11+00:00",
       "last_traded_at": "2023-01-22T21:02:11+00:00",
       "last_fetch_at": "2023-01-22T21:02:11+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bybit.com/trade/spot/BTC/USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "EUR",
       "market": {
         "name": "Coinbase Exchange",
         "identifier": "gdax",
         "has_trading_incentive": false
       },
       "last": 20643.98,
       "volume": 312.67615823,
       "converted_last": {
         "btc": 0.99586627,
         "eth": 13.844455,
         "usd": 22435
       },
       "converted_volume": {
         "btc": 311.384,
         "eth": 4329,
         "usd": 7014909
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.023721,
       "timestamp": "2023-01-22T21:01:26+00:00",
       "last_traded_at": "2023-01-22T21:01:26+00:00",
       "last_fetch_at": "2023-01-22T21:01:26+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://pro.coinbase.com/trade/BTC-EUR",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "WBTC",
       "target": "BTC",
       "market": {
         "name": "Bitrue",
         "identifier": "bitrue",
         "has_trading_incentive": false
       },
       "last": 0.9984,
       "volume": 233.9024,
       "converted_last": {
         "btc": 1,
         "eth": 13.915174,
         "usd": 22528
       },
       "converted_volume": {
         "btc": 233.528,
         "eth": 3250,
         "usd": 5260932
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.060078,
       "timestamp": "2023-01-22T21:02:40+00:00",
       "last_traded_at": "2023-01-22T21:02:40+00:00",
       "last_fetch_at": "2023-01-22T21:02:40+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitrue.com/trade/wbtc_btc",
       "token_info_url": null,
       "coin_id": "wrapped-bitcoin",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "BUSD",
       "market": {
         "name": "Coinsbit",
         "identifier": "coinsbit",
         "has_trading_incentive": false
       },
       "last": 22441.19661312,
       "volume": 10606.42700466,
       "converted_last": {
         "btc": 0.99586218,
         "eth": 13.844398,
         "usd": 22435
       },
       "converted_volume": {
         "btc": 10563,
         "eth": 146840,
         "usd": 237954855
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.047859,
       "timestamp": "2023-01-22T21:01:56+00:00",
       "last_traded_at": "2023-01-22T21:01:56+00:00",
       "last_fetch_at": "2023-01-22T21:01:56+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://coinsbit.io/trade/BTC_BUSD",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "binance-usd"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "LocalTrade",
         "identifier": "localtrade",
         "has_trading_incentive": false
       },
       "last": 22468.76,
       "volume": 6464.70824046,
       "converted_last": {
         "btc": 1.001145,
         "eth": 13.932592,
         "usd": 22555
       },
       "converted_volume": {
         "btc": 6472,
         "eth": 90070,
         "usd": 145810959
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.020011,
       "timestamp": "2023-01-22T21:03:27+00:00",
       "last_traded_at": "2023-01-22T21:03:27+00:00",
       "last_fetch_at": "2023-01-22T21:03:27+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://localtrade.cc/trade/BTC_USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "DOGE",
       "target": "BTC",
       "market": {
         "name": "WhiteBIT",
         "identifier": "whitebit",
         "has_trading_incentive": false
       },
       "last": 0.00000388,
       "volume": 2848484,
       "converted_last": {
         "btc": 1,
         "eth": 13.916656,
         "usd": 22529
       },
       "converted_volume": {
         "btc": 11.052118,
         "eth": 153.809,
         "usd": 248994
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.257732,
       "timestamp": "2023-01-22T21:03:36+00:00",
       "last_traded_at": "2023-01-22T21:03:36+00:00",
       "last_fetch_at": "2023-01-22T21:03:36+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://whitebit.com/trade/DOGE_BTC",
       "token_info_url": null,
       "coin_id": "dogecoin",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "XBT",
       "target": "USD",
       "market": {
         "name": "itBit",
         "identifier": "itbit",
         "has_trading_incentive": false
       },
       "last": 22437,
       "volume": 285.99006918,
       "converted_last": {
         "btc": 0.99595236,
         "eth": 13.845652,
         "usd": 22437
       },
       "converted_volume": {
         "btc": 284.832,
         "eth": 3960,
         "usd": 6416759
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.010026,
       "timestamp": "2023-01-22T21:01:44+00:00",
       "last_traded_at": "2023-01-22T21:01:44+00:00",
       "last_fetch_at": "2023-01-22T21:01:44+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": null,
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USD",
       "market": {
         "name": "Gemini",
         "identifier": "gemini",
         "has_trading_incentive": false
       },
       "last": 22468.52,
       "volume": 271.21147076,
       "converted_last": {
         "btc": 0.99731021,
         "eth": 13.879223,
         "usd": 22469
       },
       "converted_volume": {
         "btc": 270.482,
         "eth": 3764,
         "usd": 6093720
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.046086,
       "timestamp": "2023-01-22T21:03:45+00:00",
       "last_traded_at": "2023-01-22T21:03:45+00:00",
       "last_fetch_at": "2023-01-22T21:03:45+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": null,
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USD",
       "market": {
         "name": "Crypto.com Exchange",
         "identifier": "crypto_com",
         "has_trading_incentive": false
       },
       "last": 22443.33,
       "volume": 9976.0352,
       "converted_last": {
         "btc": 0.99631106,
         "eth": 13.850647,
         "usd": 22443
       },
       "converted_volume": {
         "btc": 9939,
         "eth": 138175,
         "usd": 223895450
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.017239,
       "timestamp": "2023-01-22T20:59:34+00:00",
       "last_traded_at": "2023-01-22T20:59:34+00:00",
       "last_fetch_at": "2023-01-22T20:59:34+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://crypto.com/exchange/trade/spot/BTC_USD",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "ETH",
       "target": "BTC",
       "market": {
         "name": "Coinbase Exchange",
         "identifier": "gdax",
         "has_trading_incentive": false
       },
       "last": 0.07189,
       "volume": 2842.16891748,
       "converted_last": {
         "btc": 1,
         "eth": 13.916656,
         "usd": 22529
       },
       "converted_volume": {
         "btc": 204.324,
         "eth": 2844,
         "usd": 4603229
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.055648,
       "timestamp": "2023-01-22T21:03:16+00:00",
       "last_traded_at": "2023-01-22T21:03:16+00:00",
       "last_fetch_at": "2023-01-22T21:03:16+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://pro.coinbase.com/trade/ETH-BTC",
       "token_info_url": null,
       "coin_id": "ethereum",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "FNB",
       "target": "BTC",
       "market": {
         "name": "FinexBox",
         "identifier": "finexbox",
         "has_trading_incentive": false
       },
       "last": 0.00002992,
       "volume": 370876,
       "converted_last": {
         "btc": 1,
         "eth": 13.916656,
         "usd": 22529
       },
       "converted_volume": {
         "btc": 11.09661,
         "eth": 154.428,
         "usd": 249997
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.167001,
       "timestamp": "2023-01-22T21:03:47+00:00",
       "last_traded_at": "2023-01-22T21:03:47+00:00",
       "last_fetch_at": "2023-01-22T21:03:47+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.finexbox.com/Home/Orders/market/pair/FNB-BTC.html",
       "token_info_url": null,
       "coin_id": "finexbox-token",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USD",
       "market": {
         "name": "Cryptology",
         "identifier": "cryptology",
         "has_trading_incentive": false
       },
       "last": 22457.55,
       "volume": 202.7589356,
       "converted_last": {
         "btc": 0.99686455,
         "eth": 13.858333,
         "usd": 22458
       },
       "converted_volume": {
         "btc": 202.123,
         "eth": 2810,
         "usd": 4553469
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.040457,
       "timestamp": "2023-01-22T21:01:56+00:00",
       "last_traded_at": "2023-01-22T21:01:56+00:00",
       "last_fetch_at": "2023-01-22T21:01:56+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://cryptology.com/app/next/trading/BTC_USD",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDC",
       "market": {
         "name": "DigiFinex",
         "identifier": "digifinex",
         "has_trading_incentive": false
       },
       "last": 22430.6,
       "volume": 712.098995,
       "converted_last": {
         "btc": 0.99919861,
         "eth": 13.890781,
         "usd": 22510
       },
       "converted_volume": {
         "btc": 711.528,
         "eth": 9892,
         "usd": 16029443
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.03341,
       "timestamp": "2023-01-22T21:01:58+00:00",
       "last_traded_at": "2023-01-22T21:01:58+00:00",
       "last_fetch_at": "2023-01-22T21:01:58+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.digifinex.com/en-ww/trade/USDC/BTC",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "usd-coin"
     },
     {
       "base": "BTC",
       "target": "GBP",
       "market": {
         "name": "Kraken",
         "identifier": "kraken",
         "has_trading_incentive": false
       },
       "last": 18104.8,
       "volume": 96.50834193,
       "converted_last": {
         "btc": 0.9961317,
         "eth": 13.861346,
         "usd": 22441
       },
       "converted_volume": {
         "btc": 96.135,
         "eth": 1338,
         "usd": 2165734
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.034781,
       "timestamp": "2023-01-22T21:02:03+00:00",
       "last_traded_at": "2023-01-22T21:02:03+00:00",
       "last_fetch_at": "2023-01-22T21:02:03+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://trade.kraken.com/markets/kraken/btc/gbp",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDC",
       "market": {
         "name": "OKX",
         "identifier": "okex",
         "has_trading_incentive": false
       },
       "last": 22450.7,
       "volume": 895.70769661,
       "converted_last": {
         "btc": 1.000223,
         "eth": 13.918274,
         "usd": 22533
       },
       "converted_volume": {
         "btc": 910.486,
         "eth": 12670,
         "usd": 20511468
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.010445,
       "timestamp": "2023-01-22T21:02:51+00:00",
       "last_traded_at": "2023-01-22T21:02:51+00:00",
       "last_fetch_at": "2023-01-22T21:02:51+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.okx.com/trade-spot/btc-usdc",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "usd-coin"
     },
     {
       "base": "ETH",
       "target": "BTC",
       "market": {
         "name": "OKX",
         "identifier": "okex",
         "has_trading_incentive": false
       },
       "last": 0.07184,
       "volume": 4790.306045,
       "converted_last": {
         "btc": 1,
         "eth": 13.901922,
         "usd": 22528
       },
       "converted_volume": {
         "btc": 342.312,
         "eth": 4759,
         "usd": 7711667
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.013918,
       "timestamp": "2023-01-22T21:01:10+00:00",
       "last_traded_at": "2023-01-22T21:01:10+00:00",
       "last_fetch_at": "2023-01-22T21:01:10+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.okx.com/trade-spot/eth-btc",
       "token_info_url": null,
       "coin_id": "ethereum",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDC",
       "market": {
         "name": "Bitget",
         "identifier": "bitget",
         "has_trading_incentive": false
       },
       "last": 22434.08,
       "volume": 77.10658,
       "converted_last": {
         "btc": 0.99935363,
         "eth": 13.893533,
         "usd": 22513
       },
       "converted_volume": {
         "btc": 78.514,
         "eth": 1092,
         "usd": 1768710
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.087545,
       "timestamp": "2023-01-22T21:00:50+00:00",
       "last_traded_at": "2023-01-22T21:00:50+00:00",
       "last_fetch_at": "2023-01-22T21:00:50+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitget.com/en/spot/BTCUSDC_SPBL",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "usd-coin"
     },
     {
       "base": "BTC",
       "target": "BUSD",
       "market": {
         "name": "Dex-Trade",
         "identifier": "dextrade",
         "has_trading_incentive": false
       },
       "last": 22440,
       "volume": 204.08572,
       "converted_last": {
         "btc": 0.99580908,
         "eth": 13.844255,
         "usd": 22433
       },
       "converted_volume": {
         "btc": 203.23,
         "eth": 2825,
         "usd": 4578255
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.070022,
       "timestamp": "2023-01-22T21:00:34+00:00",
       "last_traded_at": "2023-01-22T21:00:34+00:00",
       "last_fetch_at": "2023-01-22T21:00:34+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": null,
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "binance-usd"
     },
     {
       "base": "BTC",
       "target": "USDC",
       "market": {
         "name": "Cryptology",
         "identifier": "cryptology",
         "has_trading_incentive": false
       },
       "last": 22437.73,
       "volume": 81.39677288,
       "converted_last": {
         "btc": 0.99951623,
         "eth": 13.895196,
         "usd": 22517
       },
       "converted_volume": {
         "btc": 81.357,
         "eth": 1131,
         "usd": 1832835
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.040452,
       "timestamp": "2023-01-22T21:01:56+00:00",
       "last_traded_at": "2023-01-22T21:01:56+00:00",
       "last_fetch_at": "2023-01-22T21:01:56+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://cryptology.com/app/next/trading/BTC_USDC",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "usd-coin"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Kraken",
         "identifier": "kraken",
         "has_trading_incentive": false
       },
       "last": 22413.1,
       "volume": 183.7274045,
       "converted_last": {
         "btc": 0.99866507,
         "eth": 13.896598,
         "usd": 22498
       },
       "converted_volume": {
         "btc": 183.482,
         "eth": 2553,
         "usd": 4133494
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.028511,
       "timestamp": "2023-01-22T21:02:04+00:00",
       "last_traded_at": "2023-01-22T21:02:04+00:00",
       "last_fetch_at": "2023-01-22T21:02:04+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://trade.kraken.com/markets/kraken/btc/usdt",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "EUR",
       "market": {
         "name": "Cryptology",
         "identifier": "cryptology",
         "has_trading_incentive": false
       },
       "last": 20671.93,
       "volume": 112.54660843884123,
       "converted_last": {
         "btc": 0.99721458,
         "eth": 13.863199,
         "usd": 22465
       },
       "converted_volume": {
         "btc": 112.233,
         "eth": 1560,
         "usd": 2528409
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.06047,
       "timestamp": "2023-01-22T21:01:56+00:00",
       "last_traded_at": "2023-01-22T21:01:56+00:00",
       "last_fetch_at": "2023-01-22T21:01:56+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://cryptology.com/app/next/trading/BTC_EUR",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Phemex",
         "identifier": "phemex",
         "has_trading_incentive": false
       },
       "last": 22418.06,
       "volume": 1592.15863,
       "converted_last": {
         "btc": 0.99888607,
         "eth": 13.899673,
         "usd": 22503
       },
       "converted_volume": {
         "btc": 1590,
         "eth": 22130,
         "usd": 35828263
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.012863,
       "timestamp": "2023-01-22T21:02:45+00:00",
       "last_traded_at": "2023-01-22T21:02:45+00:00",
       "last_fetch_at": "2023-01-22T21:02:45+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://phemex.com/spot/trade/BTCUSDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDC",
       "market": {
         "name": "LBank",
         "identifier": "lbank",
         "has_trading_incentive": false
       },
       "last": 22440.56,
       "volume": 5604.7,
       "converted_last": {
         "btc": 0.999771,
         "eth": 13.911987,
         "usd": 22523
       },
       "converted_volume": {
         "btc": 5603,
         "eth": 77973,
         "usd": 126234007
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.010045,
       "timestamp": "2023-01-22T21:02:36+00:00",
       "last_traded_at": "2023-01-22T21:02:36+00:00",
       "last_fetch_at": "2023-01-22T21:02:36+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.lbank.info/exchange/btc/usdc",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "usd-coin"
     },
     {
       "base": "BTC",
       "target": "JPY",
       "market": {
         "name": "Coincheck",
         "identifier": "coincheck",
         "has_trading_incentive": false
       },
       "last": 2909084,
       "volume": 1596.82341906,
       "converted_last": {
         "btc": 0.99753509,
         "eth": 13.867655,
         "usd": 22473
       },
       "converted_volume": {
         "btc": 1593,
         "eth": 22144,
         "usd": 35884863
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.02275,
       "timestamp": "2023-01-22T21:01:44+00:00",
       "last_traded_at": "2023-01-22T21:01:44+00:00",
       "last_fetch_at": "2023-01-22T21:01:44+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": null,
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "DASH",
       "target": "BTC",
       "market": {
         "name": "Bitforex",
         "identifier": "bitforex",
         "has_trading_incentive": false
       },
       "last": 0.00227208,
       "volume": 269348.5058,
       "converted_last": {
         "btc": 1,
         "eth": 13.901922,
         "usd": 22528
       },
       "converted_volume": {
         "btc": 611.981,
         "eth": 8508,
         "usd": 13786830
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.294147,
       "timestamp": "2023-01-22T21:01:50+00:00",
       "last_traded_at": "2023-01-22T21:01:50+00:00",
       "last_fetch_at": "2023-01-22T21:01:50+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitforex.com/en/spot/dash_btc",
       "token_info_url": null,
       "coin_id": "dash",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "ETH",
       "target": "BTC",
       "market": {
         "name": "Crypto.com Exchange",
         "identifier": "crypto_com",
         "has_trading_incentive": false
       },
       "last": 0.071829,
       "volume": 445.2475,
       "converted_last": {
         "btc": 1,
         "eth": 13.916656,
         "usd": 22529
       },
       "converted_volume": {
         "btc": 31.981683,
         "eth": 445.078,
         "usd": 720519
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.022279,
       "timestamp": "2023-01-22T21:03:30+00:00",
       "last_traded_at": "2023-01-22T21:03:30+00:00",
       "last_fetch_at": "2023-01-22T21:03:30+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://crypto.com/exchange/trade/spot/ETH_BTC",
       "token_info_url": null,
       "coin_id": "ethereum",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "EUR",
       "market": {
         "name": "Binance",
         "identifier": "binance",
         "has_trading_incentive": false
       },
       "last": 20663.98,
       "volume": 3016.6086181108285,
       "converted_last": {
         "btc": 0.99686548,
         "eth": 13.858941,
         "usd": 22457
       },
       "converted_volume": {
         "btc": 3007,
         "eth": 41807,
         "usd": 67743364
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.021344,
       "timestamp": "2023-01-22T21:00:49+00:00",
       "last_traded_at": "2023-01-22T21:00:49+00:00",
       "last_fetch_at": "2023-01-22T21:00:49+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.binance.com/en/trade/BTC_EUR?ref=37754157",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "ETH",
       "target": "BTC",
       "market": {
         "name": "Bitrue",
         "identifier": "bitrue",
         "has_trading_incentive": false
       },
       "last": 0.07187,
       "volume": 17084.419,
       "converted_last": {
         "btc": 1,
         "eth": 13.915174,
         "usd": 22528
       },
       "converted_volume": {
         "btc": 1228,
         "eth": 17086,
         "usd": 27661219
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.011391,
       "timestamp": "2023-01-22T21:02:40+00:00",
       "last_traded_at": "2023-01-22T21:02:40+00:00",
       "last_fetch_at": "2023-01-22T21:02:40+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitrue.com/trade/eth_btc",
       "token_info_url": null,
       "coin_id": "ethereum",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "ETH",
       "target": "BTC",
       "market": {
         "name": "BitMart",
         "identifier": "bitmart",
         "has_trading_incentive": false
       },
       "last": 0.071873,
       "volume": 4678.6808,
       "converted_last": {
         "btc": 1,
         "eth": 13.915174,
         "usd": 22528
       },
       "converted_volume": {
         "btc": 336.271,
         "eth": 4679,
         "usd": 7575524
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.014174,
       "timestamp": "2023-01-22T21:02:43+00:00",
       "last_traded_at": "2023-01-22T21:02:43+00:00",
       "last_fetch_at": "2023-01-22T21:02:43+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitmart.com/trade/en?layout=basic&symbol=ETH_BTC",
       "token_info_url": null,
       "coin_id": "ethereum",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "BUSD",
       "market": {
         "name": "Bitrue",
         "identifier": "bitrue",
         "has_trading_incentive": false
       },
       "last": 22430.93,
       "volume": 3129.95305,
       "converted_last": {
         "btc": 0.99540659,
         "eth": 13.851256,
         "usd": 22425
       },
       "converted_volume": {
         "btc": 3116,
         "eth": 43354,
         "usd": 70187827
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.028275,
       "timestamp": "2023-01-22T21:02:01+00:00",
       "last_traded_at": "2023-01-22T21:02:01+00:00",
       "last_fetch_at": "2023-01-22T21:02:01+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitrue.com/trade/btc_busd",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "binance-usd"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "BIT",
         "identifier": "bit_com",
         "has_trading_incentive": false
       },
       "last": 22467.59,
       "volume": 1113.4653579201142,
       "converted_last": {
         "btc": 1.001093,
         "eth": 13.931866,
         "usd": 22554
       },
       "converted_volume": {
         "btc": 1115,
         "eth": 15513,
         "usd": 25112811
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.018006,
       "timestamp": "2023-01-22T21:03:06+00:00",
       "last_traded_at": "2023-01-22T21:03:06+00:00",
       "last_fetch_at": "2023-01-22T21:03:06+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bit.com/spot?pair=BTC-USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "EXMO",
         "identifier": "exmo",
         "has_trading_incentive": false
       },
       "last": 22483.7,
       "volume": 187.26105462,
       "converted_last": {
         "btc": 1.001811,
         "eth": 13.947528,
         "usd": 22491
       },
       "converted_volume": {
         "btc": 187.6,
         "eth": 2612,
         "usd": 4211614
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.031511,
       "timestamp": "2023-01-22T21:04:24+00:00",
       "last_traded_at": "2023-01-22T21:04:24+00:00",
       "last_fetch_at": "2023-01-22T21:04:24+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://exmo.com/en/trade/BTC_USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "LTC",
       "target": "BTC",
       "market": {
         "name": "Coinsbit",
         "identifier": "coinsbit",
         "has_trading_incentive": false
       },
       "last": 0.00387416,
       "volume": 3574.30545491,
       "converted_last": {
         "btc": 1,
         "eth": 13.901922,
         "usd": 22528
       },
       "converted_volume": {
         "btc": 13.847431,
         "eth": 192.506,
         "usd": 311958
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.045978,
       "timestamp": "2023-01-22T21:01:56+00:00",
       "last_traded_at": "2023-01-22T21:01:56+00:00",
       "last_fetch_at": "2023-01-22T21:01:56+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://coinsbit.io/trade/LTC_BTC",
       "token_info_url": null,
       "coin_id": "litecoin",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "ETH",
       "target": "BTC",
       "market": {
         "name": "EXMO",
         "identifier": "exmo",
         "has_trading_incentive": false
       },
       "last": 0.07188606,
       "volume": 8463.73601421,
       "converted_last": {
         "btc": 1,
         "eth": 13.922318,
         "usd": 22450
       },
       "converted_volume": {
         "btc": 608.425,
         "eth": 8471,
         "usd": 13659104
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.238977,
       "timestamp": "2023-01-22T21:04:23+00:00",
       "last_traded_at": "2023-01-22T21:04:23+00:00",
       "last_fetch_at": "2023-01-22T21:04:23+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://exmo.com/en/trade/ETH_BTC",
       "token_info_url": null,
       "coin_id": "ethereum",
       "target_coin_id": "bitcoin"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "Bibox",
         "identifier": "bibox",
         "has_trading_incentive": false
       },
       "last": 22569.9,
       "volume": 2759,
       "converted_last": {
         "btc": 1.005652,
         "eth": 14.001002,
         "usd": 22577
       },
       "converted_volume": {
         "btc": 2775,
         "eth": 38629,
         "usd": 62289478
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.010443,
       "timestamp": "2023-01-22T21:04:28+00:00",
       "last_traded_at": "2023-01-22T21:04:28+00:00",
       "last_fetch_at": "2023-01-22T21:04:28+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bibox.com/en/exchange/basic/BTC_USDT",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USDC",
       "market": {
         "name": "Bybit",
         "identifier": "bybit_spot",
         "has_trading_incentive": false
       },
       "last": 22456.55,
       "volume": 641.953054,
       "converted_last": {
         "btc": 1.000483,
         "eth": 13.9219,
         "usd": 22539
       },
       "converted_volume": {
         "btc": 642.263,
         "eth": 8937,
         "usd": 14468937
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.020753,
       "timestamp": "2023-01-22T21:02:10+00:00",
       "last_traded_at": "2023-01-22T21:02:10+00:00",
       "last_fetch_at": "2023-01-22T21:02:10+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bybit.com/trade/spot/BTC/USDC",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "usd-coin"
     },
     {
       "base": "BTC",
       "target": "USDT",
       "market": {
         "name": "CoinEx",
         "identifier": "coinex",
         "has_trading_incentive": false
       },
       "last": 22419.97,
       "volume": 393.0501042,
       "converted_last": {
         "btc": 0.99897117,
         "eth": 13.887619,
         "usd": 22505
       },
       "converted_volume": {
         "btc": 399.443,
         "eth": 5553,
         "usd": 8998732
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.031806,
       "timestamp": "2023-01-22T21:01:52+00:00",
       "last_traded_at": "2023-01-22T21:01:52+00:00",
       "last_fetch_at": "2023-01-22T21:01:52+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.coinex.com/trading?currency=USDT&dest=BTC#limit",
       "token_info_url": null,
       "coin_id": "bitcoin",
       "target_coin_id": "tether"
     },
     {
       "base": "BTC",
       "target": "USD",
       "market": {
         "name": "Bittrex",
         "identifier": "bittrex",
         "has_trading_incentive": false
       },
       "last": 22471.943,
       "volume": 79.71164049,
       "converted_last": {
         "btc": 0.99746215,
         "eth": 13.881337,
         "usd": 22472
       },
       "converted_volume": {
         "btc": 79.509,
         "eth": 1107,
         "usd": 1791275
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.106715,
       "timestamp": "2023-01-22T21:03:23+00:00",
       "last_traded_at": "2023-01-22T21:03:23+00:00",
       "last_fetch_at": "2023-01-22T21:03:23+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://bittrex.com/Market/Index?MarketName=USD-BTC",
       "token_info_url": null,
       "coin_id": "bitcoin"
     },
     {
       "base": "BNB",
       "target": "BTC",
       "market": {
         "name": "Bitforex",
         "identifier": "bitforex",
         "has_trading_incentive": false
       },
       "last": 0.01337179,
       "volume": 18397.8295,
       "converted_last": {
         "btc": 1,
         "eth": 13.901922,
         "usd": 22528
       },
       "converted_volume": {
         "btc": 246.012,
         "eth": 3420,
         "usd": 5542202
       },
       "trust_score": "green",
       "bid_ask_spread_percentage": 0.050687,
       "timestamp": "2023-01-22T21:01:50+00:00",
       "last_traded_at": "2023-01-22T21:01:50+00:00",
       "last_fetch_at": "2023-01-22T21:01:50+00:00",
       "is_anomaly": false,
       "is_stale": false,
       "trade_url": "https://www.bitforex.com/en/spot/bnb_btc",
       "token_info_url": null,
       "coin_id": "binancecoin",
       "target_coin_id": "bitcoin"
     }
   ]
 }
 */

struct CoinDetailModel: Codable {
    let id: String?
    let symbol, name: String?
    let blockTimeInMinutes: Int?
    let hashingAlgorithm: String?
    let description: Description?
    let links: Links?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, description, links
        case blockTimeInMinutes = "block_time_in_minutes"
        case hashingAlgorithm = "hashing_algorithm"
    }
    
    var readableDescription: String? {
        return description?.en?.removingHTMLOccurances
    }
}

struct Description: Codable {
    let en: String?
}

struct Links: Codable {
    let homepage: [String]?
    let subredditURL: String?
    
    enum CodingKeys: String, CodingKey {
        case homepage
        case subredditURL = "subreddit_url"
    }
}


