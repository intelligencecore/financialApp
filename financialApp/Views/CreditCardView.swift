import SwiftUI

struct CreditCardView: View {

	@Binding var accentColor: Double
	@State private var inputBalance = ""
	@State private var selectedDays = 30
	@State private var inputApr = ""

	private var balance: Double? {
		guard let value = try? Double(inputBalance, format: .number), value >= 0 else { return nil }
		return value
	}

	private var interest: Double? {
		guard let balance,
			  let apr = try? Double(inputApr, format: .number), apr >= 0
		else { return nil }
		return MathHelper.interestCalculator(balance: balance, annualInterestPercentage: apr, daysInCycle: selectedDays)
	}

	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 20) {
				VStack(alignment: .leading, spacing: 12) {
					Label("What are credit cards?", systemImage: "creditcard")
						.font(.title2.bold())

					Text("A credit card lets you borrow from a bank up to a pre-approved limit instead of paying from your own account. Every month you get a bill for what you spent.")
						.foregroundStyle(.secondary)

					Label("Pay the full balance by the due date and you pay no interest, while building your credit score and earning rewards.", systemImage: "checkmark.circle")
						.foregroundStyle(.green)

					Label("Pay only the minimum and the rest rolls over, charged at a high APR. That is how high-interest debt builds up.", systemImage: "exclamationmark.triangle")
						.foregroundStyle(.orange)
				}
				.card()

				VStack(alignment: .leading, spacing: 12) {
					Label("Types of cards", systemImage: "square.stack")
						.font(.title2.bold())

					Text("Some cards give you airline points, others give you cash back. The right one depends on what you spend the most on every month.")
						.foregroundStyle(.secondary)
				}
				.card()

				Text("It is in your best interest not to pay interest!")
					.font(.headline)
					.frame(maxWidth: .infinity)
					.multilineTextAlignment(.center)

				VStack(alignment: .leading, spacing: 16) {
					Label("Interest Calculator", systemImage: "percent")
						.font(.title2.bold())

					VStack(alignment: .leading, spacing: 6) {
						Text("Balance")
							.font(.headline)
						HStack {
							Text("$")
								.foregroundStyle(.secondary)
							TextField("1000", text: $inputBalance)
								.keyboardType(.decimalPad)
						}
						.textFieldStyle(.roundedBorder)
					}

					VStack(alignment: .leading, spacing: 6) {
						Text("Days in billing cycle")
							.font(.headline)
						Picker("Days in billing cycle", selection: $selectedDays) {
							Text("29 Days").tag(29)
							Text("30 Days").tag(30)
							Text("31 Days").tag(31)
						}
						.pickerStyle(.segmented)
					}

					VStack(alignment: .leading, spacing: 6) {
						Text("APR")
							.font(.headline)
						HStack {
							TextField("From 0 to 29.99", text: $inputApr)
								.keyboardType(.decimalPad)
							Text("%")
								.foregroundStyle(.secondary)
						}
						.textFieldStyle(.roundedBorder)
					}

					Divider()

					VStack(alignment: .leading, spacing: 4) {
						Text("Interest this cycle")
							.font(.subheadline)
							.foregroundStyle(.secondary)
						Text(interest ?? 0, format: .currency(code: "USD"))
							.font(.largeTitle.bold())
							.contentTransition(.numericText())
						Text("Total to pay: \((balance ?? 0) + (interest ?? 0), format: .currency(code: "USD"))")
							.font(.subheadline)
							.foregroundStyle(.red)
					}
					.animation(.default, value: interest)
				}
				.card(tint: .accentColor)
			}
			.padding()
		}
		.navigationTitle("Credit Cards")
		.scrollDismissesKeyboard(.interactively)
		.background(Color("CustomYellow").opacity(accentColor))
	}
}

private extension View {
	func card(tint: Color? = nil) -> some View {
		padding()
			.frame(maxWidth: .infinity, alignment: .leading)
			.background(.regularMaterial, in: .rect(cornerRadius: 14))
			.background((tint ?? .clear).opacity(0.15), in: .rect(cornerRadius: 14))
	}
}

#Preview {
	NavigationStack {
		CreditCardView(accentColor: .constant(0.5))
	}
}
