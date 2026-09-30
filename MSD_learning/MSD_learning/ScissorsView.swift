//
//  ScissorsView.swift
//  MSD_learning
//
//  Created by Верещагина Анастасия Александровна on 11.09.2026.
//

import UIKit

final class ScissorsView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .clear
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		backgroundColor = .clear
	}

	override func draw(_ rect: CGRect) {
		let color = UIColor.white
		let lineWidth: CGFloat = 10
		let center = CGPoint(x: bounds.midX, y: bounds.midY)
		let dx = bounds.width / 2
		let dy = bounds.height / 2
		let length = sqrt(dx * dx + dy * dy)

		for angle: CGFloat in [0, .pi / 2] {
			let path = UIBezierPath()
			// линия от центра к краю в одном направлении...
			path.move(to: center)
			path.addLine(to: CGPoint(x: center.x + cos(angle) * length,
									 y: center.y + sin(angle) * length))
			// ...и в противоположном
			path.move(to: center)
			path.addLine(to: CGPoint(x: center.x - cos(angle) * length,
									 y: center.y - sin(angle) * length))

			color.setStroke()
			path.lineWidth = lineWidth
			path.lineCapStyle = .round
			path.stroke()
		}
	}

	override func didMoveToWindow() {
		super.didMoveToWindow()
		guard window != nil else { return }
		let anim = CABasicAnimation(keyPath: "transform.rotation.z")
		anim.fromValue = 0
		anim.toValue = 2 * CGFloat.pi
		anim.duration = 4
		anim.repeatCount = .infinity
		layer.add(anim, forKey: "scissorsSpin")
	}
}
