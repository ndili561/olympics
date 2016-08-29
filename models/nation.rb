require('pg')
require_relative('../db/sql_runner')
require 'json/ext'

class Nation
  
  attr_reader :nation
  attr_accessor :point,:id
  
  def initialize(options)
    @id = options['id'].to_i
    @nation = options['nation']
    @point = options['point'].to_i
   
  end


def save()
    begin
  sql = "INSERT INTO nations(nation,points)VALUES ('#{@nation}', '#{@point}')RETURNING *"
  nation=run(sql)
  @id = nation.first['id'].to_i
  rescue
    end
end

  def self.all(query = "")
    query = query.to_s
    sql = "SELECT * FROM nations"
    sql = sql + " WHERE nation LIKE '%#{query}%'" unless query.empty?
    nations = run(sql)
   result = nations.map {|nation| Nation.new(nation)}
   return result
  end


  def self.delete_all()
    sql = "DELETE FROM nations"
    run(sql)
  end

  def self.map_items(sql)
    nations = run(sql)
    result = nations.map { |nation| Nation.new( nation ) }
    return result
  end

  def self.update(params)
   run ( "UPDATE nations SET 
    nation='#{params['nation']}', points='#{params['points']}' WHERE id=#{params['id']}")
  end

  def self.find(id)
    sql="SELECT * FROM nations WHERE id=#{id}"
    nation=run(sql)
    result=Nation.new(nation.first)
    return result
  end

  def self.delete(id)
    run("DELETE FROM nations WHERE id=#{id}")
  end

  def self.json()
    sql = "SELECT * FROM nations"
    result = run(sql)
    return result
  end
 

end

