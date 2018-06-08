# class Agent
   
#     def initialize(max_stone)
#         @com1 = rand(2,6)
#         @com2 = rand(2,6)

#     end
#     def max_stone
#         @max_stone
#     end
#     def put_stone(first)
        
#         if first == user
#             rest_stone = stone_num - user_stone
#             if rest_stone => 3
#                 rest_stone = rest_stone - com.max_stone
#             else rest_stone <= 2
#                 puts("comの負けです")
#             end 
#             return rest_stone
#         else
#             rest_stone =stone_num - com.max_stone
#             if rest_stone => 3
#                 rest_stone = rest_stone - user_stone
#             else rest_stone <= 2
#                 puts("あなたの負けです")
#             end 
#             return rest_stone
#         end
        
#     end

#     com1 = Agent.new()
#     com2 = Agent.new()





#     rest_num = Random.rand(11..30)# このclassの初期値の設定
#     array =[com, user]
#     first = array[rand(2)]#どちらが先行か決定する
#     if first == user
#         second = com 
#     else 
#         second = user
#     end

#     for rest_num =>3




















    # #第一回目の試行
    # for rest_stone => 3
    #     puts("入力してください")
    #     user_stone = gets.to_i　# userが一度に取り除くことが出来る石の数

    #     com = Agent.new(rand(2..6)) # comが一度に取り除くことが出来る石の数
    #     # puts("comの数は"+com.max_stone)

    #         put_stone() #試行を実行する
    #     else 
    #         puts("入力してください")
    #         user_stone = gets.to_i　# userが一度に取り除くことが出来る石の数

    #         com = Agent.new(rand(2..6)) # comが一度に取り除くことが出来る石の数
    #         # puts("comの数は"+com.max_stone)

    #         put_stone()
    # end
    #     # if rest_stone = 2
    #     #     break

    #     # end
        


# end

#ここから本当のコード


class Agent
   
    def initialize(max_stone)
        @max_stone = max_stone
        # @com1 = max_stone
        # @com2 = max_stone
        # @user = max_stone
    end
    def count
        puts "取る数は　#@max_stone"
    end
    # def myloop()
    #     while true
    #         yield
    #      end
    # end
    #com1の引き算
    def put_stone1(stone_num)
        loop do
            if @max_stone < stone_num
                print "com1の試行前は" , stone_num
                print "\n"
                rest_num = stone_num - @max_stone
                print "com1の試行後は" , rest_num , "\n\n"
                stone_num = rest_num
                break
            else
                @max_stone = rand(2..6)
                print "選びなおしました　数は　#@max_stone\n\n"
            end
        end
        
        return stone_num
    end
    #com2の引き算
    def put_stone2(stone_num)
        loop do
            if @max_stone < stone_num
                print "com2の試行前は" , stone_num
                print "\n"
                rest_num = stone_num - @max_stone
                print "com2の試行後は" , rest_num , "\n\n"
                stone_num = rest_num
                break
            else
                @max_stone = rand(2..6)
                print "選びなおしました　数は　#@max_stone\n\n"
            end
        end
        return stone_num
    end

    def put_stone_user(stone_num)
        print "userの試行前は" , stone_num
        print "\n"
        rest_num = stone_num - @max_stone
        print "userの試行後は" , rest_num , "\n\n"
        stone_num = rest_num
        return stone_num
    end
end
 
stone_num = Random.rand(11..30)
print "初期の石の数は＝"
print stone_num
print "\n\n"


loop do
    #com1の挙動
    com1 = Agent.new(rand(2..6))
    print "com1の"
    com1.count
    print "\n"
    # myloop do
        stone_num = com1.put_stone1(stone_num)
        # break if rest_num ＝！ stone_num
        # print(rest_num)
        # stone_num = rest_num
    # end  
    if stone_num < 3  then
        print "com2のまけ\n\n"
        break
    end

    #com2の挙動
    com2 = Agent.new(rand(2..6))
    print "com2の" 
    com2.count
    print "\n"
    # myloop do
        stone_num = com2.put_stone2(stone_num)
        # break if rest_num ＝！ stone_num
        # print(rest_num)
        # stone_num = rest_num
    # end  
    if stone_num < 3 then
        print "userのまけ\n\n"
        break
    end

    #userの挙動
    print("取る石の数（２〜６）を入力してください")
    user_stone = gets.to_i
    print "入力した数字は＝" , user_stone
    print "\n\n"
    user = Agent.new(user_stone)
    if user_stone > 1 and user_stone < 7
        stone_num = user.put_stone_user(stone_num)
    end
    if stone_num < 3 then
        print "com1のまけ\n\n"
        break
    end

end
