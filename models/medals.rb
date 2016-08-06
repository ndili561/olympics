require('pg')
require('pry-byebug')
require_relative('event')
require_relative('nation')

class Medal

  attr_accessor :id, :gold_medal_athlete, :silver_medal_athlete,:bronze_medal_athlete, :gold_medal_athlete_id, :silver_medal_athlete_id,:bronze_medal_athlete_id

  def initialize(options)
    @id=options['id'].to_i
    @gold_medal_athlete_id=options['gold_medal_athlete'].to_i
    @silver_medal_athlete_id=options['silver_medal_athlete'].to_i
    @bronze_medal_athlete_id=options['bronze_medal_athlete'].to_i
    # @gold_medal=options['gold_medal_athlete'].to_i
    # @silver_medal=options['silver_medal_athlete'].to_i
    # @bronze_medal=options['bronze_medal_athlete'].to_i

  end


  def save()
    sql = "INSERT INTO medals(gold_medal,silver_medal,bronze_medal)VALUES('#{@gold_medal_athlete_id}','#{@silver_medal_athlete_id}','#{@bronze_medal_athlete_id}')RETURNING *"
    medals = run(sql)
    @id = medals.first['id'].to_i
  end


  def self.nations
    sql="SELECT * FROM nations"
    nations=run (sql)
    res=nations.to_a
    return res
  end


  def self.update(params)
   run ( "UPDATE nations SET 
    points='#{params['points']}' WHERE id=#{params['id']}")
  end

 def self.update_medal(params)
  sql = "select * from nations"
  nation=run(sql)
  result=nation.to_a
  result.each {|h| h.each_pair {|k,v| h['points'] = h['points'].to_i}}
  result.each {|h| h.each_pair {|k,v| h['id'] = h['id'].to_i}}
  result.each do |x|
    if x['id']==params.gold_medal_athlete_id
      x['points']+=5
    # elsif 
    end
end
result.each do |res|
  if res['id']==params.silver_medal_athlete_id
    res['points']+=3
    # elsif 
  end
end
result.each do |r|
  if r['id']==params.bronze_medal_athlete_id
    r['points']+=1
  end
end
result.each {|h| h.each_pair {|k,v| h['points'] = h['points'].to_s}}
result.each {|h| h.each_pair {|k,v| h['id'] = h['id'].to_s}}
result.each do |t|
  Medal.update(t)
  return Medal.sort(result)
   end
 end


def self.sort(params)
 sort = params.to_a
 sort.each {|h| h.each_pair {|k,v| h['points'] = h['points'].to_i}}
 sort.each {|h| h.each_pair {|k,v| h['id'] = h['id'].to_i}}
 points=sort.sort_by{|value|-value['points']}
 return points
end
end
