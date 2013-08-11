class SamSounds

  CORRECT_SOUNDS = ["http://www.soundboard.com/mediafiles/158-e6853b4c-d35f-4a7f-923c-e2bca1707d8d.mp3",
                    "http://www.soundboard.com/mediafiles/158-fa5860c7-bacd-454d-906e-28b5e3799368.mp3"

  ]

  INCORRECT_SOUNDS = [ "http://www.soundboard.com/mediafiles/158-e9c6e890-09cc-4a2a-a0c8-8bd118f3cb36.mp3",
                       "http://www.soundboard.com/mediafiles/158-11b717ff-a3d4-470c-932d-86715806e700.mp3",
                       "http://www.soundboard.com/mediafiles/158-c28fb12a-e2c0-4aa7-af06-edfada0d0d9b.mp3",
                       "http://www.soundboard.com/mediafiles/158-be34e45e-d3d3-4159-b046-5fa50319b416.mp3"
  ]

# "http://www.soundboard.com/mediafiles/158-bdc99a40-7dd3-41e7-8545-e7af4d57f7a5.mp3"

  def self.get_sound(correctness)
    if correctness == "first"
      return "http://www.soundboard.com/mediafiles/158-53cad5ff-ec4d-4835-abd0-bb6a8e337cbc.mp3"
    elsif correctness == "true"
      return CORRECT_SOUNDS.sample
    else
      return INCORRECT_SOUNDS.sample
    end
  end
end