class ActivityDecorator < Draper::Decorator
  delegate_all

  def author_name
    source.author.try(:nickname) || '暂无'
  end

end
