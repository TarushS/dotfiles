import pyautogui
import time

pyautogui.press("s")
while True:
    pyautogui.keyDown("alt")
    pyautogui.press("tab")
    pyautogui.keyUp("alt")
    time.sleep(540)
