//
//  ChatRowCellViewBuilder.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
	var currentUserId: String? = ""
	var chat: ChatModel = .mocks.first!
	var getAvatar: () async -> AvatarModel?
	var getLastChatMessage: () async -> ChatMessageModel?

	@State private var avatar: AvatarModel?
	@State private var lastChatMessage: ChatMessageModel?

	@State private var didLoadAvatar: Bool = false
	@State private var didLoadLastChatMessage: Bool = false

	private var isLoading: Bool {
		!didLoadAvatar || !didLoadLastChatMessage
	}

	private var headline: String? {
		if isLoading {
			return "xxxx xxxx"
		}
		return avatar?.name
	}

	private var subheadline: String {
		if isLoading {
			return "xxxx xxxx xxxx xxxx"
		}
		return lastChatMessage?.content ?? "Error"
	}

	private var hasNewChat: Bool {
		guard
			let seenByIds = lastChatMessage?.seenByIds,
			let currentUserId
		else { return false }

		return seenByIds.contains(currentUserId)
	}

    var body: some View {
		ChatRowCellView(
			imageURL: avatar?.profileImageURL,
			headline: headline,
			subheadline: subheadline,
			hasNewChat: hasNewChat
		)
		.redacted(reason: isLoading ? .placeholder : [])
		.task {
			avatar = await getAvatar()
			didLoadAvatar = true
		}
		.task {
			lastChatMessage = await getLastChatMessage()
			didLoadLastChatMessage = true
		}
    }

}

#Preview {
	VStack {
		ChatRowCellViewBuilder(getAvatar: {
			try? await Task.sleep(for: .seconds(3))
			return .mock
		}, getLastChatMessage: {
			try? await Task.sleep(for: .seconds(3))
			return .mock
		})

		ChatRowCellViewBuilder(getAvatar: {
			.mock
		}, getLastChatMessage: {
			.mock
		})

		ChatRowCellViewBuilder(getAvatar: {
			nil
		}, getLastChatMessage: {
			nil
		})
	}
}
