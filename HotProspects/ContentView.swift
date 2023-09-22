
import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture { selectedTab = "Two" }
                .tabItem { Label("One", systemImage: "star") }
            Text("Tab 2")
                .tabItem { Label("Two", systemImage: "circle") }
                .tag("Two")
            Text("Tab 3")
                .tabItem { Label("Three", systemImage: "square") }
        }
    }
}

#Preview {
    ContentView()
}
