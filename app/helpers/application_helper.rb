module ApplicationHelper

  def date(y, m, d)
    y = 0 if y.nil?
    m = 0 if m.nil?
    d = 0 if d.nil?
    s  = "#{y}年"
    s += "#{m}月" if (0 < m)
    s += "#{d}日" if (0 < m) && (0 < d)
    s += "頃"     if (m == 0) || (d == 0)
    return s
  end

  def age(year, month, day)
    year = 0 if year.nil?
    month = 0 if month.nil?
    day = 0 if day.nil?    
    y = year
    m = (month == 0)? 1 : month
    d = (day == 0)?   1 : day
    f = "%Y%m%d"
    age  = Date.today.strftime(f).to_i
    age -= Date.new(y, m, d).strftime(f).to_i
    age /= 10000
    age  = age.to_s
    age += "才"
    age += "くらい" if (month == 0) || (day == 0)
    return age
  end

  def formYmd(f)
    s  = f.text_field(:year, {placeholder:'1999', style: "width:40px"}) + "年"
    s +=f.text_field(:month, {placeholder:'1', style: "width:20px"}) + "月"
    s += f.text_field(:day, {placeholder:'1', style: "width:20px"}) + "日"
    return s
  end
end
