module FeishuBot
  class FeishuMessage < ApplicationRecord
    enum clazz: {
      'text': 1,
      'image': 2,
      'file': 3
    }
  end
end
