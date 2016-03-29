//
//  GenoiseSpec.swift
//  Genoise
//
//  Created by aarias on 3/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation

import Quick
import Nimble
import Genoise

class GenoiseSpec: QuickSpec {
    override func spec() {
        describe("Private methods tests") {
            it("Can get local app version") {
                expect(Genoise.getLocalAppVersion()) == "1.0"
            }
            it("Can get app URL") {
                Genoise.initializeWithApplicationId("12341234")
                expect(Genoise.getAppURL()) == "https://itunes.apple.com/lookup?id=12341234"
                Genoise.initializeWithApplicationId("45674567")
                expect(Genoise.getAppURL()) == "https://itunes.apple.com/lookup?id=45674567"
                Genoise.initializeWithApplicationId("78907890")
                expect(Genoise.getAppURL()) == "https://itunes.apple.com/lookup?id=78907890"
                Genoise.initializeWithApplicationId("asdfasdf")
                expect(Genoise.getAppURL()) == "https://itunes.apple.com/lookup?id=asdfasdf"
                Genoise.initializeWithApplicationId("34563456")
                expect(Genoise.getAppURL()) == "https://itunes.apple.com/lookup?id=34563456"
                Genoise.initializeWithApplicationId("890890")
                expect(Genoise.getAppURL()) == "https://itunes.apple.com/lookup?id=890890"
                Genoise.initializeWithApplicationId("tyuityui")
                expect(Genoise.getAppURL()) == "https://itunes.apple.com/lookup?id=tyuityui"
            }
            it("Can get store URL") {
                Genoise.initializeWithApplicationId("12341234")
                expect(Genoise.getStoreURL()) == "https://itunes.apple.com/US/app/id12341234?mt=8"
            }
//            it("Can get an array of ints") {
//                expect(Genoise.toIntArray(["3","4","7"])) == [3,4,7]
//            }
        }
    }
}