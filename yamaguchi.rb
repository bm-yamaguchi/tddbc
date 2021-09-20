class VendingMachine
  def initialize
    puts "OK"
    @total = 0
    @total_sales = 0
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
      puts "金額を投入：¥" + money.to_s
    else
      puts "⚠️硬貨または千円札のみ使用できます"
      puts "⏪返却：¥" + money.to_s
    end
    puts "💰投入金額：¥" + @total.to_s
    puts "商品ラインナップ"
    @items.each do |item|
      can_buy =  @total >= item[:price] && item[:stock] > 0 ? "○" : "ー"
      puts can_buy + "｜" + item[:name].to_s + "｜¥" + item[:price].to_s + "｜在庫：" + item[:stock].to_s
    end

  end

  # 購入
  def buy(name)
    # コーラを強制的に買う
    purchase_item = @items.find{|item| item[:name] == name}
    
    if @total >= purchase_item[:price] && purchase_item[:stock] > 0

      @total -= purchase_item[:price]
      @total_sales += purchase_item[:price]
      purchase_item[:stock] -= 1
      
      puts purchase_item[:name] + "を購入しました"
      puts "在庫：" + purchase_item[:stock].to_s
      puts "売上：" + @total_sales.to_s

      refund
      
    else
      puts "購入できません"
    end
  end

  # お釣りボタン
  def refund
    puts "⏪返却：¥" + @total.to_s
    @total = 0
    "💰投入金額：¥" + @total.to_s
  end

  # 在庫表示
  def items
    @items
  end



  # def amount
  #   amount
  # end

  # def kei
  #   kei = 0
  # end
end



# load "./yamaguchi.rb"; vm = VendingMachine.new