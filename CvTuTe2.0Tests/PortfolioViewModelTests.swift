//
//  PortfolioViewModelTests.swift
//  CvTuTe2.0Tests
//
//  Created by Matías Spinelli on 01/10/2025.
//

import XCTest
@testable import CvTuTe2_0

final class PortfolioViewModelTests: XCTestCase {

    var sut: PortfolioViewModel! // system under test

    override func setUp() {
        super.setUp()
        sut = PortfolioViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSkillDuration_Caso1_ProyectoConSkillsYFechas() {
        let proyecto = Proyecto(
            id: UUID(),
            name: "App Test",
            image: "test",
            url: nil,
            tareas: nil,
            fechaInicio: "01/01/2020",
            fechaFin: "31/12/2020",
            skills: ["Swift"]
        )
        let exp = ExperienciaLaboral(
            empresa: "Empresa1",
            cliente: nil,
            fechaInicio: "01/01/2020",
            fechaFin: "31/12/2020",
            image: "img",
            proyectos: [proyecto],
            skills: nil
        )

        sut.experienciasViewModel.experiencias = [exp]

        let result = sut.totalExperience(for: Skill(name: "Swift"))
        XCTAssertEqual(result, "1 año")
    }

    func testSkillDuration_Caso2_ProyectoConSkillsSinFechasUsaPadre() {
        let proyecto = Proyecto(
            id: UUID(),
            name: "App Test",
            image: "test",
            url: nil,
            tareas: nil,
            fechaInicio: nil,
            fechaFin: nil,
            skills: ["Swift"]
        )
        let exp = ExperienciaLaboral(
            empresa: "Empresa2",
            cliente: nil,
            fechaInicio: "01/01/2020",
            fechaFin: "31/12/2020",
            image: "img",
            proyectos: [proyecto],
            skills: nil
        )

        sut.experienciasViewModel.experiencias = [exp]

        let result = sut.totalExperience(for: Skill(name: "Swift"))
        XCTAssertEqual(result, "1 año")
    }

    func testSkillDuration_Caso3_ProyectoSinSkillsNoSuma() {
        let proyecto = Proyecto(
            id: UUID(),
            name: "App Test",
            image: "test",
            url: nil,
            tareas: nil,
            fechaInicio: "01/01/2020",
            fechaFin: "31/12/2020",
            skills: []
        )
        let exp = ExperienciaLaboral(
            empresa: "Empresa3",
            cliente: nil,
            fechaInicio: "01/01/2020",
            fechaFin: "31/12/2020",
            image: "img",
            proyectos: [proyecto],
            skills: nil
        )

        sut.experienciasViewModel.experiencias = [exp]

        let result = sut.totalExperience(for: Skill(name: "Swift"))
        XCTAssertEqual(result, "0 meses") // no debería sumar nada
    }

    func testSkillDuration_Caso4_ProyectosSinSkillsPeroPadreTiene() {
        let proyecto1 = Proyecto(
            id: UUID(),
            name: "App1",
            image: "img",
            url: nil,
            tareas: nil,
            fechaInicio: nil,
            fechaFin: nil,
            skills: nil
        )
        let proyecto2 = Proyecto(
            id: UUID(),
            name: "App2",
            image: "img",
            url: nil,
            tareas: nil,
            fechaInicio: nil,
            fechaFin: nil,
            skills: nil
        )
        let exp = ExperienciaLaboral(
            empresa: "Empresa4",
            cliente: nil,
            fechaInicio: "01/01/2020",
            fechaFin: "31/12/2021",
            image: "img",
            proyectos: [proyecto1, proyecto2],
            skills: ["Swift"]
        )

        sut.experienciasViewModel.experiencias = [exp]

        let result = sut.totalExperience(for: Skill(name: "Swift"))
        XCTAssertEqual(result, "2 años")
    }
}
