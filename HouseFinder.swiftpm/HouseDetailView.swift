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
    
    @State private var isBookmarked: Bool = false
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Image("Bedroom")   
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 400)
                
                Section {
                    VStack(spacing: 15) {
                        
                        LabeledContent("Address:", value: house.location)
                        LabeledContent("isAvailable:", value: house.isAvailable == true ? "Yes" : "No")
                        LabeledContent("Number of bedroom:", value: String(house.numberOfBedroom))
                        LabeledContent("Contact:", value: house.phoneNumber)
                        LabeledContent("Price:", value: String(format: "$%.2f", house.rentPrice))
                    }
                    .font(.headline)
                    .padding(.horizontal, 20)
                    
                } header: {
                    HStack(spacing: 10) {
                        Button {
                            isBookmarked.toggle()
                        } label: {
                            Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                                 .foregroundStyle(isBookmarked ? .yellow : .black)
                        }
                        .buttonStyle(.plain)
                            
                        Text("Apartment Description")
                            .foregroundStyle(.blue)
                    }
                    .font(.title2)
                }
                
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
