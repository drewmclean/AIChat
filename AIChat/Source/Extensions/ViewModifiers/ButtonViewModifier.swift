//
//  ButtonViewModifier.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct HighlightButtonStyle: ButtonStyle {
	func makeBody(configuration: ButtonStyleConfiguration) -> some View {
		configuration.label
			.overlay {
				configuration.isPressed
					? Color.accentColor.opacity(0.4)
					: Color.accentColor.opacity(0.001)
			}
			.animation(.smooth, value: configuration.isPressed)
	}
}

struct PressableButtonStyle: ButtonStyle {
	func makeBody(configuration: ButtonStyleConfiguration) -> some View {
		configuration.label
			.scaleEffect(configuration.isPressed ? 0.9 : 1)
			.animation(.smooth, value: configuration.isPressed)
	}
}

enum ButtonStyleOption {
	case press, highlight, plain
}

extension View {

	@ViewBuilder
	func buttonWithStyle(_ option: ButtonStyleOption = .plain, action: @escaping () -> Void) -> some View {
		switch option {
		case .press:
			pressableButton(action: action)
		case .highlight:
			highlightButton(action: action)
		case .plain:
			plainButton(action: action)
		}
	}

	private func highlightButton(action: @escaping () -> Void) -> some View {
		Button {
			action()
		} label: {
			self
		}
		.buttonStyle(HighlightButtonStyle())
	}

	private func pressableButton(action: @escaping () -> Void) -> some View {
		Button {
			action()
		} label: {
			self
		}
		.buttonStyle(PressableButtonStyle())
	}

	private func plainButton(action: @escaping () -> Void) -> some View {
		Button {
			action()
		} label: {
			self
		}
		.buttonStyle(PlainButtonStyle())
	}

}

#Preview {
	VStack {
		Text("My Button")
			.padding()
			.frame(maxWidth: .infinity)
			.tapableBackground()
			.buttonWithStyle(.highlight, action: {

			})
			.padding()

		Text("My Button")
			.callToActionButtion()
			.buttonWithStyle(.press, action: {

			})

		Text("My Button")
			.callToActionButtion()
			.buttonWithStyle(.plain, action: {

			})

	}
}
