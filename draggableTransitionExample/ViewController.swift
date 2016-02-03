//
//  ViewController.swift
//  draggableTransitionExample
//
//  Created by Cemen Istomin on 03.02.16.
//  Copyright © 2016 Cemen Istomin. All rights reserved.
//

import UIKit
import ZFDragableModalTransition

struct Segues {
    static let Modal = "ModalSegue"
    static let Popover = "PopoverSegue"
}

class ViewController: UIViewController {
    
    var animator = ZFModalTransitionAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func performModal(sender:AnyObject) {
        self.performSegueWithIdentifier(Segues.Modal, sender: sender)
    }
    
    @IBAction func performPopover(sender: AnyObject) {
        self.performSegueWithIdentifier(Segues.Popover, sender: sender)
    }
    
    @IBAction func reco(reco:UIGestureRecognizer) {
        NSLog("Peow")
        if reco.state == .Ended {
            performModal(self)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Segues.Modal ||
            segue.identifier == Segues.Popover {
            let child = segue.destinationViewController
            animator = ZFModalTransitionAnimator(modalViewController: child)
            animator.bounces = true
//            animator.duration = CGFloat(0.8)
            animator.direction = .Right
            animator.dragable = true
            
            child.modalPresentationStyle = .Custom
            child.transitioningDelegate = animator
        }
    }
}

