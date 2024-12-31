//
//  CategoryCellView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct CategoryCellView: View {
	var title: String = "Aliens"
	var imageURL: String = Constants.randomImage
	var font: Font = .title2
	var cornerRadius: CGFloat = 16
	
	var body: some View {
		ImageLoaderView(urlString: imageURL)
		.aspectRatio(1.0, contentMode: .fit)
		.overlay(alignment: .bottomLeading) {
			Text(title)
				.font(.headline)
				.fontWeight(.semibold)
			.foregroundStyle(.white)
			.padding(16)
			.frame(maxWidth: .infinity, alignment: .leading)
			.textGradientBackground()
		}
		.cornerRadius(16)
	}
}

#Preview {
	VStack {
		CategoryCellView()
			.frame(width: 150)
		CategoryCellView(title: "Space")
			.frame(width: 300)
	}
	.frame(maxWidth: .infinity)
}
