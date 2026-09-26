import SwiftUI






struct TaxesView: View {
	
	
	
	var body: some View {
		
		
		ScrollView {
			
			
			VStack(alignment: .leading, spacing: 20) {
				
				Text("🧾What are taxes, and why do we have to pay them?")
					.font(.title3)
					.bold()
				
				VStack {
					Text("A tax is a mandatory payment made by individuals or businesses to a government (local, state, or federal). Governments use this collected money to fund public services, build infrastructure (like roads and schools), and maintain safety programs.")
					
				}
				.font(.body)
				.lineSpacing(3)
				.padding(16)
				.frame(maxWidth: .infinity, alignment: .leading)
				.background(
					RoundedRectangle(cornerRadius: 14, style: .continuous)
						.fill(Color.green.opacity(0.30))
				)
				
				Text("But why do I need to pay it?")
					.font(.title3)
					.fontWeight(.semibold)
				
				VStack{
					Text("You need to pay taxes because it is a legal obligation that funds the shared infrastructure, public services, and safety systems of society. The US government collect these mandatory payments from individuals and businesses to build roads, operate public schools, pay for emergency services like police and fire departments, and maintain national defense. Essentially, taxes are the entry fee for living in an organized community, providing the essential services and stability that individuals could not afford or manage on their own.")
						.font(.body)
						.lineSpacing(3)
						.padding(16)
						.frame(maxWidth: .infinity, alignment: .leading)
						.background(
							RoundedRectangle(cornerRadius: 14, style: .continuous)
								.fill(Color.green.opacity(0.30))
						)
					
					
					
				}
				
				Text("How many taxes do I have to pay in the year?")
					.font(.title3)
					.fontWeight(.semibold)
				
				
				
				VStack{
				Text("You have to pay three main types of income-based taxes: Federal Income Tax (which uses a progressive system with rates ranging from 10% to 37% based on your income brackets), FICA Payroll Taxes (which consist of a 6.2% Social Security tax on earnings up to $184,500 and a 1.45% Medicare tax), and State and Local Income Taxes (which vary completely depending on where you live). Additionally, you are subject to consumption and ownership costs like sales and property taxes depending on your local municipal laws.")
			}
				.font(.body)
				
				
				
				
			}
			.padding()
			
		}
		.navigationTitle("Taxes, Why?")
		.background(.blue.opacity(0.3))
	}
}

#Preview {
	TaxesView()
}
