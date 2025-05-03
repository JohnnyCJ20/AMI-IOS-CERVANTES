
import SwiftUI

struct EventoForm: View {
    @State var nombreEvento: String = ""
    @State var fechaEvento: Date = Date()
    @State var lugarEvento: String = ""
    @State var showCredentials: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nombre del evento", text: $nombreEvento)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.words)
                    
                    DatePicker("Fecha", selection: $fechaEvento, displayedComponents:
                        [.date])
                    
                    TextField("Lugar", text: $lugarEvento)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.words)
                }
            }
            .navigationTitle("Registro de Evento")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showCredentials = true
                    }) {
                        Image(systemName: "checkmark")
                    }
                    .disabled(nombreEvento.isEmpty || lugarEvento.isEmpty)
                }
            }
            .sheet(isPresented: $showCredentials) {
                PaseEventoApp(nombreEvento: nombreEvento,
                              fechaEvento: fechaEvento,
                              lugarEvento: lugarEvento)
            }
        }
    }
}

#Preview {
    EventoForm()
}
