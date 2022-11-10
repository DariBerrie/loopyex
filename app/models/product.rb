class Product < ApplicationRecord
  belongs_to :user
  has_one :order, dependent: :destroy
  validates :name, :brand, :weight, :color, :price, :quantity, :description, :material, :address, presence: true
  validates :brand, inclusion: { in: ['Adriafil', 'Austermann', 'BC Garn', 'Bergere de France', 'Berroco', 'Caron',
                                      'Cascade Yarns', 'DMC', 'Debbie Bliss', 'Drops', 'Istex', 'ITO', 'Katia',
                                      'Knitting for Olive', 'Lana Grossa', 'Lang Yarns', 'Lion Brand', 'Malabrigo',
                                      'Noro', 'Novita', 'Phildar', 'Rico', 'Rowan', 'Schachenmayr', 'Scheepjes',
                                      'The Fibre Co.', 'Life in the Long Grass', 'Hobbii', 'Other'] }
  validates :weight, inclusion: { in: ['Lace', 'Fingering', 'Sock', 'Sport', 'DK', 'Worsted', 'Aran', 'Chunky',
                                       'Super Chunky', 'Bulky', 'Jumbo', 'Other'] }
  validates :material, inclusion: { in: ['Acrylic', 'Alpaca', 'Angora', 'Bamboo', 'Cashmere', 'Cotton', 'Linen',
                                         'Merino', 'Mohair', 'Polyester', 'Silk', 'Wool', 'Other'] }
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model

  pg_search_scope :search_by_name_brand_material,
    against: [ :name, :brand ],
    using: {
      tsearch: { prefix: true }
    }
  end
