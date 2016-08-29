require('pg')
require_relative('../db/sql_runner')


class Event

  attr_accessor :event,:id,:day,:month,:type

  def initialize(options)
    @id=options['id'].to_i
    @event=options['event']
    @day=options['day'].to_i
    @month=options['month']
    @type=options['type']
  end

  def save()
    begin
      sql = "INSERT INTO events(event,day,month,type)VALUES('#{@event}','#{@day}','#{@month}','#{@type}')RETURNING *"
      event = run(sql)
      @id = event.first['id'].to_i
    rescue

    end
  end

  def self.find(id)
    sql="SELECT * FROM events WHERE id=#{id}"
    event=run(sql)
    result=Event.new(event.first)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM events"
    run(sql)
  end

  

  def self.all(query = "")
    query = query.to_s
    sql = "SELECT * FROM events"
    sql = sql + " WHERE nation LIKE '%#{query}%'" unless query.empty?
    events = run(sql)
    events = events.map {|event| Event.new(event)}
    return events
  end


def self.update(params)
   run ( "UPDATE events SET 
    event='#{params['event']}' WHERE id=#{params['id']}")
end

def self.map_items(sql)
  events = run(sql)
  result = events.map { |event| Event.new( event ) }
  return result
end

def self.delete(id)
  run("DELETE FROM events WHERE id=#{id}")
end
end








