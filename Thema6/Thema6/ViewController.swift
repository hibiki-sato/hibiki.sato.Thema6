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

    var num = String(Int.random(in: 1 ... 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 起動時にランダム値を生成
        numLabel.text = num
    }

    private func presentAlert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let reChalenge = UIAlertAction(title: "再挑戦", style: .default, handler: { [self]_ in
            num = String(Int.random(in: 1 ... 100))
            numLabel.text = num
        })
        alert.addAction(reChalenge)
        present(alert, animated: true, completion: nil)
    }

    @IBAction private func didTapJudgeButton(_ sender: Any) {
        if num == String(self.slider.value) {
            presentAlert(message: "あたり!\nあなたの値：\(Int(self.slider.value))")
        } else if num != String(self.slider.value) {
            presentAlert(message: "はずれ！\nあなたの値：\(Int(self.slider.value))")
        }
    }
}
