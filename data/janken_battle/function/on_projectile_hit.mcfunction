# @s = 発射体

# 無限ループ防止
execute if entity @s[tag=janken_processing] run return 0
tag @s add janken_processing

# アドバンスメントrevoke
advancement revoke @s only janken_battle:damage_triggers/projectile_hit

# 発射体にじゃんけんタグまたは汎用兵士タグがあるかチェック
execute unless predicate janken_battle:has_janken_tag run unless predicate janken_battle:has_hanyou_tag run return 0

# 遠距離ダメージ適用
function janken_battle:damage/apply_ranged

# クリーンアップ
tag @s remove janken_processing