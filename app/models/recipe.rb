class Recipe < ApplicationRecord
    validates :name, :stuff, :duration, :prepare_mode, presence:true
    validates_length_of :stuff, maximum: 400
    validates_length_of :prepare_mode, maximum: 400
    validates_numericality_of :calories, greather_than_or_equals_to:0, presence:true
    validates_format_of :poster, allow_blank: true, with: /\w+\.(gif|jpg|png|webp)\z/i, message: " utilizar somente arquivos GIF, JPEG ou PNG"
    
    KIND = %w(Carnes Aves Peixes Massas Saladas Doces)
    validates_inclusion_of :kind, in:KIND

    has_many :comments , dependent: :destroy

    def light?
        calories < 130
    end

    def self.created_at 
        where('created_at <= ?', Time.now).order('created_at DESC')
    end

    # formas de fazer consultas no bd
    # Recipe.all
    # Recipe.count
    # Recipe.order('nome_do_campo DESC')
    # Recipe.find(1)
    # Recipe.find_by(name: 'teste')
    # Recipe.where('campo <= ?', valor)
    # Recipe.where('created_at <= ?', Time.now).order('created_at DESC')

end
