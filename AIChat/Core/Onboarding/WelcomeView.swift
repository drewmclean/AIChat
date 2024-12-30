//
//  WelcomeView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct WelcomeView: View {
	@State var imagePath: String = Constants.randomImage

    var body: some View {
		NavigationStack {
			VStack(spacing: 8) {
				ImageLoaderView(urlString: imagePath)

				VStack(spacing: 8) {
					titleSection
					.padding(.top, 24)

					ctaButtons
					policyLinks
				}
				.padding()
			}
			.ignoresSafeArea()
		}
    }

	private var titleSection: some View {
		VStack {
			Text("AI Chat 🤙")
				.font(.largeTitle)
				.fontWeight(.semibold)

			Text("YouTube @ SwiftfulThinking")
				.font(.caption)
				.foregroundStyle(.secondary)
		}
	}

	private var ctaButtons: some View {
		VStack {
			NavigationLink {
				OnboardingIntroView()
			} label: {
				Text("Get Started")
					.callToActionButtion()
			}

			Text("Already have an account? Sign In.")
				.font(.callout)
				.foregroundColor(.black)
				.underline()
				.padding(8)
				.tapableBackground()
				.onTapGesture {

				}
		}
	}

	private var policyLinks: some View {
		HStack {
			Link("Terms of Service", destination: URL(string: Constants.termsOfServiceURL)!)
				.foregroundColor(.accent)

			Text("\u{00B7}")

			Link("Privacy Policy", destination: URL(string: Constants.privacyPolicyURL)!)
				.foregroundColor(.accent)

		}
	}
}

#Preview {
    WelcomeView()
}
