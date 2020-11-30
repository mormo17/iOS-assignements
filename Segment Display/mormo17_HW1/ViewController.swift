import UIKit

class ViewController: UIViewController {

	@IBOutlet var digitView1: [UIView]!
	@IBOutlet var digitView2: [UIView]!
	@IBOutlet var digitView3: [UIView]!

	let digits = [
		[true,	true,	true,	true,	true,	true,	false],	// 0
		[false,	false,	true,	true,	false,	false,	false],	// 1
		[false,	true,	true,	false,	true,	true,	true],	// 2
		[false,	true,	true,	true,	true,	false,	true],	// 3
		[true,	false,	true,	true,	false,	false,	true],	// 4
		[true,	true,	false,	true,	true,	false,	true],	// 5
		[true,	true,	false,	true,	true,	true,	true],	// 6
		[false,	true,	true,	true,	false,	false,	false],	// 7
		[true,	true,	true,	true,	true,	true,	true],	// 8
		[true,	true,	true,	true,	true,	false,	true],	// 9
	]

	override func viewDidLoad() {
		super.viewDidLoad()

		var toPaint = 798

		let thirdDigit = toPaint % 10
		toPaint /= 10

		let secondDigit = toPaint % 10
		toPaint /= 10

		let firstDigit = toPaint % 10
		toPaint /= 10

		paintDigit(digitView1, firstDigit)
		paintDigit(digitView2, secondDigit)
		paintDigit(digitView3, thirdDigit)
	}

	func paintDigit(_ digitView: [UIView]!, _ toPaint: Int){
		let digit = digits[toPaint]
		for (i, _) in digit.enumerated(){
			digitView[i].backgroundColor = .black
			if !digit[i] {
				digitView[i].backgroundColor = .gray
				digitView[i].alpha = 0.4
			}
		}
	}

}

