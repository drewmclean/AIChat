//
//  HeroCellView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct HeroCellView: View {
	var title: String? = "Hero Cell Title"
	var subtitle: String? = "Hero Cell Subtitle that will go here"
	var imageURL: String? = Constants.randomImage

    var body: some View {
		ZStack {
			Color(uiColor: .tertiarySystemBackground)

			if let imageURL {
				ImageLoaderView(urlString: imageURL)
			}
		}
		.overlay(alignment: .bottomLeading) {
			VStack(alignment: .leading, spacing: 4) {
				if let title {
					Text(title)
						.font(.headline)
						.fontWeight(.bold)
				}
				if let subtitle {
					Text(subtitle)
						.font(.subheadline)
				}
			}
			.foregroundStyle(.white)
			.padding(12)
			.frame(maxWidth: .infinity, alignment: .leading)
			.background(LinearGradient(
				colors: [.black.opacity(0), .black.opacity(0.3), .black.opacity(0.5), .black],
				startPoint: .top,
				endPoint: .bottom
			))
		}
		.cornerRadius(16)
    }
}

#Preview {
	ScrollView {
		HeroCellView()
			.frame(width: 300, height: 200)
		HeroCellView()
			.frame(width: 300, height: 400)
		HeroCellView()
			.frame(width: 200, height: 400)
		HeroCellView(imageURL: nil)
			.frame(width: 300, height: 200)
		HeroCellView(title: nil)
			.frame(width: 300, height: 200)
		HeroCellView(subtitle: nil)
			.frame(width: 300, height: 200)
	}
	.frame(maxWidth: .infinity)

}
