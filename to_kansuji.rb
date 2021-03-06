require 'pry'
class Integer
  def to_kansuji
    out_put = ""
    chara0 = ["","","二","三","四","五","六","七","八","九"]
    chara1 = ["","一","二","三","四","五","六","七","八","九"]
    chara2 = ["","十","百","千"]
    chara3 = ["","万","億","兆","京","垓","𥝱","穣","溝","澗","正","載","極","沙河恒","祇僧阿","他由那","議思可不","数大量無"]
    if self == 0
      out_put = "零"
    else
      num1 = self.to_s.reverse.scan(/.{4}|.+\Z/)
      num1.each_with_index do |n, i|
        unless n == "0000"
          out_put << chara3[i.to_i]
          num2 = n.split("")
          num2.each_with_index do |a, c|
            unless a == "0"
              out_put << chara2[c.to_i]
              if c == 1 || c == 2
                out_put << chara0[a.to_i]
              else
                out_put << chara1[a.to_i]
              end
            end
          end
        end
      end
    out_put.reverse!
    end
  end
end
