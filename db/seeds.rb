# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8



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
Facility.create(name: "Meijiフットサル",
                image: "court2.jpg",
                pref_id: 1,
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
Facility.create(name: "宝塚フットサルドームCABO",
                image: "court1.jpg",
                pref_id: 2,
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
Facility.create(name: "フットサルスクエア京都南",
                image: "court3.jpg",
                pref_id: 3,
                address: "京都市伏見区竹田青池町135(ふしみっとビル2F)",
                tel: "075-642-2036",
                site: "http://www.2036.jp/",
                open_hour: "平日/10:00～26:00　土・日・祝日/8:00～26:00",
                fee: "平日10時～18時
                メンバー　￥7,000　ビジター　￥9,200
                平日18時～24時　土日祝 8時～24時
                メンバー　￥10,800　ビジター　￥13,000",
                parking:"25台",
                )
Facility.create(name: "ダックマンフットボールガーデン草津",
                image: "court4.jpg",
                pref_id: 4,
                address: "滋賀県草津市川原町129-1",
                tel: "075-642-2036",
                site: "http://duck-man.net/",
                open_hour: "平日/10:00～26:00　土・日・祝日/8:00～26:00",
                fee: "平日10時～18時
                メンバー　￥7,000　ビジター　￥9,200
                平日18時～24時　土日祝 8時～24時
                メンバー　￥10,800　ビジター　￥13,000",
                parking:"25台",
                )
Facility.create(name: "香芝フットサルパーク",
                image: "court5.jpg",
                pref_id: 5,
                address: "奈良県香芝市平野595番地の1",
                tel: "0745-79-8717",
                site: "http://www.kashibafutsalpark.com/",
                open_hour: "平日/10:00～26:00　土・日・祝日/8:00～26:00",
                fee: "平日10時～18時
                メンバー　￥7,000　ビジター　￥9,200
                平日18時～24時　土日祝 8時～24時
                メンバー　￥10,800　ビジター　￥13,000",
                parking:"25台",
                )
Facility.create(name: "ＦＵＴＳＡＬ ＣＬＵＢ西浜ハットトリック",
                image: "court6.jpg",
                pref_id: 6,
                address: "和歌山県和歌山市湊５１７",
                tel: "073-431-2132",
                site: "http://www.n-hattrick.com/",
                open_hour: "平日/10:00～26:00　土・日・祝日/8:00～26:00",
                fee: "平日10時～18時
                メンバー　￥7,000　ビジター　￥9,200
                平日18時～24時　土日祝 8時～24時
                メンバー　￥10,800　ビジター　￥13,000",
                parking:"25台",
                )
TeamInfo.create(name: "サンプル",
                logo: "default_logo.jpg",
                image: "default_team.jpg",
                pref_id: 1,
                facility_id: 1,
                cat_id: 1,
                age_ave: 10,
                comment: "よろしくお願いします。",
                email: "fujiwara@yahoo.co.jp",
                password: "211111",
                admin: true,
                attack: 10,
                physical: 10,
                stamina: 10,
                defense: 10,
                tactics: 10,
                technique: 10)
TeamInfo.create(name: "名古屋オーシャンズ",
                logo: "logo1.jpg",
                image: "team1.jpg",
                pref_id: 2,
                facility_id: 2,
                cat_id: 3,
                age_ave: 25,
                comment: "よろしくお願いします。",
                email: "yossy1986512@yahoo.co.jp",
                password: "211111",
                attack: 9,
                physical: 9,
                stamina: 9,
                defense: 9,
                tactics: 9,
                technique: 9)
TeamInfo.create(name: "シュライカー大阪",
                logo: "logo2.jpg",
                image: "team2.jpg",
                pref_id: 3,
                facility_id: 3,
                cat_id: 4,
                age_ave: 23,
                comment: "よろしくお願いします。",
                email: "yoshi1986512@yahoo.co.jp",
                password: "211111",
                attack: 8,
                physical: 8,
                stamina: 8,
                defense: 8,
                tactics: 8,
                technique: 8)
TeamInfo.create(name: "バルドラール浦安",
                logo: "logo3.jpg",
                image: "team3.jpg",
                pref_id: 4,
                facility_id: 4,
                cat_id: 5,
                age_ave: 30,
                comment: "よろしくお願いします。",
                email: "yossy1986512@gmail.com",
                password: "211111",
                attack: 7,
                physical: 7,
                stamina: 7,
                defense: 7,
                tactics: 7,
                technique: 7)
TeamInfo.create(name: "バサジィ大分",
                logo: "logo4.jpg",
                image: "team4.jpg",
                pref_id: 5,
                facility_id: 5,
                cat_id: 6,
                age_ave: 25,
                comment: "よろしくお願いします。",
                email: "yoshi1986512@gmail.com",
                password: "211111",
                attack: 6,
                physical: 6,
                stamina: 6,
                defense: 6,
                tactics: 6,
                technique: 6)
MatchReq.create(team_info_id: 2,
                match_date: (Time.local(2018,10,30)),
                start_time: (Time.local(2018,10,30,18,0,0)),
                end_time: (Time.local(2018,10,30,20,0,0)),
                pref_id: 2,
                facility_id: 2,
                req_cat: 1,
                req_team_num: 4,
                content: "よろしくお願いします。"
                )
MatchReq.create(team_info_id: 3,
                match_date: (Time.local(2018,10,30)),
                start_time: (Time.local(2018,10,30,18,0,0)),
                end_time: (Time.local(2018,10,30,20,0,0)),
                pref_id: 3,
                facility_id: 3,
                req_cat: 2,
                req_team_num: 4,
                content: "よろしくお願いします。"
                )
MatchReq.create(team_info_id: 4,
                match_date: (Time.local(2018,10,30)),
                start_time: (Time.local(2018,10,30,18,0,0)),
                end_time: (Time.local(2018,10,30,20,0,0)),
                pref_id: 4,
                facility_id: 4,
                req_cat: 3,
                req_team_num: 4,
                content: "よろしくお願いします。"
                )
MatchReq.create(team_info_id: 5,
                match_date: (Time.local(2018,10,30)),
                start_time: (Time.local(2018,10,30,18,0,0)),
                end_time: (Time.local(2018,10,30,20,0,0)),
                pref_id: 5,
                facility_id: 5,
                req_cat: 4,
                req_team_num: 4,
                content: "よろしくお願いします。"
                )
Room.create(match_req_id: 1)
Room.create(match_req_id: 2)
Room.create(match_req_id: 3)
Room.create(match_req_id: 4)
ChatLink.create(room_id: 1,
                team_info_id: 2)
ChatLink.create(room_id: 2,
                team_info_id: 3)
ChatLink.create(room_id: 3,
                team_info_id: 4)
ChatLink.create(room_id: 4,
                team_info_id: 5)