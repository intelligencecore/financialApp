import Foundation
import SwiftUI




struct CreditCardView:View {
	
	@State private var inputBalance = ""
	@State private var selectedSelection = 0
	@State private var inputAPR = ""
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
						.padding(.all, 10))
			}
			
			
			
			VStack {
				
				Text("Is in your best interest not to pay interest!")
					.fontWeight(.heavy)
					.bold()
				
				
				
				
			}
			
			//Credit card interest calculator
			VStack {
				Text("Credit Card Interest Calculator")
					.fontWeight(.semibold)
					.padding()
				
				// take in the balance
				VStack(alignment: .leading, spacing: 16){
					Text("Input Your Balance")
						.font(.title2)
						.bold()
						.padding(.horizontal)
					
					//textfield for the input
					TextField("e.g. 1000", text: $inputBalance)
						.textFieldStyle(.bordered)
						.foregroundStyle(Color.white)
						.padding(.horizontal)
					
					
				}
				
				// take in the days in the month
				VStack(alignment: .leading, spacing: 10){
					Text("Select how many days")
						.font(.title2)
						.bold()
						.padding(.horizontal)
								
					
					Picker("Options", selection: $selectedSelection) {
						Text("29 Days").tag(0)
						Text("30 Days").tag(1)
						Text("31 Days").tag(2)
					}
					.pickerStyle(.segmented) // Forces the 3-button switch style
					.foregroundStyle(Color.green.opacity(0.4))
					.padding()
					
					
					VStack(alignment: .leading) {
						Text("Whats your APR?")
							.bold()
							
					
						TextField("Input your APR", text: $inputAPR)
							.bold()
							.padding()

					}
		
				}
			}
			.background(
				RoundedRectangle(cornerRadius: 14)
					.fill(Color.blue.opacity(0.4))
					.padding(.all, 10)
			)
			
			
			
			
			
			
		}
		.navigationTitle("Credit Cards")
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color("CustomYellow"))
		
	}
	
	
		// call the MathHelper file to calculate the interest with the calculator
	
	
	
	
	
}






#Preview{
	CreditCardView()
}
