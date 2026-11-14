import SwiftUI

struct SettingsView: View {
	@AppStorage("useDarkMode") private var useDarkMode = false
	@AppStorage("showDefinitions") private var showDefinitions = true
	@State private var versValue = 1.0
	@State private var selectedColor = Color.white
	@State private var accentColor:Double = 0.0
	
	
	
	
	
	
	
	
	
	var body: some View {
		Form {
			Section("Appearance") {
				Toggle("Dark mode", isOn: $useDarkMode)
				
			}
				Section("Color Opacity") {
				Slider(value: $accentColor, in: 0...100){
					Text("Color")
				}
				// slider
				
				
				
				
				
				
			}
			
			Section("Reading") {
				Toggle("Show inline definitions", isOn: $showDefinitions)
			}
			
			Section("About") {
					//Versioning and info
				NavigationLink {
					AboutView()
				} label: {
					LabeledContent("Version", value: String(versValue))
				}
				
				Link(
					"Github Repo",
					destination: URL( string: "https://github.com/intelligencecore/financialApp")!)
			}
			
			
			Link(
				"Example page for url string test",
				destination:  URL(string: "www.example.com")!)
			.cornerRadius(1)
			
		}
			
			Spacer()
			

			
			
			Section {
				
				Text("This app does not provide financial services or generate monetary gain for its users. It was created solely as a hobby project for educational and learning purposes.")
			}
			.fontWidth(.condensed)
			.background(
				RoundedRectangle(cornerRadius: 14, style: .continuous)
					.fill(Color("CustomBeige"))
			)
			
		
		
			.padding(.bottom, 10)
			.navigationTitle("Settings")
			
		}
//		.padding()
		
		
		
	}
	

	


#Preview {
	SettingsView()
}
