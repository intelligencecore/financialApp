//
//  dockVew.swift
//  financialApp

import SwiftUI




struct dockView: View {
	var body: some View {
		// start
		
		TabView {
			NavigationStack {
				ContentView()
			}
			.tabItem {
				Label("Taxes", systemImage: "percent")
			}
			
			NavigationStack {
				//
			}
			.tabItem {
				Label("Credit Card", systemImage: "creditcard")
			}
			
			NavigationStack {
					//
			}
			.tabItem {
				Label("Mortgage", systemImage: "house")
			}
			
			NavigationStack {
				 //
			}
			.tabItem {
				Label("Settings", systemImage: "gear")
			}
		}
	}
}
		

#Preview {
	dockView()
}




