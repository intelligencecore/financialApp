import Foundation
import SwiftUI










struct CreditCardView:View {
	
	var body: some  View {
		
		

		ScrollView {
		
			
			
			
			
		VStack {
			VStack(alignment: .leading, spacing: 40){
			Text("💳Whart are credit cards?")
				.fontWeight(.semibold)
				.frame(maxWidth: .infinity, alignment: .leading)
				}

			VStack{
				Text("A credit card is a physical or digital financial tool issued by a bank that grants you access to a revolving line of credit, allowing you to borrow money up to a pre-approved limit to make purchases rather than drawing from your personal bank account. Every month, you receive a bill for what you spent; if you pay the entire balance in full by the due date, you avoid interest charges entirely while safely building your credit score and earning rewards. However, if you only pay the minimum required amount, the remaining balance rolls over to the next month and accrues interest at a typically high Annual Percentage Rate (APR), which can quickly lead to high-interest debt if not managed responsibly.")
				
					//.multilineTextAlignment(.leading)
					.bold()
			}
			.padding()
			.background(
				RoundedRectangle(cornerRadius: 14)
					//.fill(Color("CustomYellow"))
					.fill(Color.gray)
					.padding(.all, 10)
				
			)
			
			VStack{
				
				Text("There are various tpyes of credit cards, some will get you arilines points, some other will give you cash back or c, it will depend on the use that you have and what are you expending on the most every month")
					.bold()
			}
			.padding()
			.background(
				RoundedRectangle(cornerRadius: 14)
				//.fill(Color("CustomYellow"))
					.fill(Color.gray)
					.padding(.all, 10)
				
			)
			
			
			
		}
		
		
		
	}
		.navigationTitle("Credit Cards")
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color("CustomYellow"))
		
		
		
	}
}






#Preview{
	CreditCardView()
}
