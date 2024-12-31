//
//  Color+Extensions.swift
//  AIChat
//
//  Created by Andrew McLean on 12/31/24.
//

import Foundation
import SwiftUI

extension Color {
	/// Initialize a Color using a hex string.
	/// - Parameter hex: The hex string, e.g., "#RRGGBB" or "RRGGBB".
	init(hex: String) {
		let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
		var int: UInt64 = 0
		Scanner(string: hex).scanHexInt64(&int)

		let red, green, blue: Double
		if hex.count == 6 {
			red = Double((int >> 16) & 0xFF) / 255
			green = Double((int >> 8) & 0xFF) / 255
			blue = Double(int & 0xFF) / 255
		} else {
			red = 0
			green = 0
			blue = 0
		}

		self.init(red: red, green: green, blue: blue)
	}

	/// Convert a Color back to a hex string.
	/// - Returns: A hex string representation of the color, e.g., "#RRGGBB".
	func toHex() -> String? {
		let uiColor = UIColor(self)
		var red: CGFloat = 0
		var green: CGFloat = 0
		var blue: CGFloat = 0
		var alpha: CGFloat = 0

		uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

		guard alpha == 1 else { return nil } // Return nil if color is not opaque

		return String(format: "#%02X%02X%02X", Int(red * 255), Int(green * 255), Int(blue * 255))
	}
}
