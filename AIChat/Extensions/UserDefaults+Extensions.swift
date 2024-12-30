//
//  Keys.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//


extension UserDefaults {
	private struct Keys {
		static let showTabBarView: String = "showTabBarView"
	}

	static var showTabBarView: Bool {
		get { standard.bool(forKey: Keys.showTabBarView) }
		set { standard.set(newValue, forKey: Keys.showTabBarView) }
	}

}
