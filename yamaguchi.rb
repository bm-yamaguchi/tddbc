class VendingMachine
  def initialize
    puts "OK"
    @total = 0
    @total_sales = 0
    @moneys = [
      { 
        name: "10円硬貨",
        amount: 10,
        stock: 10,
      },
      { 
        name: "50円硬貨",
        amount: 50,
        stock: 10,
      },
      { 
        name: "100円硬貨",
        amount: 100,
        stock: 10,
      },
      { 
        name: "500円硬貨",
        amount: 500,
        stock: 10,
      },
      { 
        name: "1,000円札",
        amount: 1000,
        stock: 10,
      },
    ]
    @moneys = @moneys.sort do |a, b| b[:amount] <=> a[:amount] end
    @items = [
      {
        name: "コカコーラ",
        price: 120,
        stock: 5
      },
      {
        name: "レッドブル",
        price: 200,
        stock: 5
      },
      {
        name: "水",
        price: 100,
        stock: 5
      }
    ]
  end

  def total
    @total
  end

  def test
    puts "test"
  end

  # お金の投入口
  def insert(money)
    if money==10 || money==50 || money==100 || money==500 || money==1000
      @total += money
      puts "😀 ¥" + money.to_s + "を投入しました"
    else
      puts "⚠️硬貨または千円札のみ使用できます"
      puts "⏪返却：¥" + money.to_s
    end
    puts "商品ラインナップ"
    @items.each do |item|
      can_buy =  @total >= item[:price] && item[:stock] > 0 ? "○" : "ー"
      puts can_buy + "｜" + item[:name].to_s + "｜¥" + item[:price].to_s + "｜在庫：" + item[:stock].to_s
    end
    status
  end

  def admin_insert(money)
    @total += money
    status
  end

  # 購入
  def buy(name)
    purchase_item = @items.find{|item| item[:name] == name}
    
    if @total >= purchase_item[:price] && purchase_item[:stock] > 0

      @total -= purchase_item[:price]
      @total_sales += purchase_item[:price]
      purchase_item[:stock] -= 1
      
      puts purchase_item[:name] + "を購入しました"

      refund
      
    else
      puts "購入できません"
    end
  end

  # お釣りの処理
  def refund
    puts "⏪返却：¥" + @total.to_s
    @moneys.each do |money|
      while @total > money[:amount] && money[:stock] > 0
        puts money[:name] + "を返却"
        @total -= money[:amount]
        money[:stock] -=1
      end
    end

    @total = 0
    status
  end

  # 自動販売機の全情報を表示
  def status 
    puts "------------------"
    puts "投入金額：¥" + @total.to_s
    puts "売上：¥" + @total_sales.to_s
    @items.each do |item|
      puts "【商品】" + item[:name].to_s + "｜販売価格：¥" + item[:price].to_s + "｜在庫：" + item[:stock].to_s
    end
    @moneys.each do |item|
      puts "【お釣り】" + item[:name].to_s + "｜個数：" + item[:stock].to_s
    end
    puts "------------------"
  end
end


# load "./yamaguchi.rb"; vm = VendingMachine.new