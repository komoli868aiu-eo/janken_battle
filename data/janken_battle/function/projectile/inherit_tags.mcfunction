# @s = 発射体 (arrow/spectral_arrow/trident)

# 射手のじゃんけんタグを取得
execute on attacker run function janken_battle:utils/get_hand_tag

# じゃんけんタグ継承
execute if score @s janken_temp matches 1 run tag @s add kinsetu_keisou_paa
execute if score @s janken_temp matches 2 run tag @s add kinsetu_juusou_guu
execute if score @s janken_temp matches 3 run tag @s add kyuuhei_tyoki

# 汎用兵士タグ継承 (射手が持っていれば発射体にも付与)
execute on attacker run tag @s add ore_hanyou_heishi_dayo

# クリーンアップ (attacker側のスコアをリセット)
execute on attacker run scoreboard players reset @s janken_temp