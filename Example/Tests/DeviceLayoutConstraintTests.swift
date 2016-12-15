//
//  DeviceLayoutConstraintTests.swift
//  DeviceLayout
//
//  Created by CruzDiary on 15/12/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

import Quick
import Nimble

@testable import DeviceLayout

class DeviceLayoutConstraintTests: QuickSpec {
    
    struct Expected {
        struct Constant {
            static let inch3_5: CGFloat = 30
            static let inch4: CGFloat = 50
            static let inch4_7: CGFloat = 80
            static let inch5_5: CGFloat = 100
            static let inch7_9: CGFloat = 150
            static let inch9_7: CGFloat = 200
            static let inch12_9: CGFloat = 250
        }
    }
    
    override func spec() {
        var sut: DeviceLayoutConstraint!
        let defaultConstant: CGFloat = 30
        
        beforeEach {
            sut = DeviceLayoutConstraint()
            sut.constant = defaultConstant
        }
        
        describe("DeviceLayoutConstraint") {
            context("when use iPhone6") {
                beforeEach {
                    sut.deviceSize = .screen5_5Inch
                    sut.inch5_5 = Expected.Constant.inch5_5
                }
                
                it("constant should be equal to \(Expected.Constant.inch5_5)") {
                    expect(sut.constant).to(equal(Expected.Constant.inch5_5))
                }
                
                context("when update iPhone4_7 inch constant") {
                    beforeEach {
                        sut.inch4_7 = Expected.Constant.inch4_7
                    }
                    
                    it("constant should be equal to inch5_5") {
                        expect(sut.constant).to(equal(Expected.Constant.inch5_5))
                    }
                }
            }
        }
    }
}
