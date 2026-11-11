import AVFoundation
import UIKit

final class VideoBackgroundView: UIView {

	private let player = AVPlayer()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}

	private func setup() {
		let playerLayer = AVPlayerLayer(player: player)
		playerLayer.videoGravity = .resizeAspectFill
		playerLayer.frame = bounds
		layer.addSublayer(playerLayer)

		player.isMuted = true
		player.actionAtItemEnd = .none

		NotificationCenter.default.addObserver(
			self,
			selector: #selector(loopVideo),
			name: .AVPlayerItemDidPlayToEndTime,
			object: player.currentItem
		)
	}

	func play(url: URL) {
		let item = AVPlayerItem(url: url)
		player.replaceCurrentItem(with: item)
		player.play()
	}

	@objc private func loopVideo() {
		player.seek(to: .zero)
		player.play()
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		layer.sublayers?.first?.frame = bounds
	}

	deinit {
		NotificationCenter.default.removeObserver(self)
	}
}
