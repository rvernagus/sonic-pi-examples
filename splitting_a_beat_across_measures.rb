live_loop :metronome do
  cue :beat
  sample :elec_tick
  sleep 1
end

live_loop :kick do
  sync :beat
  t = tick
  if t % 4 == 1
    sample :bd_boom, amp: 3, rate: 1.5
    sleep 0.5
    sample :bd_ada
    sleep 0.25
    sample :bd_ada
  elsif t % 4 == 3
    sample :bd_ada
  end
end

live_loop :snare do
  sync :beat
  if tick % 4 == 2 or tick % 4 == 0
    sample :drum_snare_hard
  end
end
