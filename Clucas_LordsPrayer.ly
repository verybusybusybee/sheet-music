\version "2.26.0"
#(set-global-staff-size 17) 
% 17 to 18.5


\header {
  dedication = \markup { \italic { "For Michael Barry (1981)" } }
  title = "The Lord’s Prayer"
  composer = "Humphrey Clucas"
  arranger = "(b. 1941)"
  tagline = \markup {
    \abs-fontsize #7.5 "Digitally engraved for Joe Watson and the Choir of Coventry Cathedral by Eugene Chan (2026)"
  }
}

\paper {
#(set-paper-size "a4")

  markup-system-spacing.basic-distance = 22.5
  top-system-spacing.basic-distance = 10
  score-system-spacing.basic-distance = 20
  system-system-spacing.basic-distance = 20
  last-bottom-spacing.basic-distance = 10


  % Traditional German choral spacing rules
  top-margin = 20\mm
  bottom-margin = 10\mm
  left-margin = 15\mm
  right-margin = 15\mm
         
  % Font configuration to match traditional engraving
  property-defaults.fonts.serif = "Palatino Linotype"
}

global = {
  \key d \major
  \omit Staff.TimeSignature
  % \cadenzaOn
  % \time 4/2
  \tempo "Moderato"
}

sopMusic = \relative {
  \time 7/4 
  R1*7/4 \bar "|"
  r2 d''2 d4( cis) cis~ \bar "|"
  \time 4/4
  cis r4 r2 \bar "|"
  \time 6/4
  r4 d d cis cis2~ \bar "|"
  \time 7/4
  cis4 r2 r4 e cis2~ \bar "|" \break
  \time 6/4
  cis4 r2 r r4 \bar "|"
  \time 5/4
  r1 e4~ \bar "|"
  e dis dis2 r4 \bar "|"
  \time 6/4
  dis! e dis fis2 dis4 \bar "|" \break
  \time 4/4
  fis dis! dis2~ \bar "|" 
  \time 5/4
  dis4 r1 \bar "|"
  \time 4/4
  r4 e dis! cis \bar "|"
  \time 7/4 \dynamicUp
  fis( e) dis! cis b4.\> b8 a4 \bar "|" \break
  \time 8/4
  cis2 cis4\! r1 r4 \bar "|"
  \time 6/4
  r4 e2\>  cis\! r4 \bar "|"
  \time 4/4
  R1*4/4 \bar "|" \dynamicNeutral
  r4 cis4( b d \bar "|"
  cis2)\> cis2\!\fermata \bar "|."
}
sopWords = \lyricmode { \set lyricMelismaAlignment = #CENTER \set stanza = \markup { \dynamic "mp" }
  Our Fa -- ther, __
  which art in heav'n, __
  hal -- lowed __ 
  \set stanza = \markup { \dynamic "mf" } be __ thy name. Give us this day our
  dai -- ly bread. __ As we for -- 
  give __ them that tres -- pass a -- gainst us. \set stanza = \markup { \dynamic "mp" } Fa -- ther.
  \set stanza = \markup { \dynamic "p" } A -- men.
}

altoMusic = \relative { 
  fis'2 fis4( g) g2 g4
  fis e g2~ g2.
  g4. g8 fis4 e
  fis1.
  fis4 a2 fis4 a2.
  fis4 fis2 fis4 gis! fis
  \override DynamicTextSpanner.style = #'none
  \crescTextCresc
  a2\< a8\! a gis4 fis gis!1 r4
  gis!4 a gis fis2 gis4
  a gis! gis4. r8
  fis4 gis! a4. gis8 fis4
  a4. a8 a2~
  a2. r4 r2 e4
  gis2 gis4 a2 a4 fis e
  fis2 fis e4 fis
  \set crescendoText = \markup { \italic { dim. e poco rit. } }
  \override DynamicTextSpanner.style = #'none
  g!4.\< g8\! fis4 e
  g2 g2~ g4 r4 r2\fermata
}
altoWords = 
\lyricmode { \set lyricMelismaAlignment = #CENTER \set stanza = \markup { \dynamic "mp" }
  Our Fa -- ther, which art in heav'n, __ hal -- lowed be thy 
  name; thy king -- dom come; thy will be done, in
  earth as it is in heav'n. \set stanza = \markup { \dynamic "mf" } Give us this day our
  dai -- ly bread. \set stanza = \markup { \dynamic "mp" } And for -- give us our tres -- pas -- ses, __ 
  and lead us not in -- to temp -- ta -- tion; but de --
  li -- ver us from e -- vil. __
}

tenorMusic = \relative {
  cis'2 cis4( d4) d2 d4
  cis b d2~ d2.
  d4. d8 cis4 b
  cis1.
  cis4 fis2 cis4 fis2.
  d4 d2 d4 e d
  d2 d8 d e4 d
  dis1 r4
  dis!4 e dis cis2 dis4
  e dis! dis4. r8
  cis4 dis! e4. dis8 cis4
  e4. e8 e2~
  e2. r4 r2 e4
  e2 e4 e2 e4 cis cis
  cis2 cis2 b4 cis
  d!4. d8 cis4 b4
  d2 d2~ d4 r4 r2\fermata
}
tenorWords = \lyricmode { \set lyricMelismaAlignment = #CENTER
  
}

bassMusic = \relative {
  a2 a4( b) b2 b4
  a g b2~ b2.
  b4. b8 a4 g
  a1.
  a4 cis2 a4 cis2. 
  a4 a2 a4 b a
  cis2 cis8 cis b4 a
  gis1 r4
  b cis b a2 b4
  cis b b4. r8
  a4 b cis4. b8 a4
  cis4. cis8 cis2~
  cis2. r4 r2 cis4
  b2 b4 cis2 cis4 a gis
  a2 a gis4 a
  b4. b8 a4 g!
  b2 b2~ b4 r4 r2
}
bassWords = \lyricmode { \set lyricMelismaAlignment = #CENTER
  
}

\layout {
  \context {
    \Score
    measureBarType = #'()
    \override LyricText.font-name = "Palatino Linotype"
    \override LyricText.font-size = #-0.5
  }
}


\score {
    % \shiftDurations #1 #0
    \new ChoirStaff << 
    \new Lyrics = "sopranos" \with {
      % this is needed for lyrics above a staff
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }
    \new Staff = "women" \with {
    \consists "Merge_rests_engraver" } <<
        \new Voice = "sopranos" {
        \voiceOne
        << \global \sopMusic >>
      }
      \new Voice = "altos" {
        \voiceTwo
        << \global \altoMusic >>
      }
    >>
    \new Lyrics = "altos"
    \new Lyrics = "tenors" \with {
      % this is needed for lyrics above a staff
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }
    \new Staff = "men" \with {
    \consists "Merge_rests_engraver" } <<
      \clef bass
      \new Voice = "tenors" {
        \voiceOne
        << \global \tenorMusic >>
      }
      \new Voice = "basses" {
        \voiceTwo << \global \bassMusic >>
      }
    >>
    \new Lyrics = "basses"
    \context Lyrics = "sopranos" \lyricsto "sopranos" \sopWords
    \context Lyrics = "altos" \lyricsto "altos" \altoWords
    \context Lyrics = "tenors" \lyricsto "tenors" \tenorWords
    \context Lyrics = "basses" \lyricsto "basses" \bassWords
  >>

\layout { }
\midi { }

}

\markup {
  \vspace #5 % Adds vertical space between the music and the text
  \fill-line {
    % \override #'(line-width . 115) % Adjust this number to change paragraph width
    \justify { \abs-fontsize #7.5 \override #'(baseline-skip . 10) {
      Together with his Closing Responses, this forms the companion set to Humphrey’s very well-known 
      Preces and Responses of 1964, sung in most cathedrals in the land, according to his publisher,
      Fagus Music. } 
    }
  }
}