# Janken Battle Data Pack

**Minecraft 1.21 / 1.21.1 / 1.21.2 / 1.21.3 / 1.21.4 対応**

三すくみ（じゃんけん）ベースのダメージ倍率システムを追加するデータパックです。

---

## 概要

プレイヤーが持つ武器のカスタムデータに基づいて、攻撃時に以下のダメージ倍率を適用します。

| 相性 | 倍率 |
|------|------|
| 勝利 (パー→グー / グー→チョキ / チョキ→パー) | **1.2倍** |
| 通常 | **1.0倍** |
| 敗北 (グー→パー / チョキ→グー / パー→チョキ) | **0.5倍** |
| 汎用兵士 (特別タグ) | **0.8倍** (相性無視) |

---

## 対応武器

以下の武器を使用した攻撃が対象です：

- 剣 (全て)
- 斧 (全て)
- メイス
- トライデント
- 弓
- クロスボウ

※ 素手その他の武器では通常ダメージになります。

---

## タグ一覧

### じゃんけんタグ (武器用)

武器の `custom_data` に以下のいずれかを設定します：

| タグ | カスタムデータ | 意味 |
|------|----------------|------|
| `kinsetu_keisou_paa` | `{janken:"paa"}` | パー |
| `kinsetu_juusou_guu` | `{janken:"guu"}` | グー |
| `kyuuhei_tyoki` | `{janken:"tyoki"}` | チョキ |

### 汎用兵士タグ (プレイヤー用)

| タグ | 効果 |
|------|------|
| `ore_hanyou_heishi_dayo` | 攻撃が常に **0.8倍** (三すくみ無効) |

---

## 使い方

### 1. データパックのインストール

```
.minecraft/
└── saves/
    └── (ワールド名)/
        └── datapacks/
            └── janken_battle/   # このフォルダを配置
```

### 2. 武器へのタグ付与 (giveコマンド例)

```mcfunction
# パーの武器 (剣)
give @s diamond_sword[custom_data={janken:"paa"}]

# グーの武器 (斧)
give @s netherite_axe[custom_data={janken:"guu"}]

# チョキの武器 (弓/クロスボウ/トライデント)
give @s bow[custom_data={janken:"tyoki"}]
give @s crossbow[custom_data={janken:"tyoki"}]
give @s trident[custom_data={janken:"tyoki"}]
```

### 3. 既存アイテムへのタグ付与

```mcfunction
item replace entity @s weapon.mainhand with iron_sword[custom_data={janken:"paa"}]
```

### 4. 汎用兵士タグの付与 (プレイヤー自身)

```mcfunction
# 付与
tag @s add ore_hanyou_heishi_dayo

# 解除
tag @s remove ore_hanyou_heishi_dayo
```

---

## 遠距離攻撃について

弓・クロスボウ・トライデントで発射された矢やトライデントは、**発射時の射手のタグを継承**します。

- 射手が `{janken:"paa"}` の武器を持っていれば、発射体にも `kinsetu_keisou_paa` タグが付与
- 射手が汎用兵士タグを持っていれば、発射体にも継承

着弾時のダメージ計算は**発射体自身のタグ**を参照するため、発射後に射手の装備を変更しても正しく判定されます。

---

## ファイル構成

```
janken_battle/
├── pack.mcmeta
└── data/
    ├── janken_battle/
    │   ├── damage_type/
    │   │   └── janken_damage.json
    │   ├── function/
    │   │   ├── load.mcfunction
    │   │   ├── tick.mcfunction
    │   │   ├── on_melee_attack.mcfunction
    │   │   ├── on_projectile_hit.mcfunction
    │   │   ├── on_damage_loop_prevent.mcfunction
    │   │   ├── clear_damage_tag.mcfunction
    │   │   ├── projectile/
    │   │   │   └── inherit_tags.mcfunction
    │   │   ├── damage/
    │   │   │   ├── calculate.mcfunction
    │   │   │   ├── apply_melee.mcfunction
    │   │   │   ├── apply_ranged.mcfunction
    │   │   │   └── apply_ranged_damage.mcfunction
    │   │   └── utils/
    │   │       └── get_hand_tag.mcfunction
    │   ├── advancement/
    │   │   └── damage_triggers/
    │   │       ├── melee_attack.json
    │   │       ├── projectile_hit.json
    │   │       └── prevent_infinite_loop.json
    │   ├── predicate/
    │   │   ├── holding_weapon.json
    │   │   ├── is_melee_weapon.json
    │   │   ├── is_ranged_weapon.json
    │   │   ├── has_janken_tag.json
    │   │   └── has_hanyou_tag.json
    │   └── tags/
    │       ├── function/
    │       │   └── load.json
    │       └── damage_type/
    │           └── no_immunity.json
    └── minecraft/
        └── tags/
            └── function/
                └── tick.json
```

---

## バージョン対応

| Minecraft バージョン | pack_format |
|---------------------|-------------|
| 1.21 – 1.21.1 | 48 |
| 1.21.2 – 1.21.4 | 61 |

※ `pack.mcmeta` 内の `pack_format` を環境に合わせて変更してください。

---

## 注意事項

1. **無限ループ防止**  
   `/damage` コマンドで与えたダメージを再検知しない仕組みが実装されています。

2. **他のデータパックとの競合**  
   名前空間 `janken_battle` を使用しているため、他のデータパックと競合しにくい設計です。

3. **デバッグメッセージ**  
   各 `apply_*.mcfunction` 内にデバッグ用の `tellraw` コマンドがコメントアウトで用意されています。必要に応じてコメントを解除してください。

---

## 動作確認済み環境

- Minecraft Java Edition 1.21.4
- 純正サーバー / Paper サーバー (データパック機能が有効な場合)

---

## ライセンス

このデータパックは自由に使用・改変・再配布可能です。

---

## 作者

Janken Battle Data Pack
