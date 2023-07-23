//
//  ViewController.swift
//  ImageView
//
//  Created by JunK on 2023/07/23.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false
    // isZomm -> 확대 여부를 나타내는 변수
    var imgOn: UIImage?
    // imgOn -> 켜진 전구 이미지가 있는 UIImage 타입의 변수
    var imgOff: UIImage?
    // imgOff -> 꺼진 전구 이미지가 있는 UIImage 타입의 변수
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    // 26L~29L : viewDidLoad 함수 내 UIImage 타입의 변수에 이미지 지정
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        // scale 상수는 이미지를 확대할 배율 값임을 의미함
        var newWidth:CGFloat, newHeight:CGFloat
        // newWidth, newHeight 변수는 확대 또는 축소했을 때 이미지 가로와 세로 길이를 저장할 변수를 의미함
        
        if (isZoom) { // 현재 상태가 확대일 때
            // 40L~41L : 이미지 프레임의 가로, 세로 크기에 scale 값을 나누어 nwWidth와 newHeight에 할당함
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
            // 버튼의 텍스트를 확대로 변경
        }
        else { // 현재 상태가 축소일 때
            // 47L~48L : 이미지 프레임의 가로, 세로 크기에 scale 값을 곱하여 newWidth와 newHeight에 할당함
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
            // 버튼의 텍스트를 축소로 변경
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    // 스위치 클릭 시 동작하는 함수
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        } else{
            imgView.image = imgOff
        }
    }
    
}
