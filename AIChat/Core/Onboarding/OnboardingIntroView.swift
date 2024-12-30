//
//  OnboardingIntroView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct OnboardingIntroView: View {
    var body: some View {
		VStack {
			Group {
				Text("Make your own ")
				+
				Text("avatars ")
					.foregroundStyle(.accent)
					.fontWeight(.semibold)
				+
				Text("and chat with them.\n\nHave ")
				+
				Text("real conversations ")
					.foregroundStyle(.accent)
					.fontWeight(.semibold)
				+
				Text("with AI generated responses.")
			}
			.baselineOffset(6)
			.frame(maxHeight: .infinity)
			.padding(24)

			NavigationLink {
				OnboardingColorView()
			} label: {
				Text("Continue")
					.callToActionButtion()
			}
		}
		.padding()
		.font(.title3)
		.toolbar(.hidden)
    }
}

#Preview {
    OnboardingIntroView()
}
