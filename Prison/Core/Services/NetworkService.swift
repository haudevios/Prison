//
//  NetworkService.swift
//  Prison
//
//  Created by umaxsoft on 24/6/25.
//


import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    func loadCharacters(fromLocal: Bool, completion: @escaping (Result<[Character], Error>) -> Void) {
        if fromLocal {
            guard let url = Bundle.main.url(forResource: "characters", withExtension: "json") else {
                completion(.failure(NetworkError.fileNotFound))
                return
            }
            do {
                let data = try Data(contentsOf: url)
                let characters = try JSONDecoder().decode([Character].self, from: data)
                completion(.success(characters))
            } catch {
                completion(.failure(error))
            }
        } else {
            RemoteConfigManager.shared.fetchConfig { result in
                switch result {
                case .success(let data):
                    do {
                        let characters = try JSONDecoder().decode([Character].self, from: data)
                        completion(.success(characters))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
