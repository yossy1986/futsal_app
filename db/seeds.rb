# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

MatchReq.create(team_id: 1,
                match_date: (Time.local(2018,10,10)),
                start_time: (Time.local(2018,10,10,10,10,0)),
                end_time: (Time.local(2018,10,10,12,12,0)),
                pref: 1,
                facility: 1,
                req_cat: "d",
                req_rank: "SS",
                req_team_num: 4,
                content: "よろしくお願いします。"
                )
MatchReq.create(team_id: 2,
                match_date: (Time.local(2018,9,1)),
                start_time: (Time.local(2018,9,1,10,10,0)),
                end_time: (Time.local(2018,9,1,12,12,0)),
                pref: 2,
                facility: 2,
                req_cat: "c",
                req_rank: 2,
                req_team_num: 4,
                content: "よろしくお願いします。"
                )
MatchReq.create(team_id: 3,
                match_date: (Time.local(2018,9,3)),
                start_time: (Time.local(2018,9,3,10,10,0)),
                end_time: (Time.local(2018,9,3,12,12,0)),
                pref: 3,
                facility: 3,
                req_cat: "b",
                req_rank: 3,
                req_team_num: 4,
                content: "よろしくお願いします。"
                )
MatchReq.create(team_id: 4,
                match_date: (Time.local(2018,9,22)),
                start_time: (Time.local(2018,9,22,10,10,0)),
                end_time: (Time.local(2018,9,22,12,12,0)),
                pref: 2,
                facility: 2,
                req_cat: "a",
                req_rank: 4,
                req_team_num: 4,
                content: "よろしくお願いします。"
                )

TeamInfo.create(name: "名古屋オーシャンズ",
                logo: "logo1.jpg",
                image: "team1.jpg",
                pref: 1,
                facility: 1,
                cat: "a",
                rank: 0,
                age_ave: 25,
                comment: "よろしくお願いします。",
                email: "yossy1986512@yahoo.co.jp",
                password: 2111,)
TeamInfo.create(name: "シュライカー大阪",
                logo: "logo2.jpg",
                image: "team2.jpg",
                pref: 2,
                facility: 2,
                cat: "b",
                rank: 1,
                age_ave: 23,
                comment: "よろしくお願いします。",
                email: "yoshi1986512@yahoo.co.jp",
                password: 2111,)
TeamInfo.create(name: "バルドラール浦安",
                logo: "logo3.jpg",
                image: "team3.jpg",
                pref: 3,
                facility: 3,
                cat: "c",
                rank: 2,
                age_ave: 30,
                comment: "よろしくお願いします。",
                email: "yossy1986512@gmail.com",
                password: 2111,)
TeamInfo.create(name: "バサジィ大分",
                logo: "logo4.jpg",
                image: "team4.jpg",
                pref: 4,
                facility: 4,
                cat: "d",
                rank: 3,
                age_ave: 25,
                comment: "よろしくお願いします。",
                email: "yoshi1986512@gmail.com",
                password: 2111,)