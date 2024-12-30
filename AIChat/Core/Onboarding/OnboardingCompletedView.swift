//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct OnboardingCompletedView: View {
	@Environment(AppState.self) private var root

    var body: some View {
		VStack {
			Text("Onboarding Complete")
				.font(.title)
				.frame(maxHeight: .infinity)

			Button {
				root.updateViewState(showTabBar: true)
			} label: {
				Text("Finish")
					.callToActionButtion()
			}
		}
    }

}

#Preview {
    OnboardingCompletedView()
		.environment(AppState())
}
