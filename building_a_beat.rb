live_loop :metronome do
  cue :beat
  sample :elec_tick
  sleep 1
end

live_loop :kick do
  sync :beat
  sample :drum_heavy_kick
  if tick.even?
    sleep 1.0/2.0
    sample :drum_heavy_kick
    sleep 1.0/8.0
    sample :drum_heavy_kick
    sleep 1.0/8.0
  end
end

live_loop :snare do
  sync :beat
  sleep 1.0/4.0*3
  sample :drum_snare_hard
end

live_loop :cymbol do
  sync :beat
  sleep 1.0/8.0
  4.times do
    sample :drum_cymbal_closed
    sleep 1.0/8.0
  end
  with_fx :reverb do
    sample :drum_cymbal_hard, rate: 1, finish: 0.15 if tick.odd?
  end
end
