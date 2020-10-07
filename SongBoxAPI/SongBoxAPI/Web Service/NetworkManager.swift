//
//  NetworkManager.swift
//  SongBoxAPI
//
//  Created by Burak Donat on 7.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

public protocol WebServiceProtocol {
    func fetchSongs(url: String, completion: @escaping (Result<HotTracksResponse, NetworkError>) -> Void)
}

public class NetworkManager: WebServiceProtocol {
    public init() { }

    public func fetchSongs(url: String, completion: @escaping (Result<HotTracksResponse, NetworkError>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(.network))
                return
            }
            do {
                let response = try JSONDecoder().decode(HotTracksResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.decoding))
            }
        }
        task.resume()
    }
}
