//
//  ViewController.swift
//  MSD_learning
//
//  Created by Alex on 12.08.2026.
//

import UIKit

class ViewController: UIViewController {

	private let videoBackground = VideoBackgroundView()
	private let scissorsView = ScissorsView()
	private let titleLabel = UILabel()
	private let subtitleLabel = UILabel()
	private let continueButton = GhostButton()
	private let activityIndicator = UIActivityIndicatorView(style: .medium)

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black
		setupVideoBackground()
		setupScissorsView()
		setupLabels()
		setupContinueButton()
		setupStackView()
	}

	private func setupVideoBackground() {
		videoBackground.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(videoBackground)
		NSLayoutConstraint.activate([
			videoBackground.topAnchor.constraint(equalTo: view.topAnchor),
			videoBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			videoBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			videoBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])

		if let url = Bundle.main.url(forResource: "background", withExtension: "mp4") {
			videoBackground.play(url: url)
		}
	}

	private func setupScissorsView() {
		scissorsView.translatesAutoresizingMaskIntoConstraints = false
		scissorsView.widthAnchor.constraint(equalToConstant: 120).isActive = true
		scissorsView.heightAnchor.constraint(equalToConstant: 120).isActive = true
	}

	private func setupLabels() {
		titleLabel.text = "Твоя стрижка. Твой график."
		titleLabel.font = .systemFont(ofSize: 28)
		titleLabel.textColor = .white
		titleLabel.textAlignment = .center
		titleLabel.numberOfLines = 0
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		subtitleLabel.text = "Запись в один свайп"
		subtitleLabel.font = .systemFont(ofSize: 17)
		subtitleLabel.textColor = .white.withAlphaComponent(0.7)
		subtitleLabel.textAlignment = .center
		subtitleLabel.numberOfLines = 0
		subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
	}

	private func setupContinueButton() {
		continueButton.translatesAutoresizingMaskIntoConstraints = false
		continueButton.setTitle("Продолжить", for: .normal)
		continueButton.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
		view.addSubview(continueButton)

		let safeArea = view.safeAreaLayoutGuide
		NSLayoutConstraint.activate([
			continueButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
			continueButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24),
			continueButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -24),
			continueButton.heightAnchor.constraint(equalToConstant: 52)
		])
	}

	private func setupStackView() {
		let stackView = UIStackView(arrangedSubviews: [scissorsView, titleLabel, subtitleLabel])
		stackView.axis = .vertical
		stackView.distribution = .equalCentering
		stackView.alignment = .center
		stackView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(stackView)

		let safeArea = view.safeAreaLayoutGuide
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 60),
			stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 22),
			stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -22),
			stackView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -20)
		])
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
