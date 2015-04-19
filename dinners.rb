#!/usr/bin/ruby
load 'fixnum.rb'
load 'hash.rb'

require 'yaml'

PROTEIN_FREQ = {
  :chicken => 3,
  :pork => 2,
  :beef => 2,
  :fish => 3
}

data = YAML::load_file('db/store.yml')

dinners = {
  :steak => [
    :protein => :beef,
    :time => 1.hour,
    :ingredients => [
      :steak => 2,
      :lettice => 1,
      :tomatoo => 2,
      :red_onion => 1
    ]
  ],
  :parmy => [
    :protein => :chicken,
    :time => 1.hour,
    :ingredients => [
      :chicken_breast => 1,
      :tomotoo_paste => '50g',
      :cheese_grated => '100g',
      :ham => '100g',
      :potato_chips => '500g'
    ]
  ],
  :carbonara => [
    :protein => :pork,
    :time => 1.hour,
    :ingredients => [
      :bacon => '50g',
      :paramesan_cheese => '80g',
      :egg_yoke => 5,
      :onion => 1,
      :pasta => '350g'
    ]
  ],
  :chicken_curry => [
    :protein => :beef,
    :time => 30.minute,
    :ingredients => [
      :evaporated_milk => '1 tin',
      :chicken_breast => 1,
      :spices => true
    ]
  ],
  :kebab => [
    :protein => :beef,
    :time => 1.hour,
    :ingredients => [
      :mince => '500g',
      :spices => true,
      :tomatoo => 2,
      :cheese => '200g',
      :onion => 1
    ]
  ],
  :fish_chips => [
    :protein => :fish,
    :time => 1.hour,
    :ingredients => [
      :fish => 1,
      :chips => '300g'
    ]
  ],
  :tomoto_chicken => [
    :protein => :chicken,
    :time => 1.hour,
    :ingredients => [
      :chicken_thigh => 2,
      :chicken_leg => 2,
      :pasta_tomato_mix => '250g',
      :garlic => true,
      :spices => true,
      :onion => 1
    ]
  ],
  :sushi => [
    :protein => :chicken,
    :time => 2.hour,
    :ingredients => [
    :rice => '1cup',
      :nori => '6 sheets',
      :chicken_breast => 1,
      :kfc_spices => 1
    ]
  ],
  :dongsnmash => [
    :protein => :beef,
    :time => 1.hour,
    :ingredients => [
    :thick_sausages => 2,
      :thin_sausages => 2,
      :potatos => 5,
      :vegtables => 1
    ]
  ],
  :pizza => [
    :protein => :mix,
    :time => 45.minute,
    :ingredients => [
      :bacon => 4,
      :pepperoni => '50g',
      :pork_sausage => 4,
      :mushrooms => 4,
      :onion => 1,
      :pizza_paste => '30g',
      :spices => true,
      :cheese => '150g',
      :lebo_bread => 2
    ]
  ],
  :beef_burgers => [
    :protein => :beef,
    :time => 1.hour,
    :ingredients => [
      :carrot => 1,
      :onion => 1,
      :mince => '250g',
      :stock => true,
      :mince_garlic => '1tsp',
      :egg => 1,
      :barbecue_sauce => '1tbsp',
      :bread_crumbs => 'to consistency',
      :bread => 4,
      :mayonase => true,
      :mustard => true
    ]
  ],
  :tex_mex_chicken => [
    :protein => :chicken,
    :time => 1.hour,
    :ingredients => [
      :taco_seasoning => true,
      :bread_crumbs => true,
      :potatos => 5,
      :vegtables => true
    ]
  ],
  :shepards_pie => [
    :protein => :beef,
    :time => 3.hour,
    :ingredients => [
      :potato => 3,
      :beef => '400g',
      :onion => 1,
      :egg => 1,
      :cheese => '100g',
      :carrot => 2,
      :pea_corn => '100g',
      :garlic => true
    ]
  ],
  :strogenoff => [
    :protein => :beef,
    :time => 2.hour,
    :ingredients => [
      :beef_strips => '350g',
      :onion => 1,
      :rice => '.66cup',
      :vegtables => true,
      :tomato_paste => '2tspn',
      :garlic => true,
      :sour_cream => '100g',
      :spices => true
    ]
  ],
  :stew => [
    :protein => :beef,
    :time => 3.hour,
    :ingredients => [
      :beef => '350g',
      :onion => 1,
      :carrot => 2,
      :potato => 2,
      :pea_corn => '100g',
      :garlic => true,
      :zucchini => 1
    ]
  ],
  :chicken_wings => [
    :protein => :chicken,
    :time => 1.hour,
    :ingredients => [
      :chicken_wings => 6,
      :honey => '150ml',
      :chilly_sauce => '1tsp',
      :soy => '1tbsp',
      :tomoto_sauce => '2tbsp',
      :garlic => true
    ]
  ],
  :mongolian_beef => [
    :protein => :beef,
    :time => 1.hour,
    :ingredients => [
      :beef_strips => '300g',
      :zucchini => 2,
      :carrot => 2,
      :red_cap => '.5',
      :green_cap => '.5',
      :onion => 1,
      :garlic => true,
      :mongolian_maranade => true,
      :mongolian_sauce => true
    ]
  ],
  :seafood => [
    :protein => :fish,
    :time => :unknown,
    :ingredients => [
      :oysters => 12,
      :bacon => 4,
      :woshteshire => true,
      :samon => 2,
      :chips => '300g',
      :salad => true
    ]
  ],
  :curry_sausages => [
    :protein => :beef,
    :time => 1.hour,
    :ingredients => [
      :thin_sausages => 4,
      :onion => 1,
      :peas_corn => true,
      :spices => true
    ]
  ]
}
File.open("db/store.yml", "w") do |file|
    file.write dinners.deep_stringify_keys.to_yaml
end
puts dinners.first
