//
//  AppState.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import Foundation

@Observable
class AppState {

	private(set) var showTabBar: Bool {
		didSet {
			UserDefaults.showTabBarView = showTabBar
		}
	}

	init(
		showTabBar: Bool = UserDefaults.showTabBarView
	) {
		self.showTabBar = showTabBar
	}

	func updateViewState(showTabBar: Bool) {
		self.showTabBar = showTabBar
	}
}
