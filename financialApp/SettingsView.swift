




import SwiftUI

struct SettingsView: View {
	@AppStorage("useDarkMode") private var useDarkMode = false
	@AppStorage("showDefinitions") private var showDefinitions = true
	@State private var versValue = 0.1
	
	var body: some View {
		Form {
			Section("Appearance") {
				Toggle("Dark mode", isOn: $useDarkMode)
			}
			
			Section("Reading") {
				Toggle("Show inline definitions", isOn: $showDefinitions)
			}
			
			Section("About") {
				LabeledContent("Version", value: String(versValue))
				Link("Privacy Policy",
					 destination: URL(string: "https://github.com/intelligencecore/financialApp")!)
			}
			
			Section {
				Text("This app is for educational purposes only and does not provide financial advice.")
					.font(.footnote)
					.foregroundStyle(.secondary)
			}
		}
		.navigationTitle("Settings")
	}
}



#Preview {
	SettingsView()
}
