//
//  DateHelperTests.swift
//  CvTuTe2.0Tests
//
//  Created by Matías Spinelli on 22/09/2025.
//

import XCTest
@testable import CvTuTe2_0

final class DateHelperTests: XCTestCase {
    
    func testParseValidDate() {
        let date = DateHelper.parse("01/10/2023")
        XCTAssertNotNil(date, "La fecha debería parsearse correctamente")
    }
    
    func testParseInvalidDate() {
        let date = DateHelper.parse("2023-10-01")
        XCTAssertNil(date, "Formato incorrecto debería devolver nil")
    }
    
    func testFormatMonthYear() {
        let date = DateHelper.parse("01/10/2025")
        let formatted = DateHelper.formatMonthYear(date)
        XCTAssertEqual(formatted, "Oct 2025", "El formato esperado es 'Oct 2025'")
    }
    
    func testDurationOnlyMonths() {
        let start = DateHelper.parse("01/10/2023")
        let end   = DateHelper.parse("28/02/2024")
        let duration = DateHelper.duration(from: start, to: end)
        XCTAssertEqual(duration, "5 meses", "De octubre a febrero inclusive son 5 meses")
    }
    
    func testDurationYearsAndMonths() {
        let start = DateHelper.parse("01/01/2020")
        let end   = DateHelper.parse("15/03/2021")
        let duration = DateHelper.duration(from: start, to: end)
        XCTAssertEqual(duration, "1 año 3 meses", "Debería calcular 1 año y 3 meses")
    }
    
    func testDurationOnlyYears() {
        let start = DateHelper.parse("01/01/2020")
        let end   = DateHelper.parse("31/12/2021")
        let duration = DateHelper.duration(from: start, to: end)
        XCTAssertEqual(duration, "2 años", "Debería calcular 2 años exactos")
    }
}
