# coding: utf-8  

Node.destroy_all
TopicCategory.destroy_all

n1 = Node.create(:name => "生活")
TopicCategory.create(:node_id => n1.id, :name => "美食", :url => "foods", 
  :description => "民以食为天,发现什么好吃的,和大家分享吧,或者在这里讨论如何弄好吃的")
TopicCategory.create(:node_id => n1.id, :name => "孩子", :url => "children", 
  :description => "孩子是一件大事,聊聊如何带好孩子的话题")
TopicCategory.create(:node_id => n1.id, :name => "单生", :url => "single", 
  :description => "单生贵族在这里发发联系,说不一定能碰到心仪的对象")
TopicCategory.create(:node_id => n1.id, :name => "房子", :url => "house", 
  :description => "装修,房贷,房子有关的一切一切")
TopicCategory.create(:node_id => n1.id, :name => "车子", :url => "cars", 
  :description => "小车大车,自行车电瓶车的交流话题可以发在这里")
TopicCategory.create(:node_id => n1.id, :name => "植物", :url => "plants", 
  :description => "谈论植物种植的心得")
TopicCategory.create(:node_id => n1.id, :name => "宠物", :url => "pets", 
  :description => "猫,狗,鱼,鸟...你在养吗?")
  
n2 = Node.create(:name => "玩乐")
TopicCategory.create(:node_id => n2.id, :name => "灌水区", :url => "club", 
  :description => "没有什么特别的主题,随便聊聊")
TopicCategory.create(:node_id => n2.id, :name => "自言自语", :url => "talk", 
  :description => "自言自语,不管别人")
TopicCategory.create(:node_id => n2.id, :name => "电影", :url => "movies", 
  :description => "在这里分享电影下载或电影评价之类的东西")
TopicCategory.create(:node_id => n2.id, :name => "电视", :url => "tvs", 
  :description => "电视节目的话题")
TopicCategory.create(:node_id => n2.id, :name => "音乐", :url => "musics", 
  :description => "音乐是可以代替任何语言的东西")
TopicCategory.create(:node_id => n2.id, :name => "聚会", :url => "party", 
  :description => "如果可以大家在合适的时候搞搞聚会吧")
TopicCategory.create(:node_id => n2.id, :name => "旅游", :url => "travel", 
  :description => "旅游")
  
n3 = Node.create(:name => "数码")
TopicCategory.create(:node_id => n3.id, :name => "电脑", :url => "computer", 
  :description => "电脑坏了怎么办,这里有专家哦!")
TopicCategory.create(:node_id => n3.id, :name => "软件", :url => "soft", 
  :description => "软件分享,经验讨论")
TopicCategory.create(:node_id => n3.id, :name => "游戏", :url => "games", 
  :description => "偶尔放松,玩玩游戏吧")
TopicCategory.create(:node_id => n3.id, :name => "网站", :url => "sites", 
  :description => "其实有一些很不错的网站不是人人都知道的,在这里大家一起分享有趣的地方")
TopicCategory.create(:node_id => n3.id, :name => "手机", :url => "mobiles", 
  :description => "手机人人都有,你能玩得转吗?")
TopicCategory.create(:node_id => n3.id, :name => "家电", :url => "electrics", 
  :description => "TV,VCD,DVD,EVD...")
  
n4 = Node.create(:name => "市场")
TopicCategory.create(:node_id => n4.id, :name => "二手", :url => "ershou", 
  :description => "二手转让,留着没用的东西,拿出来的晒晒,交换出售")
TopicCategory.create(:node_id => n4.id, :name => "商家", :url => "business", 
  :description => "在这里对周边的商家进行评价,推荐好的,打击奸商")
  
n5 = Node.create(:name => "社区")
TopicCategory.create(:node_id => n5.id, :name => "公告", :url => "annoucements", 
  :description => "这里发布小区公告")
TopicCategory.create(:node_id => n5.id, :name => "反馈", :url => "feedback", 
  :description => "对网站有什么好的建议意见在这里发")

User.destroy_all
User.create(:email => "chm2920@gmail.com", :username => "master", :password => "123456")

#