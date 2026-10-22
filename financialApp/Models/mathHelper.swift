import Foundation



struct MathHelper{
	static func add(_ a: Int, _ b: Int) -> Int {
		return a + b
	}
	
	
	static func savingsReturn(startingBalance: Double, apy: Double, years: Int, monthlyDeposit: Double) -> Double {
			// valudation of the values prior to their use
			// this function is not working properly
		guard startingBalance >= 0.0, apy >= 0.0, years > 0, monthlyDeposit >= 0.0 else {return -1}
		
		let totalMonths = years * 12
		
		let monthlyRate = pow(1.0 + apy, 1.0 / 12.0) - 1.0
		
		var totalBalance = startingBalance
		
		for _ in 1...totalMonths {
				// Calculate interest earned on current balance for the month
			let interestEarned = totalBalance * monthlyRate
			
				// Add interest and the monthly contribution to the total
			totalBalance += interestEarned + monthlyDeposit
		}
		return totalBalance
	}
	
	
	
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
	
	
	
	
	
	
}







