# 毎tick、新しく生成された発射体をチェックしてタグ継承
execute as @e[type=arrow,tag=!tag_inherited] run function janken_battle:projectile/inherit_tags
execute as @e[type=arrow,tag=!tag_inherited] run tag @s add tag_inherited

execute as @e[type=spectral_arrow,tag=!tag_inherited] run function janken_battle:projectile/inherit_tags
execute as @e[type=spectral_arrow,tag=!tag_inherited] run tag @s add tag_inherited

execute as @e[type=trident,tag=!tag_inherited] run function janken_battle:projectile/inherit_tags
execute as @e[type=trident,tag=!tag_inherited] run tag @s add tag_inherited