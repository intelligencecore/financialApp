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
			
			VStack(alignment: .leading){
				Text("What are savings?")
					.font(.title)
				
			}
			
			VStack{
				Text(" Savings represent the portion of your income that you choose not to spend on immediate living expenses, but instead set aside to secure your financial future, handle unexpected emergencies, or fund specific personal goals.")
				
				
			}
			.padding()
			.background{
				RoundedRectangle(cornerRadius: 14)
					.foregroundStyle(Color.green.opacity(0.9))
			}
			
			
			Text("There are several types of Savings that one can have: ")
			
			VStack{
				Text("Traditional savings accounts are the standard options offered by brick-and-mortar neighborhood banks, making them highly convenient for in-person customer service and quick cash deposits. They allow you to easily link your savings to a checking account for fast transfers, keeping your cash highly accessible. However, the major downside is that they pay incredibly low interest rates, often yielding a near-zero 0.01% APY, which means your money will slowly lose purchasing power to inflation over time. This makes them ideal only for small cash buffers or money you expect to spend in the immediate future.")
			}
			.padding()
			.background{
				RoundedRectangle(cornerRadius: 14)
					.foregroundStyle(Color.green.opacity(0.9))
			}
			
		
			
			
			
			
		}
		.navigationTitle("Savings")
		.navigationBarTitleDisplayMode(.automatic)
		.background{
			Color.green.opacity(0.2)
				.ignoresSafeArea()
		}
		
		
		
    }
}

#Preview {
    SavingsView()
}
