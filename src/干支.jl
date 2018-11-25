module 干支 # Sexagesimal

export 六十甲子
export 甲子, 乙丑, 丙寅, 丁卯, 戊辰, 己巳, 庚午, 辛未, 壬申, 癸酉,
       甲戌, 乙亥, 丙子, 丁丑, 戊寅, 己卯, 庚辰, 辛巳, 壬午, 癸未,
       甲申, 乙酉, 丙戌, 丁亥, 戊子, 己丑, 庚寅, 辛卯, 壬辰, 癸巳,
       甲午, 乙未, 丙申, 丁酉, 戊戌, 己亥, 庚子, 辛丑, 壬寅, 癸卯,
       甲辰, 乙巳, 丙午, 丁未, 戊申, 己酉, 庚戌, 辛亥, 壬子, 癸丑,
       甲寅, 乙卯, 丙辰, 丁巳, 戊午, 己未, 庚申, 辛酉, 壬戌, 癸亥

@enum 天干 甲=1 乙 丙 丁 戊 己 庚 辛 壬 癸
@enum 地支 子=1 丑 寅 卯 辰 巳 午 未 申 酉 戌 亥

六十字 = [Symbol(天, 地) for (天, 地) in zip(repeat(collect(instances(天干)), 6),
                                             repeat(collect(instances(地支)), 5))]
eval(quote
    @enum 六十甲子 甲子=1 $(六十字[2:end]...)
end)

function Base.:+(數::六十甲子, n::Int)
    六十甲子((Int(數) + n) % 60)
end

function Base.:-(數::六十甲子, n::Int)
    x = Int(數) - n
    六十甲子(x > 0 ? x : x+60)
end

end # Sexagesimal.干支
