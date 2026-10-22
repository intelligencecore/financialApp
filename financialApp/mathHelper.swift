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
}








