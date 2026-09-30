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
				//Versioning and info
				NavigationLink {
					AboutView()
				} label: {
					LabeledContent("Version", value: String(versValue))
				}

				Link(
					"Github Repo",
					destination: URL(
						string:
							"https://github.com/intelligencecore/financialApp"
					)!
				)
			}
			
			
			Section {
				Text(
					"Select your own colors here:"
				)
				.font(.footnote)
				.foregroundStyle(.secondary)
			}
			.padding()
			

			Section {
				Text(
					"This app is for educational purposes only."
				)
				.font(.footnote)
				.foregroundStyle(.secondary)
				.bold()
			}
		}
		.navigationTitle("Settings")
	}
}

#Preview {
	SettingsView()
}
