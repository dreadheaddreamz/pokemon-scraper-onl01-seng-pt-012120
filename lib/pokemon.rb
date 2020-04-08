require 'pry'
class Pokemon
  attr_accessor :name, :type, :db 
  attr_reader :id
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
  end
  
  def self.find(id, db)
   new_pokeman = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    new_pokeman = self.new(id: new_pokeman[0], name: new_pokeman[1], type: new_pokeman[2], db: db)
    
  end

end