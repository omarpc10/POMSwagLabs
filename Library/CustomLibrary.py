import time
import selenium
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.webdriver import WebDriver
# save following snippet as python file (shadow.py)
from robot.libraries.BuiltIn import BuiltIn
from PIL.Image import WEB
from typing import Optional

class CustomLibrary():


    def __init__(self, base_dir : Optional[str] = None) -> None:
        self.base_dir = base_dir

    def highlight(self, element):
        """Highlights (blinks) a Selenium Webdriver element"""
        driver = element._parent
        def apply_style(s):
            driver.execute_script("arguments[0].setAttribute('style', arguments[1]);",
                                  element, s)
        original_style = element.get_attribute('style')
        apply_style("background-color:rgba(0, 0, 255, 0.2); border: 4px Solid Blue;")
        time.sleep(.5)
        apply_style(original_style)


    def replace_values(self, text, value):
        """Replaces ``value`` in the given ``text``.

            ``old_value`` always be the string `Replace` for this keyword

            ``original string`` should be modified previously to include the text `Replace`


            ``value`` is used as a literal string.


            A modified version of the string is returned and the original
            string is not altered.

            See `Replace String` from Robot Framework Library if more powerful pattern matching is needed.
            If you need to just remove a string see `Remove String`.

            This is for more dynamic xpath creations


            Examples:
            | ${str} =        | Replace Values | //input[@id="Replace"]  | authServiceNum   |
            | Should Be Equal | ${str}         | //input[@id="authServiceNum"] |
            """
        old_value = 'Replace'
        new_value = value
        l_value = text.replace(old_value,new_value)
        return  l_value
