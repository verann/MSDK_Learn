//
//  GhostButton.swift
//  MSD_learning
//
//  Created by Верещагина Анастасия Александровна on 11.09.2026.
//

import UIKit

final class GhostButton: UIButton {

	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}

	private func setup() {
		setTitleColor(.white, for: .normal)
		titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
		backgroundColor = .clear
		layer.cornerRadius = 26          
		layer.borderWidth = 1
		layer.borderColor = UIColor.white.cgColor
	}
}
