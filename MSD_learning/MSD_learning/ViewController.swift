//
//  ViewController.swift
//  MSD_learning
//
//  Created by Alex on 12.08.2026.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var continueButton: GhostButton!

	private let activityIndicator = UIActivityIndicatorView(style: .medium)

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black
		continueButton.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
		
		if let videoBackground = view.viewWithTag(100) as? VideoBackgroundView {
			if let url = Bundle.main.url(forResource: "background", withExtension: "mp4") {
				videoBackground.play(url: url)
			}
		}
	}

	@objc private func handleContinue() {
		continueButton.setTitle("", for: .normal)
		continueButton.addSubview(activityIndicator)
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			activityIndicator.centerXAnchor.constraint(equalTo: continueButton.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: continueButton.centerYAnchor)
		])
		activityIndicator.startAnimating()

		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			self.navigationController?.pushViewController(MasterSelectionViewController(), animated: true)
		}
	}
}

