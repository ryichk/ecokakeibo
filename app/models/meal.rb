class Meal < ApplicationRecord
  has_many :cuisines
  has_many :foodstuffs, through: :cuisines
  belongs_to :user

  before_save :food_vw_create
  before_save :vw_create


  def food_vw_create
    foodstuff = Foodstuff.where(cuisine_id: self.cuisine_id)
    foods = foodstuff.select('food', 'amount')
    a = foods.inject({}) {|hash, foodstuff| hash[foodstuff.food] = foodstuff.amount; hash }
    if a.include?('牛肉')
      b = a["牛肉"]
      if b == "８枚(約180g)"
        self.gyu_vw = 90 * 20.6
        self.gyu_fm = 90 * 0.000001 * 15396 * 20.7
      elsif b == "６枚(約200g)" || b == "２枚（200g）" || b == "１枚(200g)"
        self.gyu_vw = 100 * 20.6
        self.gyu_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b == "８枚(約100g)"
        self.gyu_vw = 50 * 20.6
        self.gyu_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b == "４枚(220g)"
        self.gyu_vw = 110 * 20.6
        self.gyu_fm = 110 * 0.000001 * 15396 * 20.7
      elsif b == "２枚(約240g)"
        self.gyu_vw = 120 * 20.6
        self.gyu_fm = 120 * 0.000001 * 15396 * 20.7
      elsif b == "２枚(300g)" || b == "２枚"
        self.gyu_vw = 150 * 20.6
        self.gyu_fm = 150 * 0.000001 * 15396 * 20.7
      elsif b == "６枚(120g)" || b == "４枚(120g)" || b == "６枚(約120g)"
        self.gyu_vw = 60 * 20.6
        self.gyu_fm = 60 * 0.000001 * 15396 * 20.7
      elsif b == "１枚(約150g)"
        self.gyu_vw = 75 * 20.6
        self.gyu_fm = 75 * 0.000001 * 15396 * 20.7
      elsif b == "2枚(約400g)"
        self.gyu_vw = 200 * 20.6
        self.gyu_fm = 200 * 0.000001 * 15396 * 20.7
      elsif b == "２枚(160g)"
        self.gyu_vw = 80 * 20.6
        self.gyu_fm = 80 * 0.000001 * 15396 * 20.7
      elsif b == "４枚(60g)"
        self.gyu_vw = 30 * 20.6
        self.gyu_fm = 30 * 0.000001 * 15396 * 20.7
      else
        self.gyu_vw = b.to_f / 2.000 * 20.6
        self.gyu_fm = b.to_f / 2.00 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('豚肉')
      b = a["豚肉"]
      if b == "８枚(約200g)" || b == "２枚(約200g)" || b == "小２枚(約200g)" || b == "２枚(200g)" || b == "１枚(約200g)" || b == "４枚(約200g)" || b == "約200g" || b == "６枚(約200g)"
        self.buta_vw = 100 * 5.9
        self.buta_vw = 100 * 0.000001 * 15396 * 20.7
      elsif b == "８枚(約160g)" || b == "８枚"
        self.buta_vw = 80 * 5.9
        self.buta_fm = 80 * 0.000001 * 15396 * 20.7
      elsif b == "６枚(約120g)" || b == "４～６枚(120g)"
        self.buta_vw = 60 * 5.9
        self.bata_fm = 60 * 0.000001 * 15396 * 20.7
      elsif b == "６枚" || b == "６枚(100～120g)"
        self.buta_vw = 50 * 5.9
        self.buta_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b == "２枚(260g)" || b == "２枚"
        self.buta_vw = 130 * 5.9
        self.buta_fm = 130 * 0.000001 * 15396 * 20.7
      elsif b == "４～６本(約300g)" || b == "５枚" || b == "４本"
        self.buta_vw = 150 * 5.9
        self.buta_fm = 150 * 0.000001 * 15396 * 20.7
      elsif b == "６枚(約180g)" || b == "６枚(180g)"
        self.buta_vw = 90 * 5.9
        self.buta_fm = 90 * 0.000001 * 15396 * 20.7
      elsif b == "２枚（240g）"
        self.buta_vw = 120 * 5.9
        self.buta_fm = 120 * 0.000001 * 15396 * 20.7
      elsif b == "１本(約600g)"
        self.buta_vw = 300 * 5.9
        self.buta_fm = 300 * 0.000001 * 15396 * 20.7
      elsif b == "４枚(230g)" || b == "４枚"
        self.buta_vw = 115 * 5.9
        self.buta_fm = 115 * 0.000001 * 15396 * 20.7
      elsif b == "９枚(約150g)"
        self.buta_vw = 75 * 5.9
        self.buta_fm = 75 * 0.000001 * 15396 * 20.7
      elsif b == "１個(450g)"
        self.buta_vw = 225 * 5.9
        self.buta_fm = 225 * 0.000001 * 15396 * 20.7
      else
        self.buta_vw = b.to_f / 2.000 * 5.900
        self.buta_fm = b.to_f / 2.000 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('とりもも肉') || a.include?('鶏がら') || a.include?('とり肉') || a.include?('とりむね肉') || a.include?('とり手羽先') || a.include?('とり手羽元') || a.include?('とりささ身') || a.include?('とりレバー')
      b = a["とりもも肉"] || a["鶏がら"] || a["とり肉"] || a["とりむね肉"] || a["とり手羽先"] || a["とり手羽元"] || a["とりささ身"] || a["とりレバー"]
      if b == "４本" || b == "大１枚(約200g)"
        self.tori_vw = 100 * 4.5
        self.tori_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b == "３本(160g)" || b == "３本"
        self.tori_vw = 80 * 4.5
        self.tori_fm = 80 * 0.000001 * 15396 * 20.7
      elsif b == "2枚(約500g)" || b == "８本(500g)" || b == "８本"
        self.tori_vw = 250 * 4.5
        self.tori_fm = 250 * 0.000001 * 15396 * 20.7
      elsif b == "２枚(約400g)" || b == "２枚"
        self.tori_vw = 200 * 4.5
        self.tori_fm = 200 * 0.000001 * 15396 * 20.7
      elsif b == "1/2枚(85g)" || b == "１本" || b == "1/2枚"
        self.tori_vw = 85 / 2 * 4.5
        self.tori_fm = 85 / 2 * 0.000001 * 15396 * 20.7
      elsif b == "10本"
        self.tori_vw = 300 * 4.5
        self.tori_fm = 300 * 0.000001 * 15396 * 20.7
      else
        self.tori_vw = b.to_f / 2.00 * 4.5
        self.tori_fm = b.to_f / 2.00 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('卵')
      b = a["卵"]
      if b.include?('1/2個')
        self.tamago_vw = 14 * 3.2
        self.tamago_fm = 14 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4個')
        self.tamago_vw = 7 * 3.2
        self.tamago_fm = 7 * 0.000001 * 15396 * 20.7
      elsif b.include?('１個')
        self.tamago_vw = 28 * 3.2
        self.tamago_fm = 28 * 0.000001 * 15396 * 20.7
      elsif b.include?('２個')
        self.tamago_vw = 56 * 3.2
        self.tamago_fm = 56 * 0.000001 * 15396 * 20.7
      elsif b.include?('３個')
        self.tamago_vw = 84 * 3.2
        self.tamago_fm = 84 * 0.000001 * 15396 * 20.7
      elsif b.include?('４個')
        self.tamago_vw = 112 * 3.2
        self.tamago_fm = 112 * 0.000001 * 15396 * 20.7
      elsif b.include?('５個')
        self.tamago_vw = 140 * 3.2
        self.tamago_fm = 140 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2個')
        self.tamago_vw = 14 * 3.2
        self.tamago_fm = 14 * 0.000001 * 15396 * 20.7
      else
        self.tamago_vw = b.to_f / 2.000 * 3.2
        self.tamago_fm = b.to_f / 2.00 * 56 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('米') || a.include?('もち米')
      b = a["米"] || a["もち米"]
      if b.include?('２合') || b.include?('２カップ')
        self.kome_vw = 360 / 2 * 3.7
        self.kome_fm = 360 / 2 * 0.000001 * 15396 * 9.6
      elsif b.include?('１合') || b.include?('１カップ')
        self.kome_vw = 180 / 2 * 3.7
        self.kome_fm = 180 / 2 * 0.000001 * 15396 * 9.6
      elsif b.include?('３カップ') || b.include?('３合')
        self.kome_vw = 540 / 2 * 3.7
        self.kome_fm = 540 / 2 * 0.000001 * 15396 * 9.6
      elsif b == "1/2カップ"
        self.kome_vw = 90 / 2 * 3.7
        self.kome_fm = 90 / 2 * 0.000001 * 15396 * 9.6
      elsif b.include?('1.5合') || b.include?('1.5カップ') || b == "１　1/2カップ(270ml)" || b == "１　1/2カップ(270cc)"
        self.kome_vw = 270 / 2 * 3.7
        self.kome_fm = 270 / 2 * 0.000001 * 15396 * 9.6
      elsif b == "２　1/2カップ(450cc)"
        self.kome_vw = 450 / 2 * 3.7
        self.kome_fm = 450 / 2 * 0.000001 * 15396 * 9.6
      end
    end
    if a.include?('ご飯')
      b = a["ご飯"]
      if b == "茶碗１杯分" || b == "１カップ"
        self.gohan_vw = 2 * 150 * 3.7
        self.gohan_fm = 2 * 150 * 0.000001 * 15396 * 9.6
      elsif b == "茶碗２杯分" || b == "２皿分" || b == "２杯"
        self.gohan_vw = 2 * 300 * 3.7
        self.gohan_fm = 2 * 300 * 0.000001 * 15396 * 9.6
      elsif b == "どんぶり２杯分"
        self.gohan_vw = 400 / 2 * 3.7
        self.gohan_fm = 400 / 2 * 0.000001 * 15396 * 9.6
      elsif b == "茶碗３杯分"
        self.gohan_vw = 450 / 2 * 3.7
        self.gohan_fm = 450 / 2 * 0.000001 * 15396 * 9.6
      else
        self.gohan_vw = b.to_f / 2 * 3.7
        self.gohan_fm = b.to_f / 2 * 0.000001 * 15396 * 9.6
      end
    end
    if a.include?('食パン') || a.include?('フランスパン') || a.include?('パン')
      b = a["食パン"] || a['フランスパン'] || a['パン']
      if b == "２個" || b == "２枚"
        self.pan_vw = 2.0 / 2.000 * 60 * 1.600
        self.pan_fm = 2.0 / 2.000 * 60 * 0.000001 * 15396 * 20.7
      elsif b == "４枚" || b == "４個"
        self.pan_vw = 4.0 / 2.000 * 60 * 1.600
        self.pan_fm = 4.0 / 2.000 * 60 * 0.000001 * 15396 * 20.7
      else
        self.pan_vw = b.to_f / 2.000 * 60 * 1.600
        self.pan_fm = b.to_f / 2.000 * 60 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('うどん')
      b = a["うどん"]
      if b == "２玉"
        self.udon_vw = 320 / 2 * 1.6
        self.udon_fm = 320 / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('そうめん')
      b = a["そうめん"]
      self.soumen_vw = b.to_f / 2 * 2.00
      self.soumen_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
    end
    if a.include?('そば')
      b = a["そば"]
      self.soba_vw = b.to_f / 2 * 4.6
      self.soba_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
    end
    if a.include?('スパゲッティ') || a.include?('パスタ') || a.include?('マカロニ')
      b = a["スパゲッティ"] || a["パスタ"] || a["マカロニ"]
      self.supagety_vw = b.to_f / 2.000 * 2.00
      self.supagety_fm = b.to_f / 2.000 * 0.000001 * 15396 * 20.7
    end
    if a.include?('ラーメン')
      b = a["ラーメン"]
      if b == "２食"
        self.ramen_vw = 65 * 1.85
        self.ramen_fm = 65 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('大根') || a.include?('大根おろし')
      b = a["大根"] || a["大根おろし"]
      if b == "１カップ"
        self.daikon_vw = 100 * 0.128
        self.daikon_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b == "1/2カップ"
        self.daikon_vw = 50 * 0.128
        self.daikon_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b == "1/2本"
        self.daikon_vw = 250 * 0.128
        self.daikon_fm = 250 * 0.000001 * 15396 * 20.7
      elsif b == "1/3本"
        self.daikon_vw = 200 * 0.128
        self.daikon_fm = 200 * 0.000001 * 15396 * 20.7
      elsif b == "1/5本"
        self.daikon_vw = 125 * 0.128
        self.daikon_fm = 125 * 0.000001 * 15396 * 20.7
      elsif b == "10cm"
        self.daikon_vw = 150 * 0.128
        self.daikon_fm = 150 * 0.000001 * 15396 * 20.7
      elsif b == "５cm"
        self.daikon_vw = 75 * 0.128
        self.daikon_fm = 75 * 0.000001 * 15396 * 20.7
      elsif b == "４cm"
        self.daikon_vw = 60 * 0.128
        self.daikon_fm = 60 * 0.000001 * 15396 * 20.7
      elsif b == "３cm"
        self.daikon_vw = 40 * 0.128
        self.daikon_fm = 40 * 0.000001 * 15396 * 20.7
      elsif b == "大さじ３"
        self.daikon_vw = 18 * 3 / 2 * 0.128
        self.daikon_fm = 18 * 3 / 2 * 0.000001 * 15396 * 20.7
      elsif b == "大さじ２"
        self.daikon_vw = 18 * 0.128
        self.daikon_fm = 18 * 0.000001 * 15396 * 20.7
      else
        self.daikon_vw = b.to_f / 2 * 0.128
        self.daikon_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('かぶ')
      b = a["かぶ"]
      if b == "１個"
        self.kabu_vw = 40 * 0.208
        self.kabu_fm = 40 * 0.000001 * 15396 * 20.7
      elsif b == "２個"
        self.kabu_vw = 80 * 0.208
        self.kabu_fm = 80 * 0.000001 * 15396 * 20.7
      else
        self.kabu_vw = b.to_f * 40 * 0.208
        self.kabu_fm = b.to_f * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('にんじん')
      b = a["にんじん"]
      if b == "１本"
        self.ninjin_vw = 75 * 0.183
        self.ninjin_fm = 75 * 0.000001 * 15396 * 20.7
      elsif b == "２本"
        self.ninjin_vw = 150 * 0.183
        self.ninjin_fm = 150 * 0.000001 * 15396 * 20.7
      elsif b == "1/2本"
        self.ninjin_vw = 40 * 0.183
        self.ninjin_fm = 40 * 0.000001 * 15396 * 20.7
      elsif b == "1/3本"
        self.ninjin_vw = 30 * 0.183
        self.ninjin_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b == "1/4本" || b == "４cm"
        self.ninjin_vw = 20 * 0.183
        self.ninjin_fm = 20 * 0.000001 * 15396 * 20.7
      elsif b == "６cm"
        self.ninjin_vw = 30 * 0.183
        self.ninjin_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b == "２cm"
        self.ninjin_vw = 10 * 0.183
        self.ninjin_fm = 10 * 0.000001 * 15396 * 20.7
      else
        self.ninjin_vw = b.to_f / 2.000 * 0.183
        self.ninjin_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('ごぼう')
      b = a["ごぼう"]
      if b == "１本"
        self.gobou_vw = 100 * 0.44
        self.gobou_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b == "1/2本"
        self.gobou_vw = 50 * 0.44
        self.gobou_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b == "1/4本"
        self.gobou_vw = 25 * 0.44
        self.gobou_fm = 25 * 0.000001 * 15396 * 20.7
      else
        self.gobou_vw = b.to_f / 2 * 0.44
        self.gobou_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('れんこん')
      b = a["れんこん"]
      self.renkon_vw = b.to_f / 2 * 0.665
      self.renkon_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
    end
    if a.include?('里いも')
      b = a["里いも"]
      if b == "３個"
        self.satoimo_vw = 100 * 0.673
        self.satoimo_fm = 100 * 0.000001 * 15396 * 20.7
      else
        self.satoimo_vw = b.to_f / 2 * 0.673
        self.satoimo_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('長いも')
      b = a["長いも"]
      if b == "４cm"
        self.yamaimo_vw = 50 * 0.392
        self.yamaimo_fm = 50 * 0.000001 * 15396 * 20.7
      else
        self.yamaimo_vw = b.to_f / 2 * 0.392
        self.yamaimo_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('白菜') || a.include?('白菜キムチ')
      b = a["白菜"] || a["白菜キムチ"]
      if b == "２枚"
        self.hakusai_vw = 100 * 0.079
        self.hakusai_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b == "４枚"
        self.hakusai_vw = 200 * 0.079
        self.hakusai_fm = 200 * 0.000001 * 15396 * 20.7
      elsif b == "1/4株"
        self.hakusai_vw = 75 * 0.079
        self.hakusai_fm = 75 * 0.000001 * 15396 * 20.7
      elsif b == "１枚"
        self.hakusai_vw = 50 * 0.079
        self.hakusai_fm = 50 * 0.000001 * 15396 * 20.7
      else
        self.hakusai_vw = b.to_f / 2.000 * 0.079
        self.hakusai_fm = b.to_f / 2.000 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('キャベツ')
      b = a["キャベツ"]
      if b == "１枚"
        self.kyabetsu_vw = 25 * 0.117
        self.kyabetsu_fm = 25 * 0.000001 * 15396 * 20.7
      elsif b == "２枚"
        self.kyabetsu_vw = 50 * 0.117
        self.kyabetsu_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b == "３枚"
        self.kyabetsu_vw = 75 * 0.117
        self.kyabetsu_fm = 75 * 0.000001 * 15396 * 20.7
      elsif b == "４枚" || b == "1/6個"
        self.kyabetsu_vw = 100 * 0.117
        self.kyabetsu_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b == "５枚"
        self.kyabetsu_vw = 125 * 0.117
        self.kyabetsu_fm = 125 * 0.000001 * 15396 * 20.7
      elsif b == "1/4個"
        self.kyabetsu_vw = 150 * 0.117
        self.kyabetsu_fm = 150 * 0.000001 * 15396 * 20.7
      elsif b == "1/3個" || b == "８枚"
        self.kyabetsu_vw = 200 * 0.117
        self.kyabetsu_fm = 200 * 0.000001 * 15396 * 20.7
      else
        self.kyabetsu_vw = b.to_f / 2.000 * 0.117
        self.kyabetsu_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('ほうれん草')
      b = a["ほうれん草"]
      if  b == "1/2わ" || b == "1/2束"
        self.hourensou_vw = 50 * 0.246
        self.hourensou_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b == "１わ"
        self.hourensou_vw = 100 * 0.246
        self.hourensou_fm = 100 * 0.000001 * 15396 * 20.7
      else
        self.hourensou_vw = b.to_f / 2 * 0.246
        self.hourensou_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('ねぎ') || a.include?('長ねぎ')
      b = a["ねぎ"] || a["長ねぎ"]
      if b == "小さじ１"
        self.negi_vw = 1 * 0.433
        self.negi_fm = 1 * 0.000001 * 15396 * 20.7
      elsif b == "小さじ２" || b == "適宣"
        self.negi_vw = 2 * 0.433
        self.negi_fm = 2 * 0.000001 * 15396 * 20.7
      elsif b == "大さじ１"
        self.negi_vw = 2.5 * 0.433
        self.negi_fm = 2.5 * 0.000001 * 15396 * 20.7
      elsif b == "大さじ２" || b == "5cm" || b == "５cm"
        self.negi_vw = 5 * 0.433
        self.negi_fm = 5 * 0.000001 * 15396 * 20.7
      elsif b == "10cm"
        self.negi_vw = 10 * 0.433
        self.negi_fm = 10 * 0.000001 * 15396 * 20.7
      elsif b == "1/4本"
        self.negi_vw = 25 / 2 * 0.433
        self.negi_fm = 25 / 2 * 0.000001 * 15396 * 20.7
      elsif b == "1/3本"
        self.negi_vw = 100 / 6 * 0.433
        self.negi_fm = 100 / 6 * 0.000001 * 15396 * 20.7
      elsif b == "1/2本"
        self.negi_vw = 25 * 0.433
        self.negi_fm = 25 * 0.000001 * 15396 * 20.7
      elsif b == "１本"
        self.negi_vw = 50 * 0.433
        self.negi_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b == "２本"
        self.negi_vw = 100 * 0.433
        self.negi_fm = 100 * 0.000001 * 15396 * 20.7
      else
        self.negi_vw = b.to_f / 2 * 0.433
        self.negi_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('玉ねぎ')
      b = a['玉ねぎ']
      if b == "大さじ１" || b == "適宣"
        self.tamanegi_vw = 5 * 0.158
        self.tamanegi_fm = 5 * 0.000001 * 15396 * 20.7
      elsif b == "1/8個"
        self.tamanegi_vw = 25 / 2 * 0.158
        self.tamanegi_fm = 25 / 2 * 0.000001 * 15396 * 20.7
      elsif b == "1/6個"
        self.tamanegi_vw = 50 / 3 * 0.158
        self.tamanegi_fm = 50 / 3 * 0.000001 * 15396 * 20.7
      elsif b == "大さじ４"
        self.tamanegi_vw = 20 * 0.158
        self.tamanegi_fm = 20 * 0.000001 * 15396 * 20.7
      elsif b == "1/4個"
        self.tamanegi_vw = 25 * 0.158
        self.tamanegi_fm = 25 * 0.000001 * 15396 * 20.7
      elsif b == "小1/2個"
        self.tamanegi_vw = 40 * 0.158
        self.tamanegi_fm = 40 * 0.000001 * 15396 * 20.7
      elsif b == "1/2個"
        self.tamanegi_vw = 50 * 0.158
        self.tamanegi_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b == "小１個"
        self.tamanegi_vw = 80 * 0.158
        self.tamanegi_fm = 80 * 0.000001 * 15396 * 20.7
      elsif b == "１個"
        self.tamanegi_vw = 100 * 0.158
        self.tamanegi_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b == "小２個"
        self.tamanegi_vw = 160 * 0.158
        self.tamanegi_fm = 160 * 0.000001 * 15396 * 20.7
      elsif b == "２個"
        self.tamanegi_vw = 200 * 0.158
        self.tamanegi_fm = 200 * 0.000001 * 15396 * 20.7
      else
        self.tamanegi_vw = b.to_f / 2 * 0.158
        self.tamanegi_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('なす')
      b = a["なす"]
      if b == "２個"
        self.nasu_vw = 80 * 0.185
        self.nasu_fm = 80 * 0.000001 * 15396 * 20.7
      elsif b == "４個"
        self.nasu_vw = 160 * 0.185
        self.nasu_fm = 160 * 0.000001 * 15396 * 20.7
      elsif b == "５個"
        self.nasu_vw = 200 * 0.185
        self.nasu_fm = 200 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('トマト')
      b = a["トマト"]
      if b == "1/4個" || b == "適宣"
        self.tomato_vw = 75 / 4 * 0.131
        self.tomato_fm = 75 / 4 * 0.000001 * 15396 * 20.7
      elsif b == "1/2個"
        self.tomato_vw = 75 / 2 * 0.131
        self.tomato_fm = 75 / 2 * 0.000001 * 15396 * 20.7
      elsif b == "１個"
        self.tomato_vw = 75 * 0.131
        self.tomato_fm = 75  * 0.000001 * 15396 * 20.7
      elsif b == "４個"
        self.tomato_vw = 300 * 0.131
        self.tomato_fm = 300 * 0.000001 * 15396 * 20.7
      else
        self.tomato_vw = b.to_f / 2 * 0.131
        self.tomato_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('ミニトマト')
      b = a['ミニトマト']
      if b == "４個"
        self.tomato_vw = 20 * 0.131
        self.tomato_fm = 20 * 0.000001 * 15396 * 20.7
      elsif b == "10個"
        self.tomato_vw = 50 * 0.131
        self.tomato_fm = 50 * 0.000001 * 15396 * 20.7
      else
        self.tomato_vw = b.to_f / 2 * 0.131
        self.tomato_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?("きゅうり")
      b = a["きゅうり"]
      if b.include?('1/3本')
        self.kyuri_vw = 15 * 0.123
        self.kyuri_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2本')
        self.kyuri_vw = 25 * 0.123
        self.kyuri_fm = 25 * 0.000001 * 15396 * 20.7
      elsif b.include?('１本')
        self.kyuri_vw = 45 * 0.123
        self.kyuri_fm = 45 * 0.000001 * 15396 * 20.7
      elsif b.include?('２本')
        self.kyuri_vw = 90 * 0.123
        self.kyuri_fm = 90 * 0.000001 * 15396 * 20.7
      elsif b == "４cm" || b == "５cm" || b == "６cm"
        self.kyuri_vw = 90 / 8 * 0.123
        self.kyuri_fm = 90 / 8 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?("かぼちゃ")
      b = a["かぼちゃ"]
      if b.include?('1/4個') || b.include?('1/6個')
        self.kabotya_vw = 125 * 0.309
        self.kabotya_fm = 125 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/8個')
        self.kabotya_vw = 100 * 0.309
        self.kabotya_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/10個') || b.include?('1/12個') || b == "正味100g"
        self.kabotya_vw = 50 * 0.309
        self.kabotya_fm = 50 * 0.000001 * 15396 * 20.7
      else
        self.kabotya_vw = b.to_f / 2 * 0.309
        self.kabotya_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('ピーマン')
      b = a["ピーマン"]
      if b.include?('2個')
        self.pyman_vw = 40 * 0.193
        self.pyman_fm = 40 * 0.000001 * 15396 * 20.7
      elsif b.include?('１個')
        self.pyman_vw = 15 * 0.193
        self.pyman_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2個') || b.include?('適宜')
        self.pyman_vw = 15 / 2 * 0.193
        self.pyman_fm = 15 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4個')
        self.pyman_vw = 15 / 4 * 0.193
        self.pyman_fm = 15 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('３個')
        self.pyman_vw = 45 * 0.193
        self.pyman_fm = 45 * 0.000001 * 15396 * 20.7
      elsif b.include?('５個')
        self.pyman_vw = 75 / 2 * 0.193
        self.pyman_fm = 75 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小６～８個')
        self.pyman_vw = 90 * 0.193
        self.pyman_fm = 90 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('さやえんどう')
      b = a["さやえんどう"]
      if b.include?('１パック') || b == "20枚"
        self.endou_vw = 50 * 0.547
        self.endou_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b == "６個"
        self.endou_vw = 15 * 0.547
        self.endou_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b == "10個" || b == "1/2袋"
        self.endou_vw = 25 * 0.547
        self.endou_fm = 25 * 0.000001 * 15396 * 20.7
      elsif b == "８個" || b == "８本" || b == "８～10個"
        self.endou_fm = 20 * 0.547
        self.endou_fm = 20 * 0.000001 * 15396 * 20.7
      elsif b == "４個"
        self.endou_fm = 10 * 0.547
        self.endou_fm = 10 * 0.000001 * 15396 * 20.7
      else
        self.endou_vw = b.to_f / 2.000 * 0.547
        self.endou_fm = b.to_f / 2.000 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('枝豆')
      b = a["枝豆"]
      if b.include?('約250g（正味1/2カップ）') || b.include?('(正味)1/2カップ')
        self.edamame_vw = 125 * 0.672
        self.edamame_fm = 125 * 0.000001 * 15396 * 20.7
      elsif b.include?('１カップ弱')
        self.edamame_vw = 250 * 0.672
        self.edamame_fm = 250 * 0.000001 * 15396 * 20.7
      elsif b.include?('50g（1/3カップ）')
        self.edamame_vw = 25 * 0.672
        self.edamame_fm = 25 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4カップ(30g)')
        self.edamame_vw = 15 * 0.672
        self.edamame_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b.include?('10さや（30粒）')
        self.edamame_vw = 20 * 0.672
        self.edamame_fm = 20 * 0.000001 * 15396 * 20.7
      else
        self.edamame_vw = b.to_f / 2.000 * 0.672
        self.edamame_fm = b.to_f / 2.000 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('いんげん')
      b = a["いんげん"]
      self.ingen_vw = b.to_f / 2.000 * 0.311
      self.ingen_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
    end
    if a.include?('とうもろこし') || a.include?('コーン')
      b = a["とうもろこし"] || a['コーン']
      if b.include?('１本')
        self.tomorokoshi_vw = 125 * 0.434
        self.tomorokoshi_fm = 125 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2本')
        self.tomorokoshi_vw = 125 / 2 * 0.434
        self.tomorokoshi_fm = 125 / 2 * 0.000001 * 15396 * 20.7
      elsif b == "大さじ２" || b == "大さじ３" || b == "正味大さじ２"
        self.tomorokoshi_vw = 30 * 0.434
        self.tomorokoshi_fm = 30 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('レタス')
      b = a["レタス"]
      if b.include?('１個') || b.include?('１株')
        self.retasu_vw = 150 * 0.165
        self.retasu_fm = 150 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2個')
        self.retasu_vw = 75 * 0.165
        self.retasu_fm = 75 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/3個')
        self.retasu_vw = 50 * 0.165
        self.retasu_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4個')
        self.retasu_vw = 75 / 2 * 0.165
        self.retasu_fm = 75 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('２枚') || b.include?('適宜')
        self.retasu_vw = 30 * 0.165
        self.retasu_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b.include?('３枚')
        self.retasu_vw = 45 * 0.165
        self.retasu_fm = 45 * 0.000001 * 15396 * 20.7
      elsif b.include?('４枚')
        self.retasu_vw = 60 * 0.165
        self.retasu_fm = 60 * 0.000001 * 15396 * 20.7
      elsif b.include?('５枚')
        self.retasu_vw = 75 * 0.165
        self.retasu_fm = 75 * 0.000001 * 15396 * 20.7
      elsif b.include?('６枚')
        self.retasu_vw = 90 * 0.165
        self.retasu_fm = 90 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2枚')
        self.retasu_vw = 15 / 2 * 0.165
        self.retasu_fm = 15 / 2 * 0.000001 * 15396 * 20.7
      else
        self.retasu_vw = b.to_f / 2.000 * 0.165
        self.retasu_fm = b.to_f / 2.000 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('セロリ')
      b = a["セロリ"]
      if b.include?('１本')
        self.serori_vw = 80 * 0.129
        self.serori_fm = 80 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2本')
        self.serori_vw = 40 * 0.129
        self.serori_fm = 40 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/3本')
        self.serori_vw = 80 / 3 * 0.129
        self.serori_fm = 80 / 3 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4本')
        self.serori_vw = 20 * 0.129
        self.serori_fm = 20 * 0.000001 * 15396 * 20.7
      elsif b == "２本" || b == "２～３本" || b == "小２本"
        self.serori_vw = 160 * 0.129
        self.serori_fm = 160 * 0.000001 * 15396 * 20.7
      elsif b == "３本"
        self.serori_vw = 240 * 0.129
        self.serori_fm = 240 * 0.000001 * 15396 * 20.7
      else
        self.serori_vw = b.to_f / 2 * 0.129
        self.serori_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('カリフラワー')
      b = a["カリフラワー"]
      if b.include?('１個')
        self.karifura_vw = 225 * 0.166
        self.karifura_fm = 225 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2')
        self.karifura_vw = 115 * 0.166
        self.karifura_fm = 115 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/3')
        self.karifura_vw = 225 / 3 * 0.166
        self.karifura_fm = 225 / 3 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4')
        self.karifura_vw = 115 / 2 * 0.166
        self.karifura_fm = 115 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/5')
        self.karifura_vw = 225 / 5 * 0.166
        self.karifura_fm = 225 / 5 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/6')
        self.karifura_vw = 225 / 6 * 0.166
        self.karifura_fm = 225 / 6 * 0.000001 * 15396 * 20.7
      elsif b == "４房"
        self.karifura_vw = 20 * 0.166
        self.karifura_fm = 20 * 0.000001 * 15396 * 20.7
      elsif b == "小房１個"
        self.karifura_vw = 5 * 0.166
        self.karifura_fm = 5 * 0.000001 * 15396 * 20.7
      else
        self.karifura_vw = b.to_f / 2 * 0.166
        self.karifura_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('ブロッコリー')
      b = a["ブロッコリー"]
      if b == "小１個(約220g)" || b == "小１個"
        self.buro_vw = 110 * 0.314
        self.buro_fm = 110 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2個')
        self.buro_vw = 75 * 0.314
        self.buro_fm = 75 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2株')
        self.buro_vw = 50 * 0.314
        self.buro_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4') || b.include?('1/3個') || b.include?('1/6個') || b == "５房"
        self.buro_vw = 25 * 0.314
        self.buro_fm = 25 * 0.000001 * 15396 * 20.7
      elsif b.include?('大１個(約400g)')
        self.buro_vw = 200 * 0.314
        self.buro_fm = 200 * 0.000001 * 15396 * 20.7
      elsif b == "小1/2個"
        self.buro_vw = 55 * 0.314
        self.buro_fm = 55 * 0.000001 * 15396 * 20.7
      elsif b == "(約80g)"
        self.buro_vw = 40 * 0.314
        self.buro_fm = 40 * 0.000001 * 15396 * 20.7
      elsif b == "４房"
        self.buro_vw = 20 * 0.314
        self.buro_fm = 20 * 0.000001 * 15396 * 20.7
      elsif b == "６房"
        self.buro_vw = 30 * 0.314
        self.buro_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b == "２～３房"
        self.buro_vw = 15 * 0.314
        self.buro_fm = 15 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('じゃがいも')
      b = a["じゃがいも"]
      if b.include?('１個')
        self.jaga_vw = 50 * 0.185
        self.jaga_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b.include?('２個') || b == "５個(約200g)" || b.include?('大１個')
        self.jaga_vw = 100 * 0.185
        self.jaga_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b.include?('３個') || b == "中３～４個(300g)"
        self.jaga_vw = 150 * 0.185
        self.jaga_fm = 150 * 0.000001 * 15396 * 20.7
      elsif b.include?('６')
        self.jaga_vw = 350 * 0.185
        self.jaga_fm = 350 * 0.000001 * 15396 * 20.7
      elsif b == "1/2個(90g)"
        self.jaga_vw = 45 * 0.185
        self.jaga_fm = 45 * 0.000001 * 15396 * 20.7
      elsif b.include?('大２個')
        self.jaga_vw = 200 * 0.185
        self.jaga_fm = 200 * 0.000001 * 15396 * 20.7
      elsif b == "中2個(260g)" || b == "２個(約250g)"
        self.jaga_vw = 130 * 0.185
        self.jaga_fm = 130 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('さつまいも')
      b = a["さつまいも"]
      if b.include?('１本')
        self.satsumaimo_vw = 125 * 0.202
        self.satsumaimo_fm = 125 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2本')
        self.satsumaimo_vw = 125 / 2 * 0.202
        self.satsumaimo_fm = 125 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/3本')
        self.satsumaimo_vw = 35 * 0.202
        self.satsumaimo_fm = 35 * 0.000001 * 15396 * 20.7
      elsif b == "大１本（400～500g）"
        self.satsumaimo_vw = 225 * 0.202
        self.satsumaimo_fm = 225 * 0.000001 * 15396 * 20.7
      elsif b.include?('小１本')
        self.satsumaimo_vw = 100 * 0.202
        self.satsumaimo_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4本')
        self.satsumaimo_vw = 125 / 4 * 0.202
        self.satsumaimo_fm = 125 / 4 * 0.000001 * 15396 * 20.7
      elsif b == "２本（300g）"
        self.satsumaimo_vw = 150 * 0.202
        self.satsumaimo_fm = 150 * 0.000001 * 15396 * 20.7
      elsif b.include?('小1/2本')
        self.satsumaimo_vw = 50 * 0.202
        self.satsumaimo_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b.include?('小1/4本')
        self.satsumaimo_vw = 25 * 0.202
        self.satsumaimo_fm = 25 * 0.000001 * 15396 * 20.7
      elsif b == "180ｇ（約１本）"
        self.satsumaimo_vw = 90 * 0.202
        self.satsumaimo_fm = 90 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('にんにく')
      b = a["にんにく"]
      if b.include?('１片')
        self.ninniku_vw = 15 / 2 * 2.317
        self.ninniku_fm = 15 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('２片')
        self.ninniku_vw = 15 * 2.317
        self.ninniku_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b.include?('３片')
        self.ninniku_vw = 45 / 2 * 2.317
        self.ninniku_fm = 45 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2片')
        self.ninniku_vw = 15 / 4 * 2.317
        self.ninniku_fm = 15 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4')
        self.ninniku_vw = 15 / 8 * 2.317
        self.ninniku_fm = 15 / 8 * 0.000001 * 15396 * 20.7
      elsif b.include?('1株')
        self.ninniku_vw = 45 * 2.317
        self.ninniku_fm = 45 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('しいたけ')
      b = a["しいたけ"]
      if b.include?('１枚')
        self.shitake_vw = 5 * 3.125
        self.shitake_fm = 5 * 0.000001 * 15396 * 20.7
      elsif b.include?('２枚')
        self.shitake_vw = 10 * 3.125
        self.shitake_fm = 10 * 0.000001 * 15396 * 20.7
      elsif b.include?('３')
        self.shitake_vw = 15 * 3.125
        self.shitake_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b.include?('４枚')
        self.shitake_vw = 20 * 3.125
        self.shitake_fm = 20 * 0.000001 * 15396 * 20.7
      elsif b.include?('５枚')
        self.shitake_vw = 25 * 3.125
        self.shitake_fm = 25 * 0.000001 * 15396 * 20.7
      elsif b.include?('６枚')
        self.shitake_vw = 30 * 3.125
        self.shitake_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b.include?('８枚')
        self.shitake_vw = 40 * 3.125
        self.shitake_fm = 40 * 0.000001 * 15396 * 20.7
      elsif b.include?('１パック')
        self.shitake_vw = 50 * 3.125
        self.shitake_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b.include?('２パック')
        self.shitake_vw = 100 * 3.125
        self.shitake_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b == " 各50g"
        self.shitake_vw = 25 * 3.125
        self.shitake_fm = 25 * 0.000001 * 15396 * 20.7
      else
        self.shitake_vw = b.to_f / 2.000 * 3.125
        self.shitake_fm = b.to_f / 2.000 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('栗')
      b = a['栗']
      if b.include?('８個')
        self.kuri_vw = 60 * 7.145
        self.kuri_vw = 60 * 0.000001 * 15396 * 20.7
      elsif b.include?('10個')
        self.kuri_vw = 75 * 7.145
        self.kuri_fm = 75 * 0.000001 * 15396 * 20.7
      elsif b.include?('４個')
        self.kuri_vw = 30 * 7.145
        self.kuri_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b.include?('３粒') || b.include?('適宜')
        self.kuri_vw = 45 / 2 * 7.145
        self.kuri_fm = 45 / 2 * 0.000001 * 15396 * 20.7
      else
        self.kuri_vw = b.to_f / 2.000 * 7.145
        self.kuri_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('大豆')
      b = a['大豆']
      if b.include?('１缶') || b.include?('１カップ')
        self.daizu_vw = 75 * 2.5
        self.daizu_fm = 75 * 0.000001 * 15396 * 9.6
      elsif b.include?('1/2缶')
        self.daizu_vw = 30 * 2.5
        self.daizu_fm = 30 * 0.000001 * 15396 * 9.6
      else
        self.daizu_vw = b.to_f / 2.000 * 2.500
        self.daizu_fm = b.to_f / 2 * 0.000001 * 15396 * 9.6
      end
    end
    if a.include?('オレンジ')
      b = a["オレンジ"]
      if b.include?('１個')
        self.orange_vw = 225 / 2 * 0.581
        self.orange_fm = 225 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('２個')
        self.orange_vw = 225 * 0.581
        self.orange_fm = 225 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('りんご')
      b = a["りんご"]
      if b.include?('１個')
        self.ringo_vw = 315 / 2 * 0.347
        self.ringo_fm = 315 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2個')
        self.ringo_vw = 315 / 4 * 0.347
        self.ringo_fm = 315 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4個')
        self.ringo_vw = 315 / 8 * 0.347
        self.ringo_fm = 315 / 8 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('ぶどう')
      b = a["ぶどう"]
      self.budou_vw = b.to_f / 2 * 0.706
      self.budou_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
    end
    if a.include?('柿')
      b = a["柿"]
      if b.include?('１個')
        self.kaki_vw = 80 * 0.696
        self.kaki_fm = 80 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('いちご')
      b = a["いちご"]
      if b.include?('４個')
        self.ichigo_vw = 30 * 0.682
        self.ichigo_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b.include?('９個')
        self.ichigo_vw = 135 / 2 * 0.682
        self.ichigo_fm = 135 / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('豆腐') || a.include?('もめん豆腐')
      b = a["豆腐"] || a['もめん豆腐']
      if b.include?('１丁')
        self.touhu_vw = 150 * 0.2509
        self.touhu_fm = 150 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2丁')
        self.touhu_vw = 75 * 0.2509
        self.touhu_fm = 75 * 0.000001 * 15396 * 20.7
      elsif b.include?('2/3丁')
        self.touhu_vw = 100 * 0.2509
        self.touhu_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/3丁')
        self.touhu_vw = 50 * 0.2509
        self.touhu_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b.include?('１/4丁')
        self.touhu_vw = 75 / 2 * 0.2509
        self.touhu_fm = 75 / 2 * 0.000001 * 15396 * 20.7
      elsif b == "１個(350ｇ)"
        self.touhu_vw = 175 * 0.2509
        self.touhu_fm = 175 * 0.000001 * 15396 * 20.7
      else
        self.touhu_vw = b.to_f / 2 * 0.2509
        self.touhu_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('こんにゃく')
      b = a["こんにゃく"]
      if b.include?('１枚')
        self.konnyaku_vw = 125 * 0.805
        self.konnyaku_fm = 125 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2')
        self.konnyaku_vw = 125 / 2 * 0.805
        self.konnyaku_fm = 125 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/3枚')
        self.konnyaku_vw = 125 / 3 * 0.805
        self.konnyaku_fm = 125 / 3 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4')
        self.konnyaku_vw = 125 / 4 * 0.805
        self.konnyaku_fm = 125 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('小１枚(150g)') || b == "150g"
        self.konnyaku_vw = 75 * 0.805
        self.konnyaku_fm = 75 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2枚（約100ｇ）') || b.include?('100g')
        self.konnyaku_vw = 50 * 0.805
        self.konnyaku_fm = 50 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('バター')
      b = a["バター"]
      if b.include?('大さじ１')
        self.bata_vw = 15 / 2 * 13.2
        self.bata_fm = 15 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.bata_vw = 15 * 13.2
        self.bata_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３')
        self.bata_vw = 45 / 2 * 13.2
        self.bata_fm = 46 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ1/2')
        self.bata_vw = 15 / 4 * 13.2
        self.bata_fm = 15 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１') || b.include?('少々') || b.include?('適宜')
        self.bata_vw = 5 / 2 * 13.2
        self.bata_fm = 5 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ２')
        self.bata_vw = 5 * 13.2
        self.bata_fm = 5 * 0.000001 * 15396 * 20.7
      else
        self.bata_vw = b.to_f / 2 * 13.2
        self.bata_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('チーズ') || a.include?('粉チーズ')
      b = a["チーズ"] || a['粉チーズ']
      if b.include?('大さじ１')
        self.cheese_vw = 15 / 2 * 3.2
        self.cheese_fm = 15 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.cheese_vw = 15 * 3.2
        self.cheese_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３')
        self.cheese_vw = 45 / 2 * 3.2
        self.cheese_fm = 45 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ４')
        self.cheese_vw = 30 * 3.2
        self.cheese_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ５')
        self.cheese_vw = 75 / 2 * 3.2
        self.cheese_fm = 75 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ６')
        self.cheese_vw = 45 * 3.2
        self.cheese_fm = 45 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１') || b.include?('少々')
        self.cheese_vw = 5 / 2 * 3.2
        self.cheese_fm = 5 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ２') || b.include?('適宜')
        self.cheese_vw = 5 * 3.2
        self.cheese_fm = 5 * 0.000001 * 15396 * 20.7
      elsif b.include?('１枚')
        self.cheese_vw = 9 * 3.2
        self.cheese_fm = 9 * 0.000001 * 15396 * 20.7
      elsif b.include?('２枚')
        self.cheese_vw = 18 * 3.2
        self.cheese_fm = 18 * 0.000001 * 15396 * 20.7
      elsif b.include?('４枚')
        self.cheese_vw = 36 * 3.2
        self.cheese_fm = 36 * 0.000001 * 15396 * 20.7
      elsif b.include?('１個(250g)')
        self.cheese_vw = 125 * 3.2
        self.cheese_fm = 125 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4個')
        self.cheese_vw = 125 / 4 * 3.2
        self.cheese_fm = 125 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('１袋(200g)') || b.include?('１個(200g)')
        self.cheese_vw = 100 * 3.2
        self.cheese_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2カップ')
        self.cheese_vw = 45 / 2 * 3.2
        self.cheese_fm = 45 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('3/4カップ')
        self.cheese_vw = 270 / 8 * 3.2
        self.cheese_fm = 270 / 8 * 0.000001 * 15396 * 20.7
      elsif b.include?('１　1/2枚')
        self.cheese_vw = 27 / 2 * 3.2
        self.cheese_fm = 27 / 2 * 0.000001 * 15396 * 20.7
      else
        self.cheese_vw = b.to_f / 2 * 3.2
        self.cheese_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('牛乳')
      b = a["牛乳"]
      if b.include?('大さじ1')
        self.gyunyu_vw = 15 / 2 * 0.550
        self.gyunyu_fm = 15 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.gyunyu_vw = 15 * 0.550
        self.gyunyu_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３')
        self.gyunyu_vw = 45 / 2 * 0.550
        self.gyunyu_fm = 45 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ４')
        self.gyunyu_vw = 30 * 0.550
        self.gyunyu_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ５')
        self.gyunyu_vw = 75 / 2 * 0.550
        self.gyunyu_fm = 75 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ８')
        self.gyunyu_vw = 60 * 0.550
        self.gyunyu_fm = 60 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ1/2')
        self.gyunyu_vw = 15 / 4 * 0.550
        self.gyunyu_fm = 15 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１')
        self.gyunyu_vw = 5 / 2 * 0.550
        self.gyunyu_fm = 5 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/2')
        self.gyunyu_vw = 5 / 4 * 0.550
        self.gyunyu_fm = 5 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('２カップ')
        self.gyunyu_vw = 210 * 0.550
        self.gyunyu_fm = 210 * 0.000001 * 15396 * 20.7
      elsif b.include?('１カップ')
        self.gyunyu_vw = 105 * 0.550
        self.gyunyu_fm = 105 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2カップ')
        self.gyunyu_vw = 105 / 2 * 0.550
        self.gyunyu_fm = 105 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4カップ')
        self.gyunyu_vw = 105 / 4 * 0.550
        self.gyunyu_fm = 105 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('3/4カップ')
        self.gyunyu_vw = 315 / 4 * 0.550
        self.gyunyu_fm = 315 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('2/3カップ')
        self.gyunyu_vw = 210 / 3 * 0.550
        self.gyunyu_fm = 210 / 3 * 0.000001 * 15396 * 20.7
      else
        self.gyunyu_vw = b.to_f / 2 * 0.550
        self.gyunyu_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('生クリーム')
      b = a["生クリーム"]
      if b.include?('大さじ１') || b.include?('適宜') || b.include?('少々')
        self.v_vw = 15 / 2 * 3.554
        self.v_vw = 15 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.v_vw = 15 * 3.554
        self.v_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３')
        self.v_vw = 45 / 2 * 3.554
        self.v_fm = 45 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ４')
        self.v_vw = 30 * 3.554
        self.v_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ５')
        self.v_vw = 75 / 2 * 3.554
        self.v_fm = 75 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('１カップ')
        self.v_vw = 100 * 3.554
        self.v_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2カップ')
        self.v_vw = 50 * 3.554
        self.v_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4カップ')
        self.v_vw = 25 * 3.554
        self.v_fm = 25 * 0.000001 * 15396 * 20.7
      elsif b.include?('3/4カップ')
        self.v_vw = 75 * 3.554
        self.v_fm = 75 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/3カップ')
        self.v_vw = 100 / 3 * 3.554
        self.v_fm = 100 / 3 * 0.000001 * 15396 * 20.7
      else
        self.v_vw = b.to_f / 2 * 3.554
        self.v_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('塩')
      b = a["塩"]
      if b.include?('適宣')
        self.sio_vw = 5 / 2 * 0.008
        self.sio_fm = 5 / 2 * 0.000001 * 15396 * 20.7
      else
        self.sio_vw = b.to_f / 2 * 0.008
        self.sio_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('しょうゆ')
      b = a["しょうゆ"]
      if b.include?('大さじ１')
        self.syoyu_vw = 9 * 0.960
        self.syoyu_fm = 9 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.syoyu_vw = 18 * 0.960
        self.syoyu_fm = 18 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３')
        self.syoyu_vw = 27 * 0.960
        self.syoyu_fm = 27 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ４') || b.include?('各70ml')
        self.syoyu_vw = 36 * 0.960
        self.syoyu_fm = 36 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ５')
        self.syoyu_vw = 45 * 0.960
        self.syoyu_fm = 45 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ1/2')
        self.syoyu_vw = 9 / 2 * 0.960
        self.syoyu_fm = 9 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１') || b.include?('少々')
        self.syoyu_vw = 3 * 0.960
        self.syoyu_fm = 3 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ２')
        self.syoyu_vw = 6 * 0.960
        self.syoyu_fm = 6 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/2')
        self.syoyu_vw = 3 / 2 * 0.960
        self.syoyu_fm = 3 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/4')
        self.syoyu_vw = 3 / 4 * 0.960
        self.syoyu_fm = 3 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2カップ')
        self.syoyu_vw = 115 * 0.960
        self.syoyu_fm = 115 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4カップ')
        self.syoyu_vw = 115 / 2 * 0.960
        self.syoyu_fm = 115 / 2 * 0.000001 * 15396 * 20.7
      else
        self.syoyu_vw = b.to_f / 2 * 0.960
        self.syoyu_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('酒')
      b = a["酒"]
      if b.include?('大さじ１')
        self.sake_vw = 15 / 2 * 1.236
        self.sake_fm = 15 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.sake_vw = 15 * 1.236
        self.sake_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３')
        self.sake_vw = 45 / 2 * 1.236
        self.sake_fm = 45 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ４')
        self.sake_vw = 30 * 1.236
        self.sake_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ８')
        self.sake_vw = 60 * 1.236
        self.sake_fm = 60 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ1/2') || b == "1/2"
        self.sake_vw = 15 / 4 * 1.236
        self.sake_fm = 15 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１') || b.include?('少々')
        self.sake_vw = 5 / 2 * 1.236
        self.sake_fm = 5 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ２') || b.include?('適宜')
        self.sake_vw = 5 * 1.236
        self.sake_fm = 5 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/2')
        self.sake_vw = 5 / 4 * 1.236
        self.sake_fm = 5 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('１カップ')
        self.sake_vw = 100 * 1.236
        self.sake_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2カップ')
        self.sake_vw = 50 * 1.236
        self.sake_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/3カップ')
        self.sake_vw = 100 / 3 * 1.236
        self.sake_fm = 100 / 3 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4カップ')
        self.sake_vw = 25 * 1.236
        self.sake_fm = 25 * 0.000001 * 15396 * 20.7
      else
        self.sake_vw = b.to_f / 2 * 1.236
        self.sake_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('みそ')
      b = a['みそ']
      if b.include?('大さじ1')
        self.miso_vw = 9 * 1.2
        self.miso_fm = 9 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.miso_vw = 18 * 1.2
        self.miso_fm = 18 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３')
        self.miso_vw = 27 * 1.2
        self.miso_fm = 27 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ４')
        self.miso_vw = 36 * 1.2
        self.miso_fm = 36 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ６')
        self.miso_vw = 54 * 1.2
        self.miso_fm = 54 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ８')
        self.miso_vw = 72 * 1.2
        self.miso_fm = 72 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ1/2')
        self.miso_vw = 9 / 2 * 1.2
        self.miso_fm = 9 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１') || b.include?('少々')
        self.miso_vw = 3 * 1.2
        self.miso_fm = 3 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ２') || b.include?('適宜')
        self.miso_vw = 6 * 1.2
        self.miso_fm = 6 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/2')
        self.miso_vw = 3 / 2 * 1.2
        self.miso_fm = 3 / 2 * 0.000001 * 15396 * 20.7
      else
        self.miso_vw = b.to_f / 2 * 1.2
        self.miso_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('トマトケチャップ')
      b = a["トマトケチャップ"]
      if b.include?('大さじ１')
        self.kecha_vw = 15 / 2 * 0.219
        self.kecha_fm = 15 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.kecha_vw = 15 * 0.219
        self.kecha_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３')
        self.kecha_vw = 45 / 2 * 0.219
        self.kecha_fm = 45 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ４')
        self.kecha_vw = 30 * 0.219
        self.kecha_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ1/2')
        self.kecha_vw = 15 / 4 * 0.219
        self.kecha_fm = 15 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ５')
        self.kecha_vw = 75 / 2 * 0.219
        self.kecha_fm = 75 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１') || b.include?('少々')
        self.kecha_vw = 5 / 2 * 0.219
        self.kecha_fm = 5 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ２') || b.include?('適宜')
        self.kecha_vw = 5 * 0.219
        self.kecha_fm = 5 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/2')
        self.kecha_vw = 5 / 4 * 0.219
        self.kecha_fm = 5 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4カップ')
        self.kecha_vw = 115 / 4 * 0.219
        self.kecha_fm = 115 / 4 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('こしょう')
      b = a["こしょう"]
      if b.include?('大さじ１')
        self.kosyo_vw = 3 * 4.921
        self.kosyo_fm = 3 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１') || b.include?('適量')
        self.kosyo_fm = 1 * 4.921
        self.kosyo_vw = 1 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/2') || b.include?('少々')
        self.kosyo_vw = 0.5 * 4.921
        self.kosyo_fm = 0.5 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/4')
        self.kosyo_vw = 0.25 * 4.921
        self.kosyo_fm = 0.25 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.kosyo_vw = 6 * 4.921
        self.kosyo_fm = 6 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('カレールー') || a.include?('カレー粉')
      b = a["カレールー"] || a['カレー粉']
      if b.include?('大さじ１')
        self.kary_vw = 3 * 4.561
        self.kary_fm = 3 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.kary_vw = 6 * 4.561
        self.kary_fm = 6 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３')
        self.kary_vw = 9 * 4.561
        self.kary_fm = 9 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ1/2')
        self.kary_vw = 3 / 2 * 4.561
        self.kary_fm = 3 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１') || b.include?('少々') || b.include?('ひとつまみ')
        self.kary_vw = 1 * 4.561
        self.kary_fm = 1 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ２') || b.include?('適宜')
        self.kary_vw = 2 * 4.561
        self.kary_fm = 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/2')
        self.kary_vw = 0.5 * 4.561
        self.kary_fm = 0.5 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/4')
        self.kary_vw = 0.25 * 4.561
        self.kary_fm = 0.25 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ2/3')
        self.kary_vw = 2 / 3 * 4.561
        self.kary_fm = 2 / 3 * 0.000001 * 15396 * 20.7
      elsif b.include?('１箱')
        self.kary_vw = 60 * 4.561
        self.kary_fm = 60 * 0.000001 * 15396 * 20.7
      elsif b.include?('2/3箱')
        self.kary_vw = 40 * 4.561
        self.kary_fm = 40 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2箱')
        self.kary_vw = 30 * 4.561
        self.kary_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/3箱')
        self.kary_vw = 33 / 2 * 4.561
        self.kary_fm = 33 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('１皿分')
        self.kary_vw = 15 * 4.561
        self.kary_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b.include?('２皿分')
        self.kary_vw = 20 * 4.561
        self.kary_fm = 20 * 0.000001 * 15396 * 20.7
      elsif b.include?('２かけ')
        self.kary_vw = 25 * 4.561
        self.kary_fm = 25 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2かけ')
        self.kary_vw = 7 * 4.561
        self.kary_fm = 7 * 0.000001 * 15396 * 20.7
      elsif b.include?('３かけ')
        self.kary_vw = 75 / 2 * 4.561
        self.kary_fm = 75 / 2 * 0.000001 * 15396 * 20.7
      else
        self.kary_vw = b.to_f / 2 * 4.561
        self.kary_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('小麦粉')
      b = a["小麦粉"]
      if b.include?('大さじ１') || b.include?('適宜')
        self.komugi_vw = 9 / 2 * 2.1
        self.komugi_fm = 9 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.komugi_vw = 9 * 2.1
        self.komugi_fm = 9 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３')
        self.komugi_vw = 27 / 2 * 2.1
        self.komugi_fm = 27 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ４')
        self.komugi_vw = 18 * 2.1
        self.komugi_fm = 18 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ1/2')
        self.komugi_vw = 9 / 4 * 2.1
        self.komugi_fm = 9 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１') || b.include?('少々')
        self.komugi_vw = 3 / 2 * 2.1
        self.komugi_fm = 3 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ２')
        self.komugi_vw = 3 * 2.1
        self.komugi_fm = 3 * 0.000001 * 15396 * 20.7
      elsif b.include?('１カップ')
        self.komugi_vw = 55 * 2.1
        self.komugi_fm = 55 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2カップ')
        self.komugi_vw = 55 / 2 * 2.1
        self.komugi_fm = 55 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/3カップ')
        self.komugi_vw = 55 / 3 * 2.1
        self.komugi_fm = 55 / 3 * 0.000001 * 15396 * 20.7
      else
        self.komugi_vw = b.to_f / 2 * 2.1
        self.komugi_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('砂糖')
      b = a["砂糖"]
      if b.include?('大さじ１') || b.include?('適宜')
        self.satou_vw = 9 / 2 * 1.4
        self.satou_fm = 9 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ2')
        self.satou_vw = 9 * 1.4
        self.satou_fm = 9 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３') || b.include?('適宜')
        self.satou_vw = 27 / 2 * 1.4
        self.satou_fm = 27 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ５')
        self.satou_vw = 45 / 2 * 1.4
        self.satou_fm = 45 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ８')
        self.satou_vw = 36 * 1.4
        self.satou_fm = 36 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ1/2')
        self.satou_vw = 9 / 4 * 1.4
        self.satou_fm = 9 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１') || b.include?('少々')
        self.satou_vw = 3 / 2 * 1.4
        self.satou_fm = 3 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ２')
        self.satou_vw = 3 * 1.4
        self.satou_fm = 3 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/2')
        self.satou_vw = 3 / 4 * 1.4
        self.satou_fm = 3 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/3')
        self.satou_vw = 3 / 6 * 1.4
        self.satou_fm = 3 / 6 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2カップ')
        self.satou_vw = 65 / 2 * 1.4
        self.satou_fm = 65 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4カップ')
        self.satou_vw = 65 / 4 * 1.4
        self.satou_fm = 65 / 4 * 0.000001 * 15396 * 20.7
      else
        self.satou_vw = b.to_f / 2 * 1.4
        self.satou_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('酢')
      b = a["酢"]
      if b.include?('大さじ１')
        self.su_vw = 15 / 2 * 0.773
        self.su_fm = 15 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.su_vw = 15 * 0.773
        self.su_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ3')
        self.su_vw = 45 / 2 * 0.773
        self.su_fm = 45 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ４')
        self.su_vw = 30 * 0.773
        self.su_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ５')
        self.su_vw = 75 / 2 * 0.773
        self.su_fm = 75 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ６')
        self.su_vw = 90 / 2 * 0.773
        self.su_fm = 90 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ1/2')
        self.su_vw = 15 / 4 * 0.773
        self.su_fm = 15 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１') || b.include?('少々')
        self.su_vw = 5 / 2 * 0.773
        self.su_fm = 5 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ２') || b.include?('適宜')
        self.su_vw = 5 * 0.773
        self.su_fm = 5 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/2')
        self.su_vw = 5 / 4 * 0.773
        self.su_fm = 5 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2カップ')
        self.su_vw = 50 * 0.773
        self.su_fm = 50 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4カップ')
        self.su_vw = 25 * 0.773
        self.su_fm = 25 * 0.000001 * 15396 * 20.7
      else
        self.su_vw = b.to_f / 2 * 0.773
        self.su_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('サラダ油')
      b = a["サラダ油"]
      if b.include?('大さじ１')
        self.syokubutsuyu_vw = 6 * 1.6
        self.syokubutsuyu_fm = 6 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.syokubutsuyu_vw = 12 * 1.6
        self.syokubutsuyu_fm = 12 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３')
        self.syokubutsuyu_vw = 18 * 1.6
        self.syokubutsuyu_fm = 18 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ４')
        self.syokubutsuyu_vw = 24 * 1.6
        self.syokubutsuyu_fm = 24 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ1/2') || b.include?('適宜')
        self.syokubutsuyu_vw = 3 * 1.6
        self.syokubutsuyu_fm = 3 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１') || b.include?('少々')
        self.syokubutsuyu_vw = 2 * 1.6
        self.syokubutsuyu_fm = 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ２')
        self.syokubutsuyu_vw = 4 * 1.6
        self.syokubutsuyu_fm = 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/2')
        self.syokubutsuyu_vw = 1 * 1.6
        self.syokubutsuyu_fm = 1 * 0.000001 * 15396 * 20.7
      else
        self.syokubutsuyu_vw = b.to_f / 2 * 1.6
        self.syokubutsuyu_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('オリーブオイル')
      b = a["オリーブオイル"]
      if b.include?('大さじ１') || b.include?('適宜')
        self.oliveoil_vw = 6 * 21.106
        self.oliveoil_fm = 6 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.oliveoil_vw = 12 * 21.106
        self.oliveoil_fm = 12 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３')
        self.oliveoil_vw = 18 * 21.106
        self.oliveoil_fm = 18 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ４')
        self.oliveoil_vw = 24 * 21.106
        self.oliveoil_fm = 24 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ５')
        self.oliveoil_vw = 30 * 21.106
        self.oliveoil_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ６')
        self.oliveoil_vw = 36 * 21.106
        self.oliveoil_fm = 36 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ1/2')
        self.oliveoil_vw = 3 * 21.106
        self.oliveoil_fm = 3 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１') || b.include?('少々')
        self.oliveoil_vw = 2 * 21.106
        self.oliveoil_fm = 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ２')
        self.oliveoil_vw = 4 * 21.106
        self.oliveoil_fm = 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/2')
        self.oliveoil_vw = 1 * 21.106
        self.oliveoil_fm = 1 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2カップ')
        self.oliveoil_vw = 45 * 21.106
        self.oliveoil_fm = 45 * 0.000001 * 15396 * 20.7
      else
        self.oliveoil_vw = b.to_f / 2 * 21.106
        self.oliveoil_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('温かい緑茶')
      b = a["温かい緑茶"]
      self.tya_vw =  5 * 6.4
      self.tya_fm = 5 / 2 * 0.000001 * 15396 * 20.7
    end
    if a.include?('紅茶')
      b = a["紅茶"]
      self.tea_vw = 30 * 4.940
      self.tea_fm = 30 * 0.000001 * 15396 * 20.7
    end
    if a.include?('オレンジジュース')
      b = a["オレンジジュース"]
      self.orangejuce_vw = 15 / 2 * 0.840
      self.orangejuce_fm = 15 / 2 * 0.000001 * 15396 * 20.7
    end
    if a.include?('レモン汁')
      b = a["レモン汁"]
      if b.include?('大さじ１')
        self.lemonjuce_vw = 15 / 2 * 1.232
        self.lemonjuce_fm = 15 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.lemonjuce_vw = 15 * 1.232
        self.lemonjuce_fm = 15 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３')
        self.lemonjuce_vw = 45 / 2 * 1.232
        self.lemonjuce_fm = 45 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ４')
        self.lemonjuce_vw = 30 * 1.232
        self.lemonjuce_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ1/2')
        self.lemonjuce_vw = 15 / 4 * 1.232
        self.lemonjuce_fm = 15 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ2/3')
        self.lemonjuce_vw = 15 / 3 * 1.232
        self.lemonjuce_fm = 15 / 3 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ１') || b.include?('少々')
        self.lemonjuce_vw = 5 / 2 * 1.232
        self.lemonjuce_fm = 5 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ２') || b.include?('適宜')
        self.lemonjuce_vw = 5 * 1.232
        self.lemonjuce_fm = 5 * 0.000001 * 15396 * 20.7
      elsif b.include?('小さじ1/2')
        self.lemonjuce_vw = 5 / 4 * 1.232
        self.lemonjuce_fm = 5 / 4 * 0.000001 * 15396 * 20.7
      else
        self.lemonjuce_vw = b.to_f / 2 * 1.232
        self.lemonjuce_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
  end

  def vw_create
    self.virtualwater = self.gyu_vw.to_f + self.buta_vw.to_f + self.tori_vw.to_f + self.tamago_vw.to_f + self.kome_vw.to_f + self.gohan_vw.to_f + self.pan_vw.to_f + self.udon_vw.to_f + self.soumen_vw.to_f + self.soba_vw.to_f + self.supagety_vw.to_f + self.ramen_vw.to_f + self.daikon_vw.to_f + self.kabu_vw.to_f + self.ninjin_vw.to_f + self.gobou_vw.to_f + self.renkon_vw.to_f + self.satoimo_vw.to_f + self.yamaimo_vw.to_f + self.hakusai_vw.to_f + self.kyabetsu_vw.to_f + self.hourensou_vw.to_f + self.negi_vw.to_f + self.tamanegi_vw.to_f + self.nasu_vw.to_f + self.tomato_vw.to_f + self.kyuri_vw.to_f + self.kabotya_vw.to_f + self.pyman_vw.to_f + self.endou_vw.to_f + self.edamame_vw.to_f + self.ingen_vw.to_f + self.tomorokoshi_vw.to_f + self.retasu_vw.to_f + self.serori_vw.to_f + self.karifura_vw.to_f + self.buro_vw.to_f + self.jaga_vw.to_f + self.satsumaimo_vw.to_f + self.ninniku_vw.to_f + self.shitake_vw.to_f + self.kuri_vw.to_f + self.daizu_vw.to_f + self.mikan_vw.to_f + self.orange_vw.to_f + self.ringo_vw.to_f + self.budou_vw.to_f + self.kaki_vw.to_f + self.ichigo_vw.to_f + self.touhu_vw.to_f + self.konnyaku_vw.to_f + self.bata_vw.to_f + self.yoogle_vw.to_f + self.cheese_vw.to_f + self.gyunyu_vw.to_f + self.v_vw.to_f + self.sio_vw.to_f + self.syoyu_vw.to_f + self.sake_vw.to_f + self.miso_vw.to_f + self.kecha_vw.to_f + self.kosyo_vw.to_f + self.kary_vw.to_f + self.komugi_vw.to_f + self.satou_vw.to_f + self.su_vw.to_f + self.syokubutsuyu_vw.to_f + self.oliveoil_vw.to_f + self.tya_vw.to_f + self.tea_vw.to_f + self.orangejuce_vw.to_f + self.lemonjuce_vw.to_f
    self.foodmileage = self.gyu_fm.to_f + self.buta_fm.to_f + self.tori_fm.to_f + self.tamago_fm.to_f + self.kome_fm.to_f + self.gohan_fm.to_f + self.pan_fm.to_f + self.udon_fm.to_f + self.soumen_fm.to_f + self.soba_fm.to_f + self.supagety_fm.to_f + self.ramen_fm.to_f + self.daikon_fm.to_f + self.kabu_fm.to_f + self.ninjin_fm.to_f + self.gobou_fm.to_f + self.renkon_fm.to_f + self.satoimo_fm.to_f + self.yamaimo_fm.to_f + self.hakusai_fm.to_f + self.kyabetsu_fm.to_f + self.hourensou_fm.to_f + self.negi_fm.to_f + self.tamanegi_fm.to_f + self.nasu_fm.to_f + self.tomato_fm.to_f + self.kyuri_fm.to_f + self.kabotya_fm.to_f + self.pyman_fm.to_f + self.endou_fm.to_f + self.edamame_fm.to_f + self.ingen_fm.to_f + self.tomorokoshi_fm.to_f + self.retasu_fm.to_f + self.serori_fm.to_f + self.karifura_fm.to_f + self.buro_fm.to_f + self.jaga_fm.to_f + self.satsumaimo_fm.to_f + self.ninniku_fm.to_f + self.shitake_fm.to_f + self.kuri_fm.to_f + self.daizu_fm.to_f + self.mikan_fm.to_f + self.orange_fm.to_f + self.ringo_fm.to_f + self.budou_fm.to_f + self.kaki_fm.to_f + self.ichigo_fm.to_f + self.touhu_fm.to_f + self.konnyaku_fm.to_f + self.bata_fm.to_f + self.yoogle_fm.to_f + self.cheese_fm.to_f + self.gyunyu_fm.to_f + self.v_fm.to_f + self.sio_fm.to_f + self.syoyu_fm.to_f + self.sake_fm.to_f + self.miso_fm.to_f + self.kecha_fm.to_f + self.kosyo_fm.to_f + self.kary_fm.to_f + self.komugi_fm.to_f + self.satou_fm.to_f + self.su_fm.to_f + self.syokubutsuyu_fm.to_f + self.oliveoil_fm.to_f + self.tya_fm.to_f + self.tea_fm.to_f + self.orangejuce_fm.to_f + self.lemonjuce_fm.to_f
  end
end

