//
//  EnvelopeViewModel.swift
//  CvTuTe2.0
//
//  Created by Matías Spinelli on 29/09/2025.
//

import Foundation
import Combine

class EnvelopeViewModel: ObservableObject {
    @Published var envelopes: [Envelope] = []
    
    init() {
        loadSampleData()
    }
    
    private func loadSampleData() {
        envelopes = [
            Envelope(
                text: "“siempre con buena onda, siempre para adelante, siempre con chistes. Tenes una forma de ser que al menos a mi me hace querer seguir trabajando con vos siempre y no cambiar de proyecto. Sos una maquina de codear, velocidad, calidad, propuesta de mejora constante, critico con lo que esta hecho como el orto. Sos de las perdidas mas grandes de wolox para mi gusto, porque sos un desarrollador clave. Me llevo un amigo de todo esto por suerte, espero no colgar de seguir en contacto.”"
            ),
            Envelope(
                text: "“Ponerle buena onda a las consultas técnicas y todas las ceremonias durante mi estancia en el proyecto de Essen.”"
            ),
            Envelope(
                text: "“Planificación y ejecución de tu trabajo, participación en tareas grupales”"
            ),
            Envelope(
                text: "“Buena onda y predisposición, siempre pendiente de que las cosas se hagan bien. Laburas un montón, y se nota. Seguí diciendo lo que pensas, y levantando la voz cuándo algo te molesta.”"
            ),
            Envelope(
                text: "“ ... Destaco la predisposición y buena onda que tuviste para inducir a varios miembros del equipo al proyecto de BBVA y la ayuda que brindaste acerca de tus conocimientos en StayQuit. Te deseo lo mejor para la próxima etapa, seguí rompiendola!”"
            ),
            Envelope(
                text: "“Desarrollos en essen bien hechos, atender a los comentarios velozmente, tener buena onda en las respuestas, prestar atención a los detalles mencionados en futuros desarrollos”"
            )
        ]
    }
}
