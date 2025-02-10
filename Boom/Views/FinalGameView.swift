//
//  FinalGameView.swift
//  Boom
//
//  Created by Евгений on 10.02.2025.
//

import UIKit

class FinalGameView: UIView {
    let backGround: UIImageView = {
        let bgImage = UIImageView()
        bgImage.image = UIImage(named: "WhiteBackground")
        bgImage.contentMode = .scaleAspectFill
        return bgImage
    }()
    let titel: UILabel = {
        let label = UILabel()
        label.text = "Конец Игры"
        label.font = UIFont(name: Fonts.SFBlack, size: 30)
        return label
    }()
    let image: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "FinalBoom")
        img.contentMode = .scaleAspectFit
        return img
    }()
    let text: UILabel = {
        let label = UILabel()
        label.text = "В следующем раунде после каждого ответа хлопать в ладоши"
        label.font = UIFont(name: Fonts.SFHeavy, size: 28)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    let changeTsk: UIButton = {
        let button = UIButton()
        button.setTitle("Начать заново", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "GameButtons")
        button.titleLabel?.font = UIFont(name: Fonts.SFBlack, size: 20)
        button.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    let restart: UIButton = {
        let button = UIButton()
        button.setTitle("Начать заново", for: .normal)
        button.backgroundColor = UIColor(named: "GameButtons")
        button.titleLabel?.font = UIFont(name: Fonts.SFBlack, size: 20)
        button.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setView()
        setConstraint()
    }
    func setView(){
        
        
    }
    func setConstraint(){
        addSubview(backGround)
        addSubview(titel)
        addSubview(image)
        addSubview(text)
        addSubview(changeTsk)
        addSubview(restart)
        
        backGround.translatesAutoresizingMaskIntoConstraints = false
        titel.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        changeTsk.translatesAutoresizingMaskIntoConstraints = false
        restart.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            backGround.topAnchor.constraint(equalTo: topAnchor, constant: -20 ),
            backGround.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 130),
            backGround.leftAnchor.constraint(equalTo: leftAnchor, constant: -40),
            backGround.rightAnchor.constraint(equalTo: rightAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            titel.topAnchor.constraint(equalTo: topAnchor, constant: -30), //Эта переменная не бьетсяс фигмой
            titel.leftAnchor.constraint(equalTo: leftAnchor, constant: 95),
            titel.rightAnchor.constraint(equalTo: rightAnchor, constant: -90)])
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: titel.bottomAnchor, constant: 65),
            image.widthAnchor.constraint(equalToConstant: 249),
            image.heightAnchor.constraint(equalToConstant: 300),
            image.leftAnchor.constraint(equalTo: leftAnchor, constant: 69)])
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 47),
            text.leftAnchor.constraint(equalTo: leftAnchor, constant: 23),
            text.rightAnchor.constraint(equalTo: rightAnchor, constant: -23)])
        NSLayoutConstraint.activate([
            changeTsk.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 43),
            changeTsk.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            changeTsk.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            changeTsk.heightAnchor.constraint(equalToConstant: 55)])
        NSLayoutConstraint.activate([
            restart.topAnchor.constraint(equalTo: changeTsk.bottomAnchor, constant: 16),
            restart.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            restart.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            restart.heightAnchor.constraint(equalToConstant: 55)
        ])
            
            
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    FinalGameView()
}
