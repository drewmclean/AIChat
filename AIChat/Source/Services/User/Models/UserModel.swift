//
//  UserModel.swift
//  AIChat
//
//  Created by Andrew McLean on 12/31/24.
//

import Foundation
import SwiftUI

struct UserModel {
	let userId: String
	let dateCreated: Date?
	let didCompleteOnboarding: Bool?
	let profileColor: String?
	let username: String

	var profileColorValue: Color {
		guard let profileColor else { return .accent }
		return Color(hex: profileColor)
	}

	init(
		userId: String,
		dateCreated: Date? = nil,
		didCompleteOnboarding: Bool? = nil,
		profileColor: String? = nil,
		username: String
	) {
		self.userId = userId
		self.dateCreated = dateCreated
		self.didCompleteOnboarding = didCompleteOnboarding
		self.profileColor = profileColor
		self.username = username
	}

	static var mock: Self { Self.mocks.first! }

	static var mocks: [Self] {
		let now = Date()
		return [
			UserModel(
				userId: "user1",
				dateCreated: now.addingTimeInterval(days: -30),
				didCompleteOnboarding: true,
				profileColor: "#33FF57",
				username: "JohnDoe"
			),
			UserModel(
				userId: "user2",
				dateCreated: now.addingTimeInterval(days: -15),
				didCompleteOnboarding: false,
				profileColor: "#33FF57",
				username: "JaneSmith"
			),
			UserModel(
				userId: "user3",
				dateCreated: now.addingTimeInterval(days: -7),
				didCompleteOnboarding: true,
				profileColor: "#3357FF",
				username: "MikeJones"
			),
			UserModel(
				userId: "user4",
				dateCreated: nil, // New user, no date yet
				didCompleteOnboarding: false,
				profileColor: nil, // No color set
				username: "NewUser"
			)
		]
	}
	
}
