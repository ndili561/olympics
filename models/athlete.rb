require('pg')
require_relative('nation')


class Athlete

  attr_reader :name,:id,:event_id,:nation_id,:medals

  def initialize(options)
    @id=options['id'].to_i
    @name=options['name']
    @event_id=options['event_id'].to_i
    @nation_id=options['nation_id'].to_i
  end


  def save()
    sql = "INSERT INTO athletes(name,athlete_nation,athlete_event)VALUES('#{@name}','#{@nation_id}','#{@event_id}')RETURNING *"
    athlete = run(sql)
    @id = athlete.first['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM athletes"
    run(sql)
  end

  def self.all()
    sql = "SELECT * FROM athletes"
    athletes = run (sql)
    return athletes
  end

end