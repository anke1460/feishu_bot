module FeishuBot
  class FeishuMessage < ApplicationRecord
    enum clazz: {
      'text': 1,
      'image': 2,
      'file': 3,
      'media': 4
    }
  end
end
