//
//  AvatarModel.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import Foundation

struct AvatarModel: Hashable {
	let avatarId: String
	let name: String?
	let characterOption: CharacterOption?
	let characterAction: CharacterAction?
	let characterLocation: CharacterLocation?
	let profileImageURL: String?
	let autherId: String?
	let dateCreated: Date?

	var characterDescription: String? {
		return AvatarDescriptionBuilder(avatar: self).characterDescription
	}

	init(
		avatarId: String,
		name: String? = nil,
		characterOption: CharacterOption? = nil,
		characterAction: CharacterAction? = nil,
		characterLocation: CharacterLocation? = nil,
		profileImageURL: String? = Constants.randomImage,
		autherId: String? = nil,
		dateCreated: Date? = nil
	) {
		self.avatarId = avatarId
		self.name = name
		self.characterOption = characterOption
		self.characterAction = characterAction
		self.characterLocation = characterLocation
		self.profileImageURL = profileImageURL
		self.autherId = autherId
		self.dateCreated = dateCreated
	}

	static var mock: AvatarModel { AvatarModel.mocks.first! }

	static var mocks: [AvatarModel] {
		[
			AvatarModel(
				avatarId: UUID().uuidString,
				name: "Alpha",
				characterOption: .man,
				characterAction: .smiling,
				characterLocation: .home
			),
			AvatarModel(
				avatarId: UUID().uuidString,
				name: "Delta",
				characterOption: .woman,
				characterAction: .smiling,
				characterLocation: .home
			),
			AvatarModel(
				avatarId: UUID().uuidString,
				name: "Beta",
				characterOption: .man,
				characterAction: .eating,
				characterLocation: .restaurant
			),
			AvatarModel(
				avatarId: UUID().uuidString,
				name: "Gamma",
				characterOption: .alien,
				characterAction: .crying,
				characterLocation: .school
			),
			AvatarModel(
				avatarId: UUID().uuidString,
				name: "Theta",
				characterOption: .dog,
				characterAction: .sitting,
				characterLocation: .park
			)
		]
	}
}

struct AvatarDescriptionBuilder {
	let characterOption: CharacterOption
	let characterAction: CharacterAction
	let characterLocation: CharacterLocation

	init(avatar: AvatarModel) {
		self.characterOption = avatar.characterOption ?? .default
		self.characterAction = avatar.characterAction ?? .default
		self.characterLocation = avatar.characterLocation ?? .default
	}

	init(characterOption: CharacterOption, characterAction: CharacterAction, characterLocation: CharacterLocation) {
		self.characterOption = characterOption
		self.characterAction = characterAction
		self.characterLocation = characterLocation
	}

	var characterDescription: String {
		"A \(characterOption) that is \(characterAction) in the \(characterLocation)"
	}
}

enum CharacterOption: String {
	case man, woman, alien, dog, cat

	static let `default`: Self = .alien
}

enum CharacterAction: String {
	case smiling, sitting, eating, drinking, walking, shopping, studying, sleeping, relaxing, crying, working

	static let `default`: Self = .smiling
}

enum CharacterLocation: String {
	case home, work, school, library, park, restaurant, mall, museum, city, desert, mountains, forest, space

	static let `default`: Self = .desert
}
