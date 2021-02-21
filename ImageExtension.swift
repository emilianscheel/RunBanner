/**
 *
 *  ImageExtension.swift
 *  RunIt
 *
 *  Created by Emilian Scheel on 09.02.21
 *
 */





import Foundation
import UIKit
import MapKit
import CoreImage

class RunBanner {
  
  private var renderer: UIGraphicsImageRenderer?
  private var areaSize: CGRect?
  var backgroundImage: UIImage?
  var textLayers: [TextLayer] = []
  
  init(whichPhoto: Image) {
    
    // get background image
    switch whichPhoto {
      case .fernsehturm:
        backgroundImage = UIImage(named: Image.fernsehturm.rawValue)
      case .fernsehturm2:
        backgroundImage = UIImage(named: Image.fernsehturm2.rawValue)
    }
  }
  
  init(whichPhoto: UIImage) {
    
    backgroundImage = whichPhoto
  }
  
  init(textLayers: [TextLayer]) {
    self.textLayers = textLayers
  }
  
  
  func delete(position: LayerPosition) {
    let newTextLayers = textLayers.filter { $0.position != position }
    textLayers = newTextLayers
  }
  
  func delete(position: [LayerPosition]) {
    var newTextLayers: [TextLayer] = []
    for l in position {
      newTextLayers = textLayers.filter { $0.position != l }
    }
    textLayers = newTextLayers
  }
  
  func hasLayers(position: [LayerPosition]) -> Bool {
    var count: Int = 0
    for i in self.textLayers {
      for l in position {
        if i.position == l {
          count = count +  1
        }
      }
    }
    if count>0 {return true}
    else {return false}
  }
  
  func get() -> UIImage {
    
    // set up size of it
    areaSize = CGRect(x: 0, y: 0, width: 886.0, height: 886.0)
    renderer = UIGraphicsImageRenderer(size: CGSize(width: areaSize!.width, height: areaSize!.height))
    
    
    let alleTexte = renderer!.image { ctx in
      
      for text in self.textLayers {
        
        if !text.enabled {
          continue
        }
        
        // create text
        var textSize: CGFloat?
        var fontFamily: String?
        var textColor: UIColor?
        var position: CGRect?
        let paragraphStyle = NSMutableParagraphStyle()
        
        switch text.position {
          case .bottomLeftValue:
            
            // BOTTOM LEFT VALUE
            paragraphStyle.alignment = .left
            textSize = 64
            fontFamily = "HelveticaNeue-CondensedBold"
            position = CGRect(x: 26, y: areaSize!.height-110, width: areaSize!.width, height: areaSize!.height)
            
            // BOTTOM LEFT VALUE - COLOR STYLE
            switch text.colorStyle {
              case .normal:
                textColor = .white
              case .dark:
                textColor = .darkGray
              case .light:
                textColor = .white
            }
          case .bottomLeftTitle:
            
            // BOTTOM LEFT TITLE
            paragraphStyle.alignment = .left
            textSize = 38
            fontFamily = "HelveticaNeue-CondensedBold"
            position = CGRect(x: 26, y: areaSize!.height-155, width: areaSize!.width, height: areaSize!.height)
            
            // BOTTOM LEFT VALUE - COLOR STYLE
            switch text.colorStyle {
              case .normal:
                textColor = .lightGray
              case .dark:
                textColor = .darkGray
              case .light:
                textColor = .white
            }
          case .topLeftValue:
            
            // TOP LEFT VALUE
            paragraphStyle.alignment = .left
            textSize = 64
            fontFamily = "HelveticaNeue-CondensedBold"
            position = CGRect(x: 26, y: 22, width: areaSize!.width, height: areaSize!.height)
            
            // BOTTOM LEFT VALUE - COLOR STYLE
            switch text.colorStyle {
              case .normal:
                textColor = .white
              case .dark:
                textColor = .darkGray
              case .light:
                textColor = .white
            }
          case .topLeftTitle:
            
            // TOP LEFT TITLE
            paragraphStyle.alignment = .left
            textSize = 38
            fontFamily = "HelveticaNeue-CondensedBold"
            position = CGRect(x: 26, y: 94, width: areaSize!.width-43, height: areaSize!.height)
            
            // BOTTOM LEFT VALUE - COLOR STYLE
            switch text.colorStyle {
              case .normal:
                textColor = .lightGray
              case .dark:
                textColor = .darkGray
              case .light:
                textColor = .white
            }
          case .topRightValue:
            
            // TOP RIGHT VALUE
            paragraphStyle.alignment = .right
            textSize = 64
            fontFamily = "HelveticaNeue-CondensedBold"
            position = CGRect(x: 0, y: 22, width: areaSize!.width-43, height: areaSize!.height)
            
            // BOTTOM LEFT VALUE - COLOR STYLE
            switch text.colorStyle {
              case .normal:
                textColor = .white
              case .dark:
                textColor = .darkGray
              case .light:
                textColor = .white
            }
          case .topRightTitle:
            
            // TOP RIGHT TITLE
            paragraphStyle.alignment = .right
            textSize = 38
            fontFamily = "HelveticaNeue-CondensedBold"
            position = CGRect(x: 0, y: 94, width: areaSize!.width-43, height: areaSize!.height)
            
            // BOTTOM LEFT VALUE - COLOR STYLE
            switch text.colorStyle {
              case .normal:
                textColor = .lightGray
              case .dark:
                textColor = .darkGray
              case .light:
                textColor = .white
            }
          case .bottomRightValue:
            
            // BOTTOM RIGHT VALUE
            paragraphStyle.alignment = .right
            textSize = 64
            fontFamily = "HelveticaNeue-CondensedBold"
            position = CGRect(x: 0, y: areaSize!.height-110, width: areaSize!.width-43, height: areaSize!.height)
            
            // BOTTOM LEFT VALUE - COLOR STYLE
            switch text.colorStyle {
              case .normal:
                textColor = .white
              case .dark:
                textColor = .darkGray
              case .light:
                textColor = .white
            }
          case .bottomRightTitle:
            
            // BOTTOM RIGHT TITLE
            paragraphStyle.alignment = .right
            textSize = 38
            fontFamily = "HelveticaNeue-CondensedBold"
            position = CGRect(x: 0, y: areaSize!.height-155, width: areaSize!.width-43, height: areaSize!.height)
            
            // BOTTOM LEFT VALUE - COLOR STYLE
            switch text.colorStyle {
              case .normal:
                textColor = .lightGray
              case .dark:
                textColor = .darkGray
              case .light:
                textColor = .white
            }
          case .center:
            
            // CENTER
            paragraphStyle.alignment = .center
            textSize = 168
            fontFamily = "HelveticaNeue-CondensedBlack"
            position = CGRect(x: 0, y: 350, width: areaSize!.width, height: areaSize!.height)
            
            // BOTTOM LEFT VALUE - COLOR STYLE
            switch text.colorStyle {
              case .normal:
                textColor = .white
              case .dark:
                textColor = .darkGray
              case .light:
                textColor = .white
            }
        }
        
        let attrs = [NSAttributedString.Key.font: UIFont(name: fontFamily!, size: textSize!)!, NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.foregroundColor: textColor!]
        text.text.draw(with: position!, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
      }
    }
    
    // begin drawing image
    UIGraphicsBeginImageContext(areaSize!.size)

    backgroundImage!.cropsToSquare().vignetteFilter().draw(in: areaSize!)
    
    alleTexte.draw(in: areaSize!, blendMode: .normal, alpha: 0.8)

    let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    
    return newImage
  }
  
  
  
  enum Image: String {
    
    case fernsehturm =  "turm-1"
    case fernsehturm2 = "turm-2"
  }

  enum LayerPosition {
    
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
  
  
  enum LayerColor {
    
    case normal
    case dark
    case light
  }




  class TextLayer {
    
    var text: String
    var position: LayerPosition
    var colorStyle: LayerColor = .normal
    var enabled: Bool = true
    
    init(text: String, position: LayerPosition, colorStyle: LayerColor = .normal, enabled: Bool? = nil) {
      self.text = text
      self.position = position
      if enabled == nil {
        self.enabled = false
      } else {
        self.enabled = enabled!
      }
    }
    
    @available(iOS 13.0, *)
    func layerIcon() -> UIImage {
      switch position {
        case .bottomLeftTitle, .bottomLeftValue:
          return UIImage(systemName: "rectangle.inset.bottomleft.fill")!
          
        case .bottomRightTitle, .bottomRightValue:
          return UIImage(systemName: "rectangle.inset.bottomright.fill")!
          
        case .topRightTitle, .topRightValue:
          return UIImage(systemName: "rectangle.inset.topright.fill")!
          
        case .topLeftTitle, .topLeftValue:
          return UIImage(systemName: "rectangle.inset.topleft.fill")!
        case .center:
          return UIImage(systemName: "rectangle.center.inset.fill")!
      }
    }
  }
}

extension UIImage {
  
  func cropsToSquare() -> UIImage {
    let refWidth = CGFloat((self.cgImage!.width))
    let refHeight = CGFloat((self.cgImage!.height))
    let cropSize = refWidth > refHeight ? refHeight : refWidth
        
    let x = (refWidth - cropSize) / 2.0
    let y = (refHeight - cropSize) / 2.0
        
    let cropRect = CGRect(x: x, y: y, width: cropSize, height: cropSize)
    let imageRef = self.cgImage?.cropping(to: cropRect)
    let cropped = UIImage(cgImage: imageRef!, scale: 0.0, orientation: self.imageOrientation)
        
    return cropped
  }
  
  func vignetteFilter() -> UIImage {
    let imageRef = self.cgImage
    let beginImage = CIImage(cgImage: imageRef!)
    
    let filter = CIFilter(name: "CIVignette")!
    filter.setValue(beginImage, forKey: kCIInputImageKey)
    filter.setValue(1, forKey: kCIInputIntensityKey)
    
    return UIImage(ciImage: filter.outputImage!)
  }
}
