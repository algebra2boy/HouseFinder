import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let house: Self = .init(latitude: 42.3941, longitude: -72.5251)
}

extension MKCoordinateSpan {
    static let defaultSpan: Self = .init(latitudeDelta: 0.001, longitudeDelta: 0.001) 
}

struct HouseDetailView: View {
    
    let house: House
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Image("Bedroom")   
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 400)
                
                Section {
                    VStack(spacing: 15) {
                        Text("Address: \(house.location)") 
                        Text("isAvailable: \(house.isAvailable == true ? "Yes" : "No")") 
                        Text("Number of bedroom: \(house.numberOfBedroom)") 
                        Text("Contact: \(house.phoneNumber)")
                        Text("Price: \(String(format: "$%.2f", house.rentPrice))")
                    }
                    .font(.headline)
                    
                } header: {
                    Label("Apartment Description", systemImage: "bookmark")
                        .font(.title2)
                        .foregroundStyle(.blue)
                }
                .padding(.leading, 20)
                
                Map(initialPosition: .region(.init(center: .house, span: .defaultSpan))) {
                    Marker("Apartment", coordinate: .house) 
                }
                .padding(.vertical, 10)
                
            }
        }
        .navigationTitle("Detail View")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    HouseDetailView(house: House.data[0])
}
