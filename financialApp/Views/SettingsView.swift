import SwiftUI

struct SettingsView: View {
	@AppStorage("useDarkMode") private var useDarkMode = false
	@AppStorage("showDefinitions") private var showDefinitions = true
	@State private var versValue = 0.9
	@State private var selectedColor = Color.white
	
	
	
	
	
	
	
	
	var body: some View {
		Form {
			Section("Appearance") {
				Toggle("Dark mode", isOn: $useDarkMode)
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
			
			
			Section {
				Text(
					"Select your own colors here:"
				)
				.font(.footnote)
				.foregroundStyle(.secondary)
				
				
				
				HStack {
						// sheet with the color picker
					ColorPicker("App colors", selection: $selectedColor)
						.padding()
						//					Text("Selected color:")
					RoundedRectangle(cornerRadius: 10)
						.fill(selectedColor)
					
					
					
					
				}
				
				
				
			}
			.padding()
			
			
			Section {
				
				Text("This app does not provide financial services or generate monetary gain for its users. It was created solely as a hobby project for educational and learning purposes.")
					.padding()
			}
			.fontWidth(.condensed)
			.background(
				RoundedRectangle(cornerRadius: 14, style: .continuous)
					.fill(Color("CustomBeige"))
			)
			
			
			
		}
		.padding()
		
		.navigationTitle("Settings")
		
		
	}
	
}
	


#Preview {
	SettingsView()
}
