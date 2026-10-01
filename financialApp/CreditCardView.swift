import Foundation
import SwiftUI










struct CreditCardView:View {
	
	var body: some  View {

		
		VStack {
			
			
			VStack{
			Text(.init(systemName: "creditcard"))
				.font(.title)
				.foregroundColor(Color.blue)
		}
			
			VStack{
				Text("A credit card is an instrument of debt that bank will lend you to pay and then repay back at the end of the month, credit cards should be paid in full at the end of the month and should not carry any balance, carrying balance could incur in interest rates hikes and other")
					.bold()
			}
		
			
			
			
		}
		.navigationTitle("Credit Cards")
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(.yellow)
		
		
		
	}
}






#Preview{
	CreditCardView()
}
