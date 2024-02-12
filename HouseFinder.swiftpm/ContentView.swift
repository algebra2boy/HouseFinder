import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            SaleView()
                .navigationTitle("Sales")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            AddNewHouseView()
                        } label: {
                            Image(systemName: "house")
                        }
                    }
                }
        }
    }
}
