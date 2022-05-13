extension Dictionary where Value: Equatable {
    func key(forValue value: Value) -> Key? {
        return first { $0.1 == value }?.0
        
    }
}

let dictionary = ["Nepal": "Kathmandu", "Italy": "Rome", "England": "London"]

let key = dictionary.key(forValue: "Rome")
