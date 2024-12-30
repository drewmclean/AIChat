//
//  OnboardingSelectColorView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct OnboardingColorView: View {

	@State private var selectedColor: Color?

	private let colors: [Color] = [
		.red, .blue, .green, .yellow, .purple, .orange, .mint, .indigo, .pink
	]

	private let gridColumns: [GridItem] = Array(repeating: .init(.flexible(minimum: 100, maximum: 100)), count: 3)

    var body: some View {
		ScrollView {
			colorGrid
			.padding(.horizontal, 24)
		}
		.safeAreaInset(edge: .bottom, alignment: .center, spacing: 16, content: {
			ZStack {
				if selectedColor != nil {
					ctaButton
					.transition(.move(edge: .bottom))
				}
			}
			.padding()
			.background(Color(uiColor: .systemBackground))
		})
		.animation(.bouncy(duration: 0.2), value: selectedColor)
    }

	private var colorGrid: some View {
		LazyVGrid(
			columns: gridColumns,
			alignment: .center,
			spacing: 16,
			pinnedViews: .sectionHeaders,
			content: {
				Section {
					ForEach(colors, id: \.self) { color in
						Circle()
							.fill(.accent)
							.overlay(content: {
								color
									.clipShape(Circle())
									.padding(selectedColor == color ? 8 : 0)
							})
							.onTapGesture {
								selectedColor = color
							}
					}
				} header: {
					Text("Select a profile color")
						.font(.headline)
						.frame(maxWidth: .infinity)
				}
			}
		)
	}

	private var ctaButton: some View {
		NavigationLink {
			OnboardingCompletedView()
		} label: {
			Text("Continue")
				.callToActionButtion()
		}
	}
}

#Preview {
    OnboardingColorView()
}
