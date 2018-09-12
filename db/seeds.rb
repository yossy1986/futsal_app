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
                req_cat: "a",
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
                req_cat: "a",
                req_rank: "A",
                req_team_num: 4,
                content: "よろしくお願いします。"
                )
MatchReq.create(team_id: 3,
                match_date: (Time.local(2018,9,3)),
                start_time: (Time.local(2018,9,3,10,10,0)),
                end_time: (Time.local(2018,9,3,12,12,0)),
                pref: 3,
                facility: 3,
                req_cat: "a",
                req_rank: "A",
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