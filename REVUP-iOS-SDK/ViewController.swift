//
//  ViewController.swift
//  REVUP-iOS-SDK
//
//  Created by 심경보 on 3/30/26.
//

import UIKit
import REVUP

fileprivate let mediaID = "0"
fileprivate let mediaSecretKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
fileprivate let unitID = "xxxxxxxxxx"

class ViewController: UIViewController {

    @IBOutlet private weak var mediaIDTextField: UITextField!
    @IBOutlet private weak var secretKeyTextField: UITextField!
    private let revup = REVUPInterface.sharedInstance()! // not recommend: force unwraping
    private let textFont = UIFont.systemFont(ofSize: 12)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        mediaIDTextField.font = textFont
        mediaIDTextField.text   = mediaID
        
        secretKeyTextField.font = textFont
        secretKeyTextField.text = mediaSecretKey
        
        revup.setMainDelegate(self)
        revup.setUserId("test")
        revup.initialize(mediaID, mediaSecret: mediaSecretKey, callBackTag: "")
    }
    
    // MARK: - Events
    @IBAction func loadButtonTapped(_ sender: Any) {
        revup.load(unitID)
    }
    
    @IBAction func isLoadedButtonTapped(_ sender: Any) {
        print(revup.isLoaded(unitID))
    }
    
    @IBAction func showButtonTapped(_ sender: Any) {
        guard revup.isLoaded(unitID) == true else { return }
        revup.show()
    }
}

extension ViewController: REVUPDelegate {
    func onInitialized(_ isSuccess: Bool) {
        print("initialized: \(isSuccess)")
    }

    func onRewardedVideoAdLoaded(_ unitID: String!) {
        print("onRewardedVideoAdLoaded: \(unitID!)")
    }
    
    func onRewardedVideoAdFailed(toLoad unitID: String!, error: REVUPError!) {
        print("onRewardedVideoAdFailed: \(error.description) TraceID: \(error.getXB3TraceID() ?? "-")")
    }
    
    func onRewardedVideoAdOpened(_ unitID: String!) {
        print("onRewardedVideoAdOpened: \(unitID!)")
    }
    
    func onRewardedVideoAdClosed(_ unitID: String!) {
        print("onRewardedVideoAdClosed: \(unitID!)")
    }
    
    func onRewardedVideoAdFailed(toShow unitID: String!, error: REVUPError!) {
        print("onRewardedVideoAdFailed: \(unitID!), error: \(error.description) TraceID: \(error.getXB3TraceID() ?? "-")")
    }
    
    func onRewarded(_ unitID: String!, item: REVUPRewardItem!) {
        print("onRewarded: \(item.unit ?? ""), Amount: \(item.amount)")
    }
}

