
import XCTest
@testable import financialApp

final class financialAppTests: XCTestCase {
	
		//arrange, act, assert!
	
		// testing both calculators on the SavingsView() and the TaxesView()
	
	
	
		
	func testZeroYearsIsRejected() {
		let result = MathHelper.savingsCalculator(startingBalance: 1000, apy: 0.05, years: 0, monthlyDeposit: 0)
		XCTAssertEqual(result, -1.0)
	}
	
}
