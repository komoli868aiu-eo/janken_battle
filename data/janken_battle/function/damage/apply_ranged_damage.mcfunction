# @s = 防御者

# multiplier に応じてダメージを適用 (基本ダメージ3.0)
execute if score $multiplier janken_multiplier matches 12 run damage @s 3.6 janken_battle:janken_damage
execute if score $multiplier janken_multiplier matches 10 run damage @s 3.0 janken_battle:janken_damage
execute if score $multiplier janken_multiplier matches 8 run damage @s 2.4 janken_battle:janken_damage
execute if score $multiplier janken_multiplier matches 5 run damage @s 1.5 janken_battle:janken_damage

# デバッグメッセージ (オプション、必要に応じてコメント解除)
# execute if score $multiplier janken_multiplier matches 12 run tellraw @a [{"text":"[Janken Ranged] ","color":"green"},{"text":"勝利！ 1.2倍ダメージ","color":"yellow"}]
# execute if score $multiplier janken_multiplier matches 8 run tellraw @a [{"text":"[Janken Ranged] ","color":"gray"},{"text":"汎用兵士… 0.8倍ダメージ","color":"yellow"}]
# execute if score $multiplier janken_multiplier matches 5 run tellraw @a [{"text":"[Janken Ranged] ","color":"red"},{"text":"敗北… 0.5倍ダメージ","color":"yellow"}]

# スコアリセット
scoreboard players reset $multiplier janken_multiplier