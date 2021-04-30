class Place < ApplicationRecord
  belongs_to :area
  validates :name, :area, presence: true

  has_many :incidence_places
  has_many :incidences, through: :incidence_places


  after_create :generate_qr_code
  after_destroy :destroy_qr_code

  def generate_qr_code
    qr_code = RQRCode::QRCode.new(self.id.to_s)
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
    IO.binwrite("app/assets/images/qr_codes/qrcode_#{self.id.to_s}.png", png.to_s)
  end
  
  def destroy_qr_code
    File.delete("app/assets/images/qr_codes/qrcode_#{self.id.to_s}.png")
  end
end
