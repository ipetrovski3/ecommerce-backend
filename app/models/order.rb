class Order < ApplicationRecord

  # ova uste ne mi e jasno kako funkcionira ama gledam se koristi zatoa go staviv da go naucime
  enum status: { received: 0, confirmed: 1, delivered: 2, closed: 3 }
end
