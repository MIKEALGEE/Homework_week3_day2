require_relative('./models/bounty_hunter.rb')
require('pry')


# BountyHunter.delete_all()

hunter1 =BountyHunter.new({

"name" => "Farty McGhee",
"species" => "Crackbum",
"homeworld" => "Uranus",
"bounty_value" => 30000

})


hunter2 =BountyHunter.new({

"name" => "Wee Dave",
"species" => "Chav",
"homeworld" => "Niddry",
"bounty_value" => 23,

})

# hunter1.save()
# hunter2.save()

hunters = BountyHunter.all()

BountyHunter.find()

binding.pry
nil
