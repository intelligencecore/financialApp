import Foundation



struct MathHelper{
	static func add(_ a: Int, _ b: Int) -> Int {
		return a + b
	}
	
	
		// function for the savings calculator (SavingsView)
	static func savingsCalculator(startingBalance: Double, apy: Double, years: Int, monthlyDeposit: Double) -> (finalBalance: Double, totalInterestAccrued: Double) {
		
			//validation check
		guard startingBalance >= 0.0, apy >= 0.0, years > 0, monthlyDeposit >= 0.0 else {return (-1.0, -1.0)}
		
		
			//convert annual metrics into monthly metrics
			// Convert annual metrics into monthly metrics
		let totalMonths = years * 12
		let monthlyRate = (apy / 100) / 12
		
			// Track the running balance and total interest across time
		var currentBalance = startingBalance
		var totalInterestAccrued = 0.0
		
			// Compound the interest
		for _ in 1...totalMonths {
				// Add the new monthly contribution first
			currentBalance += monthlyDeposit
			
				// Calculate interest earned on the new balance for this month
			let monthlyInterest = currentBalance * monthlyRate
			
				// Accumulate the interest separately
			totalInterestAccrued += monthlyInterest
			
				// Add the interest to the running balance
			currentBalance += monthlyInterest
		}
		
		
		return  (finalBalance: currentBalance, totalInterestAccrued: totalInterestAccrued)
	}
	
	
	
	
	
	
	
	 // Interest calculator function
	static func interestCalculator( balance: Double?,  annualInterestPercentage: Double?,  daysInCycle: Int?) -> Double {
		
		guard let balance, let annualInterestPercentage, let daysInCycle else {
			return -1
		}
		
			// the number has to be divided between 100 because is a percentage
		let aprDecimal = annualInterestPercentage / 100.0
		
		
		
			// i need to use DPR (Daily Periodic Rate)
		
			// first: the daily rate is the division of the APR between 365 of the year (rounded)
		let dailyPeriodicRate = aprDecimal / 365
		
		
		
			// Next i calculate the ADB (Average Daily Balance) - This is the average of the balances in the period that the user had. IE: 100 * 30 / 30 = 100 (This is assumed)
		
		let averageDailyBalance = balance * 30 / Double(daysInCycle)
		
		
			// The formula is ADB * Daily Rate * Days in cycle = interes charged
		
		let interestCharged = averageDailyBalance * dailyPeriodicRate * Double(daysInCycle)
		
		
			// return the result of the whole operation back
		return interestCharged
	}
	
	
	
	
	// static means that the function belongs to the struct itself and doesnt have to be instanciated.
	static func mortgageCalculator(housePrice: Double?, downPayment: Double?, interestRate: Double?, loanTermYears: Double?) -> Double{
		
		guard let housePrice,
			  let downPayment,
			  let interestRate,
			  let loanTermYears
				else {
			return -1.0
		}
		
	// I need to calculate the apr monthly for each year
		let principal = housePrice - downPayment
		let totalMonths = Double(loanTermYears * 12)
		let monthlyRate = (interestRate / 100) / 12
		
		
		
		// check when the interest rate is 0%
		if monthlyRate == 0 {
			return principal / totalMonths
		}
		
		
		
		
			// amortization formula
		let ratePow = pow(1 + monthlyRate, totalMonths)
		let monthlyPayment = principal * (monthlyRate * ratePow) / (ratePow - 1)
		
		return monthlyPayment
			
	}
	
	
	
	
	
	
	
	
}







