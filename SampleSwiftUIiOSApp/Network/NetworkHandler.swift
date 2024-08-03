//
//  NetworkHandler.swift
//  SampleSwiftUIiOSApp
//
//  Created by Arshad Khan on 7/31/24.
//

import Combine
import Foundation

protocol NetworkHandlerProvider {
    func sendRequest(_ request: URLRequest) -> AnyPublisher<Data, Error>
    func sendRequest(_ request: URLRequest) async throws -> Data
}

class NetworkHandler: NetworkHandlerProvider {
    func sendRequest(_ request: URLRequest) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }
                return output.data
            }.mapError { error in
                return NetworkError.other(error)
            }.eraseToAnyPublisher()
    }
    
    func sendRequest(_ request: URLRequest) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard response is HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        return data
    }
}

enum NetworkError: Error {
    case invalidResponse
    case other(Error)
}
