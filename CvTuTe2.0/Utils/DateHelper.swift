//
//  DateHelper.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 22/09/2025.
//

import Foundation

enum DateHelper {
    
    /// Convierte un string "dd/MM/yyyy" en Date
    static func parse(_ dateString: String?) -> Date? {
        guard let dateString = dateString else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.date(from: dateString)
    }
    
    /// Devuelve la fecha en formato "MMM yyyy" (ej: "sep 2025")
    static func formatMonthYear(_ date: Date?) -> String? {
        guard let date = date else { return nil }
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_ES")
        formatter.dateFormat = "MMM yyyy"
        return formatter.string(from: date).capitalized
    }
    
    /// Cálculo de duración en años/meses
    static func duration(from startDate: Date?, to endDate: Date? = Date()) -> String {
        guard let startDate = startDate else { return "" }
        let endDate = endDate ?? Date()
        
        let components = Calendar.current.dateComponents([.year, .month], from: startDate, to: endDate)
        
        if var years = components.year, var months = components.month {
            months += 1
            if months >= 12 {
                years += months / 12
                months = months % 12
            }
            
            if years == 0 {
                return "\(months) mes\(months > 1 ? "es" : "")"
            } else if months == 0 {
                return "\(years) año\(years > 1 ? "s" : "")"
            } else {
                return "\(years) año\(years > 1 ? "s" : "") \(months) mes\(months > 1 ? "es" : "")"
            }
        }
        return ""
    }
}
