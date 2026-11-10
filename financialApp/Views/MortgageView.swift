import SwiftUI

struct MortgageView: View {
	private enum Field { case homeValue, downPayment, interestRate }

	@State private var homeValue = ""
	@State private var downPayment = ""
	@State private var interestRate = ""
	@State private var termYears = 30
	@State private var monthlyPayment: Double = 0
	@State private var errorMessage: String?
	@FocusState private var focusedField: Field?

	private let cardColor = Color(red: 0.71, green: 0.64, blue: 0.40)

	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 20) {
				Text("What is a mortgage?")
					.font(.title2.bold())

				Text("A mortgage is a specialized loan used to purchase or maintain a home, land, or other types of real estate, where the property itself serves as collateral. The borrower agrees to pay the lender back over a set period, typically 15 or 30 years, through regular payments divided into principal and interest. If the borrower fails to make these payments, the lender holds the legal right to seize the property through a process known as foreclosure.")
					.font(.callout)
					.foregroundStyle(.secondary)
					.lineSpacing(4)
					.padding()
					.background(.black.opacity(0.05), in: .rect(cornerRadius: 14, style: .continuous))

				Text("Check your rate and payment below")
					.font(.headline)

				calculatorCard

				Text("Rates go up and down, so always check your own.")
					.font(.footnote)
					.foregroundStyle(.secondary)
					.frame(maxWidth: .infinity)
			}
			.padding()
		}
		.background(Color("CustomBeige").ignoresSafeArea())
		.navigationTitle("Mortgage")
		.toolbar {
			ToolbarItemGroup(placement: .keyboard) {
				Spacer()
				Button("Done") { focusedField = nil }
			}
		}
	}

	private var calculatorCard: some View {
		VStack(spacing: 14) {
			Text("Mortgage Calculator")
				.font(.headline)

			inputField("Home Value", prompt: "e.g. 400,000", text: $homeValue, field: .homeValue)
			inputField("Down Payment", prompt: "e.g. 25,000", text: $downPayment, field: .downPayment)
			inputField("Interest Rate (%)", prompt: "e.g. 6.5", text: $interestRate, field: .interestRate)

			Picker("Loan Term", selection: $termYears) {
				ForEach([15, 20, 30], id: \.self) { years in
					Text("\(years) yrs").tag(years)
				}
			}
			.pickerStyle(.segmented)

			VStack(spacing: 4) {
				Text("Monthly Payment")
					.font(.caption.bold())
					.foregroundStyle(.secondary)
				Text(monthlyPayment, format: .currency(code: "USD"))
					.font(.system(size: 34, weight: .bold, design: .rounded))
					.monospacedDigit()
					.contentTransition(.numericText())
				if let errorMessage {
					Text(errorMessage)
						.font(.caption)
						.foregroundStyle(.red)
				}
			}
			.frame(maxWidth: .infinity)
			.padding(.vertical, 12)
			.background(.background, in: .rect(cornerRadius: 12, style: .continuous))

			HStack(spacing: 12) {
				Button("Calculate", action: calculate)
					.buttonStyle(.glassProminent)
					.frame(maxWidth: .infinity)
				Button("Reset", role: .destructive, action: reset)
					.buttonStyle(.glass)
			}
		}
		.padding(20)
		.background(
			RoundedRectangle(cornerRadius: 16, style: .continuous)
				.fill(cardColor)
				.shadow(color: .black.opacity(0.15), radius: 12, y: 6)
		)
	}

	private func inputField(_ title: String, prompt: String, text: Binding<String>, field: Field) -> some View {
		VStack(alignment: .leading, spacing: 6) {
			Text(title)
				.font(.subheadline)
				.foregroundStyle(.secondary)
			TextField(prompt, text: text)
				.keyboardType(.decimalPad)
				.textFieldStyle(.roundedBorder)
				.focused($focusedField, equals: field)
		}
	}

	private func number(from text: String) -> Double? {
		let decimal = Locale.current.decimalSeparator ?? "."
		let grouping = Locale.current.groupingSeparator ?? ","
		let cleaned = text
			.replacingOccurrences(of: grouping, with: "")
			.replacingOccurrences(of: decimal, with: ".")
			.filter { ("0"..."9").contains($0) || $0 == "." }
		return Double(cleaned)
	}

	private func calculate() {
		focusedField = nil
		guard let price = number(from: homeValue), price > 0 else {
			return fail("Enter a home value.")
		}
		let down = downPayment.isEmpty ? 0 : (number(from: downPayment) ?? -1)
		guard down >= 0, down < price else {
			return fail("Down payment must be less than the home value.")
		}
		guard let rate = number(from: interestRate), rate >= 0, rate < 100 else {
			return fail("Enter an interest rate between 0 and 100.")
		}
		let payment = MathHelper.mortgageCalculator(
			housePrice: price,
			downPayment: down,
			interestRate: rate,
			loanTermYears: Double(termYears)
		)
		withAnimation {
			monthlyPayment = payment
			errorMessage = nil
		}
	}

	private func fail(_ message: String) {
		monthlyPayment = 0
		errorMessage = message
	}

	private func reset() {
		homeValue = ""
		downPayment = ""
		interestRate = ""
		termYears = 30
		focusedField = nil
		withAnimation {
			monthlyPayment = 0
			errorMessage = nil
		}
	}
}

#Preview {
	NavigationStack {
		MortgageView()
	}
}
