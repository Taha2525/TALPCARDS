import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(hex: "#8EDCE6"), .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20.0) { // Verwenden Sie VStack für die Gesamtanordnung
                ZStack {
                    VStack(spacing: 20.0) {
                        Image("appiconlogo")
                            .resizable()
                            .cornerRadius(3.0)
                            .aspectRatio(contentMode: .fit)
                            .padding(.all)
                        
                        HStack{
                            
                            Text("TALPCARDS")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Image(systemName: "lightbulb.max")
                                .foregroundColor(.black)
                            
                        }
                        
                        Text("DO LEARNING EASIER!")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        HStack(spacing: 20.0){
                            
                            Image(systemName:"star.fill")
                            Image(systemName:"star.fill")
                            Image(systemName:"star.fill")
                            Image(systemName:"star.fill")
                            Image(systemName: "star.leadinghalf.filled")
                        }
                        .foregroundColor(.orange)
                    }
                }
                .padding()
                .background(Rectangle().foregroundColor(.white))
                .cornerRadius(15)
                .shadow(radius: 15)
                .padding()

                // Button hier hinzufügen
                Button("Start learning") {
                    // Aktion für den Button
                }
                .padding()
                .background(Color(hex: "#8EDCE6"))
                .foregroundColor(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "#8EDCE6"), lineWidth: 2)
                )
            }
        }
    }
}

// Erweiterung, um Color mit HEX-Werten zu initialisieren
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
