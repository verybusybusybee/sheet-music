\version "2.26.0"
#(set-global-staff-size 17)


\header {
  title = "The Lord’s Prayer"
  composer = "John Farmer"
  arranger = "(c. 1570 – c. 1601)"
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
  \key ees \major
  \omit Staff.TimeSignature
  \time 4/4
}

sopMusic = \relative {
  \partial 2 g'2 | g4 bes ees2( | c4) c2 b4 | c2 aes( | g4) g f4. f8 | e2 f |
  c'4 ees d c | b c d e | c2 ees! | d4 c( b) c | c bes! bes2 | r4 aes aes g | g2 f | 
  e4 f e2 | g4 g g8 g bes4 | d  c bes a | c4. c8 b4 c8 c | c c b4 c c | g2 e!4. f8 | 
  g4 ees! f aes | g f g2 | g bes4( c) | d ees d c | b b bes( g | ees'2 d) | c1 \bar "|."
}
sopWords = \lyricmode { \set lyricMelismaAlignment = #CENTER
  Our Fa -- ther which __ art in heav'n, hal -- low'd be thy name; thy 
  king -- dom come; thy will be done in earth, in earth as __ it is in heav'n. Give us this day our
  dai -- ly bread. And for -- give us our tres -- pas -- ses, as we for -- five them that tres -- pass a -- gainst us. And lead us 
  not in -- to temp -- ta -- ti -- on; but de -- liv -- er us from ev -- il. A -- men.
}

altoMusic = \relative { 
  \partial 2 ees'2 | d4 d g2~ | g4 g g4.( f8) | e2( f4) f~ | f e f f, | g2 aes4 c~ | 
  c8 c bes4. \override Slur.positions= #'(-7 . 0) g8( g'4) \revert Slur.positions | g ees d g | e2 g | g4 ees( g) g | aes f g2 | ees f4 d | e c c4. c8 | 
  c1 | ees!4 ees bes8 bes f'4 | f f f f | g g g f8 f | g4 g8 f e4 e | e4. \override Slur.positions= #'(-5 . -4) f8( g4) \revert Slur.positions c, | 
  c c c c | bes bes bes2 | c4 bes( ees c) | g'4. g8 g4 ees8( f) | g4 g d2( | ees4 g g4. f8) | e1
}
altoWords = \lyricmode { \set lyricMelismaAlignment = #CENTER
  Our Fa -- ther which __ art in __ heav'n, __ hal -- low'd be thy name; thy king -- 
  dom come; thy __ will be done in earth, in earth as __ it is in heav'n. Give us this day our dai -- ly 
  bread. And for -- give us our tres -- pas -- ses as we for -- give them that tres -- pass a -- gainst us. And lead __ us 
  not in -- to temp -- ta -- ti -- on; but de -- liv -- er us from __ ev -- il. A -- men.
}

tenorMusic = \relative {
  \partial 2 g2 | bes4( g) bes c | ees2 d | c c( | d4) c c b | c2 c | 
  ees4 ees bes ees | d c b c | g2 c | bes!4 c( d) ees | ees d ees2 | c c4 b | c g( aes2) |
  g4 f g2 | g4 g g f8 f | bes4 c d c | ees ees d8 d c4 | d d8 d c4 c | g2 g4 aes | 
  ees g f ees | ees d ees2 | ees \override Slur.positions= #'(5 . 4) g4( f) \revert Slur.Slur.positions | bes g bes c | d d bes2( | g4 c2 b4) | c1
}
tenorWords = \lyricmode { \set lyricMelismaAlignment = #CENTER
  Our Fa -- ther which art in heav'n, hal -- low'd be thy name; thy 
  king -- dom come; thy will be done in earth, in earth as __ it is in heav'n. Give us this day our __ 
  dai -- ly bread. And for -- give us our tres -- pas -- ses as we for -- give them that tres -- pass a -- gainst us. And lead us 
  not in -- to temp -- ta -- ti -- on; but de -- liv -- er us from ev -- il. A -- men.
}

bassMusic = \relative {
  \partial 2 c2 | g'4. f8( ees4) c | c'2 g | c, f( | bes,4) c d4. d8 | c2 f4 aes~ | 
  aes ees g c, | g c g' c, | c2 c | g'4 aes( g) c | aes bes ees,2 | aes f4 g | c, e( f2) | 
  c4 aes c2 | c4 c ees d8 d | bes4 f' d f | c c' g8 g aes4 | g g8 g c,4 c | c2 c4 c | 
  c c aes aes | bes bes ees2 | c4 ees2( aes4) | g c, g' aes | g g g,2( c g'4 g,) | c1
}
bassWords = \lyricmode { \set lyricMelismaAlignment = #CENTER
  Our Fa -- ther __ which art in heav'n, hal -- low'd be thy name; thy king -- 
  dom come; thy will be done in earth, in earth as __ it is in heav'n. Give us this day our __ 
  dai -- ly bread. And for -- give us our tres -- pas -- ses as we for -- give them that tres -- pass a -- gainst us. And lead us 
  not in -- to temp -- ta -- ti -- on; but de -- liv -- er us from ev -- il. A -- men.
}

\layout {
  \context {
    \Score
    \override LyricText.font-name = "Palatino Linotype"
    \override LyricText.font-size = #-1
  }
}


\score {
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
      From\italic{The Whole Booke of Psalmes with their Wonted Tunes} printed by Thomas East in 1592.
      Note values are halved and transposed down a tone. Re-set to the translation in the \italic{Book of Common
      Prayer} by Unknown.}
    }
  }
}