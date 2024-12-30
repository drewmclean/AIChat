//
//  ImageLoaderView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
	let urlString: String
	let resizingMode: ContentMode = .fill

    var body: some View {
		Rectangle()
			.opacity(1.0)
			.overlay {
				WebImage(url: .init(string: urlString))
					.resizable()
					.indicator(.activity)
					.aspectRatio(contentMode: resizingMode)
					.allowsHitTesting(false)
			}
			.clipped()
    }

}

#Preview {
	ImageLoaderView(urlString: Constants.randomImage)
		.frame(width: 300, height: 200)
}
