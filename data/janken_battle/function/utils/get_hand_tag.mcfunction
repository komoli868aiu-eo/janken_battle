# @s = プレイヤー
# 戻り値: 1=パー, 2=グー, 3=チョキ, 0=なし (janken_tempスコアに設定)

# パー判定 (custom_data {janken:"paa"})
execute store success score @s janken_temp if items entity @s weapon.mainhand *[custom_data~{janken:"paa"}]
execute if score @s janken_temp matches 1 run return 1

# グー判定
execute store success score @s janken_temp if items entity @s weapon.mainhand *[custom_data~{janken:"guu"}]
execute if score @s janken_temp matches 1 run return 2

# チョキ判定
execute store success score @s janken_temp if items entity @s weapon.mainhand *[custom_data~{janken:"tyoki"}]
execute if score @s janken_temp matches 1 run return 3

# なし
scoreboard players set @s janken_temp 0
return 0