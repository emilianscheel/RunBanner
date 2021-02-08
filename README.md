# RunBanner
Put TextLayers on Image

<img src="https://github.com/emilianscheel/RunBanner/blob/main/IMG_F1075BECA80E-1.jpeg" width="250">

## How to use
```Swift
// create new textLayers
let textLayers: [BannerTextLayer] = [BannerTextLayer(text: "Test", position: .topLeftTitle),
                                    BannerTextLayer(text: "Test", position: .topLeftValue),
                                    BannerTextLayer(text: "Test", position: .topRightTitle),
                                    BannerTextLayer(text: "Test", position: .topRightValue)]
                                    
// get background image                                    
let backgroundImage = UIImage(named: "turm")    

// initalize new runBanner
let runBanner = RunBanner(whichPhoto: backgroundImage)

// put text layers on the image
runBanner.textLayers = textLayers

// if you want to delete parts
runBanner.delete(position: .topLeftTitle)

// get final image
let finalImage = runBanner.get()
```

Create new File and copy this.
```Swift
class RunBanner {
  
  private var renderer: UIGraphicsImageRenderer?
  private var areaSize: CGRect?
  var backgroundImage: UIImage?
  var textLayers: [BannerTextLayer] = []
  
  init(whichPhoto: Image) {
    
    // get background image
    switch whichPhoto {
      case .fernsehturm:
        backgroundImage = UIImage(named: Image.fernsehturm.rawValue)
    }
  }
  
  init(textLayers: [BannerTextLayer]) {
    self.textLayers = textLayers
  }
  
  init(whichPhoto: UIImage) {
    
    backgroundImage = whichPhoto
  }
  
  func delete(position: BannerTextLayerPosition) {
    for text in 0..<self.textLayers.count {
      if self.textLayers[text].position == position {
        self.textLayers.remove(at: text)
      }
    }
  }
  
  func get() -> UIImage {
    
    // set up size of it
    areaSize = CGRect(x: 0, y: 0, width: backgroundImage!.size.width*3, height: backgroundImage!.size.height*3)
    renderer = UIGraphicsImageRenderer(size: CGSize(width: areaSize!.width, height: areaSize!.height))
    
    
    let alleTexte = renderer!.image { ctx in
      
      for text in self.textLayers {
        
        // create text
        var textSize: CGFloat?
        var fontFamily: String?
        var textColor: UIColor?
        var position: CGRect?
        let paragraphStyle = NSMutableParagraphStyle()
        
        switch text.position {
          case .bottomLeftValue:
            
            
            print(areaSize!.width)
            print(areaSize!.width)
            
            // BOTTOM LEFT VALUE
            paragraphStyle.alignment = .left
            textSize = 64
            fontFamily = "HelveticaNeue-CondensedBold"
            textColor = .white
            position = CGRect(x: 26, y: areaSize!.height-110, width: areaSize!.width, height: areaSize!.height)
          case .bottomLeftTitle:
            
            // BOTTOM LEFT TITLE
            paragraphStyle.alignment = .left
            textSize = 38
            fontFamily = "HelveticaNeue-CondensedBold"
            textColor = .darkGray
            position = CGRect(x: 26, y: areaSize!.height-155, width: areaSize!.width, height: areaSize!.height)
          case .topLeftValue:
            
            // TOP LEFT VALUE
            paragraphStyle.alignment = .left
            textSize = 64
            fontFamily = "HelveticaNeue-CondensedBold"
            textColor = .white
            position = CGRect(x: 26, y: 22, width: areaSize!.width, height: areaSize!.height)
          case .topLeftTitle:
            
            // TOP LEFT TITLE
            paragraphStyle.alignment = .left
            textSize = 38
            fontFamily = "HelveticaNeue-CondensedBold"
            textColor = .darkGray
            position = CGRect(x: 26, y: 94, width: areaSize!.width-43, height: areaSize!.height)
          case .topRightValue:
            
            // TOP RIGHT VALUE
            paragraphStyle.alignment = .right
            textSize = 64
            fontFamily = "HelveticaNeue-CondensedBold"
            textColor = .white
            position = CGRect(x: 0, y: 22, width: areaSize!.width-43, height: areaSize!.height)
          case .topRightTitle:
            
            // TOP RIGHT TITLE
            paragraphStyle.alignment = .right
            textSize = 38
            fontFamily = "HelveticaNeue-CondensedBold"
            textColor = .darkGray
            position = CGRect(x: 0, y: 94, width: areaSize!.width-43, height: areaSize!.height)
          case .bottomRightValue:
            
            // BOTTOM RIGHT VALUE
            paragraphStyle.alignment = .right
            textSize = 64
            fontFamily = "HelveticaNeue-CondensedBold"
            textColor = .white
            position = CGRect(x: 0, y: areaSize!.height-110, width: areaSize!.width-43, height: areaSize!.height)
          case .bottomRightTitle:
            
            // BOTTOM RIGHT TITLE
            paragraphStyle.alignment = .right
            textSize = 38
            fontFamily = "HelveticaNeue-CondensedBold"
            textColor = .darkGray
            position = CGRect(x: 0, y: areaSize!.height-155, width: areaSize!.width-43, height: areaSize!.height)
          case .center:
            
            // CENTER
            paragraphStyle.alignment = .center
            textSize = 168
            fontFamily = "HelveticaNeue-CondensedBlack"
            textColor = .white
            position = CGRect(x: 0, y: 350, width: areaSize!.width, height: areaSize!.height)
        }
        
        let attrs = [NSAttributedString.Key.font: UIFont(name: fontFamily!, size: textSize!)!, NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.foregroundColor: textColor!]
        text.text.draw(with: position!, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
      }
    }
    
    // begin drawing image
    UIGraphicsBeginImageContext(areaSize!.size)

    backgroundImage!.draw(in: areaSize!)
    
    alleTexte.draw(in: areaSize!, blendMode: .normal, alpha: 0.8)

    let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    
    return newImage
  }
}

enum Image: String {
  
  case fernsehturm = "turm-1"
}

enum BannerTextLayerPosition {
  
  case bottomLeftValue
  case bottomLeftTitle
  
  case topLeftValue
  case topLeftTitle
  
  case topRightValue
  case topRightTitle
  
  case bottomRightValue
  case bottomRightTitle
  
  case center
}

class BannerTextLayer {
  
  var text: String
  var position: BannerTextLayerPosition
  
  init(text: String, position: BannerTextLayerPosition) {
    self.text = text
    self.position = position
  }
}
```
