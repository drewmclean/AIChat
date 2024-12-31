//
//  ExploreView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct ExploreView: View {
	let avatar: AvatarModel = .mock
	
	var body: some View {
		NavigationStack {
			
			HeroCellView(
				title: avatar.name,
				subtitle: avatar.characterDescription,
				imageURL: avatar.profileImageURL
			)
			.frame(height: 200)
			.navigationTitle("Explore")
		}
	}

}

#Preview {
	ExploreView()
}
