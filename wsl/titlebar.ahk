;-Caption
LWIN & LButton::
WinSet, Style, -0xC00000, A
return
;

;+Caption
LWIN & RButton::
WinSet, Style, +0xC00000, A
return
;

;-Border
LALT & LButton::
WinSet, Style, -0xC40000, A
return
;

;+Border
LALT & RButton::
WinSet, Style, +0xC40000, A
return
;
