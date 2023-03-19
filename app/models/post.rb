class Post < ApplicationRecord
    validates :title, presence:true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}

    validates :category, inclusion: {in: ['Non-Fiction', 'Fiction']}

    #custom validator
    validate :title_sufficiently_clickbait

    VALID_WORDS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def title_sufficiently_clickbait
        errors.add(:title, 'must be clickbait') unless VALID_WORDS.any? { |pattern| title =~ pattern }
    end

end
