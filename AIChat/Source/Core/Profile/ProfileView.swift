//
//  ProfileView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct ProfileView: View {
	@State private var currentUser: UserModel? = .mock
	@State private var avatars: [AvatarModel] = []
	@State private var showSettingsView: Bool = false
	@State private var showCreateAvatarView: Bool = false
	@State private var isLoading: Bool = false

    var body: some View {
		NavigationStack {
			List {
				myInfoSection
				avatarsSection
			}
			.navigationTitle("Profile")
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					settingsButton
				}
			}
		}
		.sheet(isPresented: $showSettingsView) {
			SettingsView()
		}
		.sheet(isPresented: $showCreateAvatarView) {
			Text("Create Avatar")
		}
		.task {
			await loadData()
		}
    }

	private var myInfoSection: some View {
		Section {
			ZStack {
				Circle()
					.fill(currentUser?.profileColorValue ?? .accent)
			}
			.frame(width: 100, height: 100)
			.frame(maxWidth: .infinity)
			.removeListRowFormatting()
		}
	}

	private var avatarsSection: some View {
		Section {
			if avatars.isEmpty {
				Group {
					if isLoading {
						ProgressView()
					} else {
						Text("Click + to create an avatar.")
					}
				}
				.padding(.vertical, 200)

				.font(.body)
				.foregroundStyle(.secondary)
				.frame(maxWidth: .infinity)
				.removeListRowFormatting()
			} else {
				ForEach(avatars, id: \.self) { avatar in
					CustomListCellView(
						title: avatar.name,
						imageURL: avatar.profileImageURL
					)
					.buttonWithStyle(.highlight) {

					}
					.removeListRowFormatting()
				}
				.onDelete { indexSet in
					onDeleteAvatarTap(indexSet)
				}
			}
		} header: {
			HStack(spacing: 0) {
				Text("My Avatars")

				Spacer()

				Image(systemName: "plus.circle.fill")
					.font(.title)
					.foregroundStyle(.accent)
					.buttonWithStyle {
						onNewAvatarButtonTap()
					}
					.padding(.vertical, 6)
			}
			.removeListRowFormatting()
		}
	}

	private var settingsButton: some View {
		Image(systemName: "gear")
			.font(.headline)
			.foregroundStyle(.accent)
			.buttonWithStyle {
				onSettingsButtonTap()
			}
	}

	private func onSettingsButtonTap() {
		showSettingsView = true
	}

	private func onNewAvatarButtonTap() {
		showCreateAvatarView = true
	}

	private func onDeleteAvatarTap(_ indexSet: IndexSet) {
		guard let index = indexSet.first else { return }

		avatars.remove(at: index)
	}

	private func loadData() async {
		isLoading = true

		try? await Task.sleep(for: .seconds(3))
//		let avatars = try await API.avatars.first(limit: 10)
		
		self.avatars = AvatarModel.mocks
		
		isLoading = false
	}
}

#Preview {
	ProfileView()
		.environment(AppState())
}
