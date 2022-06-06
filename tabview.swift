struct ContentView: View {
  var body: some View {
		TabView {
			HomeView()
				.tabItem {
					Label("Home", systemName: "house.fill")
				}
		}
	}
}

struct HomeView: View {
	var body: some View {
		NavigationView {
			VStack {
				Text("Home")
// 				Add your other views here...
			}
			.navigationTitle("Home")
		}
	}
}
