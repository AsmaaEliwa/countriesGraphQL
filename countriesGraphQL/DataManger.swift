//
//  DataManger.swift
//  countriesGraphQL
//
//  Created by asmaa gamal  on 13/12/2023.
//
import Foundation
import Apollo
import CountryAPI

class DataManager: NSObject , ObservableObject {
    static let sharedInstance: DataManager = {
        let instance = DataManager()
        return instance
    }()
    
    private override init() {
        super.init()
    }
    
    
    let apolloClient = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
    
    func fetchCountries(completion: @escaping ([GetAllCountriesQuery.Data.Country]) -> Void) {
        apolloClient.fetch(query: GetAllCountriesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                
                if let countries = graphQLResult.data?.countries {
                    completion(countries.compactMap { $0 })
                }
            case .failure(let error):
                print(error)
                
                completion([])
            }
        }
    }
}
