To pspupdates
  this lua text edit software is based ps2dev ema's 'ttlde'
  rewrite all ema's code, added Chinese input method,
  Windows style interface & Windows style OpenFile.
  Search, replace text


------------------------------------------------------
Notepad for PSP Version 3.XX/4.XX/5.XX

Copyright (c) 2008.10., YaoYang. All rights reserved.
------------------------------------------------------

Ⅰ光标移动方法
   →、←、↑、↓各向右、左、上、下移动一个单位
   模拟杆快速移动
   按住□时，→、←、↑、↓各移动到行尾、行首、第一行、最后一行
   按住×时，→、←、↑、↓各向右、左、上、下移动十个单位
Ⅱ选区操作
   按住L键，配合光标移动方法建立选区
   建立选区后，按住L键，□键复制，△键剪切，○键粘贴
ⅢEdit菜单
   非输入状态下，按Select键弹出Edit菜单
   (Search,Replace,Jump to,Select all,Syntax coloring,About)
    搜索，查找并替换，转到?行，全选，语法着色，关于
ⅣFile菜单
   非输入状态下，按Start键弹出File菜单
   (New,Open,Save,Save as,Colse,Exit)
   新建，打开，保存，另存为，关闭，退出
   注意：打开文件时，可以进行删除操作，界面有提示
Ⅴ 输入法使用方法
  *在英文状态下(以Kris为例)
   先按R键打开输入法
   按住L(相当于PC的Shift)键,按○键，依次松开○，L键(大写的K输入了)
   按住↑键,按○键，依次松开○，↑键(r输入了)
   按住△键并松开，(i输入了)
   按住←键，按○键，依次松开按○，←键(s输入了)
   当你输入错误时可以按↓键删除，×是空格
   刚开始可能不习惯，当你熟练了速度是很快的
  *在拼音状态下(以 汉字 为例)
   先按R键打开输入法
   按Select切换到 拼音 输入法
   先输入han(输入错误时↓键删除)，按×键(相当PC的空格)，出现列表，根据提示选择“汉”
   输入zi，按×键(相当PC的空格)，出现列表，根据提示选择“字”
   拼音输入时列表不止一屏时，L、R键翻屏，Start取消当输入
   输入一个汉字时，如果该字有词组，会出现词语联想，选择你要的词，Start取消
   要输入标点符号时，按住L(Shift)，按↓(相当于PC的Tab)键，出现列表，选择你想要符号
   输入完毕时Select切换到英文输入，或R键关闭输入法进行其它操作
   提示:↓，×在非Shift下分别是 删除、空格
        ↓，×在Shift下分别是 Tab、回车
        在输入状态下按住L + R键也是回车
Ⅵ其它操作
 *这个是个多文档编辑器，你可以打开和建立多个文档(数量以内存为限)
  文档之间切换可以按住Select键，再按→、←
 *缩进
  先选择你想要缩进的区域，打开输入法(英文状态)，按住L(Shift)，按↓(Tab)键向右缩进
  打开输入法(英文状态)，按×(空格)键向左缩进
 *在非输入状态下，按△键是插入特殊符号功能(常见的中文标点，全角字符，制表符等)
 *在非输入状态下，按住△键后，按→、←快速输入lua语言的关键字、操作符等
 *在非输入状态下，按住□后，按×显示此文
 *在非输入状态下，按住○后，按×保存当前文件(新建文档无操作)
  
  Controls
  
  Analog    : Move Cursor(Fast)
  Arrows    : Move Cursor
  Start     : File Menu
  Select    : Edit Menu
  R(Push)   : OSK On / Off
  
  Select + Arrows : Switch Buffer
  L      + Arrows : Selection
  Circle + Arrows : Search / Replace(Previous / Next)
  Square + Arrows : Home / End 
  Cross  + Move   : Fast Move
  
  Triangle(Hold) + Arrows : Word Selector(From Dictionary)
  Triangle(Push, Release) : Symbol Selector
  
  L + Triangle : Cut
  L + Square   : Copy
  L + Circle   : Paste
  L + Cross    : Undo
  
  Square + Cross              : Help
  MultiLine Selection + Space : Indent
  MultiLine Selection + Tab   : Unindent
  OSK + Select                : Switch Input method(EN/CH)
  OSK + L(Hold) + R / Cross   : Enter
  OSK + L(Hold) + Down        : Tab
  OSK + Cross                 : Space
  OSK + Down                  : BackSpace
  OSK + L(Hold)               : Shift
  Chinese Input + L / R       : Scroll
  Chinese Input + Start       : Cancel