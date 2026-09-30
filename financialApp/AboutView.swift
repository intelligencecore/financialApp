//
//  AboutView.swift
//  financialApp
//
//  Created by Richier on 9/29/26.
//

import SwiftUI

struct AboutView: View {

	var body: some View {

		ScrollView {

			VStack(alignment: .center) {

				Text("Made with ❤️ in NYC using the: ")
					.fontWeight(.bold)
					.padding(.bottom, 50)
					.font(.headline)

				Text(.init(systemName: "swift"))
					.font(.system(size: 300))
					.foregroundStyle(Color.orange)

				Text("The Swift Programming Language")
					.bold()
					.font(.headline)

				Spacer()

				Link(
					"Learn More About Swift",
					destination: URL(string: "https://developer.apple.com/swift/")!
				)
				.buttonStyle(GlassButtonStyle())
				.foregroundStyle(Color.blue)

			}

		}
	}
}

#Preview {
	AboutView()
}
