# @s = 攻撃者 (プレイヤー)

# 無限ループ防止: 既に処理中の場合はスキップ
execute if entity @s[tag=janken_processing] run return 0
tag @s add janken_processing

# アドバンスメント再発動防止のためにrevoke
advancement revoke @s only janken_battle:damage_triggers/melee_attack

# 武器を持っているかチェック
execute unless predicate janken_battle:holding_weapon run return 0

# 防御者を取得
execute on target run tag @s add janken_defender

# ダメージ計算 (攻撃者のタグに基づいて倍率を決定)
execute as @s run function janken_battle:damage/calculate with entity @p[tag=janken_defender]

# ダメージ適用 (基本ダメージ3.0)
execute as @p[tag=janken_defender] run function janken_battle:damage/apply_melee

# クリーンアップ
tag @s remove janken_processing
tag @p[tag=janken_defender] remove janken_defender