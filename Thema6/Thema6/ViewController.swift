//
//  ViewController.swift
//  Thema6
//
//  Created by 佐藤響 on 2021/09/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var numLabel: UILabel!
    @IBOutlet private weak var slider: UISlider!

    private var num = Int.random(in: 1...100)

    override func viewDidLoad() {
        super.viewDidLoad()

        // 起動時にランダム値を生成
        numLabel.text = String(num)
    }

    private func presentAlert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let reChalenge = UIAlertAction(title: "再挑戦", style: .default, handler: { [weak self] _ in
            self?.resetGame()
        })
        alert.addAction(reChalenge)
        present(alert, animated: true, completion: nil)
    }

    private func resetGame() {
        num = Int.random(in: 1...100)
        numLabel.text = String(num)
    }

    @IBAction private func didTapJudgeButton(_ sender: Any) {
        if num == Int(slider.value) {
            presentAlert(message: "あたり!\nあなたの値：\(Int(self.slider.value))")
        } else {
            presentAlert(message: "はずれ！\nあなたの値：\(Int(self.slider.value))")
        }
    }
}
