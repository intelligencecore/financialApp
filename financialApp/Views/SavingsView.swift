import SwiftUI

struct SavingsView: View {
	
	
	@State private var isJumping = false
	@State private var apy = ""
	@State private var startingBalance = ""
	@State private var years = ""
	@State private var monthlyDeposit = ""
	@State private var totalBalanceResult: Double = 0.0
	@FocusState private var isDonePressed: Bool
	
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
			.padding()
			
			
			Text("There are several types of Savings that one can have: ")
			
			VStack{
				
				
				
				Text("**Traditional savings accounts** are the standard options offered by brick-and-mortar neighborhood banks, making them highly convenient for in-person customer service and quick cash deposits. They allow you to easily link your savings to a checking account for fast transfers, keeping your cash highly accessible. However, the major downside is that they pay incredibly low interest rates, often yielding a near-zero 0.01% APY, which means your money will slowly lose purchasing power to inflation over time. This makes them ideal only for small cash buffers or money you expect to spend in the immediate future.")
			}
			.padding()
			.background{
				RoundedRectangle(cornerRadius: 14)
					.foregroundStyle(Color.green.opacity(0.9))
			}
			.padding()
			
			
			
			VStack {
				Text("High Yield Savings Accounts **(HYSA)** are a federally insured deposit account that pays a significantly higher interest rate, often 10 to 12 times the national average than a traditional savings account, allowing your money to grow much faster through compound interest.")
					.padding()
				
				Image("HYSA_illustration")
					.resizable()
					.scaledToFit()
					.frame(maxWidth: .infinity)
					.clipShape(RoundedRectangle(cornerRadius: 14))
			}
			.background{
				RoundedRectangle(cornerRadius: 14)
					.foregroundStyle(Color.green.opacity(0.9))
				
			}
			.padding()
			
			
			VStack {
				
				Text("Money Market Accounts (MMAs) act as a hybrid between a checking and savings account, offering competitive interest rates comparable to HYSAs alongside direct check-writing privileges and debit card access. They are best suited for large emergency funds or irregular, large expenses, but they typically require a much higher initial deposit or minimum daily balance to waive monthly fees.")
					.padding()
					.background{
						RoundedRectangle(cornerRadius: 14)
							.foregroundStyle(Color.green.opacity(0.9))
					}
				
			}
			.padding()
			
			
			VStack {
				Text("**Certificates of Deposit (CDs)** are time-deposit accounts where you agree to leave your money untouched for a fixed term—ranging from a few months to several years—in exchange for a guaranteed, fixed interest rate. They provide great security and locked-in returns when market rates are falling, but withdrawing your money before the maturity date will trigger a costly early withdrawal penalty.")
					.padding()
					.background{
						RoundedRectangle(cornerRadius: 14)
							.foregroundStyle(Color.green.opacity(0.9))
						
					}
				Image("certificateofdeposit")
					.resizable()
					.scaledToFit()
					.frame(maxWidth: .infinity)
					.clipShape(RoundedRectangle(cornerRadius: 14))
			}
			.padding()
			
			
			
			
			
			VStack(spacing: 20) {
				Text("Savings Calculator")
					.font(.title2)
					.bold()
					.foregroundColor(.white)
					.padding(.top, 10)
				
					// Grouping the inputs inside a Form-style container
				VStack(alignment: .leading, spacing: 16) {
					
						// Starting Balance Input
					VStack(alignment: .leading, spacing: 6) {
						Text("Starting Balance")
							.font(.subheadline)
							.bold()
							.foregroundColor(.white.opacity(0.9))
						TextField("$0.00", text: $startingBalance)
							.keyboardType(.decimalPad)
							.textFieldStyle(.roundedBorder)
					}
					
						// APY Input
					VStack(alignment: .leading, spacing: 6) {
						Text("APY (%)")
							.font(.subheadline)
							.bold()
							.foregroundColor(.white.opacity(0.9))
						TextField("0.0", text: $apy)
							.keyboardType(.decimalPad)
							.textFieldStyle(.roundedBorder)
					}
					
						// Monthly Deposit Input
					VStack(alignment: .leading, spacing: 6) {
						Text("Monthly Deposit")
							.font(.subheadline)
							.bold()
							.foregroundColor(.white.opacity(0.9))
						TextField("$0.00", text: $monthlyDeposit)
							.keyboardType(.decimalPad)
							.textFieldStyle(.roundedBorder)
					}
					
						// Years Input
					VStack(alignment: .leading, spacing: 6) {
						Text("Years to Grow")
							.font(.subheadline)
							.bold()
							.foregroundColor(.white.opacity(0.9))
						TextField("0", text: $years)
							.keyboardType(.numberPad)
							.textFieldStyle(.roundedBorder)
					}
				}
				.padding(.horizontal)
				
					// Result Display
				VStack(spacing: 3) {
					Text("Total Balance")
						.font(.caption)
						.bold()
						.foregroundColor(.gray)
					
					Text(totalBalanceResult, format: .currency(code: "USD"))
						.font(.system(.title2, design: .rounded))
						.bold()
						.foregroundColor(.black)
				}
				.frame(maxWidth: .infinity)
				.padding(.vertical, 12)
				.background(Color.white)
				.cornerRadius(8)
				.padding(.horizontal)
				
					// Calculate Button
				Button {
					calculate()
				} label: {
					Text("Calculate")
						.bold()
						.frame(maxWidth: .infinity)
				}
				.buttonStyle(GlassButtonStyle())
				.padding(.horizontal)
				.padding(.bottom, 10)
			}
			.frame(width: 375)
			.background {
				RoundedRectangle(cornerRadius: 16, style: .continuous)
					.fill(Color.green.gradient) // Uses a nice modern subtle gradient
			}
			.shadow(radius: 10)

			
				
			}
		.navigationTitle("Savings")
			.navigationBarTitleDisplayMode(.automatic)
			.background {
				Color.green.opacity(0.2)
					.ignoresSafeArea()
			}
			.toolbar {
				ToolbarItemGroup(placement: .keyboard) {
					Spacer()
					Button("Done") { isDonePressed = true }
				}
		}
	}

	
	// function connecting and validating the inputs from the Mathhelper function to calculate savings
	private func calculate() {
		guard let balance = Double(startingBalance),
			  let annualpy = Double(apy),
			  let monthlyDeposits = Double(monthlyDeposit),
			  let yearCount = Int(years)
				else {
			totalBalanceResult = -1.0
			return
		}
		
			// referencing the MathHelper file
		totalBalanceResult = MathHelper.savingsReturn(
			startingBalance: balance,
			apy: annualpy,
			years: yearCount,
			monthlyDeposit: monthlyDeposits
		)
	}
}

#Preview {
	SavingsView()
}
