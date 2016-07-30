-- 变量示例

-- 绿色色彩对象
green = Color.new(0, 255, 0) 
-- 将出生年份存为变量 myBirthYear
myBirthYear = 1981 
-- 将当前年份存为变量 currentYear
currentYear = 2008 
-- 创建一个空变量
myAge = nil 
-- 在变量中存储一些文字
someText = "My age is roughly " 
-- 用 currentYear 减去 myBirthYear 并将结果保存在变量 myAge 中
myAge = currentYear - myBirthYear 
-- 同时打印文本变量和年龄至屏幕
screen:print(10,100,someText .. myAge,green) 
-- 离屏缓存转至显屏
screen.flip()
-- 不停循环
while true do
screen.waitVblankStart()
end
