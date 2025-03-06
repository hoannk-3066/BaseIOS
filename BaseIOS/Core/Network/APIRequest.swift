//
//  APIRequest.swift
//  BaseIOS
//
//  Created by Hoàn Nguyễn on 3/5/25.
//

import Foundation

protocol APIRequestData: Codable {}

enum APIRequest {
    case getLastestData
    case getCryptoData
    
    private var baseURL: String { AppConfig.shared.baseURL }
    
    private var path: String {
        switch self {
        case .getLastestData:
            return "/latest"
        case .getCryptoData:
            return "/crypto"
        }
    }
    
    private var method: String {
        switch self {
        case .getLastestData, .getCryptoData:
            return "GET"
        }
    }
    
    private var parameters: APIRequestData? {
        switch self {
        case .getLastestData, .getCryptoData:
            return nil
        }
    }
    
    private var body: APIRequestData? {
        switch self {
        case .getLastestData, .getCryptoData:
            return nil
        }
    }
    
    private var headers: [String: String] {
        ["Accept": "application/json",
         "Content-Type": "application/json",
         "Authorization": "Bearer ",
         "X-ACCESS-KEY": AppConfig.shared.apikey]
    }
    
    private func encodeToDictionary<T: Encodable>(_ encodable: T) -> [String: String]? {
        guard let data = try? JSONEncoder().encode(encodable),
              let dict = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return nil
        }
        return dict.reduce(into: [String: String]()) { result, item in
            if let value = item.value as? CustomStringConvertible {
                result[item.key] = value.description
            }
        }
    }
    
    func asURLRequest() -> URLRequest? {
        guard let baseURL = URL(string: baseURL) else {
            return nil
        }
        guard var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            return nil
        }
        urlComponents.path += path
        guard let url = urlComponents.url else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpMethod = method
        switch method {
        case "GET":
            if let params = parameters,
               let paramsDict = encodeToDictionary(params) {
                urlComponents.queryItems = paramsDict.map { URLQueryItem(name: $0.key, value: $0.value) }
                urlRequest.url = urlComponents.url
            }
        case "POST", "PUT", "PATCH":
            if let body = body {
                urlRequest.httpBody = try? JSONEncoder().encode(body)
            }
        case "DELETE":
            if let body = body {
                urlRequest.httpBody = try? JSONEncoder().encode(body)
            }
        default:
            break
        }
        
        return urlRequest
    }
}
