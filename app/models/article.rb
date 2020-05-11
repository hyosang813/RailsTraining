class Article
    include Mongoid::Document
    include Mongoid::Timestamps

    field :title, type: String
    field :text, type: String
    # field :published_at, type: DateTime
    # field :pv_count, type: Integer

    ARRAY = ['江頭','タイツ','露出狂','2:50']

    validates :title, presence: { message: 'nullは許容してない' }, length: { maximum: 20, message: 'タイトルは20文字以内で入力してください' }
    validate :check_ng_word

    belongs_to :user
    def check_ng_word
        errors.add(:text, "使えない文字列が含まれています") if ARRAY.include?(text)
    end
end
