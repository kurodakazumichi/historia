module ApplicationHelper

  def date(y, m, d)
    s  = "#{y}年"
    s += "#{m}月" if !m.empty?
    s += "#{d}日" if !m.empty? && !d.empty?
    s += "頃"     if m.empty? || d.empty?
    return s
  end

  def age(year, month, day)
    y = year.to_i
    m = (month.empty?)? 1 : month.to_i
    d = (day.empty?)?   1 : day.to_i
    f = "%Y%m%d"
    age  = Date.today.strftime(f).to_i
    age -= Date.new(y, m, d).strftime(f).to_i
    age /= 10000
    age  = age.to_s
    age += "才"
    age += "くらい" if month.empty? || day.empty?
    return age
  end

  def formYmd(f)
    s  = f.text_field(:year, {placeholder:'1999', style: "width:40px"}) + "年"
    s +=f.text_field(:month, {placeholder:'1', style: "width:20px"}) + "月"
    s += f.text_field(:day, {placeholder:'1', style: "width:20px"}) + "日"
    return s
  end
end
