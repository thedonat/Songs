//
//  NetworkError.swift
//  SongBoxAPI
//
//  Created by Burak Donat on 7.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case network
    case decoding

    public var errorMessage: String {
        switch self {
        case .network:
            return "Fetching Error Occured."
        case .decoding:
            return "Decoding Error Occured."
        }
    }
}
