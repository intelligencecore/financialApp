import SwiftUI




struct DockView: View {
	var body: some View {
			// start
		
			
			// refactor the view because it was rendering the page completely blank
		
		TabView {
			
			NavigationStack{
				TaxesView()
			}
			.tabItem { Label("Taxes", systemImage: "percent")}
			
			
			NavigationStack{
				CreditCardView()
			}
			.tabItem { Label("Credit Card", systemImage: "creditcard")
				}
			.toolbarBackground(.red, for: .tabBar)
			.toolbarBackground(.visible, for: .tabBar)

			
			NavigationStack{
				MortgageView()
			}
			.tabItem { Label("Mortgage", systemImage: "house")
				.foregroundColor(Color.yellow)}
			
			NavigationStack{
				SettingsView()
			}
			.tabItem { Label("Settings", systemImage: "gear")
				.foregroundColor(Color.blue)}
		}
		//.tint(.clear) 
	}
}


#Preview {
	DockView()
}




