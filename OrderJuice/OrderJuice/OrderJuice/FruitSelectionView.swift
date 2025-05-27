import SwiftUI

struct FruitSelectionView: View {
    var onSelect: (String) -> Void

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 1.0, green: 0.8, blue: 0.9), Color.pink]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Choose a flavour")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)

                HStack(spacing: 40) {
                    Button(action: {
                        onSelect("🍓")
                    }) {
                        Text("🍓")
                            .font(.system(size: 80))
                    }

                    Button(action: {
                        onSelect("🍇")
                    }) {
                        Text("🍇")
                            .font(.system(size: 80))
                    }
                }
                .padding(.top, 30)

                Spacer()
            }
        }
    }
}

