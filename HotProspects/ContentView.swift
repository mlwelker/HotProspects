
import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    @Published var value = 0
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ContentView: View {
    @StateObject private var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is \(updater.value)")
    }
}

#Preview {
    ContentView()
}
