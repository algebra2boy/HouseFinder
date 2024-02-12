import Foundation

struct House: Identifiable, Hashable {
    var id: UUID
    var location: String
    var rentPrice: Double
    var phoneNumber: String
    var isAvailable: Bool
    var numberOfBedroom: Int
    
    init(id: UUID = UUID(), location: String, rentPrice: Double, phoneNumber: String, isAvailable: Bool = true, numberOfBedroom: Int = 2) {
        self.id = id
        self.location = location
        self.rentPrice = rentPrice
        self.phoneNumber = phoneNumber
        self.isAvailable = isAvailable
        self.numberOfBedroom = numberOfBedroom
    }
    
    static var data: [House] = [
        House(location: "200 Wester Street, Amherst, MA", rentPrice: 1100, phoneNumber: "123456789", isAvailable: true, numberOfBedroom: 2),
        House(location: "300 Eastern Street, Amherst, MA", rentPrice: 900, phoneNumber: "123456789", isAvailable: true, numberOfBedroom: 3)
    ]
}
