//
//  CustomListCellView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct CustomListCellView: View {
	var title: String? = "Alien"
	var subtitle: String?
	var imageURL: String? = Constants.randomImage

	private let imageSize: CGFloat = 60

    var body: some View {
        HStack {
			if let imageURL {
				ImageLoaderView(urlString: imageURL)
					.aspectRatio(1.0, contentMode: .fit)
					.frame(height: imageSize)
					.cornerRadius(16)
			} else {
				Rectangle()
					.fill(.gray.opacity(0.5))
					.frame(width: imageSize, height: imageSize)
					.cornerRadius(16)
			}

			VStack(alignment: .leading, spacing: 4) {
				if let title {
					Text(title)
						.font(.headline)
						.fontWeight(.semibold)
						.lineLimit(1)
				}
				if let subtitle {
					Text(subtitle)
						.font(.subheadline)
						.lineLimit(2)
				}
			}
			.frame(maxWidth: .infinity, alignment: .leading)
		}
		.padding(12)
		.background(Color(uiColor: .systemBackground))
    }
}

#Preview {
	ZStack {
		Color.gray.opacity(0.5)
			.ignoresSafeArea()

		VStack {
			CustomListCellView(title: "Foo", imageURL: nil)
			CustomListCellView(title: "Foo", subtitle: nil, imageURL: nil)

			CustomListCellView()
		}
	}

}
