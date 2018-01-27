#Noise V2
#Author : Illest Preacha
 
with_fx :reverb, room: 1 do
  live_loop :time do
    with_fx [:whammy,:echo].tick do
      with_fx :bitcrusher, bits: rrand(0,16) do
        with_fx :slicer, phase: rrand(0,16) do
          notes = (scale :e5, :minor_pentatonic, num_octaves: 3)
          with_synth :gnoise do
            play notes.choose, attack: 2, release: 2, cutoff: 90, amp: 3,pan: 0.5
            sleep [1,2].choose
          end
        end
      end
    end
  end
 
  live_loop :noise2 do
    with_fx [:ixi_techno,:flanger].choose, mix: 0.95, phase: 2 do
      with_fx :distortion, distort: rrand(0.2,0.7) do
        with_synth :cnoise do
          notes = (scale :e7, :aeolian, num_octaves: 3)
          play notes.choose, release: 4, cutoff: 90, amp: 2, pitch: dice(2), pan: rrand(-0.5,0.5)
          sleep [0.5,0.25].choose
        end
      end
    end
  end
end