//
//  ChatsView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct ChatsView: View {
	
	@State private var chats: [ChatModel] = ChatModel.mocks
	
    var body: some View {
		NavigationStack {
			List {
				ForEach(chats) { chat in
					ChatRowCellViewBuilder(
						currentUserId: "",
						chat: chat,
						getAvatar: {
							try? await Task.sleep(for: .seconds(3))
							return .mock
						},
						getLastChatMessage: {
							try? await Task.sleep(for: .seconds(3))
							return .mock
						}
					)
					.buttonWithStyle(.highlight) {

					}
					.removeListRowFormatting()
				}
			}
			.navigationTitle("Chats")
		}
    }
}

#Preview {
    ChatsView()
}
