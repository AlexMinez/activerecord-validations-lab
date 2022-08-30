class Post < ActiveRecord::Base
    validates :title , presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :is_clickbait

    CLICKBAIT = [
 /Won't Believe/i,
 /Secret/i,
 /Top\d+/i,
 /Guess/i
]


    def is_clickbait
       if CLICKBAIT.none? {|p| p.match title}
            errors.add(:title, "Must be a clickbait")
        end
    end
end
