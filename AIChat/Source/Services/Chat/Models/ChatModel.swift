//
//  ChatModel.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import Foundation

struct ChatModel: Identifiable {
	let id: String
	let userId: String
	let avatarId: String
	let dateCreated: Date
	let dateModified: Date

	static var mock: Self { Self.mocks.first! }

	static var mocks: [Self] {
		let now = Date()

		return [
			ChatModel(
				id: "mockChat1",
				userId: "user1",
				avatarId: "avatar1",
				dateCreated: now,
				dateModified: now.addingTimeInterval(minutes: 10)
			),
			ChatModel(
				id: "mockChat2",
				userId: "user2",
				avatarId: "avatar2",
				dateCreated: now.addingTimeInterval(hours: -1),
				dateModified: now.addingTimeInterval(hours: -1, minutes: 30)
			),
			ChatModel(
				id: "mockChat3",
				userId: "user3",
				avatarId: "avatar3",
				dateCreated: now.addingTimeInterval(days: -1),
				dateModified: now.addingTimeInterval(days: -1, hours: 2)
			),
			ChatModel(
				id: "mockChat4",
				userId: "user4",
				avatarId: "avatar4",
				dateCreated: now.addingTimeInterval(days: -2, hours: -5),
				dateModified: now.addingTimeInterval(days: -2, hours: -4, minutes: -30)
			)
		]
	}
}
