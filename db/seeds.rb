# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

TeamInfo.create(name: "名古屋オーシャンズ",
                logo: "logo1.jpg",
                image: "team1.jpg",
                pref: 1,
                facility: 1,
                cat: 3,
                rank: 5,
                age_ave: 25,
                comment: "よろしくお願いします。",
                email: "yossy1986512@yahoo.co.jp",
                password: "2111",)
TeamInfo.create(name: "シュライカー大阪",
                logo: "logo2.jpg",
                image: "team2.jpg",
                pref: 2,
                facility: 2,
                cat: 4,
                rank: 7,
                age_ave: 23,
                comment: "よろしくお願いします。",
                email: "yoshi1986512@yahoo.co.jp",
                password: "2111",)
TeamInfo.create(name: "バルドラール浦安",
                logo: "logo3.jpg",
                image: "team3.jpg",
                pref: 3,
                facility: 1,
                cat: 5,
                rank: 2,
                age_ave: 30,
                comment: "よろしくお願いします。",
                email: "yossy1986512@gmail.com",
                password: "2111",)
TeamInfo.create(name: "バサジィ大分",
                logo: "logo4.jpg",
                image: "team4.jpg",
                pref: 4,
                facility: 2,
                cat: 6,
                rank: 4,
                age_ave: 25,
                comment: "よろしくお願いします。",
                email: "yoshi1986512@gmail.com",
                password: "2111",)
Facility.create(name: "宝塚フットサルドームCABO",
                image: "court1.jpg",
                pref: 2,
                address: "宝塚市安倉西4丁目25－1",
                tel: "1111111",
                site: "http://www.cabo-pb.com/",
                open_hour: "日～金　10：00～24：00
                土・日・祝　8：00～24：00",
                fee:"平日10時～18時
                メンバー　￥7,000　ビジター　￥9,200
                平日18時～24時　土日祝 8時～24時
                メンバー　￥10,800　ビジター　￥13,000",
                parking:"30台",
                )
Facility.create(name: "Meijiフットサル",
                image: "court2.jpg",
                pref: 1,
                address: "吹田市西御旅町7-53",
                tel: "1111111",
                site: "https://www.meiji-s.ac.jp/mt_futsal_main.html",
                open_hour: "月～金　/　10：00～22：30　土・日・祝　/　9：00～22：00",
                fee: "平日10時～18時
                メンバー　￥7,000　ビジター　￥9,200
                平日18時～24時　土日祝 8時～24時
                メンバー　￥10,800　ビジター　￥13,000",
                parking:"30台",
                )
Post.create(title: "テストです",
            content: "BODY DIRECTORのパーソナルトレーニングはウェイトトレーニング（筋トレ）も行いますが、体質や体調によって運動強度や運動量、運動時間も調整します。筋肉をつけることも、筋肉が少ない方には必要ですが、筋肉がある方に関しては、筋肉の質を整える事や、日常の疲れを取り除くためにトリートメント（ストレッチや押圧）を重視する事もあります。",
            image: "post1.jpg",
            )
Post.create(title:"体のタイプを分類するところから始まります。",
            content:"体組成計で筋肉と脂肪の量を測定
            カウンセリングでご要望と現在過去の生活習慣を把握
            ボディタイプを判断（筋肉質タイプ、肥満タイプ、痩せタイプ、隠れ肥満タイプ、バランスタイプ）
            筋肉の状態評価
            運動、食事、施術メニューの作成
            プログラム開始",
            image:"post2.jpg",
            )
Post.create(title:"このような手順を踏みます。",
            content:"カウンセリングは無料で行なっておりますので、まずはウェブページをご覧ください。",
            image:"post3.jpg",
            )
Post.create(title:"体調に気を付けて楽しみましょう！",
            content:"さて、今日も気温は35度以上の猛暑。環境によってはそれ以上に高くなるし、日差しが強ければさらに過酷な状況になります。
            フェスに参加する方は日陰を見つけて日を避けるようにしないと熱中症のリスクがとても高くて危険です。",
            image:"post4.jpg",
            )
TeamLevel.create(team_info_id: 1,
                  attack: 9,
                  physical: 9,
                  stamina: 9,
                  defense: 9,
                  tactics: 9,
                  technique: 9)
TeamLevel.create(team_info_id: 2,
                  attack: 8,
                  physical: 8,
                  stamina: 8,
                  defense: 8,
                  tactics: 8,
                  technique: 8)
TeamLevel.create(team_info_id: 3,
                  attack: 7,
                  physical: 7,
                  stamina: 7,
                  defense: 7,
                  tactics: 7,
                  technique: 7)
TeamLevel.create(team_info_id: 4,
                  attack: 6,
                  physical: 6,
                  stamina: 6,
                  defense: 6,
                  tactics: 6,
                  technique: 6)
Rank.create(
            name: "SS")
Rank.create(
            name: "S")
Rank.create(
            name: "A")
Rank.create(
            name: "B")
Rank.create(
            name: "C")
Rank.create(
            name: "D")
Rank.create(
            name: "E")
Rank.create(
            name: "F")
Pref.create(
            name: "大阪府")
Pref.create(
            name: "兵庫県")
Pref.create(
            name: "京都府")
Pref.create(
            name: "滋賀県")
Pref.create(
            name: "奈良県")
Pref.create(
            name: "和歌山県")
Cat.create(
            name: "関西リーグ")
Cat.create(
            name: "都道府県リーグ")
Cat.create(
            name: "競技志向")
Cat.create(
            name: "エンジョイ")
Cat.create(
            name: "女子")
Cat.create(
            name: "MIX")
Cat.create(
            name: "U-18")
