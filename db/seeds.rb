require 'open-uri'
require 'json'
require 'net/http'

uri = URI("https://kenkoooo.com/atcoder/atcoder-api/info/ac")
res = Net::HTTP.get_response(uri)
json = JSON.parse(res.body)
datas = json
num = 0

datas.each do |data|
    user = User.find_or_initialize_by(user_id: data["user_id"])
    user.today_count = user.now_count
    user.now_count = data["problem_count"]
    if user.persisted? 
        user.effort_count = user.now_count - user.today_count
    end
    
    user.save
    num += 1
    puts num
    
end
    
    now_ranks = User.order("now_count desc")
    pre_count = 0
    n = 0;
    rank = 1
    now_ranks.each do |now|
        if(n != 0)
            if(pre_count != now.now_count)
                rank += 1
            end
        end
        now.now_rank = rank
        now.save
        pre_count = now.now_count
        n += 1
        puts n
    end

    effort_ranks = User.order("effort_count desc")
    pre_ef = 10000
    e = 0
    ef = 1
    effort_ranks.each do |effort|
        if(e != 0)
            if(pre_ef != effort.effort_count)
                ef += 1
            end
        end
        effort.effort_rank = ef
        effort.save
        pre_ef = effort.effort_count
        e += 1
        puts e
    end
