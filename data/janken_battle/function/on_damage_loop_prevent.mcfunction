# @s = ダメージを受けたエンティティ

# /damage によるダメージを再度拾わないようタグを付与
tag @s add janken_damaged

# アドバンスメントrevoke
advancement revoke @s only janken_battle:damage_triggers/prevent_infinite_loop

# 1tick後にタグ解除
schedule function janken_battle:clear_damage_tag 1t