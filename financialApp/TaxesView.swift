import SwiftUI






struct TaxesView: View {
	
	
	
	var body: some View {
		
		
		ScrollView {
			
			
			VStack(alignment: .leading, spacing: 20) {
				
				Text(" What are taxes and why do we have to pay it?")
					.font(.title3)
					.bold()
				
				
				Text("A tax is a mandatory payment made by individuals or businesses to a government (local, state, or federal). Governments use this collected money to fund public services, build infrastructure (like roads and schools), and maintain safety programs.")
				
				Text("But why do I need to pay it?")
					.font(.system(size: 20))
					.bold()
				
				
				Text(" You need to pay taxes because it is a legal obligation that funds the shared infrastructure, public services, and safety systems of society. The US government collect these mandatory payments from individuals and businesses to build roads, operate public schools, pay for emergency services like police and fire departments, and maintain national defense. Essentially, taxes are the entry fee for living in an organized community, providing the essential services and stability that individuals could not afford or manage on their own.")
					.font(.system(size: 16))
				
				Text("How many taxes do I have to pay in the year?")
					.font(.system(size: 20))
					.bold()
				
				
				
				Text(" Text here")
				
				
				
				
			}
			.padding()
			
		}
		.navigationTitle("Taxes, Why?")
		.background(.blue)
	}
}

#Preview {
	TaxesView()
}
