//
//  WelcomeView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
		NavigationStack {
			VStack { 
				Text("Welcome")
					.font(.title)
					.frame(maxHeight: .infinity)

				NavigationLink {
					OnboardingCompletedView()
				} label: {
					Text("Get Started")
						.callToActionButtion()
				}
			}
		}
    }
}

#Preview {
    WelcomeView()
}
