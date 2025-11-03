# Playscript Class Guide (`playscript.cls`)

The `playscript` class extends `article` with commands and environments for professional theatrical playscript formatting: title pages, character lists, act/scene structure, dialogue blocks, stage directions, and parentheticals.

**Location**: `playscript.cls` (root directory)  
**Template**: `templates/playscript_template.tex`  
**Full Example**: `examples/playscripttest.tex`

## Class Overview

The playscript class provides:
- Professional title page with subtitle and translation credits
- Automatic character list formatting
- Act and scene structure with proper page breaks
- Character names centered above dialogue (all-caps)
- Dialogue blocks with traditional playscript margins
- Parentheticals for character directions
- Stage directions (short and long forms)
- Widow/orphan control to prevent awkward page breaks
- Traditional playscript typography and spacing

**Required Packages**: fontenc, xparse, setspace, parskip, titlesec, textcase, iftex, geometry

## Class Options

### Font Options

```latex
\documentclass[font=serif]{playscript}  % Default: Computer Modern Roman
\documentclass[font=sans]{playscript}   % Sans-serif (Helvetica-like)
```

- **`font=serif`** (default) — Traditional serif font for classic playscript appearance
- **`font=sans`** — Modern sans-serif font for contemporary productions

### Paper Size

```latex
\documentclass{playscript}              % Default: US Letter (8.5" × 11")
\documentclass[letter]{playscript}      % Explicit US Letter
\documentclass[a4paper]{playscript}     % A4 (210mm × 297mm)
```

### Draft Mode

```latex
\documentclass[draft]{playscript}       % Shows overfull box markers
```

Draft mode highlights overfull boxes with black bars in the margin, useful for debugging formatting issues.

## Quick Start

### Basic Playscript

```latex
\documentclass{playscript}

\title{Your Play Title}
\author{Your Name}

\begin{document}

\maketitle

\begin{characters}
\character{HAMLET}
\character{OPHELIA}
\end{characters}

\act{I}
\scene{Elsinore Castle}

\speaker{HAMLET}
\begin{dialogue}
To be, or not to be, that is the question.
\end{dialogue}

\end{document}
```

## Title Page

### Setting Title Information

```latex
\title{Your Play Title}              % Required
\subtitle{(Optional Subtitle)}       % Optional
\author{Your Name}                   % Required
\translatedby{Translator info}       % Optional
\performancenote{Opening epigraph}   % Optional
```

### Creating the Title Page

```latex
\maketitle
```

The title page is automatically formatted with:
- Play title (large, bold, uppercase)
- Subtitle in parentheses (if provided)
- "by" followed by author name (uppercase)
- Translation credit (if provided)
- Performance note or epigraph (if provided)

**Example:**

```latex
\title{R. U. R.}
\subtitle{(Rossum's Universal Robots)}
\author{Karel Čapek}
\translatedby{Translated by Paul Selver and Nigel Playfair}
\performancenote{%
Robots of the world! The power of man has fallen!\\
A new world has arisen: the Rule of the Robots!%
}
\maketitle
```

## Character List

### Creating a Character List Page

```latex
\begin{characters}
\character{FIRST CHARACTER}
\character{SECOND CHARACTER}
\character{THIRD CHARACTER}
\end{characters}
```

- Automatically creates a new page with "CHARACTERS" heading
- Each character name displayed in uppercase
- Centered alignment
- Proper spacing between names
- Page break after list

**Example:**

```latex
\begin{characters}
\character{HARRY DOMIN}
\character{HELENA GLORY}
\character{RADIUS}
\character{DR. GALL}
\end{characters}
```

## Act and Scene Structure

### Act Headings

```latex
\act{I}      % ACT I
\act{II}     % ACT II
\act{III}    % ACT III
```

- Creates centered, bold heading: "ACT [number]"
- Automatic page break before each act
- Use Roman numerals (I, II, III, IV, V)
- Proper spacing before first scene

### Scene Headings

```latex
\scene{Elsinore Castle}
\scene{A room in the house}
\scene{The garden, later that evening}
```

- Centered, italic location/description
- No automatic page break
- Brief scene identifier

### Scene Descriptions

For detailed scene-setting descriptions:

```latex
\begin{scenedesc}
Central office of the factory of Rossum's Universal Robots.
Entrance on the right. The windows on the front wall look out
on the rows of factory chimneys. DOMIN is sitting at a large
American writing table.
\end{scenedesc}
```

- Italic formatting
- Left-justified block
- Used for detailed staging, lighting, atmosphere
- Placed after scene heading

**Complete Example:**

```latex
\act{I}

\scene{Central office of the factory}

\begin{scenedesc}
The office is modern and efficient. Large windows overlook
the factory floor. A desk sits center stage with a comfortable
chair behind it. Filing cabinets line one wall.
\end{scenedesc}
```

## Characters and Dialogue

### Character Names

Two equivalent commands for character names:

```latex
\speaker{CHARACTER NAME}
\character{CHARACTER NAME}  % Alias for \speaker
```

- Centered above dialogue
- Automatic uppercase formatting
- Proper spacing before and after
- Use before each dialogue block

### Dialogue Blocks

```latex
\begin{dialogue}
Your dialogue text goes here. It will be formatted with
appropriate margins and spacing for traditional playscript
appearance.
\end{dialogue}
```

- Left-justified with playscript margins
- Line width narrower than full page (right margin set to 2 inches)
- Single-spaced within dialogue
- Proper spacing between speakers

**Example:**

```latex
\speaker{HAMLET}

\begin{dialogue}
To be, or not to be, that is the question:
Whether 'tis nobler in the mind to suffer
The slings and arrows of outrageous fortune,
Or to take arms against a sea of troubles.
\end{dialogue}

\speaker{OPHELIA}

\begin{dialogue}
My lord, I have remembrances of yours
That I have longed long to re-deliver.
\end{dialogue}
```

## Parentheticals (Character Directions)

### Brief Parenthetical

For short character actions or delivery notes:

```latex
\paren{sitting down}
\paren{aside}
\paren{to JOHN}
\paren{laughing}
```

- Italic formatting
- Additional indentation
- Brief action or delivery note
- Placed between speaker and dialogue, or within dialogue

**Example:**

```latex
\speaker{MACBETH}
\paren{aside}

\begin{dialogue}
If chance will have me king, why, chance may crown me
Without my stir.
\end{dialogue}
```

### Longer Parenthetical

For extended character directions:

```latex
\begin{parenthetical}
HAMLET enters slowly from stage left, carrying a skull.
He is deep in thought, barely noticing the others present.
\end{parenthetical}
```

- Italic formatting
- Indented block
- Used for complex actions or detailed delivery instructions

**Example:**

```latex
\speaker{DOMIN}

\begin{dialogue}
Ready?
\end{dialogue}

\begin{parenthetical}
SULLA, who has sat motionless during dictation, now types
rapidly for a few seconds, then stops, withdrawing the completed letter
\end{parenthetical}

\speaker{SULLA}

\begin{dialogue}
Yes.
\end{dialogue}
```

## Stage Directions

### Short Stage Directions

For brief actions or entrances:

```latex
\stagedirection{Enter HAMLET}
\stagedirection{They exit together}
\stagedirection{The lights dim}
```

- Centered
- Italic formatting
- Brief action or technical cue

### Long Stage Directions

For detailed actions or scene changes:

```latex
\begin{stage}
HAMLET crosses to the window and looks out over the battlements.
The ghost appears behind him, visible only to the audience.
Thunder rumbles in the distance. The torches flicker.
\end{stage}
```

- Italic formatting
- Left-justified block
- Detailed actions, movements, or technical cues
- Proper spacing from dialogue

**Example:**

```latex
\speaker{JULIET}

\begin{dialogue}
O Romeo, Romeo! Wherefore art thou Romeo?
\end{dialogue}

\begin{stage}
ROMEO steps out from the shadows below. JULIET does not
yet see him. He watches her, captivated.
\end{stage}

\speaker{ROMEO}
\paren{aside}

\begin{dialogue}
She speaks!
\end{dialogue}
```

## Special Commands

### Beat (Pause)

Indicate a pause in dialogue:

```latex
\speaker{HAMLET}

\begin{dialogue}
I must be cruel only to be kind.
\end{dialogue}

\beat

\begin{dialogue}
Thus bad begins, and worse remains behind.
\end{dialogue}
```

Creates an italic "(beat)" parenthetical.

### Continuing Dialogue

When dialogue continues from a previous page:

```latex
\speaker{HAMLET}
\continuing

\begin{dialogue}
As I was saying...
\end{dialogue}
```

Displays "(CONT'D)" below character name.

### Emphasis in Dialogue

```latex
\begin{dialogue}
I am \emph{not} going to accept this!
\end{dialogue}
```

Use `\emph{text}` for italic emphasis within dialogue.

### Transitions

Standard transition commands:

```latex
\fadein      % Fade In: (left-aligned)
\fadeout     % Fade Out. (right-aligned)
\curtain     % Curtain (centered)
```

**Example:**

```latex
\fadein

\act{I}
% ... scenes ...

\curtain

\act{II}
% ... more scenes ...

\fadeout
```

## Multiple Speakers

### Rapid Exchange

```latex
\speaker{ROMEO}
\begin{dialogue}
What shall I swear by?
\end{dialogue}

\speaker{JULIET}
\begin{dialogue}
Do not swear at all.
\end{dialogue}

\speaker{ROMEO}
\begin{dialogue}
If my heart's dear love---
\end{dialogue}

\speaker{JULIET}
\begin{dialogue}
Well, do not swear.
\end{dialogue}
```

### Three-Way Conversation

```latex
\speaker{FIRST}
\begin{dialogue}
What do you think?
\end{dialogue}

\speaker{SECOND}
\begin{dialogue}
I agree with Third.
\end{dialogue}

\speaker{THIRD}
\begin{dialogue}
Then it's settled.
\end{dialogue}
```

## Extended Monologues

### Single Paragraph

```latex
\speaker{HAMLET}

\begin{dialogue}
To be, or not to be, that is the question:
Whether 'tis nobler in the mind to suffer
The slings and arrows of outrageous fortune,
Or to take arms against a sea of troubles
And by opposing end them.
\end{dialogue}
```

### Multiple Paragraphs

For very long speeches, use multiple dialogue blocks with spacing:

```latex
\speaker{HAMLET}

\begin{dialogue}
Thus conscience does make cowards of us all,
And thus the native hue of resolution
Is sicklied o'er with the pale cast of thought.
\end{dialogue}

\vspace{0.5em}

\begin{dialogue}
And enterprises of great pitch and moment
With this regard their currents turn awry
And lose the name of action.
\end{dialogue}
```

## Page Layout Details

### Margins

- **Top**: 1.0 inch
- **Bottom**: 1.0 inch
- **Left**: 1.5 inches (for binding)
- **Right**: 1.0 inch

### Dialogue Margins

- **Left**: Flush with page left margin
- **Right**: 2 inches from right edge (creates traditional dialogue width)

### Spacing

- **Line spacing**: Single (within dialogue and stage directions)
- **Between speakers**: Approximately 0.5–1em
- **Before acts**: Automatic page break
- **Before character names**: 1em

## Compilation

### Basic Compilation

```bash
pdflatex yourplayscript.tex
```

### Using latexmk (Recommended)

```bash
# Single compilation
latexmk -pdf yourplayscript.tex

# Continuous compilation (rebuilds on save)
latexmk -pdf -pvc yourplayscript.tex
```

### Multiple Engines

```bash
# pdfLaTeX (default, recommended)
pdflatex yourplayscript.tex

# XeLaTeX (for advanced fonts)
xelatex yourplayscript.tex

# LuaLaTeX (also supported)
lualatex yourplayscript.tex
```

## Complete Example

```latex
\documentclass{playscript}

\title{A Sample Scene}
\author{Anonymous}

\begin{document}

\maketitle

\begin{characters}
\character{JANE}
\character{JOHN}
\end{characters}

\act{I}

\scene{A coffee shop, morning}

\begin{scenedesc}
Small tables scattered throughout. Large windows let in
morning light. JANE sits at a corner table, reading.
\end{scenedesc}

\stagedirection{JOHN enters, looking around}

\speaker{JOHN}
\paren{spotting JANE}

\begin{dialogue}
Jane! I didn't expect to see you here.
\end{dialogue}

\speaker{JANE}
\paren{looking up from book}

\begin{dialogue}
John. What a surprise.
\end{dialogue}

\begin{stage}
JOHN crosses to her table. An awkward moment passes.
JANE gestures to the empty chair.
\end{stage}

\speaker{JANE}

\begin{dialogue}
Would you like to sit?
\end{dialogue}

\speaker{JOHN}
\paren{sitting}

\begin{dialogue}
Thanks. I was hoping we could talk.
\end{dialogue}

\beat

\speaker{JANE}

\begin{dialogue}
About what happened?
\end{dialogue}

\speaker{JOHN}

\begin{dialogue}
Yes. About what happened.
\end{dialogue}

\curtain

\end{document}
```

## Best Practices

### Organization

- Use clear act and scene divisions
- Keep stage directions brief and action-focused
- Use parentheticals sparingly
- Maintain consistent character name spelling

### Formatting

- Always use uppercase for character names in the text
- Keep dialogue blocks to reasonable lengths
- Use `\beat` for meaningful pauses, not every pause
- Place stage directions at logical points in the action

### Technical

- Compile at least twice for proper spacing
- Use draft mode to check for overfull boxes
- Keep source .tex file well-organized with comments
- Use consistent indentation in source

## Troubleshooting

### Common Issues

**Character name not appearing correctly:**
- Ensure you're using `\speaker{NAME}` before dialogue
- Check that character name is spelled consistently

**Dialogue too wide:**
- This is controlled by the class; check for manual `\setlength` commands
- Verify you're using the `dialogue` environment

**Awkward page breaks:**
- Use `\newpage` to force breaks at better locations
- The class includes widow/orphan control, but manual breaks may help
- Consider `\nopagebreak` after a character name if needed

**Parentheticals not formatting correctly:**
- Use `\paren{text}` for brief directions
- Use `\begin{parenthetical}...\end{parenthetical}` for longer ones
- Ensure braces `{}` are balanced

### Package Conflicts

The playscript class uses minimal packages to avoid conflicts:
- `geometry` — May conflict with other layout packages
- `titlesec` — May conflict with other section formatting
- If you need additional packages, load them after `\documentclass`

### Font Issues

**Computer Modern (default) not appearing:**
- This is the default LaTeX font and should always work
- If you see missing character warnings, check your LaTeX installation

**Sans-serif option not working:**
- Ensure you're using `font=sans` option correctly
- Check that helvet package is installed (usually included in standard distributions)

## Advanced Customization

### Adjusting Spacing

If you need to fine-tune spacing (not recommended for beginners):

```latex
\setlength{\parskip}{1em}           % Space between paragraphs
\setlength{\leftskip}{0.5in}        % Additional left indent for dialogue
\setlength{\rightskip}{1.5in}       % Adjust dialogue width
```

### Custom Parenthetical Format

The class provides standard parenthetical formatting, but you can override:

```latex
\renewcommand{\paren}[1]{%
    \par\noindent\hspace{2em}\textit{[#1]}\par
}
```

### Page Numbers

The class disables page numbers by default (traditional playscript format). To enable:

```latex
\pagestyle{plain}                   % Simple page numbers
```

Or for custom headers/footers:

```latex
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
```

## See Also

- **Requirements**: `docs/requirements/playscript-requirements.md` — Complete feature specifications
- **Template**: `templates/playscript_template.tex` — Starter template with examples
- **Examples**: `examples/playscripttest.tex` — Comprehensive test of all features

## Support

For additional help:
- Check the template file for annotated examples
- Review the test file for comprehensive feature usage
- Consult the requirements document for detailed specifications
- Examine the class source code for advanced customization options

The `playscript` class provides a solid foundation for theatrical playscript formatting while maintaining simplicity and ease of use.
