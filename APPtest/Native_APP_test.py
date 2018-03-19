# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

import unittest
import os
from random import randint
from appium import webdriver
from time import sleep

from selenium.webdriver.common.keys import Keys


class WebViewIOSTests(unittest.TestCase):
    def setUp(self):
        # Set up Appium for iOS simulator devices
        appium_server = "http://0.0.0.0:4723/wd/hub"
        desired_caps = {
         "automationName": "XCUITest",
         "platformName": "iOS",
         "platformVersion": "11.2",
         "app": "/Users/zambert/Downloads/seagull.app",
         "deviceName": "iPhone 6s"
        }

        self.driver = webdriver.Remote(appium_server, desired_caps)
        self.driver.get("http://m.baidu.com")

    def tearDown(self):
        self.driver.quit()

    def test_assert_title(self):
        # 输入搜索内容
        version_input = self.driver.find_element_by_id('index-kw')
        version_input.clear()
        version_input.send_keys('zhaobo')

        # 提交搜索
        submit_btn = self.driver.find_element_by_id('index-bn')
        submit_btn.click()

        sleep(5)
        # 判断浏览器title
        self.assertEquals("zhaobo - 百度", self.driver.title)


if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(WebViewIOSTests)
    unittest.TextTestRunner(verbosity=2).run(suite)

