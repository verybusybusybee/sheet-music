\version "2.26.0"
#(set-global-staff-size 18.5)


\header {
  title = "The Lord’s Prayer"
  composer = "Robert Stone"
  arranger = "(1516 – 1613)"
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
  \key aes \major
  \omit Staff.TimeSignature
  \cadenzaOn
  % \time 4/2
}

sopMusic = \relative {
  c''1 c2 c c1 bes2 bes des1 \bar "|"
  c2. c4 c2 c bes bes1 \bar "|"
  c c bes2 a1 \bar "|"
  aes?2 aes1 aes2 aes bes aes1 aes g2 aes bes aes1 \bar "|"
  des1 c2 bes aes1 bes c bes2 bes1 \bar "|"
  bes1 bes2 c1 c2 c des1 c2 c1 \bar "|"
  c bes2 aes bes1 des2 des c1 bes2 aes g1 aes \bar "|"
  aes2 aes1 bes2 a1 a2 bes1 c2 des2. des4 c1 \bar "|"
  c2 c ees1 des2 c bes aes aes bes2.( c4 a2) bes1 \bar "|."
}
sopWords = \lyricmode { \set lyricMelismaAlignment = #CENTER
  
}

altoMusic = \relative { 
  aes'1 aes2 aes aes1 g2 g aes1
  aes2. aes4 aes2 aes f g1
  aes aes f2 f1 
  f2 f1 f2 f des f1 ees ees2 c f f1
  f f2 f f1 g aes f2 g1
  g1 g2 aes1 aes2 aes f1 aes2 aes1
  aes g2 f g1 aes2 aes aes1 g2 c, ees1 ees 
  ees2 f1 des2 f1 f2 f1 aes2 aes2. aes4 aes1
  aes2 aes aes1 f2 aes des, f f des( f1) f
}
altoWords = \lyricmode { \set lyricMelismaAlignment = #CENTER
  Our Fa -- ther which art in heav'n, hal -- low -- ed by thy name; thy king -- dom come; 
  thy will be done in earth as it is in heav'n. Give us this day our dai -- ly bread.
  And for -- give us our tres -- pas -- ses, as we for -- give them that tres -- pass a -- gainst us.
  And lead us not in -- to temp -- ta -- ti -- on; but de -- liv -- er us from ev -- il. A -- men.
}

tenorMusic = \relative {
  ees'1 ees2 ees ees1 ees2 ees f1
  ees2. ees4 ees2 c d ees1
  ees f des2 c1 
  c2 c1 c2 des bes c1 c bes2 aes des c1
  bes aes2 des c1 ees ees d2 ees1
  ees ees2 ees1 f2 f des1 ees2 ees1
  ees ees2 c ees1 f2 f ees1 ees2 aes, bes1 c
  c2 des1 bes2 c1 c2 des1 ees2 f2. f4 f1
  ees2 ees c1 des2 ees bes c c bes( c1) d
}
tenorWords = \lyricmode { \set lyricMelismaAlignment = #CENTER
  
}

bassMusic = \relative {
  aes1 aes2 aes aes1 ees2 ees des1
  aes'2. aes4 aes2 aes bes ees,1
  aes f bes2 f1
  f2 f1 f2 des ges f1 aes ees2 f des f1
  bes f2 des f1 ees aes bes2 ees,1
  ees ees2 aes1 f2 f bes1 aes2 aes1
  aes ees2 f ees1 des2 des aes'1 ees2 f ees1 aes
  aes2 des,1 ges2 f1 f2 bes1 aes2 des,2. des4 f1
  aes2 aes aes1 bes2 aes ges! f f ges!( f1) bes,1
}
bassWords = \lyricmode { \set lyricMelismaAlignment = #CENTER
  
}

\layout {
  \context {
    \Score
    measureBarType = #'()
    \override LyricText.font-name = "Palatino Linotype"
    \override LyricText.font-size = #-1
  }
}


\score {
    \shiftDurations #1 #0
    \new ChoirStaff <<
    \new Lyrics = "sopranos" \with {
      % this is needed for lyrics above a staff
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }
    \new Staff = "women" <<
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
    \new Staff = "men" <<
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
  \vspace #2 % Adds vertical space between the music and the text
  \fill-line {
    % \override #'(line-width . 115) % Adjust this number to change paragraph width
    \justify { \abs-fontsize #7.5 \override #'(baseline-skip . 10) {
      The Wenley Partbooks of 1549-52 contains this work. The date of the Wanley books 
      makes Stone’s setting one of the earliest in the Tudor period. The music 
      is presented up a minor third, with quartered note values. } 
    }
  }
}