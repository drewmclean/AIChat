//
//  Date+Extensions.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import Foundation

extension Date {
	func addingTimeInterval(days: Int = 0, hours: Int = 0, minutes: Int = 0) -> Date {
		let totalSeconds = TimeInterval((days * 24 * 60 * 60) + (hours * 60 * 60) + (minutes * 60))
		return self.addingTimeInterval(totalSeconds)
	}
}
