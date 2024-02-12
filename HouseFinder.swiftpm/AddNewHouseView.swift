import SwiftUI

struct AddNewHouseView: View {
    
    let numberOfRooms: [Int] = [1, 2, 3, 4] 
    
    @State private var location: String = "123 ABC Street, Boston, MA"
    @State private var rentPrice: Double = 1000
    @State private var isAvailable: Bool = true 
    @State private var roomSelection: Int = 2
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section("location") {
                TextField("123 ABC Street, Boston, MA", text: $location)
                    .textFieldStyle(.plain)
            }
            
            Section("rent price") {
                TextField("Amount", value: $rentPrice, format: .currency(code: "USD"))
                    .textFieldStyle(.plain)
                    .keyboardType(.phonePad)
            }
            
            Section("Avability") {
                Toggle("Is the house available?", isOn: $isAvailable)
            }
            
            Section("Number of rooms") {
                Picker("Room", selection: $roomSelection) {
                    ForEach(numberOfRooms, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Button(action: addNewHouse) {
                Text("Submit")
                    .foregroundStyle(.blue)
                    .font(.callout)   
            }
        }
        .tint(.blue)
        
        .navigationTitle("Add a new house")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    func addNewHouse() {
        let newHouse = House(location: location, rentPrice: rentPrice, phoneNumber: "123456789", isAvailable: isAvailable, numberOfBedroom: roomSelection)
        House.data.append(newHouse)
        dismiss()
    }
}

#Preview {
    AddNewHouseView()
}
