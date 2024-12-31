//
//  ExploreView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct ExploreView: View {
	@State var featuredAvatars: [AvatarModel] = AvatarModel.mocks
	@State var categories: [CharacterOption] = CharacterOption.allCases
	@State var popularAvatars: [AvatarModel] = AvatarModel.mocks

	var body: some View {
		NavigationStack {
			List {
				featuredSection
				cetegoriesSection
				popularSection
			}
			.navigationTitle("Explore")
		}
	}

	private var featuredSection: some View {
		Section(header: Text("Featured Avatars")) {
			ZStack {
				CarouselView(items: featuredAvatars) { avatar in
					HeroCellView(
						title: avatar.name,
						subtitle: avatar.characterDescription,
						imageURL: avatar.profileImageURL
					)
					.buttonWithStyle(.plain) {

					}
				}
			}
			.removeListRowFormatting()
		}
	}

	private var cetegoriesSection: some View {
		Section(header: Text("Categories")) {
			ZStack {
				ScrollView(.horizontal) {
					HStack(spacing: 12) {
						ForEach(categories, id: \.self) { category in
							CategoryCellView(
								title: category.title,
								imageURL: Constants.randomImage
							)
							.buttonWithStyle(.plain) {

							}
						}
					}
				}
				.frame(height: 140)
				.scrollIndicators(.hidden)
				.scrollTargetLayout()
				.scrollTargetBehavior(.viewAligned)
			}
			.removeListRowFormatting()
		}
	}

	private var popularSection: some View {
		Section(header: Text("Popular Avatars")) {
			ForEach(popularAvatars, id: \.self) { avatar in
				CustomListCellView(
					title: avatar.name,
					subtitle: avatar.characterDescription,
					imageURL: avatar.profileImageURL
				)
				.buttonWithStyle(.highlight) {

				}
				.removeListRowFormatting()
			}
		}
	}
	
}

#Preview {
	ExploreView()
}
