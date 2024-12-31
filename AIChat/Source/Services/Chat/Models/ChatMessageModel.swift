//
//  ChatMessageModel.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import Foundation

struct ChatMessageModel: Identifiable {
	let id: String
	let chatId: String
	let content: String
	let authorId: String
	let seenByIds: [String]?
	let dateCreated: Date

	func hasBeenSeenBy(usedId: String) -> Bool {
		guard let seenByIds else { return false }
		return seenByIds.contains(usedId)
	}

	static var mock: ChatMessageModel { ChatMessageModel.mocks.first! }

	static var mocks: [ChatMessageModel] {
		let now = Date()
		return [
			ChatMessageModel(
				id: "1",
				chatId: "1",
				content: "Hello! How are you?",
				authorId: "user1",
				seenByIds: ["user2", "user3"],
				dateCreated: now.addingTimeInterval(minutes: -5)
			),
			ChatMessageModel(
				id: "2",
				chatId: "1",
				content: "I’m good, thank you! What about you?",
				authorId: "user2",
				seenByIds: ["user1", "user3"],
				dateCreated: now.addingTimeInterval(minutes: -3)
			),
			ChatMessageModel(
				id: "3",
				chatId: "2",
				content: "Don’t forget our meeting later.",
				authorId: "user3",
				seenByIds: ["user1"],
				dateCreated: now.addingTimeInterval(hours: -1)
			),
			ChatMessageModel(
				id: "4",
				chatId: "2",
				content: "Got it, see you then!",
				authorId: "user1",
				seenByIds: ["user3"],
				dateCreated: now.addingTimeInterval(hours: -1, minutes: -30)
			)
		]
	}
}
