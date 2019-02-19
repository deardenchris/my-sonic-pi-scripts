
# A simple example showing how to use functions and threads in Sonic Pi
# 'Yellow Submarine', coded by C. Dearden, April 2017

# Introduction
use_synth :dsaw
play 62
sleep 0.3
play 64
sleep 0.2

# verse chords loop
define :verse_chords do |repeats|
 repeats.times do
  play chord(:G4)
  sleep 0.5
  play chord(:G4)
  sleep 0.5
  play chord(:G4)
  sleep 0.5
  play chord(:G4)
  sleep 0.5
  play chord(:C4)
  sleep 0.5
  play chord(:C4)
  sleep 0.5
  play chord(:C4)
  sleep 0.5
  play chord(:C4)
  sleep 0.5
  play chord(:D4, :minor)
  sleep 0.5
  play chord(:D4, :minor)
  sleep 0.5
  play chord(:D4, :minor)
  sleep 0.5
  play chord(:D4, :minor)
  sleep 0.5
  play chord(:G4)
  sleep 0.5
  play chord(:G4)
  sleep 0.5
  play chord(:G4)
  sleep 0.5
  play chord(:G4)
  sleep 0.5
 end
end

# verse melody loop
define :verse_melody do |repeats|
 repeats.times do
  play 67
  sleep 1.5
  play 64
  sleep 0.5
  play 60
  sleep 1.5
  play 64
  sleep 0.5
  play 62
  sleep 1.5
  play 64
  sleep 0.5
  play 62
  sleep 1.5
  play 62
  sleep 0.3
  play 64
  sleep 0.2
 end
end

# verse drum loop
define :verse_drum do |repeats|
 repeats.times do
  sample :drum_bass_hard
  sleep 0.5
  sample :drum_bass_hard
  sleep 0.5
  sample :drum_bass_hard
  sleep 0.5
  sample :drum_bass_hard
  sleep 0.5
 end
end 

# verse bass loop
define :verse_bass do |repeats|
 repeats.times do
 # play bass-line in G major
  play_pattern_timed [43, 47, 50, 55], [0.5,0.5,0.5]
  play_pattern_timed [48, 52, 55, 60], [0.5,0.5,0.5]
  play_pattern_timed [50, 53, 57, 53], [0.5,0.5,0.5]
  play_pattern_timed [55, 50, 47, 42], [0.5,0.5,0.5]
 end
end

# chorus chords
define :chorus_chords do |repeats|
 repeats.times do
  play chord(:C4)
  sleep 0.5
  play chord(:C4)
  sleep 0.5
  play chord(:C4)
  sleep 0.5
  play chord(:C4)
  sleep 0.5 
  play chord(:G4)
  sleep 0.5
  play chord(:G4)
  sleep 0.5
  play chord(:G4)
  sleep 0.5
  play chord(:G4)
  sleep 0.5
  play chord(:G4)
  sleep 0.5
  play chord(:G4)
  sleep 0.5
  play chord(:G4)
  sleep 0.5
  play chord(:G4)
  sleep 0.5
  play chord(:C4)
  sleep 0.5
  play chord(:C4)
  sleep 0.5
  play chord(:C4)
  sleep 0.5
  play chord(:C4)
  sleep 0.5
 end
end

# chorus drums
define :chorus_drums do |repeats|
 repeats.times do
  sleep 0.5
  sample :drum_cymbal_open
  sleep 0.5
  sample :drum_bass_hard
  sleep 0.5
  sample :drum_cymbal_open
  sleep 0.5
  sample :drum_bass_hard 
 end
end

# chorus bass part
define :chorus_bass do |repeats|
 repeats.times do
 # play bass-line following chorus chord sequence
  play_pattern_timed [48, 48, 48, 48], [0.5,0.5,0.5]
  play_pattern_timed [55, 50, 47, 43], [0.5,0.5,0.5]
  play_pattern_timed [55, 50, 47, 43], [0.5,0.5,0.5]
  play_pattern_timed [48, 48, 48, 48], [0.5,0.5,0.5]
 end
end

# chorus melody part
define :chorus_melody do |repeats|
 repeats.times do
  play 55
  sleep 0.5
  play 55
  sleep 0.5
  play 55
  sleep 0.5
  play 55
  sleep 0.3
  play 57
  sleep 0.2
  play 50
  sleep 0.5
  play 50
  sleep 0.5
  play 50
  sleep 1.0
  play 50
  sleep 0.5
  play 50
  sleep 0.5
  play 50
  sleep 1.0
  play 48
  sleep 0.5
  play 48
  sleep 0.5
  play 48
  sleep 1.0
 end
end

in_thread do
 use_synth :prophet
 verse 4
end

in_thread do
 use_synth :fm
 verse_bass 4
end

in_thread do
 verse_drums 16
end

use_synth :dsaw
verse_melody 4
 
in_thread do
 use_synth :tb303
 chorus 2
end

in_thread do
 use_synth :fm
 chorus_bass 2
end

in_thread do
 chorus_drums 8
end

use_synth :dsaw
chorus_melody 2
