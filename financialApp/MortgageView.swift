//
//  MortgageView.swift
//  financialApp
//
//  Created by Richier on 9/25/26.
//

import SwiftUI

struct MortgageView: View {
	@State private var homeValue = ""
	@State private var downPayment = ""
	@State private var loanAmount = ""
	@State private var interestRate = ""
	@State private var fieldColor = Color.white
	@FocusState private var isDone: Bool
	
	var body: some View {
		ScrollView {
			VStack(spacing: 20) {
				
				Text("What is that?")
					.font(.title3)
					.fontWeight(.heavy)
					.frame(maxWidth: .infinity, alignment: .leading)
				
				Text(
					"A mortgage is a specialized loan used to purchase or maintain a home, land, or other types of real estate, where the property itself serves as collateral. The borrower agrees to pay the lender back over a set period, typically 15 or 30 years, through regular payments divided into principal and interest. If the borrower fails to make these payments, the lender holds the legal right to seize the property through a process known as foreclosure."
				)
				.lineSpacing(5)
				.padding()
				.background(
					RoundedRectangle(cornerRadius: 14, style: .continuous)
						.fill(Color.black.opacity(0.06))
				)
				
				Text("Check your rate and payment below:")
					.bold()
				
				VStack(spacing: 16) {
					Text("Mortgage Calculator")
						.font(.headline)
					
					
					VStack{
					TextField("Home Value", text: $homeValue)
						.keyboardType(.decimalPad)
						.focused($isDone)
						.padding()
						.background(
							RoundedRectangle(cornerRadius: 8).fill(fieldColor)
						)
				}
				.toolbar{
					ToolbarItemGroup(placement: .keyboard) {
						Spacer() // Pushes the Done button to the right
						Button("Done") {
							isDone = false // Closes the keyboard
						}
						
					}
				}
					
					
					
					VStack{
						TextField("Down Payment", text: $downPayment)
							.keyboardType(.decimalPad)
							.focused($isDone)
							.padding()
							.background(
								RoundedRectangle(cornerRadius: 8).fill(fieldColor)
							)
					}
					.toolbar{
						ToolbarItemGroup(placement: .keyboard) {
							Spacer() // Pushes the Done button to the right
							Button("Done") {
								isDone = false // Closes the keyboard
							}
							
						}
					}
					
					
					
					
					
					
					VStack{
						TextField("Loan Amount", text: $loanAmount)
							.keyboardType(.decimalPad)
							.focused($isDone)
							.padding()
							.background(
								RoundedRectangle(cornerRadius: 8).fill(fieldColor)
							)
					}
					.toolbar{
						ToolbarItemGroup(placement: .keyboard) {
							Spacer() // Pushes the Done button to the right
							Button("Done") {
								isDone = false // Closes the keyboard
							}
							
						}
					}
					
					VStack {
						TextField("Interest Rate", text: $interestRate)
							.keyboardType(.decimalPad)
							.focused($isDone)
							.padding()
							.background(
								RoundedRectangle(cornerRadius: 8).fill(fieldColor)
							)
					}
					.padding()
					.background(
						RoundedRectangle(cornerRadius: 10)
							.fill(Color.gray.opacity(0.3))
					)
					
					
					Button {
						homeValue = ""
						downPayment = ""
						loanAmount = ""
						interestRate = ""
					} label: {
						Text("Reset")
					}
					.buttonStyle(GlassButtonStyle())
				}
				.padding()
			}
			.navigationTitle("Mortgage")
			.navigationBarTitleDisplayMode(.automatic)
			.background(Color("CustomBeige").ignoresSafeArea())
		}
	}
}

#Preview {
	MortgageView()
}

// REMARK: note to self: make the color of the field to be changed by the user
