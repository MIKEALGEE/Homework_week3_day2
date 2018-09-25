require('pg')

class BountyHunter

  attr_accessor :name, :species, :homeworld, :bounty_value
  attr_reader :id
def initialize(options)
  @id = options['id'].to_i()
  @name = options['name']
  @species = options['species']
  @homeworld = options['homeworld']
  @bounty_value = options['bounty_value'].to_i()
end

def self.delete_all()
  db = PG.connect({
    dbname: 'bounty_hunters',
    host: 'localhost'
    })
    sql = 'DELETE FROM bounty_hunters;'
    db.exec(sql)
    db.close()
end

def save()
    db = PG.connect({
      dbname: 'bounty_hunters',
      host: 'localhost'
      })


      sql = "
      INSERT INTO bounty_hunters (
        name,
        species,
        homeworld,
        bounty_value
      )
      VALUES ($1, $2, $3, $4)
      RETURNING id;
      "
      db.prepare('save', sql)

      result = db.exec_prepared('save', [@name, @species, @homeworld, @bounty_value])
      db.close()

      result_hash = result[0]
      string_id = result_hash['id']

      id = string_id.to_i()

    end

    def update()
        db = PG.connect({
          dbname: 'bounty_hunters',
          host: 'localhost'
          })

          sql = "
          UPDATE bounty_hunters
          SET (
            name,
            species,
            homeworld,
            bounty_value
          ) = ($1, $2, $3, $4)
          WHERE id = $5;
          "
          values = [@name, @species, @topping, @quantity, @id]
          db.prepare('update',sql)
          db.exec_prepared('update',values)
          db.close()
      end

      def self.delete_all()
        db = PG.connect({
          dbname: 'bounty_hunters',
          host: 'localhost'
          })
          sql = 'DELETE FROM bounty_hunters;'
          db.exec(sql)
          db.close()
      end

      def self.find()
        db = PG.connect({
          dbname: 'bounty_hunters',
          host: 'localhost'})
          sql ="SELECT * FROM bounty_hunters
          WHERE id = $1; "
          values = [@id]
          db.prepare('find',sql)
          db.exec_prepared('find',values)
          db.close()

      end


      def self.all()
          db = PG.connect({
            dbname: 'bounty_hunters',
            host: 'localhost'})
            sql ='SELECT * FROM bounty_hunters;'

            db.prepare('all', sql)
            order_hashes = db.exec_prepared('all')
            db.close()

            order_objects = order_hashes.map do |order_hash|
              BountyHunter.new(order_hash)
            end

            return order_objects
        end









end
