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
        self.gohan_vw = b.to_f / 2.000 * 150 * 3.7
        self.gohan_fm = b.to_f / 2.000 * 150 * 0.000001 * 15396 * 9.6
      elsif b == "茶碗２杯分" || b == "２皿分" || b == "２杯"
        self.gohan_vw = b.to_f / 2.000 * 300 * 3.7
        self.gohan_fm = b.to_f / 2.000 * 300 * 0.000001 * 15396 * 9.6
      elsif b == "どんぶり２杯分"
        self.gohan_vw = 400 / 2.000 * 3.7
        self.gohan_fm = 400 / 2.000 * 0.000001 * 15396 * 9.6
      elsif b == "茶碗３杯分"
        self.gohan_vw = 450 / 2.000 * 3.7
        self.gohan_fm = 450 / 2.000 * 0.000001 * 15396 * 9.6
      else
        self.gohan_vw = b.to_f / 2.000 * 3.7
        self.gohan_fm = b.to_f / 2.000 * 0.000001 * 15396 * 9.6
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
    if a.include?("かぼちゃ") || a.include?('かぼちゃの薄切り') || a.include?('かぼちゃ(１cm角)') || a.include?('　・かぼちゃ(種、わた、皮を除く)') || a.include?('かぼちゃ（皮と種を除いた正味）') || a.include?('冷凍かぼちゃ') || a.include?('かぼちゃ(正味)')
      b = a["かぼちゃ"] || a['かぼちゃの薄切り'] || a['かぼちゃ(１cm角)'] || a['　・かぼちゃ(種、わた、皮を除く)'] || a['かぼちゃ（皮と種を除いた正味）'] || a['冷凍かぼちゃ'] || a['かぼちゃ(正味)']
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
    if a.include?('ピーマン') || a.include?('カラーピーマン(黄)') || a.include?('カラーピーマン(赤)') || a.include?('カラーピーマン(赤、黄)') || a.include?('カラーピーマン(オレンジ)') || a.include?('カラーピーマン(赤、黄、オレンジ)') || a.include?('カラーピーマン(赤、黄、オレンジ合わせて)') || a.include?('ピーマン、赤ピーマン') || a.include?('カラーピーマン') || a.include?('&ピーマン(赤、黄、緑どれでも)') || a.include?('ジャンボピーマン(好みの色のもの)') || a.include?('ジャンボピーマン(赤)') || a.include?('　・ピーマン(放射状に８等分して長さ半分)') || a.include?('　・赤ピーマン(放射状に８等分して長さ半分)') || a.include?('ピーマン(１cm角に切る)') || a.include?('ピーマン（緑、赤）') || a.include?('赤ピーマン') || a.include?('カラーピーマン(ここでは赤、オレンジ)') || a.include?('　・ピーマン') || a.include?('カラーピーマン(赤)、玉ねぎ') || a.include?('トマト、ピーマン') || a.include?('カラーピーマン(ここでは赤、黄)') || a.include?('ピーマンのみじん切り')
      b = a["ピーマン"] || a['カラーピーマン(黄)'] || a['カラーピーマン(赤)'] || a['カラーピーマン(赤、黄)'] || a['カラーピーマン(オレンジ)'] || a['カラーピーマン(赤、黄、オレンジ)'] || a['カラーピーマン(赤、黄、オレンジ合わせて)'] || a['ピーマン、赤ピーマン'] || a['カラーピーマン'] || a['ピーマン(赤、黄、緑どれでも)'] || a['ジャンボピーマン(好みの色のもの)'] || a['ジャンボピーマン(赤)'] || a['　・ピーマン(放射状に８等分して長さ半分)'] || a['　・赤ピーマン(放射状に８等分して長さ半分)'] || a['ピーマン(１cm角に切る)'] || a['ピーマン（緑、赤）'] || a['赤ピーマン'] || a['カラーピーマン(ここでは赤、オレンジ)'] || a['　・ピーマン'] || a['カラーピーマン(赤)、玉ねぎ'] || a['トマト、ピーマン'] || a['カラーピーマン(ここでは赤、黄)'] || a['ピーマンのみじん切り']
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
    if a.include?('さやえんどう') || a.include?('スナップえんどう') || a.include?('　・スナップえんどう') || a.include?('絹さや(あればスナップえんどう)')
      b = a["さやえんどう"] || a['スナップえんどう'] || a['　・スナップえんどう'] || a['絹さや(あればスナップえんどう)']
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
    if a.include?('枝豆') || a.include?('枝豆(さやつき)') || a.include?('枝豆（さやから出したもの）') || a.include?('枝豆(塩ゆでしたもの)') || a.include?('枝豆(正味)') || a.include?('枝豆(ゆでてさやから出したもの)') || a.include?('枝豆(ゆでたもの)')
      b = a["枝豆"] || a['枝豆(さやつき)'] || a['枝豆（さやから出したもの）'] || a['枝豆(塩ゆでしたもの)'] || a['枝豆(正味)'] || a['枝豆(ゆでてさやから出したもの)'] || a['枝豆(ゆでたもの)']
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
    if a.include?('さやいんげん') || a.include?('さやいんげん(冷凍)') || a.include?('さやいんげん、こごみ') || a.include?('白いんげん豆缶') || a.include?('いんげん(３cm長さ)') || a.include?('いんげん(斜め小口切り)') || a.include?('　・さやいんげん') || a.include?('白いんげん豆の水煮缶') || a.include?('白いんげん豆(乾燥)') || a.include?('いんげん')
      b = a["さやいんげん"] || a['さやいんげん(冷凍)'] || a['さやいんげん、こごみ'] || a['白いんげん豆缶'] || a['いんげん(３cm長さ)'] || a['いんげん(斜め小口切り)'] || a['　・さやいんげん'] || a['白いんげん豆の水煮缶'] || a['白いんげん豆(乾燥)'] || a['いんげん']
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
    if a.include?('レタス') || a.include?('レタス、トマト') || a.include?('サニーレタス') || a.include?('リーフレタス') || a.include?('フリルレタス(またはレタス)') || a.include?('レタスの細切り') || a.include?('　・レタス') || a.include?('グリーンリーフ(またはレタス)') || a.include?('サラダ野菜(サニーレタス、クレソンなど)') || a.include?('サニーレタス(ちぎる)') || a.include?('サニーレタス(またはレタス)') || a.include?('レタスのせん切り') || a.include?('レタス(一口大にちぎる)') || a.include?('レタス(大きくちぎる)') || a.include?('プリーツレタス') || a.include?('サニーレタス(芯に近いところ)') || a.include?('サラダ野菜ミックス(またはレタスなどの葉野菜適宜)')
      b = a["レタス"] || a['レタス、トマト'] || a['サニーレタス'] || a['リーフレタス'] || a['フリルレタス(またはレタス)'] || a['レタスの細切り'] || a['　・レタス'] || a['グリーンリーフ(またはレタス)'] || a['サラダ野菜(サニーレタス、クレソンなど)'] || a['サニーレタス(ちぎる)'] || a['サニーレタス(またはレタス)'] || a['レタスのせん切り'] || a['レタス(一口大にちぎる)'] || a['レタス(大きくちぎる)'] || a['プリーツレタス'] || a['サニーレタス(芯に近いところ)'] || a['サラダ野菜ミックス(またはレタスなどの葉野菜適宜)']
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
    if a.include?('セロリ') || a.include?('セロリ、ズッキーニ') || a.include?('セロリと玉ねぎのマリネソース(作りやすい分量・４人分・約650g)') || a.include?('　・セロリ') || a.include?('セロリ(葉つき)') || a.include?('セロリのみじん切り') || a.include?('にんじん、セロリ') || a.include?('セロリ(葉つき)') || a.include?('　・セロリのみじん切り') || a.include?('・にんじん、セロリ、長ねぎ') || a.include?('　　・玉ねぎのみじん切り、にんじんのみじん切り、セロリのみじん切り') || a.include?('セロリ(斜め切り)') || a.include?('セロリ(葉を含む)') || a.include?('ゆでたセロリ(でき上がり分より使う)') || a.include?('セロリ(斜め薄切り)') || a.include?('セロリ(たて1/4で６cm長さ)') || a.include?('セロリのせん切り') || a.include?('セロリの芯')
      b = a["セロリ"] || a['セロリ、ズッキーニ'] || a['セロリと玉ねぎのマリネソース(作りやすい分量・４人分・約650g)'] || a['　・セロリ'] || a['セロリ(葉つき)'] || a['セロリのみじん切り'] || a['にんじん、セロリ'] || a['セロリ(葉つき)'] || a['　・セロリのみじん切り'] || a['・にんじん、セロリ、長ねぎ'] || a['　　・玉ねぎのみじん切り、にんじんのみじん切り、セロリのみじん切り'] || a['セロリ(斜め切り)'] || a['セロリ(葉を含む)'] || a['ゆでたセロリ(でき上がり分より使う)'] || a['セロリ(斜め薄切り)'] || a['セロリ(たて1/4で６cm長さ)'] || a['セロリのせん切り'] || a['セロリの芯']
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
    if a.include?('カリフラワー') || a.include?('カリフラワー（小房に分けたもの）')
      b = a["カリフラワー"] || a["カリフラワー（小房に分けたもの）"]
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
    if a.include?('ブロッコリー') || a.include?('ブロッコリー（小房に分けたもの）') || a.include?('ブロッコリー(小房に分ける)') || a.include?('ブロッコリー４房') || a.include?('　・ブロッコリー')
      b = a["ブロッコリー"] || a['ブロッコリー（小房に分けたもの）'] || a['ブロッコリー(小房に分ける)'] || a['ブロッコリー４房'] || a['　・ブロッコリー']
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
    if a.include?('じゃがいも') || a.include?('新じゃがいも') || a.include?('じゃがいも(あればメイクイーン)') || a.include?('じゃがいも、玉ねぎ') || a.include?('　・じゃがいも(1/2にカット)') || a.include?('じゃがいも(メイクイーン)') || a.include?('　・じゃがいも') || a.include?('新じゃがいも(またはじゃがいも)') || a.include?('じゃがいも(1.5cm幅の半月切り)') || a.include?('玉ねぎ、じゃがいも')
      b = a["じゃがいも"] || a['新じゃがいも'] || a['じゃがいも(あればメイクイーン)'] || a['じゃがいも、玉ねぎ'] || a['　・じゃがいも(1/2にカット)'] || a['じゃがいも(メイクイーン)'] || a['　・じゃがいも'] || a['新じゃがいも(またはじゃがいも)'] || a['じゃがいも(1.5cm幅の半月切り)'] || a['玉ねぎ、じゃがいも']
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
    if a.include?('さつまいも') || a.include?('さつまいも、にんじん')
      b = a["さつまいも"] || a["さつまいも、にんじん"]
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
    if a.include?('にんにく') || a.include?('　・おろしにんにく') || a.include?('おろしにんにく') || a.include?('にんにくのみじん切り') || a.include?('にんにくの薄切り') || a.include?('にんにく(粗みじん切り)') || a.include?('　・にんにくのすりおろし') || a.include?('　・にんにく(粗みじん切り)') || a.include?('　・にんにくのみじん切り')
      b = a["にんにく"] || a['　・おろしにんにく'] || a['おろしにんにく'] || a['にんにくのみじん切り'] || a['にんにくの薄切り'] || a['にんにく(粗みじん切り)'] || a['　・にんにくのすりおろし'] || a['　・にんにく(粗みじん切り)'] || a['　・にんにくのみじん切り']
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
    if a.include?('しいたけ') || a.include?('生しいたけ') || a.include?('干ししいたけ') || a.include?('干ししいたけ(薄切りのもの)') || a.include?('しいたけ(1/2に切る)') || a.include?('干ししいたけ(薄切り)') || a.include?('生しいたけ、しめじ') || a.include?('　・生しいたけ') || a.include?('えのきたけ、しめじ、生しいたけ') || a.include?('生しいたけ、まいたけ、エリンギ、えのき') || a.include?('　・しいたけ')
      b = a["しいたけ"] || a['生しいたけ'] || a['干ししいたけ'] || a['干ししいたけ(薄切りのもの)'] || a['しいたけ(1/2に切る)'] || a['干ししいたけ(薄切り)'] || a['生しいたけ、しめじ'] || a['　・生しいたけ'] || a['えのきたけ、しめじ、生しいたけ'] || a['生しいたけ、まいたけ、エリンギ、えのき'] || a['　・しいたけ']
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
    if a.include?('栗') || a.include?('栗(生)') || a.include?('甘栗') || a.include?('栗(皮をむいたもの)') || a.include?('栗の甘煮') || a.include?('甘栗(皮をむいたもの)') || a.include?('甘栗(殻をむいたもの)')
      b = a['栗'] || a['栗(生)'] || a['甘栗'] || a['栗(皮をむいたもの)'] || a['栗の甘煮'] || a['甘栗(皮をむいたもの)'] || a['甘栗(殻をむいたもの)']
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
    if a.include?('大豆の水煮缶') || a.include?('　・大豆の水煮') || a.include?('大豆水煮缶') || a.include?('大豆(水煮またはドライパック)') || a.include?('大豆(乾燥)') || a.include?('大豆の水煮') || a.include?('大豆（ドライパック）') || a.include?('ミックスビーンズ缶(または大豆水煮缶)')
      b = a['大豆の水煮缶'] || a['　・大豆の水煮'] || a['大豆水煮缶'] || a['大豆(水煮またはドライパック)'] || a['大豆(乾燥)'] || a['大豆の水煮'] || a['大豆（ドライパック）'] || a['ミックスビーンズ缶(または大豆水煮缶)']
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
    if a.include?('夏みかん') || a.include?('　・みかん')
      b = a["夏みかん"] || a["　・みかん"]
      if b.include?('１個')
        self.mikan_vw = 100 * 0.374
        self.mikan_fm = 100 * 0.000001 * 15396 * 20.7
      elsif b.include?('８房')
        self.mikan_vw = 40 * 0.374
        self.mikan_fm = 40 * 0.000001 * 15396 * 20.7
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
    if a.include?('豆腐') || a.include?('もめん豆腐') || a.include?('焼き豆腐') || a.include?('　・もめん豆腐') || a.include?('絹ごし豆腐') || a.include?('木綿豆腐') || a.include?('絹ごし豆腐(２cmの角切り)') || a.include?('絹ごし豆腐(一口大)') || a.include?('もめん豆腐(または絹ごし豆腐)') || a.include?('豆腐(もめんでも絹ごしでも)') || a.include?('　・絹ごし豆腐')
      b = a["豆腐"] || a['もめん豆腐'] || a['焼き豆腐'] || a['　・もめん豆腐'] || a['絹ごし豆腐'] || a['木綿豆腐'] || a['絹ごし豆腐(２cmの角切り)'] || a['絹ごし豆腐(一口大)'] || a['もめん豆腐(または絹ごし豆腐)'] || a['豆腐(もめんでも絹ごしでも)'] || a['　・絹ごし豆腐']
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
    if a.include?('こんにゃく') || a.include?('　・こんにゃく') || a.include?('糸こんにゃく(３cm長さ)') || a.include?('こんにゃく(白)')
      b = a["こんにゃく"] || a['　・こんにゃく'] || a['糸こんにゃく(３cm長さ)'] || a['こんにゃく(白)']
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
    if a.include?('バター') || a.include?('　・バター') || a.include?('バター(食塩不使用)') || a.include?('　・バター、オリーブ油') || a.include?('・塩、黒こしょう、サラダ油、バター') || a.include?('・塩、こしょう、砂糖、バター') || a.include?('・バター、しょうゆ') || a.include?('・バター、パン粉、塩、こしょう、サラダ油') || a.include?('・バター、しょうゆ、粗びき黒こしょう') || a.include?('・サラダ油、塩、こしょう、トマトケチャップ、バター')
      b = a["バター"] || a['　・バター'] || a['バター(食塩不使用)'] || a['　・バター、オリーブ油'] || a['・塩、黒こしょう、サラダ油、バター'] || a['・塩、こしょう、砂糖、バター'] || a['・バター、しょうゆ'] || a['・バター、パン粉、塩、こしょう、サラダ油'] || a['・バター、しょうゆ、粗びき黒こしょう'] || a['・サラダ油、塩、こしょう、トマトケチャップ、バター']
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
    if a.include?('プレーンヨーグルト') || a.include?('　・プレーンヨーグルト') || a.include?('　・プレーンヨーグルト、みそ') || a.include?('　・プレーンヨーグルト、マヨネーズ') || a.include?('ヨーグルトマヨドレッシング') || a.include?('加糖ヨーグルト')
      b = a["プレーンヨーグルト"] || a['　・プレーンヨーグルト'] || a['　・プレーンヨーグルト、みそ'] || a['　・プレーンヨーグルト、マヨネーズ'] || a['ヨーグルトマヨドレッシング'] || a['加糖ヨーグルト']
      if b.include?('大さじ１') || b.include?('小さじ２')
        self.yoogle_vw = 10 * 0.550
        self.yoogle_fm = 10 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ２')
        self.yoogle_vw = 20 * 0.550
        self.yoogle_fm = 20 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ３')
        self.yoogle_vw = 30 * 0.550
        self.yoogle_fm = 30 * 0.000001 * 15396 * 20.7
      elsif b.include?('大さじ４')
        self.yoogle_vw = 40 * 0.550
        self.yoogle_fm = 40 * 0.000001 * 15396 * 20.7
      elsif b.include?('１カップ')
        self.yoogle_vw = 105 * 0.550
        self.yoogle_fm = 105 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/2カップ')
        self.yoogle_vw = 105 / 2 * 0.550
        self.yoogle_fm = 105 / 2 * 0.000001 * 15396 * 20.7
      elsif b.include?('1/4カップ')
        self.yoogle_vw = 105 / 4 * 0.550
        self.yoogle_fm = 105 / 4 * 0.000001 * 15396 * 20.7
      elsif b.include?('3/4カップ')
        self.yoogle_vw = 315 / 4 * 0.550
        self.yoogle_fm = 315 / 4 * 0.000001 * 15396 * 20.7
      else
        self.yoogle_vw = b.to_f / 2 * 0.550
        self.yoogle_fm = b.to_f / 2 * 0.000001 * 15396 * 20.7
      end
    end
    if a.include?('スライスチーズ') || a.include?('粉チーズ') || a.include?('ピザ用チーズ') || a.include?('溶けるチーズ') || a.include?('　・粉チーズ') || a.include?('プロセスチーズ') || a.include?('モッツァレラチーズ') || a.include?('クリームチーズ') || a.include?('カマンベールチーズ') || a.include?('ピザ用チーズ(あればグリュイエールチーズ)') || a.include?('　・クリームチーズ') || a.include?('パルメザンチーズ(できればかたまりのパルミジャーノ・レッジャーノ)') || a.include?('プロセスチーズ(1.5cm角)') || a.include?('粉チーズ、ピザ用チーズ') || a.include?('スライスチーズ(溶けるタイプ)') || a.include?('　・スライスチーズ') || a.include?('　・スティックチーズ') || a.include?('パルミジャーノ・レッジャーノ(または粉チーズ)') || a.include?('パルメザンチーズ(おろしたもの)') || a.include?('ピザ用チーズ(あればシュレッドタイプ)') || a.include?('パルメザンチーズ(できればパルミジャーノ・レッジャーノ)') || a.include?('シュレッドチーズ') || a.include?('プロセスチーズ(細かく刻む)') || a.include?('溶けるタイプのシュレッドチーズ(またはピザ用チーズ)') || a.include?('ピザ用チーズ(あればグリュイエール)') || a.include?('グリュイエールチーズ（または粉チーズ）') || a.include?('粉チーズ(パルミジャーノ)') || a.include?('　・粉チーズ(パルミジャーノ)') || a.include?('　・ゴルゴンゾーラチーズ') || a.include?('　・モッツァレラチーズ') || a.include?('カッテージチーズ') || a.include?('　・マスカルポーネチーズ(またはクリームチーズ)') || a.include?('モッツァレラチーズ(１cm幅の薄切り)') || a.include?('ピザ用細切りチーズ') || a.include?('スモークチーズ') || a.include?('パルメザンチーズ') || a.include?('パルメザンチーズ（すりおろす）') || a.include?('ピザ用チーズ(あればミックスタイプ)') || a.include?('チーズ（ピザ用など）') || a.include?('塩、こしょう、粉チーズ') || a.include?('グリュイエールチーズ（またはピザ用チーズ）') || a.include?('パルミジャーノチーズ') || a.include?('ゴルゴンゾーラチーズ') || a.include?('チーズ(溶けるタイプ)') || a.include?('チーズ(溶けるタイプ)') || a.include?('　・カマンベールチーズ') || a.include?('プロセスチーズ(１cm厚さ)')
      b = a["スライスチーズ"] || a['粉チーズ'] || a['ピザ用チーズ'] || a['溶けるチーズ'] || a['　・粉チーズ'] || a['プロセスチーズ'] || a['モッツァレラチーズ'] || a['クリームチーズ'] || a['カマンベールチーズ'] || a['ピザ用チーズ(あればグリュイエールチーズ)'] || a['　・クリームチーズ'] || a['パルメザンチーズ(できればかたまりのパルミジャーノ・レッジャーノ)'] || a['プロセスチーズ(1.5cm角)'] || a['粉チーズ、ピザ用チーズ'] || a['スライスチーズ(溶けるタイプ)'] || a['　・スライスチーズ'] || a['　・スティックチーズ'] || a['パルミジャーノ・レッジャーノ(または粉チーズ)'] || a['パルメザンチーズ(おろしたもの)'] || a['ピザ用チーズ(あればシュレッドタイプ)'] || a['パルメザンチーズ(できればパルミジャーノ・レッジャーノ)'] || a['シュレッドチーズ'] || a['プロセスチーズ(細かく刻む)'] || a['溶けるタイプのシュレッドチーズ(またはピザ用チーズ)'] || a['ピザ用チーズ(あればグリュイエール)'] || a['グリュイエールチーズ（または粉チーズ）'] || a['粉チーズ(パルミジャーノ)'] || a['　・粉チーズ(パルミジャーノ)'] || a['　・ゴルゴンゾーラチーズ'] || a['　・モッツァレラチーズ'] || a['カッテージチーズ'] || a['　・マスカルポーネチーズ(またはクリームチーズ)'] || a['モッツァレラチーズ(１cm幅の薄切り)'] || a['ピザ用細切りチーズ'] || a['スモークチーズ'] || a['パルメザンチーズ'] || a['パルメザンチーズ（すりおろす）'] || a['ピザ用チーズ(あればミックスタイプ)'] || a['チーズ（ピザ用など）'] || a['塩、こしょう、粉チーズ'] || a['グリュイエールチーズ（またはピザ用チーズ）'] || a['パルミジャーノチーズ'] || a['ゴルゴンゾーラチーズ'] || a['チーズ(溶けるタイプ)'] || a['チーズ(溶けるタイプ)'] || a['　・カマンベールチーズ'] || a['プロセスチーズ(１cm厚さ)']
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
    if a.include?('牛乳') || a.include?('　・牛乳、マヨネーズ') || a.include?('　・牛乳') || a.include?('　・牛乳、パセリのみじん切り') || a.include?('牛乳、生クリーム') || a.include?('マヨネーズ、牛乳') || a.include?('　　・牛乳、レモン汁')
      b = a["牛乳"] || a['　・牛乳、マヨネーズ'] || a['　・牛乳'] || a['　・牛乳、パセリのみじん切り'] || a['牛乳、生クリーム'] || a['マヨネーズ、牛乳'] || a['　　・牛乳、レモン汁']
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
    if a.include?('生クリーム') || a.include?('　・生クリーム') || a.include?('　・生クリーム、水') || a.include?('牛乳、生クリーム') || a.include?('生クリーム(あれば低脂肪タイプ)') || a.include?('生クリーム(またはサワークリーム)') || a.include?('生クリーム（あれば）')
      b = a["生クリーム"] || a['　・生クリーム'] || a['　・生クリーム、水'] || a['牛乳、生クリーム'] || a['生クリーム(あれば低脂肪タイプ)'] || a['生クリーム(またはサワークリーム)'] || a['生クリーム（あれば）']
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
    if a.include?('しょうゆ') || a.include?('　・しょうゆ、酢') || a.include?('　・しょうゆ') || a.include?('　・酒、しょうゆ、砂糖') || a.include?('　・しょうゆ、オイスターソース、酒、酢') || a.include?('　・しょうゆ、みりん') || a.include?('　・酒、しょうゆ') || a.include?('　・しょうゆ、酒、みりん') || a.include?('　・しょうゆ、砂糖') || a.include?('　・しょうゆ、ごま油') || a.include?('　・酢、しょうゆ') || a.include?('　・しょうゆ、酒') || a.include?('　・マヨネーズ、レモン汁、しょうゆ') || a.include?(' ・しょうゆ') || a.include?('うす口しょうゆ(またはしょうゆ)') || a.include?('　・おろししょうが、砂糖、しょうゆ') || a.include?('　・白すりごま、しょうゆ') || a.include?('　・塩、しょうゆ') || a.include?('　・オイスターソース、しょうゆ') || a.include?('　・オリーブ油、しょうゆ') || a.include?('　・ごま油、サラダ油、しょうゆ、酒、水') || a.include?('　・しょうゆ、トマトケチャップ') || a.include?('　・しょうゆ、砂糖、片栗粉') || a.include?('うす口しょうゆ(またはしょうゆ)') || a.include?('　・しょうゆ、砂糖、酒、ごま油、片栗粉') || a.include?('　・しょうゆ、白すりごま') || a.include?('　・砂糖、しょうゆ') || a.include?('　・しょうゆ、みそ') || a.include?('しょうゆ、砂糖') || a.include?('　・粒マスタード、はちみつ、マヨネーズ、しょうゆ') || a.include?('　・白すりごま、しょうゆ') || a.include?('　・豆板醤(トウバンジャン)、しょうゆ、酢') || a.include?('　・しょうゆ、とりガラスープの素') || a.include?('　・しょうゆ、みりん、酒') || a.include?('　・チリソース(またはトマトケチャップ)、しょうゆ') || a.include?('　・はちみつ、しょうゆ') || a.include?('薄口しょうゆ') || a.include?('　・バルサミコ酢、しょうゆ') || a.include?('　・しょうゆ、酢、しょうがのせん切り') || a.include?('　・しょうゆ、オイスターソース') || a.include?('　　・しょうゆ、酢') || a.include?('　・練りわさび、しょうゆ') || a.include?('　・しょうゆ、みりん、砂糖') || a.include?('　・酒、しょうゆ、みりん') || a.include?('　・トマトケチャップ、しょうゆ') || a.include?('うす口しょうゆ(またはしょうゆ小さじ１＋塩少々)') || a.include?('　・しょうゆ、はちみつ') || a.include?('　・うす口しょうゆ') || a.include?('　・酢、しょうゆ、砂糖') || a.include?('　・しょうゆ、塩') || a.include?('　・酢、しょうゆ、砂糖') || a.include?('ナンプラー(またはしょうゆ)') || a.include?('　・砂糖、酒、しょうゆ') || a.include?('　・おろししょうが、しょうゆ、砂糖、酢') || a.include?('　・しょうゆ、黒酢') || a.include?('　・レモン汁、しょうゆ') || a.include?('　　・しょうゆ') || a.include?('　・しょうゆ、ごま油、白すりごま')
      b = a["しょうゆ"] || a['　・しょうゆ、酢'] || a['　・しょうゆ'] || a['　・酒、しょうゆ、砂糖'] || a['　・しょうゆ、オイスターソース、酒、酢'] || a['　・しょうゆ、みりん'] || a['　・酒、しょうゆ'] || a['　・しょうゆ、酒、みりん'] || a['　・しょうゆ、砂糖'] || a['　・しょうゆ、ごま油'] || a['　・酢、しょうゆ'] || a['　・しょうゆ、酒'] || a['　・マヨネーズ、レモン汁、しょうゆ'] || a[' ・しょうゆ'] || a['うす口しょうゆ(またはしょうゆ)'] || a['　・おろししょうが、砂糖、しょうゆ'] || a['　・白すりごま、しょうゆ'] || a['　・塩、しょうゆ'] || a['　・オイスターソース、しょうゆ'] || a['　・オリーブ油、しょうゆ'] || a['　・ごま油、サラダ油、しょうゆ、酒、水'] || a['　・しょうゆ、トマトケチャップ'] || a['　・しょうゆ、砂糖、片栗粉'] || a['うす口しょうゆ(またはしょうゆ)'] || a['　・しょうゆ、砂糖、酒、ごま油、片栗粉'] || a['　・しょうゆ、白すりごま'] || a['　・砂糖、しょうゆ'] || a['　・しょうゆ、みそ'] || a['しょうゆ、砂糖'] || a['　・粒マスタード、はちみつ、マヨネーズ、しょうゆ'] || a['　・白すりごま、しょうゆ'] || a['　・豆板醤(トウバンジャン)、しょうゆ、酢'] || a['　・しょうゆ、とりガラスープの素'] || a['　・しょうゆ、みりん、酒'] || a['　・チリソース(またはトマトケチャップ)、しょうゆ'] || a['　・はちみつ、しょうゆ'] || a['薄口しょうゆ'] || a['　・バルサミコ酢、しょうゆ'] || a['　・しょうゆ、酢、しょうがのせん切り'] || a['　・しょうゆ、オイスターソース'] || a['　　・しょうゆ、酢'] || a['　・練りわさび、しょうゆ'] || a['　・しょうゆ、みりん、砂糖'] || a['　・酒、しょうゆ、みりん'] || a['　・トマトケチャップ、しょうゆ'] || a['うす口しょうゆ(またはしょうゆ小さじ１＋塩少々)'] || a['　・しょうゆ、はちみつ'] || a['　・うす口しょうゆ'] || a['　・酢、しょうゆ、砂糖'] || a['　・しょうゆ、塩'] || a['　・酢、しょうゆ、砂糖'] || a['ナンプラー(またはしょうゆ)'] || a['　・砂糖、酒、しょうゆ'] || a['　・おろししょうが、しょうゆ、砂糖、酢'] || a['　・しょうゆ、黒酢'] || a['　・レモン汁、しょうゆ'] || a['　　・しょうゆ'] || a['　・しょうゆ、ごま油、白すりごま']
      if b.include?('大さじ１')
        self.syoyu_vw = 9 * 0.960
        self.syoyu_fm = 9 * 0.000001 * 15396
      elsif b.include?('大さじ２')
        self.syoyu_vw = 18 * 0.960
        self.syoyu_fm = 18 * 0.000001 * 15396
      elsif b.include?('大さじ３')
        self.syoyu_vw = 27 * 0.960
        self.syoyu_fm = 27 * 0.000001 * 15396
      elsif b.include?('大さじ４') || b.include?('各70ml')
        self.syoyu_vw = 36 * 0.960
        self.syoyu_fm = 36 * 0.000001 * 15396
      elsif b.include?('大さじ５')
        self.syoyu_vw = 45 * 0.960
        self.syoyu_fm = 45 * 0.000001 * 15396
      elsif b.include?('大さじ1/2')
        self.syoyu_vw = 9 / 2 * 0.960
        self.syoyu_fm = 9 / 2 * 0.000001 * 15396
      elsif b.include?('小さじ１') || b.include?('少々')
        self.syoyu_vw = 3 * 0.960
        self.syoyu_fm = 3 * 0.000001 * 15396
      elsif b.include?('小さじ２')
        self.syoyu_vw = 6 * 0.960
        self.syoyu_fm = 6 * 0.000001 * 15396
      elsif b.include?('小さじ1/2')
        self.syoyu_vw = 3 / 2 * 0.960
        self.syoyu_fm = 3 / 2 * 0.000001 * 15396
      elsif b.include?('小さじ1/4')
        self.syoyu_vw = 3 / 4 * 0.960
        self.syoyu_fm = 3 / 4 * 0.000001 * 15396
      elsif b.include?('1/2カップ')
        self.syoyu_vw = 115 * 0.960
        self.syoyu_fm = 115 * 0.000001 * 15396
      elsif b.include?('1/4カップ')
        self.syoyu_vw = 115 / 2 * 0.960
        self.syoyu_fm = 115 / 2 * 0.000001 * 15396
      else
        self.syoyu_vw = b.to_f / 2 * 0.960
        self.syoyu_fm = b.to_f / 2 * 0.000001 * 15396
      end
    end
    if a.include?('酒') || a.include?('　・酒、しょうゆ、砂糖') || a.include?('　・酒') || a.include?('　・トマトケチャップ、酒') || a.include?('　・しょうゆ、オイスターソース、酒、酢') || a.include?('　・酒、しょうゆ') || a.include?('　・しょうゆ、酒、みりん') || a.include?('　・酒、砂糖') || a.include?('白ワイン(または酒)') || a.include?('　・酒、オイスターソース') || a.include?('酒、みりん') || a.include?('　・しょうゆ、酒') || a.include?('　・オイスターソース、酒') || a.include?('　・酒、みりん') || a.include?('　・塩、こしょう、酒、片栗粉') || a.include?('　・砂糖、酒、みそ') || a.include?('　・酒、片栗粉') || a.include?('　・しょうゆ、酒') || a.include?('　・酒、片栗粉、ごま油') || a.include?('　・酒、みりん、砂糖') || a.include?('　・白ワイン(または酒)') || a.include?('赤ワインまたは酒') || a.include?('　・しょうゆ、砂糖、酒、ごま油、片栗粉') || a.include?('梅酒') || a.include?('　・りんごジュース、酒、ごま油') || a.include?('　・酒、酢') || a.include?('　・みりん、酒') || a.include?('紹興酒') || a.include?('　・酒、水') || a.include?('　・酒、しょうゆ、みりん') || a.include?('　・しょうゆ、みりん、酒') || a.include?('　・ニョクマム、みそ、酒、みりん') || a.include?('焼酎(あれば泡盛・なければ酒)') || a.include?('・みりん、酒') || a.include?('　・みそ、酒') || a.include?('みりん、酒') || a.include?('　・酒大さじ') || a.include?('砂糖、みりん、酒') || a.include?('酒(または水)') || a.include?('　・黒いりごま、酒') || a.include?('　・片栗粉、酒') || a.include?('　・砂糖、酒') || a.include?('　・酢、酒') || a.include?('長ねぎの青い部分、しょうがの薄切り、酒、塩')
      b = a["酒"] || a['　・酒、しょうゆ、砂糖'] || a['　・酒'] || a['　・トマトケチャップ、酒'] || a['　・しょうゆ、オイスターソース、酒、酢'] || a['　・酒、しょうゆ'] || a['　・しょうゆ、酒、みりん'] || a['　・酒、砂糖'] || a['白ワイン(または酒)'] || a['　・酒、オイスターソース'] || a['酒、みりん'] || a['　・しょうゆ、酒'] || a['　・オイスターソース、酒'] || a['　・酒、みりん'] || a['　・塩、こしょう、酒、片栗粉'] || a['　・砂糖、酒、みそ'] || a['　・酒、片栗粉'] || a['　・しょうゆ、酒'] || a['　・酒、片栗粉、ごま油'] || a['　・酒、みりん、砂糖'] || a['　・白ワイン(または酒)'] || a['赤ワインまたは酒'] || a['　・しょうゆ、砂糖、酒、ごま油、片栗粉'] || a['梅酒'] || a['　・りんごジュース、酒、ごま油'] || a['　・酒、酢'] || a['　・みりん、酒'] || a['紹興酒'] || a['　・酒、水'] || a['　・酒、しょうゆ、みりん'] || a['　・しょうゆ、みりん、酒'] || a['　・ニョクマム、みそ、酒、みりん'] || a['焼酎(あれば泡盛・なければ酒)'] || a['・みりん、酒'] || a['　・みそ、酒'] || a['みりん、酒'] || a['　・酒大さじ'] || a['砂糖、みりん、酒'] || a['酒(または水)'] || a['　・黒いりごま、酒'] || a['　・片栗粉、酒'] || a['　・砂糖、酒'] || a['　・酢、酒'] || a['長ねぎの青い部分、しょうがの薄切り、酒、塩']
      if b.include?('大さじ１')
        self.sake_vw = 15 / 2 * 1.236
        self.sake_fm = 15 / 2 * 0.000001 * 15396
      elsif b.include?('大さじ２')
        self.sake_vw = 15 * 1.236
        self.sake_fm = 15 * 0.000001 * 15396
      elsif b.include?('大さじ３')
        self.sake_vw = 45 / 2 * 1.236
        self.sake_fm = 45 / 2 * 0.000001 * 15396
      elsif b.include?('大さじ４')
        self.sake_vw = 30 * 1.236
        self.sake_fm = 30 * 0.000001 * 15396
      elsif b.include?('大さじ８')
        self.sake_vw = 60 * 1.236
        self.sake_fm = 60 * 0.000001 * 15396
      elsif b.include?('大さじ1/2') || b == "1/2"
        self.sake_vw = 15 / 4 * 1.236
        self.sake_fm = 15 / 4 * 0.000001 * 15396
      elsif b.include?('小さじ１') || b.include?('少々')
        self.sake_vw = 5 / 2 * 1.236
        self.sake_fm = 5 / 2 * 0.000001 * 15396
      elsif b.include?('小さじ２') || b.include?('適宜')
        self.sake_vw = 5 * 1.236
        self.sake_fm = 5 * 0.000001 * 15396
      elsif b.include?('小さじ1/2')
        self.sake_vw = 5 / 4 * 1.236
        self.sake_fm = 5 / 4 * 0.000001 * 15396
      elsif b.include?('１カップ')
        self.sake_vw = 100 * 1.236
        self.sake_fm = 100 * 0.000001 * 15396
      elsif b.include?('1/2カップ')
        self.sake_vw = 50 * 1.236
        self.sake_fm = 50 * 0.000001 * 15396
      elsif b.include?('1/3カップ')
        self.sake_vw = 100 / 3 * 1.236
        self.sake_fm = 100 / 3 * 0.000001 * 15396
      elsif b.include?('1/4カップ')
        self.sake_vw = 25 * 1.236
        self.sake_fm = 25 * 0.000001 * 15396
      else
        self.sake_vw = b.to_f / 2 * 1.236
        self.sake_fm = b.to_f / 2 * 0.000001 * 15396
      end
    end
    if a.include?('信州味噌') || a.include?('みそ') || a.include?('　・みそ') || a.include?('豆みそ（八丁みそなど）') || a.include?('　・白すりごま、みそ') || a.include?('　・みそ、みりん') || a.include?('　・砂糖、酒、みそ') || a.include?('あれば赤みそ') || a.include?('　・コクみそだれ') || a.include?('香味みそ＜作りやすい分量＞(みそ1/2カップ、コチュジャン大さじ１、長ねぎのみじん切り大さじ２、しょうがのみじん切り大さじ１、にんにくのみじん切り大さじ1/2、いりごま[白]大さじ１、ごま油大さじ1/2、砂糖大さじ１、酒大さじ1/2)') || a.include?('　・しょうゆ、みそ') || a.include?('　・みそ、白すりごま') || a.include?('　・みそ、ごま油') || a.include?('コクみそだれ') || a.include?('　・プレーンヨーグルト、みそ') || a.include?('　・コクみそだれ(21ページ)') || a.include?('みそだれ') || a.include?('　・みそ、砂糖、みりん') || a.include?('白みそ(またはみそ)') || a.include?('　・ニョクマム、みそ、酒、みりん') || a.include?('　・ごま油、みそ') || a.include?('西京みそ') || a.include?('　・みそ、酒') || a.include?('　・砂糖、みそ') || a.include?('　・みそ、みりん、水') || a.include?('　　・みそ') || a.include?('赤だしみそ') || a.include?('赤だしみそ(またはみそ)') || a.include?('赤みそ') || a.include?('白みそ') || a.include?('　・練りごま(白)、みそ')
      b = a["信州味噌"] || a['みそ'] || a['　・みそ'] || a['豆みそ（八丁みそなど）'] || a['　・白すりごま、みそ'] || a['　・みそ、みりん'] || a['　・砂糖、酒、みそ'] || a['あれば赤みそ'] || a['　・コクみそだれ'] || a['香味みそ＜作りやすい分量＞(みそ1/2カップ、コチュジャン大さじ１、長ねぎのみじん切り大さじ２、しょうがのみじん切り大さじ１、にんにくのみじん切り大さじ1/2、いりごま[白]大さじ１、ごま油大さじ1/2、砂糖大さじ１、酒大さじ1/2)'] || a['　・しょうゆ、みそ'] || a['　・みそ、白すりごま'] || a['　・みそ、ごま油'] || a['コクみそだれ'] || a['　・プレーンヨーグルト、みそ'] || a['　・コクみそだれ(21ページ)'] || a['みそだれ'] || a['　・みそ、砂糖、みりん'] || a['白みそ(またはみそ)'] || a['　・ニョクマム、みそ、酒、みりん'] || a['　・ごま油、みそ'] || a['西京みそ'] || a['　・みそ、酒'] || a['　・砂糖、みそ'] || a['　・みそ、みりん、水'] || a['　　・みそ'] || a['赤だしみそ'] || a['赤だしみそ(またはみそ)'] || a['赤みそ'] || a['白みそ'] || a['　・練りごま(白)、みそ']
      if b.include?('大さじ1')
        self.miso_vw = 9 * 1.2
        self.miso_fm = 9 * 0.000001 * 15396
      elsif b.include?('大さじ２')
        self.miso_vw = 18 * 1.2
        self.miso_fm = 18 * 0.000001 * 15396
      elsif b.include?('大さじ３')
        self.miso_vw = 27 * 1.2
        self.miso_fm = 27 * 0.000001 * 15396
      elsif b.include?('大さじ４')
        self.miso_vw = 36 * 1.2
        self.miso_fm = 36 * 0.000001 * 15396
      elsif b.include?('大さじ６')
        self.miso_vw = 54 * 1.2
        self.miso_fm = 54 * 0.000001 * 15396
      elsif b.include?('大さじ８')
        self.miso_vw = 72 * 1.2
        self.miso_fm = 72 * 0.000001 * 15396
      elsif b.include?('大さじ1/2')
        self.miso_vw = 9 / 2 * 1.2
        self.miso_fm = 9 / 2 * 0.000001 * 15396
      elsif b.include?('小さじ１') || b.include?('少々')
        self.miso_vw = 3 * 1.2
        self.miso_fm = 3 * 0.000001 * 15396
      elsif b.include?('小さじ２') || b.include?('適宜')
        self.miso_vw = 6 * 1.2
        self.miso_fm = 6 * 0.000001 * 15396
      elsif b.include?('小さじ1/2')
        self.miso_vw = 3 / 2 * 1.2
        self.miso_fm = 3 / 2 * 0.000001 * 15396
      else
        self.miso_vw = b.to_f / 2 * 1.2
        self.miso_fm = b.to_f / 2 * 0.000001 * 15396
      end
    end
    if a.include?('トマトケチャップ') || a.include?('　・トマトケチャップ') || a.include?('　・トマトケチャップ、酒') || a.include?('パセリ、トマトケチャップ') || a.include?('　　・トマトケチャップ、塩') || a.include?('　・マヨネーズ、トマトケチャップ') || a.include?('　・トマトケチャップ、酢') || a.include?('　・しょうゆ、トマトケチャップ') || a.include?('　・トマトケチャップ、マヨネーズ') || a.include?('　・トマトケチャップ、みりん') || a.include?('　・チリソース(またはトマトケチャップ)、しょうゆ') || a.include?('マーマレードケチャ(作りやすい分量)') || a.include?('ピザ用ソース（市販品）またはトマトケチャップ') || a.include?('　・ケチャップ') || a.include?('　・トマトケチャップ、中濃ソース') || a.include?('　・トマトケチャップ、酒、湯')
      b = a["トマトケチャップ"] || a['　・トマトケチャップ'] || a['　・トマトケチャップ、酒'] || a['パセリ、トマトケチャップ'] || a['　　・トマトケチャップ、塩'] || a['　・マヨネーズ、トマトケチャップ'] || a['　・トマトケチャップ、酢'] || a['　・しょうゆ、トマトケチャップ'] || a['　・トマトケチャップ、マヨネーズ'] || a['　・トマトケチャップ、みりん'] || a['　・チリソース(またはトマトケチャップ)、しょうゆ'] || a['マーマレードケチャ(作りやすい分量)'] || a['ピザ用ソース（市販品）またはトマトケチャップ'] || a['　・ケチャップ'] || a['　・トマトケチャップ、中濃ソース'] || a['　・トマトケチャップ、酒、湯']
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
    if a.include?('こしょう') || a.include?('　・こしょう') || a.include?('　・砂糖、こしょう') || a.include?('　・塩、こしょう') || a.include?('ゆずこしょう') || a.include?('　・塩、粗びき黒こしょう') || a.include?('　　・粗びき黒こしょう') || a.include?('塩、こしょう') || a.include?('粗びき黒こしょう') || a.include?('　・塩、こしょう、ごま油') || a.include?('　・練りわさび、こしょう') || a.include?('　・みりん、ゆずこしょう') || a.include?('　・塩、こしょう、レモン汁') || a.include?('　・塩、こしょう、酒、片栗粉') || a.include?('　・塩、こしょう、砂糖') || a.include?('　・粗びき黒こしょう') || a.include?('　・とりガラスープの素、塩、こしょう') || a.include?('塩、あらびきこしょう') || a.include?('タバスコ、塩、こしょう') || a.include?('黒粒こしょう(つぶす)') || a.include?('　・サラダ油、塩、こしょう') || a.include?('　・塩、こしょう(粗びき黒こしょう)、レモン汁') || a.include?('・粒黒こしょう') || a.include?('　・塩、こしょう、オリーブ油') || a.include?('　・こしょう、サラダ油、あればナツメグ') || a.include?('　・オリーブ油、塩、こしょう') || a.include?('黒こしょう') || a.include?('塩、こしょう、粉チーズ') || a.include?('　　・塩、こしょう') || a.include?('　・塩、砂糖、こしょう') || a.include?('　・白または黒粒こしょう') || a.include?('　・砂糖、塩、こしょう') || a.include?('フルールドセル、こしょう、オリーブオイル')
      b = a["こしょう"] || a['　・こしょう'] || a['　・砂糖、こしょう'] || a['　・塩、こしょう'] || a['ゆずこしょう'] || a['　・塩、粗びき黒こしょう'] || a['　　・粗びき黒こしょう'] || a['塩、こしょう'] || a['粗びき黒こしょう'] || a['　・塩、こしょう、ごま油'] || a['　・練りわさび、こしょう'] || a['　・みりん、ゆずこしょう'] || a['　・塩、こしょう、レモン汁'] || a['　・塩、こしょう、酒、片栗粉'] || a['　・塩、こしょう、砂糖'] || a['　・粗びき黒こしょう'] || a['　・とりガラスープの素、塩、こしょう'] || a['塩、あらびきこしょう'] || a['タバスコ、塩、こしょう'] || a['黒粒こしょう(つぶす)'] || a['　・サラダ油、塩、こしょう'] || a['　・塩、こしょう(粗びき黒こしょう)、レモン汁'] || a['・粒黒こしょう'] || a['　・塩、こしょう、オリーブ油'] || a['　・こしょう、サラダ油、あればナツメグ'] || a['　・オリーブ油、塩、こしょう'] || a['黒こしょう'] || a['塩、こしょう、粉チーズ'] || a['　　・塩、こしょう'] || a['　・塩、砂糖、こしょう'] || a['　・白または黒粒こしょう'] || a['　・砂糖、塩、こしょう'] || a['フルールドセル、こしょう、オリーブオイル']
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
    if a.include?('カレールー') || a.include?('カレー粉') || a.include?('　・カレー粉') || a.include?('　・おろしにんにく、カレー粉') || a.include?('　・カレー粉、オイスターソース') || a.include?('カレールー(市販品)') || a.include?('カレールー（市販品）') || a.include?('カレールー(市販品・辛口、甘口)') || a.include?('カレールウ(市販品)') || a.include?('　・グリーンカレーペースト') || a.include?('レッドカレーペースト') || a.include?('カレールウ') || a.include?('　・顆粒スープの素、カレー粉')
      b = a["カレールー"] || a['カレー粉'] || a['　・カレー粉'] || a['　・おろしにんにく、カレー粉'] || a['　・カレー粉、オイスターソース'] || a['カレールー(市販品)'] || a['カレールー（市販品）'] || a['カレールー(市販品・辛口、甘口)'] || a['カレールウ(市販品)'] || a['　・グリーンカレーペースト'] || a['レッドカレーペースト'] || a['カレールウ'] || a['　・顆粒スープの素、カレー粉']
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
    if a.include?('小麦粉') || a.include?('　・小麦粉') || a.include?('小麦粉(薄力粉)') || a.include?('　・小麦粉(薄力粉)') || a.include?('ころも（小麦粉、溶き卵、パン粉）') || a.include?('　・白いりごま、小麦粉') || a.include?('　・小麦粉、溶き卵、パン粉') || a.include?('　・小麦粉、マヨネーズ、水') || a.include?('　・片栗粉、小麦粉') || a.include?('小麦粉、サラダ油')
      b = a["小麦粉"] || a['　・小麦粉'] || a['小麦粉(薄力粉)'] || a['　・小麦粉(薄力粉)'] || a['ころも（小麦粉、溶き卵、パン粉）'] || a['　・白いりごま、小麦粉'] || a['　・小麦粉、溶き卵、パン粉'] || a['　・小麦粉、マヨネーズ、水'] || a['　・片栗粉、小麦粉'] || a['小麦粉、サラダ油']
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
    if a.include?('砂糖') || a.include?('　・砂糖') || a.include?('　・砂糖、ごま油') || a.include?('　・砂糖、こしょう') || a.include?('　・酒、しょうゆ、砂糖') || a.include?('きび砂糖(または砂糖)') || a.include?('　・砂糖、みりん') || a.include?('　・とりガラスープの素、砂糖') || a.include?('　・酒、砂糖') || a.include?('　・バター、砂糖') || a.include?('　・しょうゆ、砂糖') || a.include?('　・砂糖、酢') || a.include?('　・きび砂糖(または砂糖)') || a.include?('　・おろししょうが、砂糖、しょうゆ') || a.include?('　・塩、こしょう、砂糖') || a.include?('　・砂糖、酒、みそ') || a.include?('　・塩、砂糖') || a.include?('　・ウスターソース、砂糖') || a.include?('香味みそ＜作りやすい分量＞(みそ1/2カップ、コチュジャン大さじ１、長ねぎのみじん切り大さじ２、しょうがのみじん切り大さじ１、にんにくのみじん切り大さじ1/2、いりごま[白]大さじ１、ごま油大さじ1/2、砂糖大さじ１、酒大さじ1/2)') || a.include?('　　・ニョクチャム＜作りやすい分量＞(ニョクマム[またはナンプラー]大さじ２、レモンの絞り汁大さじ３、砂糖大さじ３、水[できればミネラルウォーター]大さじ２、にんにくのみじん切り小さじ１、赤とうがらし[あればプリッキーヌ]のみじん切り1/2本分)') || a.include?('　・しょうゆ、砂糖、片栗粉') || a.include?('　・酒、みりん、砂糖') || a.include?('　・しょうゆ、砂糖、酒、ごま油、片栗粉') || a.include?('　　・砂糖') || a.include?('　・白いりごま、砂糖、みりん') || a.include?('　・黒酢、砂糖') || a.include?('　・ナンプラー、サラダ油、砂糖') || a.include?('　・砂糖、酒') || a.include?('　・みりん、砂糖') || a.include?('　・長ねぎのみじん切り、酢、砂糖、しょうゆ') || a.include?('　・酢、しょうゆ、砂糖') || a.include?('　・みそ、砂糖、みりん') || a.include?('　・砂糖、一味とうがらし') || a.include?('みりん、砂糖') || a.include?('　・おろししょうが、しょうゆ、砂糖、酢') || a.include?('　・酢、砂糖') || a.include?('　・砂糖、豆板醤(トウバンジャン)')
      b = a["砂糖"] || a['　・砂糖'] || a['　・砂糖、ごま油'] || a['　・砂糖、こしょう'] || a['　・酒、しょうゆ、砂糖'] || a['きび砂糖(または砂糖)'] || a['　・砂糖、みりん'] || a['　・とりガラスープの素、砂糖'] || a['　・酒、砂糖'] || a['　・バター、砂糖'] || a['　・しょうゆ、砂糖'] || a['　・砂糖、酢'] || a['　・きび砂糖(または砂糖)'] || a['　・おろししょうが、砂糖、しょうゆ'] || a['　・塩、こしょう、砂糖'] || a['　・砂糖、酒、みそ'] || a['　・塩、砂糖'] || a['　・ウスターソース、砂糖'] || a['香味みそ＜作りやすい分量＞(みそ1/2カップ、コチュジャン大さじ１、長ねぎのみじん切り大さじ２、しょうがのみじん切り大さじ１、にんにくのみじん切り大さじ1/2、いりごま[白]大さじ１、ごま油大さじ1/2、砂糖大さじ１、酒大さじ1/2)'] || a['　　・ニョクチャム＜作りやすい分量＞(ニョクマム[またはナンプラー]大さじ２、レモンの絞り汁大さじ３、砂糖大さじ３、水[できればミネラルウォーター]大さじ２、にんにくのみじん切り小さじ１、赤とうがらし[あればプリッキーヌ]のみじん切り1/2本分)'] || a['　・しょうゆ、砂糖、片栗粉'] || a['　・酒、みりん、砂糖'] || a['　・しょうゆ、砂糖、酒、ごま油、片栗粉'] || a['　　・砂糖'] || a['　・白いりごま、砂糖、みりん'] || a['　・黒酢、砂糖'] || a['　・ナンプラー、サラダ油、砂糖'] || a['　・砂糖、酒'] || a['　・みりん、砂糖'] || a['　・長ねぎのみじん切り、酢、砂糖、しょうゆ'] || a['　・酢、しょうゆ、砂糖'] || a['　・みそ、砂糖、みりん'] || a['　・砂糖、一味とうがらし'] || a['みりん、砂糖'] || a['　・おろししょうが、しょうゆ、砂糖、酢'] || a['　・酢、砂糖'] || a['　・砂糖、豆板醤(トウバンジャン)']
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
    if a.include?('酢') || a.include?('　・ポン酢じょうゆ') || a.include?('　・しょうゆ、酢') || a.include?('　・オリーブ油、酢') || a.include?('　・ナンプラー、酢、水') || a.include?('　・酢') || a.include?('　・しょうゆ、オイスターソース、酒、酢') || a.include?('　・酢、オリーブ油') || a.include?('ポン酢じょうゆ') || a.include?('　・酢、しょうゆ') || a.include?('　・砂糖、酢') || a.include?('白ワインビネガー(または酢)') || a.include?('黒酢') || a.include?('ポン酢じょうゆ（市販品）') || a.include?('　・はちみつ、酢') || a.include?('大根おろし、ポン酢じょうゆ') || a.include?('　・トマトケチャップ、酢') || a.include?('　・オリーブ油、酢') || a.include?('好みでラー油、酢') || a.include?('　・豆板醤(トウバンジャン)、しょうゆ、酢') || a.include?('　・黒酢、砂糖') || a.include?('　・酒、酢') || a.include?('　・バルサミコ酢、しょうゆ') || a.include?('　・マヨネーズ、酢') || a.include?('　・しょうゆ、酢、しょうがのせん切り') || a.include?('ポン酢') || a.include?('バルサミコ酢') || a.include?('　・白ワインビネガー(なければ酢)') || a.include?('　・酢、しょうゆ、砂糖') || a.include?('しょうゆ、酢') || a.include?('　・しょうゆ、酢、砂糖、ごま油') || a.include?('　・ごま油、酢、砂糖') || a.include?('　・トマトケチャップ、酢') || a.include?('　・しょうゆ、酢各') || a.include?('　・酢、酒') || a.include?('　・酢、酒') || a.include?('　・酢、サラダ油') || a.include?('　・バルサミコ酢') || a.include?('　・しょうゆ、酢、サラダ油') || a.include?('　・ごま油、酢') || a.include?('　・レモン汁(または酢)') || a.include?('　・レモン汁、酢、オリーブ油') || a.include?('ワインビネガー(なければ酢)') || a.include?('すし酢(市販品)')
      b = a["酢"] || a['　・ポン酢じょうゆ'] || a['　・しょうゆ、酢'] || a['　・オリーブ油、酢'] || a['　・ナンプラー、酢、水'] || a['　・酢'] || a['　・しょうゆ、オイスターソース、酒、酢'] || a['　・酢、オリーブ油'] || a['ポン酢じょうゆ'] || a['　・酢、しょうゆ'] || a['　・砂糖、酢'] || a['白ワインビネガー(または酢)'] || a['黒酢'] || a['ポン酢じょうゆ（市販品）'] || a['　・はちみつ、酢'] || a['大根おろし、ポン酢じょうゆ'] || a['　・トマトケチャップ、酢'] || a['　・オリーブ油、酢'] || a['好みでラー油、酢'] || a['　・豆板醤(トウバンジャン)、しょうゆ、酢'] || a['　・黒酢、砂糖'] || a['　・酒、酢'] || a['　・バルサミコ酢、しょうゆ'] || a['　・マヨネーズ、酢'] || a['　・しょうゆ、酢、しょうがのせん切り'] || a['ポン酢'] || a['バルサミコ酢'] || a['　・白ワインビネガー(なければ酢)'] || a['　・酢、しょうゆ、砂糖'] || a['しょうゆ、酢'] || a['　・しょうゆ、酢、砂糖、ごま油'] || a['　・ごま油、酢、砂糖'] || a['　・トマトケチャップ、酢'] || a['　・しょうゆ、酢各'] || a['　・酢、酒'] || a['　・酢、酒'] || a['　・酢、サラダ油'] || a['　・バルサミコ酢'] || a['　・しょうゆ、酢、サラダ油'] || a['　・ごま油、酢'] || a['　・レモン汁(または酢)'] || a['　・レモン汁、酢、オリーブ油'] || a['ワインビネガー(なければ酢)'] || a['すし酢(市販品)']
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
    if a.include?('サラダ油') || a.include?('　・砂糖、ごま油') || a.include?('　・ごま油、水') || a.include?('ごま油') || a.include?('　・ごま油') || a.include?('　・しょうゆ、ごま油') || a.include?('　・ごま油、白すりごま') || a.include?('　・塩、こしょう、ごま油') || a.include?('　・ごま油、片栗粉') || a.include?('　・片栗粉、ごま油') || a.include?('　・ごま油、サラダ油、しょうゆ、酒、水') || a.include?('香味みそ＜作りやすい分量＞(みそ1/2カップ、コチュジャン大さじ１、長ねぎのみじん切り大さじ２、しょうがのみじん切り大さじ１、にんにくのみじん切り大さじ1/2、いりごま[白]大さじ１、ごま油大さじ1/2、砂糖大さじ１、酒大さじ1/2)') || a.include?('　　・炒めねぎ(サラダ油大さじ２、万能ねぎの小口切り大さじ４)') || a.include?('・サラダ油、揚げ油、打ち粉(薄力粉)') || a.include?('　・酒、片栗粉、ごま油') || a.include?('　・しょうゆ、砂糖、酒、ごま油、片栗粉') || a.include?('　・みそ、ごま油') || a.include?('　・りんごジュース、酒、ごま油') || a.include?('　・ナンプラー、サラダ油、砂糖') || a.include?('　・ナンプラー、はちみつ、レモン汁、ごま油、豆板醤(トウバンジャン)') || a.include?('　・白すりごま、ごま油') || a.include?('　・サラダ油、塩、こしょう') || a.include?('小麦粉、サラダ油') || a.include?('　・しょうゆ、酢、ごま油') || a.include?('塩、ごま油') || a.include?('　・こしょう、サラダ油、あればナツメグ') || a.include?('　・ごま油、酢') || a.include?('　・酢、サラダ油') || a.include?('　・しょうゆ、酢、サラダ油') || a.include?('　・しょうゆ、ごま油、白すりごま')
      b = a["サラダ油"] || a['　・砂糖、ごま油'] || a['　・ごま油、水'] || a['ごま油'] || a['　・ごま油'] || a['　・しょうゆ、ごま油'] || a['　・ごま油、白すりごま'] || a['　・塩、こしょう、ごま油'] || a['　・ごま油、片栗粉'] || a['　・片栗粉、ごま油'] || a['　・ごま油、サラダ油、しょうゆ、酒、水'] || a['香味みそ＜作りやすい分量＞(みそ1/2カップ、コチュジャン大さじ１、長ねぎのみじん切り大さじ２、しょうがのみじん切り大さじ１、にんにくのみじん切り大さじ1/2、いりごま[白]大さじ１、ごま油大さじ1/2、砂糖大さじ１、酒大さじ1/2)'] || a['　　・炒めねぎ(サラダ油大さじ２、万能ねぎの小口切り大さじ４)'] || a['・サラダ油、揚げ油、打ち粉(薄力粉)'] || a['　・酒、片栗粉、ごま油'] || a['　・しょうゆ、砂糖、酒、ごま油、片栗粉'] || a['　・みそ、ごま油'] || a['　・りんごジュース、酒、ごま油'] || a['　・ナンプラー、サラダ油、砂糖'] || a['　・ナンプラー、はちみつ、レモン汁、ごま油、豆板醤(トウバンジャン)'] || a['　・白すりごま、ごま油'] || a['　・サラダ油、塩、こしょう'] || a['小麦粉、サラダ油'] || a['　・しょうゆ、酢、ごま油'] || a['塩、ごま油'] || a['　・こしょう、サラダ油、あればナツメグ'] || a['　・ごま油、酢'] || a['　・酢、サラダ油'] || a['　・しょうゆ、酢、サラダ油'] || a['　・しょうゆ、ごま油、白すりごま']
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
    if a.include?('オリーブオイル') || a.include?('　・オリーブ油、酢') || a.include?('　・オリーブ油') || a.include?('　・酢、オリーブ油') || a.include?('オリーブ油（またはサラダ油）') || a.include?('　・オリーブ油、しょうゆ') || a.include?('　・オリーブ油、だし汁') || a.include?('　・レモン汁、オリーブ油、水') || a.include?('オリーブ油またはサラダ油') || a.include?('オリーブ油') || a.include?('EXバージンオリーブ油') || a.include?('　・塩、こしょう、オリーブ油') || a.include?('　・オリーブ油、塩') || a.include?('　・EXバージンオリーブ油') || a.include?('　・塩、オリーブ油') || a.include?('　・オリーブ油、塩、こしょう') || a.include?('　・塩、オリーブ油、バター') || a.include?('塩、オリーブ油') || a.include?('エクストラバージンオリーブ油（あれば）') || a.include?('バージンオリーブ油（またはオリーブ油）') || a.include?('エクストラバージンオリーブ油') || a.include?('　・バター、オリーブ油') || a.include?('　・オリーブ油、粒マスタード') || a.include?('　・レモン汁、オリーブ油') || a.include?('　・粒マスタード、オリーブ油') || a.include?('フルールドセル、こしょう、オリーブオイル') || a.include?('　・レモン汁、エクストラバージンオリーブ油(またはオリーブ油)') || a.include?('　・レモン汁、酢、オリーブ油')
      b = a["オリーブオイル"] || a['　・オリーブ油、酢'] || a['　・オリーブ油'] || a['　・酢、オリーブ油'] || a['オリーブ油（またはサラダ油）'] || a['　・オリーブ油、しょうゆ'] || a['　・オリーブ油、だし汁'] || a['　・レモン汁、オリーブ油、水'] || a['オリーブ油またはサラダ油'] || a['オリーブ油'] || a['EXバージンオリーブ油'] || a['　・塩、こしょう、オリーブ油'] || a['　・オリーブ油、塩'] || a['　・EXバージンオリーブ油'] || a['　・塩、オリーブ油'] || a['　・オリーブ油、塩、こしょう'] || a['　・塩、オリーブ油、バター'] || a['塩、オリーブ油'] || a['エクストラバージンオリーブ油（あれば）'] || a['バージンオリーブ油（またはオリーブ油）'] || a['エクストラバージンオリーブ油'] || a['　・バター、オリーブ油'] || a['　・オリーブ油、粒マスタード'] || a['　・レモン汁、オリーブ油'] || a['　・粒マスタード、オリーブ油'] || a['フルールドセル、こしょう、オリーブオイル'] || a['　・レモン汁、エクストラバージンオリーブ油(またはオリーブ油)'] || a['　・レモン汁、酢、オリーブ油']
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
    if a.include?('レモン汁') || a.include?('刻みのり、レモン汁') || a.include?('　・レモン汁') || a.include?('　・マヨネーズ、レモン汁、しょうゆ') || a.include?('　・塩、こしょう、レモン汁') || a.include?('　・レモン汁、おろししょうが') || a.include?('　・しょうが汁、レモン汁') || a.include?('　　・レモン汁') || a.include?('　・レモン汁、オリーブ油、水') || a.include?('　・ナンプラー、はちみつ、レモン汁、ごま油、豆板醤(トウバンジャン)') || a.include?('　・レモンの絞り汁') || a.include?('　・ナンプラー、レモンの絞り汁') || a.include?('　・レモン汁、しょうゆ') || a.include?('レモンの絞り汁') || a.include?('レモン汁(または酢)') || a.include?('　・レモン汁、エクストラバージンオリーブ油(またはオリーブ油)') || a.include?('　・レモン汁(または酢)') || a.include?('　・レモン汁、酢、オリーブ油') || a.include?('おろしにんにく、レモン汁')
      b = a["レモン汁"] || a['刻みのり、レモン汁'] || a['　・レモン汁'] || a['　・マヨネーズ、レモン汁、しょうゆ'] || a['　・塩、こしょう、レモン汁'] || a['　・レモン汁、おろししょうが'] || a['　・しょうが汁、レモン汁'] || a['　　・レモン汁'] || a['　・レモン汁、オリーブ油、水'] || a['　・ナンプラー、はちみつ、レモン汁、ごま油、豆板醤(トウバンジャン)'] || a['　・レモンの絞り汁'] || a['　・ナンプラー、レモンの絞り汁'] || a['　・レモン汁、しょうゆ'] || a['レモンの絞り汁'] || a['レモン汁(または酢)'] || a['　・レモン汁、エクストラバージンオリーブ油(またはオリーブ油)'] || a['　・レモン汁(または酢)'] || a['　・レモン汁、酢、オリーブ油'] || a['おろしにんにく、レモン汁']
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

