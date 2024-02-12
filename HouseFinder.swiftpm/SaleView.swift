import SwiftUI

struct SaleView: View {
    
    @State private var houses: [House] = []
    @State private var query: String = ""
    
    @ViewBuilder func houseInfo(house: House) -> some View {
        HStack {
            Image(systemName: "house")
                .font(.system(size: 40))
                .foregroundStyle(.blue)
            
            VStack(alignment: .leading) {
                Text(house.location)
                    .font(.subheadline)
                    .lineLimit(2)
                
                Text("# of Bedroom: \(house.numberOfBedroom)")
                
                Text(String(format: "$%.2f", house.rentPrice))
                    .font(.callout)
                
            }  
        }
    }
    
    var filteredHouses: [House] {
        if query.isEmpty {
            return houses
        } else {
            return houses.filter { $0.location.contains(query) }
        }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(filteredHouses) { house in
                    NavigationLink {
                        HouseDetailView(house: house)
                    } label: {
                        houseInfo(house: house)
                    }
                }
                .onDelete(perform: onDelete)
                .onMove(perform: onMove)                
            }
        }
        .searchable(text: $query, prompt: "search for nearby housing...")
        .onAppear(perform: fetchHouse)
        
    }
    
    private func fetchHouse() {
        self.houses = House.data
    }
    
    private func onDelete(at offsets: IndexSet) {
        houses.remove(atOffsets: offsets)
    }
    
    private func onMove(from source: IndexSet, to destination: Int) {
        houses.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    SaleView()
}
