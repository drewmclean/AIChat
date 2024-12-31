//
//  View+Extensions.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

extension View {
	func callToActionButtion() -> some View {
		self
			.font(.headline)
			.foregroundStyle(.white)
			.frame(maxWidth: .infinity)
			.frame(height: 50)
			.background(.accent)
			.cornerRadius(16)
			.padding()
	}

	func tapableBackground() -> some View {
		self
			.background(Color.black.opacity(0.001))
	}

	func removeListRowFormatting() -> some View {
		self
		.listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
		.listRowBackground(Color.clear)
	}

	func textGradientBackground() -> some View {
		self
			.background(LinearGradient(
				colors: [.black.opacity(0), .black.opacity(0.3), .black.opacity(0.5), .black],
				startPoint: .top,
				endPoint: .bottom
			))
	}

}
