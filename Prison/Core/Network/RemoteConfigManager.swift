//
//  RemoteConfigManager.swift
//  Prison
//
//  Created by umaxsoft on 24/6/25.
//
// Networking/RemoteConfigManager.swift
import FirebaseRemoteConfig

class RemoteConfigManager {
    static let shared = RemoteConfigManager()
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    func fetchConfig(completion: @escaping (Result<Data, Error>) -> Void) {
        remoteConfig.fetchAndActivate { status, error in
            if let error = error {
                completion(.failure(error))
            } else {
                let jsonString = self.remoteConfig.configValue(forKey: "characters_json").stringValue
                if let data = jsonString.data(using: .utf8) {
                    completion(.success(data))
                } else {
                    completion(.failure(NetworkError.invalidData))
                }
            }
        }
    }
}
