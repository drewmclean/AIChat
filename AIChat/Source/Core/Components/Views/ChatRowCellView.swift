//
//  ChatRowCellView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct ChatRowCellView: View {
	var imageURL: String? = Constants.randomImage
	var headline: String? = "Alpha"
	var subheadline: String? = "This is the last message in the chat."
	var hasNewChat: Bool = true

	private let imageSize: CGFloat = 50

	var body: some View {
		HStack {
			if let imageURL {
				ImageLoaderView(urlString: imageURL)
					.aspectRatio(1.0, contentMode: .fit)
					.frame(height: imageSize)
					.clipShape(Circle())
			} else {
				Circle()
					.fill(.gray.opacity(0.5))
					.frame(width: imageSize, height: imageSize)
					.cornerRadius(imageSize / 2)
			}

			VStack(alignment: .leading, spacing: 4) {
				if let headline {
					Text(headline)
						.font(.headline)
						.fontWeight(.semibold)
						.lineLimit(1)
				}
				if let subheadline {
					Text(subheadline)
						.font(.subheadline)
						.foregroundStyle(.secondary)
						.lineLimit(1)
				}
			}
			.frame(maxWidth: .infinity, alignment: .leading)

			if hasNewChat {
				Text("NEW")
					.font(.caption)
					.padding(.horizontal, 8)
					.padding(.vertical, 4)
					.foregroundStyle(.white)
					.background(.blue)
					.cornerRadius(6)
			}
		}
		.padding(.horizontal, 8)
		.padding(.vertical, 12)
		.background(Color(uiColor: .systemBackground))
	}
}

#Preview {
	ZStack {
		Color.gray

		List {
			ChatRowCellView()
				.removeListRowFormatting()
			ChatRowCellView(headline: nil)
				.removeListRowFormatting()
			ChatRowCellView(subheadline: nil)
				.removeListRowFormatting()
			ChatRowCellView(hasNewChat: false)
				.removeListRowFormatting()
		}

	}

}
