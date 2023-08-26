//
//  ImageManager.swift
//  DessertApp
//
//  Created by xavier on 25/08/23.
//

import Foundation
import SwiftUI

class ImageFileManager {
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        createFolderIfNeeded(folderName: folderName)
        
        guard let data = image.pngData(), let url = urlForImage(imageName: imageName, folderName: folderName) else { return }
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image. ImageName: \(imageName). \(error)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard
            let url = urlForImage(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path) else { return nil }

        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = urlForFolder(folderName: folderName) else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("Error creating directory. FolderName: \(folderName). \(error)")
            }
        }
    }
    
    private func urlForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent(folderName)
    }
    
    private func urlForImage(imageName: String, folderName: String) -> URL? {
        guard let folderUrl = urlForFolder(folderName: folderName) else { return nil }
        return folderUrl.appendingPathComponent(imageName + ".png")
    }
}
