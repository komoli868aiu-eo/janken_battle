# @s = ダメージを受けたエンティティ (スケジュール実行時は@0になるため再指定)
execute as @e[tag=janken_damaged] run tag @s remove janken_damaged