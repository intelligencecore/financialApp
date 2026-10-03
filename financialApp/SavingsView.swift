//
//  SavingsView.swift
//  financialApp
//
//  Created by Richier on 10/2/26.
//

import SwiftUI

struct SavingsView: View {
	
	
	@State private var isJumping = false

    var body: some View {
		
	
		ScrollView{
			
			
			
			Image(systemName: "banknote")
				.font(.title)
				.symbolEffect(.bounce, options: .repeat(.min))
			
			
			
			
			
			
			
		}
		.navigationTitle("Savings")
		.navigationBarTitleDisplayMode(.automatic)
		
		
		
		
    }
}

#Preview {
    SavingsView()
}
