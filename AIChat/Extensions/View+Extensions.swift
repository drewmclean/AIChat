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
}
