//
//  settingsView.swift
//  financialApp
//
//  Created by Richier on 9/22/26.
//



import SwiftUI




struct settingsView:View {
	var body: some View {
		
		VStack {
			
			Text("View with all the app settingns")
				.font(.largeTitle)
				.bold()
			
			
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(.green)
//		.ignoresSafeArea()
		
	}
	
}



#Preview {
	settingsView()
}
