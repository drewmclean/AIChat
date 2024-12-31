//
//  CarouselView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct CarouselView<Content: View, Item: Hashable>: View {

	var items: [Item]

	@ViewBuilder var content: (Item) -> Content

	@State var selection: AvatarModel?

    var body: some View {
		VStack(spacing: 12) {
			ScrollView(.horizontal) {
				LazyHStack(spacing: 0) {
					ForEach(items, id: \.self) { item in
						content(item)
						.scrollTransition(.interactive.threshold(.visible(0.95)), transition: { content, phase in
							content
								.scaleEffect(phase.isIdentity ? 1 : 0.9)
						})
						.containerRelativeFrame(.horizontal, alignment: .center)
						.id(item)
					}
				}
			}
			.frame(height: 200)
			.scrollIndicators(.hidden)
			.scrollTargetLayout()
			.scrollTargetBehavior(.paging)
			.scrollPosition(id: $selection)
			.onAppear {
				resetSelectionIfNeeded()
			}
			.onChange(of: items.count) { _, _ in
				resetSelectionIfNeeded()
			}
			HStack {
				ForEach(items, id: \.self) { item in
					Circle()
						.fill(item == selection ? .accent : .secondary.opacity(0.5))
						.frame(width: 8, height: 8)
				}
			}
			.animation(.linear, value: selection)
		}
    }

	private func resetSelectionIfNeeded() {
		if selection == nil || selection == items.last {
			selection = items.first
		}
	}

}

#Preview {
	CarouselView(items: AvatarModel.mocks, content: { item in
		HeroCellView(
			title: item.name,
			subtitle: item.characterDescription,
			imageURL: item.profileImageURL
		)
	})
	.padding()
}
