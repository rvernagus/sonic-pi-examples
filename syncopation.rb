live_loop :metronome do
  cue :beat
  sample :elec_tick
  sleep 1
end

live_loop :kick do
  sync :beat
  sleep 0.25
  sample :bd_klub
end

live_loop :snare do
  sync :beat
  sleep 0.75
  sample :elec_mid_snare
end

live_loop :tom do
  sync :beat
  3.times do
    sample :drum_cymbal_pedal, rate: 5
    sleep 0.25
  end
end

live_loop :effect do
  sync :beat
  sleep 0.75
  sample :guit_e_fifths, rate: 4
end

live_loop :chords do
  use_synth :tb303
  sync :beat
  if tick.even?
    play chord(:c3, 'major')
  else
    play chord(:a3, '7')
  end
end
