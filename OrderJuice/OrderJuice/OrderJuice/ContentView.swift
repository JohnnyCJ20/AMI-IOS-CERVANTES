import SwiftUI

struct ContentView: View {
    @State private var selectedFruit: String? = nil
    @State private var showFruitSelection = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.8), Color.pink]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                Spacer()
                
                if let fruit = selectedFruit {
                    Text("Order juice")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                    
                    Text("Here is your \(fruit) juice!")
                        .font(.title3)
                        .foregroundColor(.white)
                } else {
                    Text("Order juice")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    
                    Button(action: {
                        showFruitSelection = true
                    }) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .padding(.top, 20)
                    }
                }

                Spacer()
            }
            .fullScreenCover(isPresented: $showFruitSelection) {
                    self.selectedFruit = selected
                    self.showFruitSelection = false
                }
            }
        }
    }
}
