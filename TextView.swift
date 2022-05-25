import SwiftUI

struct ContentView: View {

@State private var username = ""

var body: some View {
TextField("Type here", text: $username)
}
}

struct ViewTheText: View {
@Binding var username: String
  
  var body: some View {
Text(username")
  }
}
