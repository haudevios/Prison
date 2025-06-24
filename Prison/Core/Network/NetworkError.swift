//
//  NetworkError.swift
//  Prison
//
//  Created by umaxsoft on 24/6/25.
//

// Utils/NetworkError.swift
import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidData
    case fileNotFound
    case decodingError
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidData: return "Dữ liệu không hợp lệ."
        case .fileNotFound: return "Không tìm thấy file JSON."
        case .decodingError: return "Lỗi giải mã dữ liệu."
        case .unknown: return "Lỗi không xác định."
        }
    }
}
