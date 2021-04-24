class Place < ApplicationRecord
  belongs_to :area
  validates :name, :area, presence: true

  has_many :incidence_places
  has_many :incidences, through: :incidence_places


  def self.generate_qr_code(place_id)
    qr_code = RQRCode::QRCode.new(place_id)
    png = qr_code.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )
    IO.binwrite("app/assets/images/qrcode_#{place_id}.png", png.to_s)
  end
end
