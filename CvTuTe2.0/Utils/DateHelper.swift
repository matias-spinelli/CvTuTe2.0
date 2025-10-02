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
    
    /// Cálculo de duración en años/meses entre dos fechas
    static func duration(from startDate: Date?, to endDate: Date? = Date()) -> String {
        guard let startDate = startDate else { return "" }
        let endDate = endDate ?? Date()
        
        let components = Calendar.current.dateComponents([.year, .month], from: startDate, to: endDate)
        
        if let years = components.year, let months = components.month {
            let totalMonths = years * 12 + months + 1
            return formatDuration(totalMonths: totalMonths)
        }
        return ""
    }
    
    /// Devuelve cantidad de meses entre dos fechas
    static func totalMonths(from start: String?, to end: String?) -> Int {
        guard let startDate = parse(start) else { return 0 }
        let endDate = parse(end) ?? Date()
        
        let comps = Calendar.current.dateComponents([.year, .month], from: startDate, to: endDate)
        if let y = comps.year, let m = comps.month {
            return y * 12 + m + 1
        }
        return 0
    }
    
    /// Devuelve meses acumulados de proyectos
    static func totalMonths(fromProjects proyectos: [Proyecto]) -> Int {
        proyectos.reduce(0) { $0 + totalMonths(from: $1.fechaInicio, to: $1.fechaFin) }
    }
    
    /// Antes devolvía String directamente, ahora usamos el formateador privado
    static func totalDuration(fromProjects proyectos: [Proyecto]) -> String {
        let months = totalMonths(fromProjects: proyectos)
        return formatDuration(totalMonths: months)
    }
    
    static func formatDuration(totalMonths: Int) -> String {
        if totalMonths == 0 {
            return "0 meses"
        }
        
        let years = totalMonths / 12
        let months = totalMonths % 12
        
        if years == 0 {
            return "\(months) mes\(months > 1 ? "es" : "")"
        } else if months == 0 {
            return "\(years) año\(years > 1 ? "s" : "")"
        } else {
            return "\(years) año\(years > 1 ? "s" : "") \(months) mes\(months > 1 ? "es" : "")"
        }
    }

}
