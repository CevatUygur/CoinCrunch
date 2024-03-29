//
//  PreviewProvider.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 19.01.2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeVM = HomeViewModel()
    let csManager = ColorSchemeManager()
    
    let stat1 = StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
    let stat2 = StatisticModel(title: "Total Volume", value: "$1.23Tr")
    let stat3 = StatisticModel(title: "Portfolio Value", value: "$50.4k", percentageChange: -12.34)
    
    let coin = CoinModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: 20727, marketCap: 399180968865, marketCapRank: 1, fullyDilutedValuation: 435103982423, totalVolume: 40919016271, high24H: 21576, low24H: 20533, priceChange24H: -446.6179618173701, priceChangePercentage24H: -2.10935, marketCapChange24H: -8224175978.078491, marketCapChangePercentage24H: -2.01867, circulatingSupply: 19266200, totalSupply: 21000000, maxSupply: 21000000, ath: 69045, athChangePercentage: -69.99159, athDate: "2021-11-10T14:24:11.849Z", atl: 67.81, atlChangePercentage: 30455.29098, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2023-01-19T00:10:12.616Z", sparklineIn7D: SparklineIn7D(price: [
        17996.832553741606,
        18287.298868179285,
        18251.788715294453,
        18236.073722424462,
        18223.57185725765,
        18217.067035364424,
        18085.45099197179,
        18143.168387415222,
        18143.216687103344,
        18118.9163181733,
        18165.487128934747,
        18188.722067097257,
        18199.104806202147,
        18240.389022473253,
        18318.354707659364,
        17922.096845712174,
        18099.79570132957,
        18108.066235546037,
        18794.607163775698,
        18830.733127119733,
        18933.17860879959,
        18975.99218926455,
        18854.62686818687,
        18925.368027365148,
        18866.810330617045,
        18792.320558388852,
        18825.667596244133,
        18810.4635509892,
        18861.621499165576,
        18848.644661175753,
        18810.84528992494,
        18856.712868858256,
        18823.295802719873,
        18844.311042872258,
        18894.814965137935,
        19035.496304999426,
        18944.3067022098,
        18869.97231896958,
        18878.300260567194,
        18987.186955941892,
        19254.212013335236,
        19131.90937105481,
        19290.275054544047,
        19344.54688159682,
        19344.381315584644,
        19488.670094239948,
        19802.819122963443,
        19932.61800284748,
        19941.780543296303,
        21083.034366769927,
        20867.38917379548,
        20956.582685807767,
        20950.58423585899,
        20898.831046175128,
        20869.370693984514,
        20962.260990938234,
        20883.91006002229,
        21026.330445118678,
        20528.6132126577,
        20449.8809385511,
        20738.586235636016,
        20916.015790269255,
        20925.89867644994,
        20843.138978816634,
        20782.577828131904,
        20810.253612457294,
        20743.696201708284,
        20754.500109660865,
        20805.99656754562,
        20847.535518328263,
        20879.331766942843,
        20944.01926345526,
        20922.63683936556,
        20787.842893640514,
        20766.851778303942,
        20742.57280368986,
        20726.2069338249,
        20729.361218053786,
        20752.918153190985,
        20737.959658386164,
        20732.608355807854,
        20606.5461758432,
        20674.634038731267,
        20731.63255622184,
        20733.65671731066,
        20696.454282735875,
        20747.94871301318,
        20814.711437098063,
        20956.258670269104,
        20885.701278781053,
        20889.403819883028,
        20700.805744941004,
        20901.09559081564,
        20920.837333244166,
        20903.899112009953,
        20812.144521910206,
        20906.040141869526,
        20924.7111951552,
        21190.077883095764,
        21252.80928594751,
        21026.965195103217,
        21182.34866601395,
        21224.083398217746,
        21185.648911080865,
        21072.65359224,
        20751.537690394238,
        20848.124708243373,
        20828.207191874055,
        20830.174346566208,
        20802.81790553102,
        20834.072135270028,
        20859.10770712413,
        20991.5669252237,
        20981.752724442926,
        21100.504618517323,
        21218.833092977453,
        21339.084564658813,
        21291.821112503225,
        21140.66776867305,
        21196.7043539542,
        21167.444996055972,
        21087.189102768214,
        21035.72416889137,
        21091.322083737952,
        21172.113197961044,
        21163.030385333517,
        21145.6834326599,
        21078.016212611372,
        21143.37185759893,
        21201.941740865605,
        21176.316447906156,
        21147.625909358103,
        21194.878269385026,
        21260.553260427037,
        21225.208422953252,
        21167.102796860785,
        21138.35118965325,
        21240.172245106583,
        21198.319122314566,
        21356.44102222878,
        21338.670970458825,
        21326.41137103781,
        21320.63011839789,
        21247.502058233295,
        21133.228554777954,
        21210.654453673727,
        21228.94986922072,
        21316.610964520347,
        21300.16714992632,
        21273.860887323823,
        21291.29088890238,
        21267.62240006751,
        21311.80322871148,
        21236.33404462805,
        21230.590444690875,
        21176.790798372233,
        21213.180310576274,
        21272.503908492723,
        21434.158598677062,
        21470.68464261412,
        21255.367139697784,
        20532.907207838653,
        20934.37579434191,
        20937.39396072067,
        20910.1451870655,
        20694.121613021045,
        20792.951370835992,
        20831.950823406285
    ]), priceChangePercentage24HInCurrency: -2.1093454742392206, currentHoldings: 1.5)
    
    let new = News(id: "13610804", guid: "https://www.cryptopolitan.com/?p=315028", publishedOn: 1686203160, imageurl: "https://images.cryptocompare.com/news/default/cryptopolitan.png", title: "Cardano Foundation Disputes SEC’s Security Classification; Robinhood Considers Delisting ADA", url: "https://www.cryptopolitan.com/cardano-foundation-robinhood-delisting-ada/", body: "The cryptocurrency market is facing regulatory hurdles and compliance concerns in the United States, particularly impacting Cardano (ADA), Solana (SOL), and Polygon (MATIC). In a recent lawsuit against Binance, the United States Securities and Exchange Commission (SEC) classified several prominent cryptocurrencies, including Cardano, as securities. However, the Cardano Foundation’s CEO disagrees with this classification, highlighting ... Read more", tags: "Cardano News", lang: "EN", upvotes: "0", downvotes: "0", categories: "ADA|ETH|EXCHANGE|MATIC|REGULATION", sourceInfo: SourceInfo(name: "Cryptopolitan", img: "https://images.cryptocompare.com/news/default/cryptopolitan.png", lang: "EN"), source: "cryptopolitan")
}
