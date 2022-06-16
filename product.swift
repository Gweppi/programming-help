import SwiftUI

struct ProductView: View {
    
    @StateObject var viewModel = ViewModel()
    
    let availableProducts = [
        Product(name: "Jacket", price: 124.99),
        Product(name: "Jeans", price: 69.99),
        Product(name: "Hat", price: 15.99)
    ]
    
    var body: some View {
        VStack {
            Form {
                Section("Add") {
                    ForEach(availableProducts, id: \.id) { product in
                        Button {
                            viewModel.addProduct(product)
                        } label: {
                            Text("Add \(product.name)")
                        }
                    }
                }
                
                Section("Delete") {
                    ForEach(availableProducts, id: \.id) { product in
                        Button {
                            viewModel.deleteProduct(product)
                        } label: {
                            Text("Delete \(product.name)")
                        }
                    }
                }
                
                Section("In Cart") {
                    ForEach(viewModel.products, id: \.id) { product in
                        Text(product.name)
                    }
                }
            }
            
            Text("Total: \(viewModel.total)")
        }
    }
}

final class ViewModel: ObservableObject {
    
    @Published private(set) var products: [Product] = []
    @Published private(set) var total = 0.0
    
    func addProduct(_ prodcut: Product) {
        products.append(prodcut)
        total += prodcut.price
    }
    
    func deleteProduct(_ product: Product) {
        products = products.filter { product.id != $0.id }
        total -= product.price
    }
}

struct Product {
    let id = UUID()
    let name: String
    let price: Double
}
