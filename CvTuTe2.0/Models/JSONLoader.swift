//
//  JSONLoader.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 20/09/2025.
//

import Foundation

struct JSONLoader {
    static func load<T: Decodable>(_ filename: String, as type: T.Type) -> T? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("❌ No se encontró el archivo \(filename).json")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch {
            print("❌ Error parseando JSON (\(filename)): \(error)")
            return nil
        }
    }
}
