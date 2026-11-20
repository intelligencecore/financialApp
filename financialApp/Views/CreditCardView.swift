import SwiftUI

struct CreditCardView: View {

	@Binding var accentColor: Double
	@State private var inputBalance = ""
	@State private var selectedDays = 30
	@State private var inputApr = ""
	@State private var paymentWithInterest = ""

	var body: some View {
		ScrollView {
			VStack {
				Text("💳What are credit cards?")
					.fontWeight(.semibold)
					.frame(maxWidth: .infinity, alignment: .leading)

				Text("A credit card is a physical or digital financial tool issued by a bank that grants you access to a revolving line of credit, allowing you to borrow money up to a pre-approved limit to make purchases rather than drawing from your personal bank account. Every month, you receive a bill for what you spent; if you pay the entire balance in full by the due date, you avoid interest charges entirely while safely building your credit score and earning rewards. However, if you only pay the minimum required amount, the remaining balance rolls over to the next month and accrues interest at a typically high Annual Percentage Rate (APR), which can quickly lead to high-interest debt if not managed responsibly.")
					.bold()
					.padding()
					.background(
						RoundedRectangle(cornerRadius: 14)
							.fill(Color.gray)
							.padding(.all, 10)
					)

				Text("There are various types of credit cards, some will get you airline points, some others will give you cash back, it will depend on the use that you have and what you are spending on the most every month.")
					.bold()
					.padding()
					.background(
						RoundedRectangle(cornerRadius: 14)
							.fill(Color.yellow)
							.padding(.all, 10)
					)

				Text("It is in your best interest not to pay interest!")
					.fontWeight(.heavy)

				VStack {
					Text("Credit Card Interest Calculator")
						.fontWeight(.semibold)
						.padding()

					VStack(alignment: .leading, spacing: 16) {
						Text("Input Your Balance")
							.font(.title2)
							.bold()
							.padding(.horizontal)

						TextField("e.g. 1000", text: $inputBalance)
							.textFieldStyle(.bordered)
							.foregroundStyle(Color.white)
							.padding(.horizontal)
					}

					VStack(alignment: .leading, spacing: 10) {
						Text("Select how many days")
							.font(.title2)
							.bold()
							.padding(.horizontal)

						Picker("Options", selection: $selectedDays) {
							Text("29 Days").tag(29)
							Text("30 Days").tag(30)
							Text("31 Days").tag(31)
						}
						.pickerStyle(.segmented)
						.foregroundStyle(Color.yellow.opacity(0.8))
						.padding()

						VStack(alignment: .leading) {
							Text("What's your APR?")
								.bold()

							TextField("Input your APR", text: $inputApr)
								.bold()
								.textFieldStyle(.bordered)
								.padding(.horizontal)

							TextField("Monthly payment", text: $paymentWithInterest)
								.textFieldStyle(.bordered)
								.foregroundStyle(Color.white)
								.padding(.horizontal)
						}
						.padding(.all)
					}
				}
				.background(
					RoundedRectangle(cornerRadius: 14)
						.fill(Color.blue.opacity(0.4))
						.padding(.all, 10)
				)
			}
		}
		.padding()
		.navigationTitle("Credit Cards")
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color("CustomYellow").opacity(accentColor))
	}
}

#Preview {
	CreditCardView(accentColor: .constant(0.5))
}
