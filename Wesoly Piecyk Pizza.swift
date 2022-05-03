// Your model:
struct Pizza: ObservableObject, Identifiable {
@Published public var name: String
@Published public var diameter: String
@Published public var price: String
@Published public var pieces: String
@Published public var no: String
}

// Your TextFields:
TextField("Name", text: $pizza.name)
TextField("Diameter", text: $pizza.diameter)
TextField("Pieces", text: $pizza.pieces)
TextField("Price", text: $pizza.price)
