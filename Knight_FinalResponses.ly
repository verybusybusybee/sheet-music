\version "2.26.0"
#(set-global-staff-size 17) 
% 17 to 18.5


\header {
  %dedication = \markup { \italic { "For Micha" } }
  title = "FINAL RESPONSES"
  subsubtitle = "For the Daily Office at Coventry Cathedral"
  composer = "Gerald Hocken Knight"
  arranger = "(1908–1979)"
  tagline = \markup {
    \abs-fontsize #7.5 "Digitally engraved for Joe Watson and the Choir of Coventry Cathedral by Eugene Chan (2026)"
  }
}

\paper {
ragged-bottom = ##t
#(set-paper-size "a4")

  markup-system-spacing.basic-distance = 22.5
  top-system-spacing.basic-distance = 10
  score-system-spacing.basic-distance = 20
  system-system-spacing.basic-distance = 30
  last-bottom-spacing.basic-distance = 10
  score-markup-spacing = #'((basic-distance . 0)
                            (minimum-distance . 0)
                            (padding . 0)
                            (stretchability . 0))

  % Traditional German choral spacing rules
  top-margin = 20\mm
  bottom-margin = 10\mm
  left-margin = 15\mm
  right-margin = 15\mm
         
  % Font configuration to match traditional engraving
  property-defaults.fonts.serif = "Palatino Linotype"

  page-count = 1
}

global = {
  \key d \major
  \omit Staff.TimeSignature
  \cadenzaOn
  % \time 4/2
  % \tempo "Moderato"

  \time 17/8
  s8*17 \bar "|" \break
  \time 11/8
  s8*11 \bar ","
  \time 13/8
  s8*13 \bar "||" \break
  \time 31/8
  s8*31 \bar "|"
  \time 10/8
  s8*10 \bar ","
  \time 8/8
  s8*8 \bar "||" \break
  \time 8/8
  s8*8
}

SoloNotes = \relative {
  \clef "bass"

  % versicle
  d8 fis a a a a b a a d cis b a b4 a

  % rest during response
  s1*11/8
  s1*13/8  

  % versicle
  d,8 fis 
  
  <<
        % VOICE 1: The actual printed chant note (the whole note reciting note)
        { \voiceOne a1 }
        
        % VOICE 2: Hidden dummy notes to stretch the text beautifully.
        % The number of notes here dictates how many syllables get spaced out.
        \new Voice = "chantSpacing" {
          \voiceTwo
          \hideNotes
          % We use 7 separate quarter notes to stretch out 7 syllables.
          % Lilypond spaces these notes (and thus the text) perfectly!
          a8 a a a a a a
          \undo \hideNotes
        }
      >> 
  
  \stemDown b4 
  
  <<
        % VOICE 1: The actual printed chant note (the whole note reciting note)
        { \voiceOne a1 }
        
        % VOICE 2: Hidden dummy notes to stretch the text beautifully.
        % The number of notes here dictates how many syllables get spaced out.
        \new Voice = "chantSpacing" {
          \voiceTwo
          \hideNotes
          % We use 7 separate quarter notes to stretch out 7 syllables.
          % Lilypond spaces these notes (and thus the text) perfectly!
          a8 a a a a \break a a
          \undo \hideNotes
        }
      >> 
  
  \stemDown a8 b a d[ \melisma cis] \melismaEnd b a b4 a \bar "|" \break
  s8*10
  s8*8
  %fis8 a d cis \slurUp b4( a) \bar "|"
}

% SoloLyrics = \lyrics { } all below due to word distribution over hidden notes

sopMusic = \relative {
  r8*17
  d'8 fis8 a b a d[ cis] b4 a
  a8 b[ cis d e fis] d g[ e] <d fis>4 <d fis>
  r8*31
  a1 a8 a8
  \dynamicUp c[\< \melisma b] \melismaEnd a g\! a4\> a\!
  
}
sopWords = \lyricmode { \set lyricMelismaAlignment = #CENTER \set stanza = \markup { \dynamic "p" }
  
}

altoMusic = \relative { 
  r8*17
  d'8 fis8 a b a a4 g8[ \melisma fis] e4 \melismaEnd
  fis8 fis4. \melisma b8[ a] \melismaEnd a g[ \melisma b] \melismaEnd a4 a4
  r8*31
  e1 fis8 fis
  g4 d8 d d[ \melisma cis] \melismaEnd d4
}
altoWords = 
\lyricmode { \set lyricMelismaAlignment = #CENTER % \set stanza = \markup { \dynamic "mp" }
  \set stanza = "℟."
  That we may sleep in thy peace, __
  and wake __ in thy __ glo -- ry.
  
  \set stanza = "℟."
  \once \override LyricText.self-alignment-X = #-1
  "And to us and all his" ser- vants, life ev -- er -- last -- ing.

  \set stanza = "℟."
  Thanks __ be to God.

}

tenorMusic = \relative {
  r8*17
  d8 fis8 a b a d4 d~ d8[ cis]
  d8 d4. g8[ fis] d d[ g] fis4 fis
  r8*31
  cis1 d8 d8
  d4 d8 d, e4 fis
}
tenorWords = \lyricmode { \set lyricMelismaAlignment = #CENTER
  \skip1 
}

bassMusic = \relative {
  r8*17
  d8 fis8 a b a fis4 g4 a
  d,8 d'8[ cis\< b g d']\! cis b[ g] d'4\ff d
  r8*31
  a1 d,8 d
  g4\< b,8 b\! a4\> d\! \break
}
bassWords = \lyricmode { \set lyricMelismaAlignment = #CENTER \set stanza = \markup { \dynamic "p" }
  \skip1
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
  <<    
    \new Voice = "SoloVoice" << \global \SoloNotes >>
    \new Lyrics \lyrics { %\lyricsto "SoloVoice" \SoloLyrics
      \set stanza = "℣."
      Keep8 us, O Lord, so a -- wake in the du -- ties of our call4 -- ing; 8*26
      
      \override Lyrics.LyricText.extra-spacing-width = #'(-1.8 . 1.8)
      \set stanza = "℣."
      God8 grant to the living, grace; to the departed,4 rest;4 
      to8 the Church, the King, the Commonwealth4
      and8 all the world, __ 8 peace8 and con4 -- cord;  
      \revert Lyrics.LyricText.extra-spacing-width
    }
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
  >>



\layout {
    ragged-right = ##f
    \context { \Staff
      % these lines prevent empty staves from being printed
      \RemoveEmptyStaves
      \override VerticalAxisGroup.remove-first = ##t
    }
  }
\midi { }

}
\markup { \vspace #1 }
\markup {
  \fill-line {
    % ==================== LEFT HALF ====================
    \score {
      \new ChoirStaff <<
        \new Staff = "upper" <<
          \key d \major
          \cadenzaOn
          \omit Staff.TimeSignature  
          \clef bass
          
          \new Voice = "soprano" { \voiceOne \relative { } }
          \new Voice = "alto" { \voiceTwo \relative { 
          fis8 a d cis \slurUp b4( \melisma a) \melismaEnd \bar "|" } }
        >>
        
        \new Staff = "lower" <<
          \key d \major
          \cadenzaOn
          \omit Staff.TimeSignature  
          \clef bass

          \new Voice = "tenor" { \voiceOne \relative { } }
          \new Voice = "bass" { \voiceTwo \relative { } }
        >>

        \new Lyrics \with { alignBelowContext = "upper" } 
          \lyricsto "alto" { 
          %\override Lyrics.LyricText.extra-spacing-width = #'(-1.8 . 1.8)
          \set stanza = "℟."
          \set lyricMelismaAlignment = #CENTER
          Let us bless the Lord. __ }

      >>
      
      \layout {
        ragged-right = ##f
        % Shuts off the indentation for a clean left edge
        indent = 0\mm
        % Dictates exactly how wide the first half stretches
        line-width = 85\mm 
        \context { \Staff
          \RemoveEmptyStaves
          \override VerticalAxisGroup.remove-first = ##t
        }
      }
    }

    % ==================== THE GAP ====================
    \hspace #1  % Adjust this number to widen or narrow the blank gap width

    % ==================== RIGHT HALF ====================
    \score {
      \new ChoirStaff <<
        \new Staff = "upper" <<
          \key d \major
          \cadenzaOn
          \omit Staff.TimeSignature  
          \clef treble
          
          \new Voice = "soprano" { \voiceOne \relative {
          \dynamicUp d''8[ e g fis] e\< d <d a'>4\! \ff } }
          \new Voice = "alto" { \voiceTwo \relative { 
          a'4 \melisma d8[ cis] \melismaEnd b b a4 \bar "|." } }
        >>
        
        \new Staff = "lower" <<
          \key d \major
          \cadenzaOn
          \omit Staff.TimeSignature  
          \clef bass

          \new Voice = "tenor" { \voiceOne \relative {
          fis'8[ e d fis] g g fis4 \bar "|." } }
          \new Voice = "bass" { \voiceTwo \relative {
          d'8[ cis b a] g\< b d4\! \ff } }
        >>

        \new Lyrics \with { alignBelowContext = "upper" } 
          \lyricsto "alto" { 
          %\override Lyrics.LyricText.extra-spacing-width = #'(-1.8 . 1.8)
          \set stanza = "℣."
          \set lyricMelismaAlignment = #CENTER
          Thanks __ be to God. }

      >>
      \layout {
        ragged-right = ##f
        % Shuts off the indentation for a clean left edge
        indent = 0\mm
        % Dictates exactly how wide the first half stretches
        line-width = 85\mm 
        \context { \Staff
          \RemoveEmptyStaves
          \override VerticalAxisGroup.remove-first = ##t
        }
      }
    }
}
  }


\markup {
  \vspace #3 % Adds vertical space between the music and the text
  \fill-line {
    %\override #'(line-width . 115) % Adjust this number to change paragraph width
    \justify { \abs-fontsize #7.5 \override #'(baseline-skip . 10) {
      Having been the Organist and Master of the Choristers at Canterbury Cathedral for more than 15 years, 
      Knight became the Director of the Royal School of Church Music in 1954, succeeding Sidney Nicholson. 
      He was appointed a fellow of the same in 1964 and was succeeded in 1972 by Lionel Dakers. } 
    }
  }
}