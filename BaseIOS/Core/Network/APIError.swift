//
//  APIError.swift
//  BaseIOS
//
//  Created by Hoàn Nguyễn on 3/5/25.
//

enum APIError: Error {
    case networkError(Error)
    case serverError(Int, String)
    case decodingError(Error)
    case unknown
    case invalidRequest
}
