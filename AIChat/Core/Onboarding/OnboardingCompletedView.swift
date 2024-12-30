//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct OnboardingCompletedView: View {
	@Environment(AppState.self) private var root

	@State private var isCompletingSetup: Bool = false
	
	let selectedColor: Color

    var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			Text("Setup Complete")
				.font(.largeTitle)
				.fontWeight(.bold)
				.foregroundColor(selectedColor)

			Text("You can now start chatting with your friends!")
				.font(.title)
				.fontWeight(.medium)
				.foregroundStyle(.secondary)
		}
		.frame(maxHeight: .infinity)
		.safeAreaInset(edge: .bottom) {
			ctaButton
		}
		.padding()
		.toolbar(.hidden)
    }

	private var ctaButton: some View {
		Button {
			onFinishButtonPresed()
		} label: {
			ZStack {
				if isCompletingSetup {
					ProgressView()
						.tint(.white)
				} else {
					Text("Finish")
				}
			}
			.disabled(isCompletingSetup)
			.callToActionButtion()
		}
	}

	private func onFinishButtonPresed() {
		isCompletingSetup = true
		Task {
//			try await saveUserProfile(color: selectedColor)
			try await Task.sleep(for: .seconds(1))
			isCompletingSetup = false

			root.updateViewState(showTabBar: true)
		}
	}

}

#Preview {
	OnboardingCompletedView(selectedColor: .cyan)
		.environment(AppState())
}
