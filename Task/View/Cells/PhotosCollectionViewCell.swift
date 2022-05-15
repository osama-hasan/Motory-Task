//
//  PhotosCollectionViewCell.swift
//  Task
//
//  Created by Osama Walid on 15/05/2022.
//

import UIKit
import Kingfisher

class PhotosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoDescriptionLabel: UILabel!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCellContent(photo:Photo){
        photoTitleLabel.text = photo.altDescription
        photoDescriptionLabel.text = photo.description
        KF.url(URL(string: (photo.urls?.full)!))
          .loadDiskFileSynchronously()
          .cacheMemoryOnly()
          .fade(duration: 0.25)
          .onProgress { receivedSize, totalSize in  }
          .onSuccess { result in  }
          .onFailure { error in }
          .set(to: photoImageView)
    }

}
