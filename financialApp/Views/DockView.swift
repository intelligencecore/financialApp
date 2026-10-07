import SwiftUI




struct DockView: View {
	var body: some View {
			// start
		
		TabView {
			
			NavigationStack{
				TaxesView()
			}
			.tabItem { Label("Taxes", systemImage: "percent")}
			
			NavigationStack{
				SavingsView()
			}
			.tabItem{Label ("Savings", systemImage: "banknote.fill")
			}
			
			NavigationStack{
				CreditCardView()
			}
			.tabItem { Label("Credit Card", systemImage: "creditcard")
				}

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
	}
}


#Preview {
	DockView()
}




