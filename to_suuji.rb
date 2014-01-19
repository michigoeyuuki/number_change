class String
  def to_suuji
    out_put = 0

    chara1 = ["一","二","三","四","五","六","七","八","九"]
    chara2 = ["十","百","千"]
    chara3 = ["万","億","兆","京","垓","𥝱","穣","溝","澗","正","載","極","恒河沙","阿僧祇","那由他","不可思議"]
    if self == "零"
      out_put = 0
    elsif self == "無量大数"
      out_put = "∞"
    else
      chara3.each do |i|
        self.sub!(i,'\&,')
      end
      num1 = self.split(",")
      num2 = []
      num1.each do |num|
        chara3.each do |i|
          num.sub!(i,',\&')
        end
        num2 << num.split(",")
      end
      num2.each do |num|
        ac_num = 0
        chara3_num = 1
        unless num[1] == nil
          chara3_num = 10 ** ((chara3.find_index(num[1]) + 1) * 4)
        end
        chara2.each do |i|
          num[0].sub!(i,'\&,')
        end
        num3 = num[0].split(",")
        num3.each do |n|
          unless n[1] == nil
            ac_num += (chara1.find_index(n[0]) + 1) * (10 ** (chara2.find_index(n[1]) + 1))
          else
            if chara1.include?(n[0])
              ac_num += chara1.find_index(n[0]) + 1
            else
              ac_num += 10 ** (chara2.find_index(n[0]) + 1)
            end
          end
        end
        out_put += ac_num * chara3_num
      end
    end
    out_put
  end
end
