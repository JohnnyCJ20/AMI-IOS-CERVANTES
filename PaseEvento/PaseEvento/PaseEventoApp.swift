import SwiftUI

struct PaseEventoApp: View {
    var nombreEvento: String
    var fechaEvento: Date
    var lugarEvento: String
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "ticket.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.blue)
                    .padding(.top, 30)
                
                Text("PASE DE EVENTO")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Evento:")
                            .font(.headline)
                            .frame(width: 70, alignment: .leading)
                        Text(nombreEvento)
                            .font(.body)
                            .foregroundStyle(.blue)
                            .fontWeight(.semibold)
                    }
                    
                    HStack {
                        Text("Fecha:")
                            .font(.headline)
                            .frame(width: 70, alignment: .leading)
                        Text(formatDate(fechaEvento))
                            .font(.body)
                            .foregroundStyle(.blue)
                            .fontWeight(.semibold)
                    }
                    
                    HStack {
                        Text("Lugar:")
                            .font(.headline)
                            .frame(width: 70, alignment: .leading)
                        Text(lugarEvento)
                            .font(.body)
                            .foregroundStyle(.blue)
                            .fontWeight(.semibold)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue, lineWidth: 2)
                        .background(Color(uiColor: .systemBackground))
                )
                .padding(.horizontal)
                
                Spacer()
                
                Image(systemName: "qrcode")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 8)
                
                Text("ID: \(generateEventID())")
                    .font(.caption)
                    .padding(.bottom, 30)
            }
            .padding()
            .navigationTitle("Tu Pase")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "es_ES") // Para formato en español
        return formatter.string(from: date)
    }
    
    private func generateEventID() -> String {
        // En una aplicación real podrías generar un ID único para cada evento
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<8).map{ _ in letters.randomElement()! })
    }
}

#Preview {
    PaseEventoApp(
        nombreEvento: "Concierto en vivo",
        fechaEvento: Date(),
        lugarEvento: "Teatro Municipal"
    )
}

#Preview {
    PaseEventoApp(
        nombreEvento: "Concierto en vivo",
        fechaEvento: Date(),
        lugarEvento: "Teatro Municipal"
    )
}
