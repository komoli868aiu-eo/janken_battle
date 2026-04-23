# 引数: @s = 攻撃者 (プレイヤーまたは発射体), @d = 防御者 (with entity で渡す)
# 倍率を janken_multiplier スコアに設定
# 10 = 1.0倍, 12 = 1.2倍, 5 = 0.5倍, 8 = 0.8倍 (汎用兵士)

# デフォルト 1.0倍 (10)
scoreboard players set $multiplier janken_multiplier 10

# ========== 優先ルール1: 攻撃者が汎用兵士の場合 ==========
# 相手のタグに関係なく 0.8倍ダメージ (三すくみ完全スキップ)
execute if entity @s[tag=ore_hanyou_heishi_dayo] run scoreboard players set $multiplier janken_multiplier 8
execute if entity @s[tag=ore_hanyou_heishi_dayo] run return 0

# ========== 通常ルール: 三すくみ相性判定 ==========
# 勝利判定 (1.2倍 = 12)
# パー vs グー
execute if entity @s[tag=kinsetu_keisou_paa] if entity @d[tag=kinsetu_juusou_guu] run scoreboard players set $multiplier janken_multiplier 12
# グー vs チョキ
execute if entity @s[tag=kinsetu_juusou_guu] if entity @d[tag=kyuuhei_tyoki] run scoreboard players set $multiplier janken_multiplier 12
# チョキ vs パー
execute if entity @s[tag=kyuuhei_tyoki] if entity @d[tag=kinsetu_keisou_paa] run scoreboard players set $multiplier janken_multiplier 12

# 敗北判定 (0.5倍 = 5)
# パー vs チョキ
execute if entity @s[tag=kinsetu_keisou_paa] if entity @d[tag=kyuuhei_tyoki] run scoreboard players set $multiplier janken_multiplier 5
# グー vs パー
execute if entity @s[tag=kinsetu_juusou_guu] if entity @d[tag=kinsetu_keisou_paa] run scoreboard players set $multiplier janken_multiplier 5
# チョキ vs グー
execute if entity @s[tag=kyuuhei_tyoki] if entity @d[tag=kinsetu_juusou_guu] run scoreboard players set $multiplier janken_multiplier 5