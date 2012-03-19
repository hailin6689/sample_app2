class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :mls
      t.string :stat
      t.string :strnum
      t.string :cp
      t.string :strname
      t.string :sfx
      t.string :rprnp
      t.string :lpsp
      t.string :rooms
      t.string :beds
      t.string :fullbaths
      t.string :halfbaths
      t.string :typ
      t.string :sci
      t.string :garages
      t.string :info
      t.string :asf
      t.string :yearbuilt
      t.string :dues
      t.string :bsmt
      t.string :bsmtdesc
      t.string :city
      t.date :closedate
      t.date :contractdate
      t.string :fin
      t.string :hsdist
      t.string :hsname
      t.date :listdate
      t.integer :listprice
      t.string :lmt
      t.integer :origlistprice
      t.string :pin
      t.string :shortsale
      t.string :subdiv
      t.string :taxexempt
      t.string :taxyear
      t.string :taxes
      t.string :baths
      t.string :origrent
      t.string :rd
      t.string :rnp
      t.string :rp

      t.timestamps
    end
  end
end
