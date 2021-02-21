# RunBanner
Put TextLayers on Image

<img src="https://github.com/emilianscheel/RunBanner/blob/main/IMG_F1075BECA80E-1.jpeg" width="250">

## How to use

1. Create your `TextLayers`, which should be shown.
```Swift
let textLayers: [BannerTextLayer] = []
textLayers.append(BannerTextLayer(text: "Test", position: .topLeftTitle)
textLayers.append(BannerTextLayer(text: "Test", position: .topLeftValue)
textLayers.append(BannerTextLayer(text: "Test", position: .topRightTitle)
textLayers.append(BannerTextLayer(text: "Test", position: .topRightValue)
```

2. Get any `UIImage` as backgroundImage. 
```Swift
let backgroundImage = UIImage(named: "turm")    
```

3. Create new `RunBanner` with your backgroundImage and set its textLayers to your `TextLayers`.
```Swift
let runBanner = RunBanner(whichPhoto: backgroundImage)
runBanner.textLayers = textLayers

runBanner.delete(position: .topLeftTitle)
```

4. Get the final Image and call `get()` to your runBanner.
```Swift
let finalImage = runBanner.get()
```
