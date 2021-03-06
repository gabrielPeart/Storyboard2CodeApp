//
//  SliderTests.swift
//  Storyboard2Code
//
//  Created by dasdom on 08.05.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import XCTest
@testable import Storyboard2Code

class SliderTests: XCTestCase {
  
  var codeString = ""
  let codeCreator = CodeCreator()
  
  override func setUp() {
    super.setUp()
    guard let data = dataFromResource(withName: "SliderTests", andType: "xml") else { fatalError() }
    let strings = codeCreator.codeStringsFrom(XMLdata: data)
    codeString = ""
    for (_, value) in strings {
      codeString += value
    }
    //    print(codeString)
  }
  
  func test_SliderdReturnsCorrectInitString() {
    let expectedString = "fooSlider = UISlider()\n"
    XCTAssertTrue(codeString.contains(expectedString))
  }
  
  func testSliderSetupString_HasTranslatesAutoresizingString() {
    let expectedString = "fooSlider.translatesAutoresizingMaskIntoConstraints = false"
    XCTAssertTrue(codeString.contains(expectedString))
  }

  func testSliderSetupString_HasValueString() {
    let expectedString = "fooSlider.value = 5"
    XCTAssertTrue(codeString.contains(expectedString))
  }
  
  func testSliderSetupString_HasMinimumValueString() {
    let expectedString = "fooSlider.minimumValue = -7"
    XCTAssertTrue(codeString.contains(expectedString))
  }
  
  func testSliderSetupString_HasMaximumValueString() {
    let expectedString = "fooSlider.maximumValue = 33"
    XCTAssertTrue(codeString.contains(expectedString))
  }
  
  func testSliderSetupString_HasContinuousString() {
    let expectedString = "fooSlider.continuous = false"
    XCTAssertTrue(codeString.contains(expectedString))
  }
  
  func testSliderSetupString_HasMinimumTrackTintColorString() {
    let expectedString = "fooSlider.minimumTrackTintColor = UIColor(colorLiteralRed: 0.000, green: 0.502, blue: 0.000, alpha: 1.000)"
    XCTAssertTrue(codeString.contains(expectedString))
  }
  
  func testSliderSetupString_HasMaximumTrackTintColorString() {
    let expectedString = "fooSlider.maximumTrackTintColor = UIColor(colorLiteralRed: 1.000, green: 0.000, blue: 0.000, alpha: 1.000)"
    XCTAssertTrue(codeString.contains(expectedString))
  }
  
  func testSliderSetupString_HasThumbTintColorString() {
    let expectedString = "fooSlider.thumbTintColor = UIColor(colorLiteralRed: 0.000, green: 0.251, blue: 0.502, alpha: 1.000)"
    XCTAssertTrue(codeString.contains(expectedString))
  }
}

extension SliderTests {
  func testDefaultSliderSetupString_HasNotContinuousString() {
    XCTAssert(codeString.contains("defaultSlider"))
    let expectedString = "defaultSlider.continuous"
    XCTAssertFalse(codeString.contains(expectedString))
  }
  
  func testDefaultSliderSetupString_HasNotMinimumTrackTintColorString() {
    XCTAssert(codeString.contains("defaultSlider"))
    let expectedString = "defaultSlider.minimumTrackTintColor"
    XCTAssertFalse(codeString.contains(expectedString))
  }
  
  func testDefaultSliderSetupString_HasNotMaximumTrackTintColorString() {
    XCTAssert(codeString.contains("defaultSlider"))
    let expectedString = "defaultSlider.maximumTrackTintColor"
    XCTAssertFalse(codeString.contains(expectedString))
  }
  
  func testDefaultSliderSetupString_HasNotThumbTintColorString() {
    XCTAssert(codeString.contains("defaultSlider"))
    let expectedString = "defaultSlider.thumbTintColor"
    XCTAssertFalse(codeString.contains(expectedString))
  }
}
