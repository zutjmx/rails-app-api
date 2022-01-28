class Articulo < ApplicationRecord
    validates :titulo, presence: true
    validates :contenido, presence: true
end
