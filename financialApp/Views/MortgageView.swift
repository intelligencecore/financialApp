import SwiftUI

struct MortgageView: View {
	@State private var homeValue = ""
	@State private var HomePrice = ""
	@State private var loanAmount = ""
	@State private var interestRate = ""
	@State private var fieldColor = Color.primary
	@State private var downPayment = ""
	@State private var totalBalanceResult: Double = 0.0
	//	@State private var settingsPickerColor: Color
	@FocusState private var isDone: Bool

	var body: some View {
		ScrollView {
			VStack(spacing: 20) {

				Text("What is that?")
					.font(.title3)
					.fontWeight(.heavy)
					.frame(maxWidth: .infinity, alignment: .leading)

				VStack {
					Text(
						"A mortgage is a specialized loan used to purchase or maintain a home, land, or other types of real estate, where the property itself serves as collateral. The borrower agrees to pay the lender back over a set period, typically 15 or 30 years, through regular payments divided into principal and interest. If the borrower fails to make these payments, the lender holds the legal right to seize the property through a process known as foreclosure."
					)
					.background(
						RoundedRectangle(cornerRadius: 14, style: .continuous)
							.fill(Color.black.opacity(0.06))
					)
					.padding()
				}

				VStack {
					Text("Check your rate and payment below:")
						.bold()
				}

				//Calculator for the house
				VStack(spacing: 16) {
					Text("Mortgage Calculator")
						.font(.title3)
						.foregroundStyle(Color.black)
						.bold()

					// grouping stacks to for a vertical layout
					VStack {
						VStack(alignment: .leading, spacing: 6) {

							Text("Home Value")

							TextField("e.g. $400,000", text: $homeValue)
								.keyboardType(.decimalPad)
								.textFieldStyle(.roundedBorder)

						}

						VStack(alignment: .leading, spacing: 6) {
							Text("Down Payment")
							TextField("e.g. $25,000", text: $downPayment)
								.keyboardType(.decimalPad)
								.textFieldStyle(.roundedBorder)

						}

						VStack(alignment: .leading, spacing: 6) {
							Text("Loan Amount")
							TextField("e.g. $500,000.00", text: $loanAmount)
								.keyboardType(.decimalPad)
								.textFieldStyle(.roundedBorder)

						}

						VStack(alignment: .leading, spacing: 6) {
							Text("Interest Rate")
							TextField("e.g. 6%", text: $interestRate)
								.keyboardType(.decimalPad)
								.textFieldStyle(.roundedBorder)

						}

						VStack {
							Text("Total Balance")
								.font(.caption)
								.bold()
								.foregroundColor(.gray)

							Text(
								totalBalanceResult,
								format: .currency(code: "USD")
							)
							.font(.system(.title2, design: .rounded))

							.frame(maxWidth: .infinity)
							.padding(.vertical, 12)
							.background(Color.white)
							.cornerRadius(8)
							.padding(.horizontal)

						}

						HStack(spacing: 16) {
							Button {

							} label: {
								Text("Get the Mortgage rate!")
							}
							.buttonStyle(GlassButtonStyle())

							Spacer()

							Button {

							} label: {
								Text("Reset")
							}
							.buttonStyle(GlassButtonStyle())
							.foregroundStyle(Color.red)

						}.padding(.horizontal)

					}
					.padding(20)
					.background(
						RoundedRectangle(cornerRadius: 10)
							.foregroundStyle(
								Color(red: 0.71, green: 0.64, blue: 0.40)
							)
					)
					// end of the Calculator HStack

				}
				.frame(maxWidth: .infinity)
				.cornerRadius(8)

			}  // end of calculator VStack
			.shadow(radius: 10)

			Section {
				Text(
					"Rates go up and down and you always should check your own."
				)
				.bold()
			}
			.padding()

		}
		.padding()
		.background(Color("CustomBeige").ignoresSafeArea())
		.navigationTitle("Mortgage")
		.navigationBarTitleDisplayMode(.automatic)
	}

	// operation function
	// now i need to pass all the values so the calculation can be done on mathHelper
	func mortgageCalculation() {

		//		return -1
	}
}

#Preview {
	MortgageView()
}

// REMARK: note to self: make the color of the field to be changed by the user
