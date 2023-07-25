import SwiftUI

struct ContentView: View {
    @State private var remainingTime: Int = 1500
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text(timeString(time: remainingTime))
                .font(.largeTitle)
                .padding()

            Button(action: {
                remainingTime = 1500
            }) {
                Text("Reset")
            }
        }
        .onReceive(timer) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            }
        }
    }

    func timeString(time: Int) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
