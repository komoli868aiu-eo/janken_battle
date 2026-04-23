# @s = 発射体

# 防御者を取得 (発射体が当たったエンティティ)
execute on target run tag @s add janken_defender_temp

# 攻撃者 (発射体自身) のタグで倍率計算
execute as @s run function janken_battle:damage/calculate with entity @p[tag=janken_defender_temp]

# ダメージ適用
execute as @p[tag=janken_defender_temp] run function janken_battle:damage/apply_ranged_damage

# クリーンアップ
tag @p[tag=janken_defender_temp] remove janken_defender_temp