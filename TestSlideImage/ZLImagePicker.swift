//
//  ZLImagePicker.swift
//  TestSlideImage
//
//  Created by Thanh Sau on 05/09/2023.
//

import Foundation
import ZLPhotoBrowser
import SwiftUI
import Photos

struct ZLPhotoPicker: UIViewControllerRepresentable {
    typealias UIViewType = UIViewController
    
    var onDone: ([PHAsset]) -> Void
    
    func makeUIViewController(context: Context) -> some UIViewController {
        var view = UIViewController()
        
        var selectedAssets: [PHAsset] = []
        
        let minItemSpacing: CGFloat = 2
        let minLineSpacing: CGFloat = 2
        
        // Custom UI
        ZLPhotoUIConfiguration.default()
//            .navBarColor(.white)
//            .navViewBlurEffectOfAlbumList(nil)
//            .indexLabelBgColor(.black)
//            .indexLabelTextColor(.white)
            .minimumInteritemSpacing(minItemSpacing)
            .minimumLineSpacing(minLineSpacing)
            .columnCountBlock { Int(ceil($0 / (428.0 / 4))) }
        
        if ZLPhotoUIConfiguration.default().languageType == .arabic {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            UIView.appearance().semanticContentAttribute = .unspecified
        }
        
        // Custom image editor
        ZLPhotoConfiguration.default()
            .editImageConfiguration
//            .imageStickerContainerView(ImageStickerContainerView())
//            .canRedo(true)
//            .tools([.draw, .clip, .mosaic, .filter])
//            .adjustTools([.brightness, .contrast, .saturation])
//            .clipRatios([.custom, .circle, .wh1x1, .wh3x4, .wh16x9, ZLImageClipRatio(title: "2 : 1", whRatio: 2 / 1)])
//            .imageStickerContainerView(ImageStickerContainerView())
//            .filters([.normal, .process, ZLFilter(name: "custom", applier: ZLCustomFilter.hazeRemovalFilter)])
        
        /*
         ZLPhotoConfiguration.default()
             .cameraConfiguration
             .devicePosition(.front)
             .allowRecordVideo(false)
             .allowSwitchCamera(false)
             .showFlashSwitch(true)
          */
        ZLPhotoConfiguration.default()
            // You can first determine whether the asset is allowed to be selected.
            .canSelectAsset { _ in true }
            .didSelectAsset { _ in }
            .didDeselectAsset { _ in }
            .noAuthorityCallback { type in
                switch type {
                case .library:
                    debugPrint("No library authority")
                case .camera:
                    debugPrint("No camera authority")
                case .microphone:
                    debugPrint("No microphone authority")
                }
            }

//            .operateBeforeDoneAction { currVC, block in
//                // Do something before select photo result callback, and then call block to continue done action.
//                block()
//            }
        
        /// Using this init method, you can continue editing the selected photo
        let ac = ZLPhotoPreviewSheet()
        
//        let ac = ZLPhotoPreviewSheet(selectedAssets: takeSelectedAssetsSwitch.isOn ? selectedAssets : nil)
        
        ac.selectImageBlock = { results, isOriginal in
            // your code
            
//            guard let `self` = self else { return }
            
//            onDone(results.map { $0.asset })
            
            let assets = results.map { $0.asset }
            self.saveAsset(assets: assets)
            
        }
        ac.cancelBlock = {
            debugPrint("cancel select")
        }
        ac.selectImageRequestErrorBlock = { errorAssets, errorIndexs in
            debugPrint("fetch error assets: \(errorAssets), error indexs: \(errorIndexs)")
        }
        
        ac.showPhotoLibrary(sender: view)
        
        return view
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func saveAsset(assets: [PHAsset]) {
        self.onDone(assets)
    }
    
}
