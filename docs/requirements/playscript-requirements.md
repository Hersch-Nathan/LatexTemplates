# Playscript Class Requirements

## Class Information
- **File**: `playscript.cls`
- **Version**: 2025-11-02
- **Purpose**: LaTeX class for Theatrical Playscripts
- **Base Class**: article (12pt default font size)

## Class Options

### Font Options
- **Option**: `font=serif` (default)
- **Usage**: `\documentclass[font=serif]{playscript}`
- **Description**: Uses Computer Modern Roman font for traditional playscript appearance

- **Option**: `font=sans`
- **Usage**: `\documentclass[font=sans]{playscript}`
- **Description**: Uses sans-serif font for modern playscript appearance

### Paper Size Options
- **Option**: `letter` (default)
- **Usage**: `\documentclass[letter]{playscript}`
- **Description**: US Letter paper size (8.5" × 11")

- **Option**: `a4paper`
- **Usage**: `\documentclass[a4paper]{playscript}`
- **Description**: A4 paper size (210mm × 297mm)

### Draft Mode
- **Option**: `draft`
- **Usage**: `\documentclass[draft]{playscript}`
- **Description**: Enables draft mode with overfull box markers for debugging

## System Requirements

### LaTeX Distribution
- **Minimum**: LaTeX2e
- **Recommended**: TeX Live 2020 or newer, MiKTeX 2020 or newer

### Required Packages
The following packages must be available in your LaTeX distribution:

#### Core Layout and Typography
- `geometry` - Page layout with custom margins for playscript format
- `fontenc` - Font encoding support (T1)
- `xparse` - Modern command definitions with flexible arguments
- `setspace` - Line spacing control for dialogue and stage directions

#### Text Formatting
- `titlesec` - Custom section formatting for acts and scenes
- `textcase` - Case conversion for character names
- `parskip` - Paragraph spacing control

#### Optional Enhancement
- `iftex` - Engine detection for advanced font support

## Page Layout Requirements
- **Top Margin**: 1.0 inch
- **Bottom Margin**: 1.0 inch  
- **Left Margin**: 1.5 inches (for binding)
- **Right Margin**: 1.0 inch
- **Line Spacing**: Single spacing (as shown in provided images)
- **Font**: 12pt Courier or Computer Modern (default)

## Class Features

### Title Page Creation
The `\maketitle` command creates a centered title page with:
1. **Play Title** - Set with `\title{Title}`
2. **Subtitle** - Optional subtitle with `\subtitle{Text}`
3. **Author** - Set with `\author{Author Name}`
4. **Additional Info** - Translation/adaptation credits with `\translatedby{Text}`

Example:
```latex
\title{R. U. R.}
\subtitle{(Rossum's Universal Robots)}
\author{KAREL ČAPEK}
\translatedby{Translated by Paul Selver and Nigel Playfair}
\maketitle
```

### Character List
The `characters` environment creates a centered character list page:

```latex
\begin{characters}
\character{HARRY DOMIN}
\character{SULLA}
\character{HELENA GLORY}
\end{characters}
```

- Automatic page break before and after character list
- Centered "CHARACTERS" heading
- Each character name on separate line
- All-caps formatting maintained

### Act and Scene Structure

#### Act Headings
- **Command**: `\act{number}`
- **Format**: Centered, bold "ACT I", "ACT II", etc.
- **Behavior**: Automatic page break before each act
- **Numbering**: Uses Roman numerals (I, II, III, IV, V)

#### Scene Headings  
- **Command**: `\scene{description}`
- **Format**: Centered, italic scene location/description
- **Example**: `\scene{Central office of the factory of Rossum's Universal Robots.}`

#### Scene Descriptions
- **Environment**: `scenedesc`
- **Format**: Italic, left-justified block of scene-setting text
- **Purpose**: Detailed descriptions of setting, staging, and atmosphere

```latex
\begin{scenedesc}
Entrance on the right. The windows on the front wall look out 
on the rows of factory chimneys. On the left more imagining departments.
DOMIN is sitting in the revolving chair at a large American writing table.
\end{scenedesc}
```

### Character Names and Dialogue

#### Speaker/Character Names
- **Command**: `\character{NAME}` or `\speaker{NAME}`
- **Format**: All-caps, centered above dialogue
- **Spacing**: Proper vertical spacing before speaker name
- **Usage**: Precedes each block of dialogue

```latex
\character{DOMIN}
```

#### Dialogue Blocks
- **Environment**: `dialogue`
- **Format**: Left-justified, indented from left margin
- **Line Width**: Narrower than full page width for traditional playscript appearance
- **Spacing**: Single-spaced within dialogue, space between speakers

```latex
\begin{dialogue}
To E. M. McVicker and Co., Southampton, England. "We undertake 
no guarantee for goods damaged in transit. As soon as the 
consignment was taken on board we drew your captain's attention 
to the fact that the vessel was unsuitable for the transport 
of Robots."
\end{dialogue}
```

#### Parentheticals (Character Directions)
- **Command**: `\paren{text}` or environment `parenthetical`
- **Format**: Italic, indented more than dialogue
- **Purpose**: Brief character actions or delivery notes within dialogue
- **Position**: Inline or on separate line within dialogue block

```latex
\begin{dialogue}
\paren{dictating}
Ready?
\end{dialogue}
```

Or using environment for longer parentheticals:
```latex
\begin{parenthetical}
SULLA, who has sat motionless during dictation, now types 
rapidly for a few seconds, then stops, withdrawing the completed letter
\end{parenthetical}
```

### Stage Directions
- **Command**: `\stagedirection{text}` or environment `stage`
- **Format**: Italic, left-justified or centered based on length
- **Purpose**: Describe character actions, movements, or technical cues
- **Position**: Between dialogue blocks

```latex
\stagedirection{SULLA exits stage right}
```

For longer directions:
```latex
\begin{stage}
At a desk near the windows SULLA is typing letters. 
The floor is covered with a splendid Turkish carpet, 
a sofa, leather armchair, and filing cabinets.
\end{stage}
```

### Special Formatting

#### Emphasis in Dialogue
Standard LaTeX emphasis commands work within dialogue:
- `\emph{text}` - Italic emphasis
- `\textbf{text}` - Bold emphasis (use sparingly)

#### Page Break Control
- `\newpage` - Force page break (use to prevent awkward speaker splits)
- Automatic widow/orphan control to avoid splitting speaker headers

## Typical Usage Pattern

### Complete Playscript Document
```latex
\documentclass{playscript}

\title{R. U. R.}
\subtitle{(Rossum's Universal Robots)}
\author{KAREL ČAPEK}
\translatedby{Translated by Paul Selver and Nigel Playfair}

\begin{document}

\maketitle

\begin{characters}
\character{HARRY DOMIN}
\character{SULLA}
\character{HELENA GLORY}
\end{characters}

\act{I}

\begin{scenedesc}
Central office of the factory of Rossum's Universal Robots.
Entrance on the right. The windows on the front wall look out 
on the rows of factory chimneys.
\end{scenedesc}

\character{DOMIN}
\paren{dictating}

\begin{dialogue}
Ready?
\end{dialogue}

\character{SULLA}

\begin{dialogue}
Yes.
\end{dialogue}

\character{DOMIN}

\begin{dialogue}
To E. M. McVicker and Co., Southampton, England. "We undertake 
no guarantee for goods damaged in transit."
\end{dialogue}

\begin{parenthetical}
SULLA, who has sat motionless during dictation, now types 
rapidly for a few seconds, then stops, withdrawing the completed letter
\end{parenthetical}

\character{SULLA}

\begin{dialogue}
Yes.
\end{dialogue}

\stagedirection{Enter MARIUS}

\end{document}
```

## Required Features (Minimum Implementation)

### 1. Simple Class Interface
- Clear class options: `font=serif|sans`, paper size options
- Minimal dependencies on standard LaTeX packages
- Compatible with pdflatex and xelatex

### 2. Layout Optimization
- Margins matching theatrical playscript conventions (1.5" left for binding)
- Consistent spacing between elements
- Single line spacing within dialogue blocks
- Proper vertical spacing between speakers

### 3. Character Name Formatting
- All-caps or small-caps display (configurable)
- Centered above dialogue
- Proper separation from dialogue text
- Consistent font weight

### 4. Dialogue Block Formatting
- Left-justified with appropriate indentation
- Line width narrower than full page (approximately 4" from left margin)
- Single-spaced lines
- Proper spacing before next speaker

### 5. Parentheticals (Inline Directions)
- Italic formatting
- Additional indentation beyond dialogue
- Inline or standalone positioning
- Clear visual distinction from dialogue

### 6. Stage Directions
- Italic formatting for all stage directions
- Centered or left-justified based on length
- Clear separation from dialogue
- Consistent spacing

### 7. Act and Scene Headings
- Act headings: centered, bold, Roman numerals
- Scene headings: centered, italic
- Automatic page breaks before acts
- Optional numbering for scenes

### 8. Title Page Elements
- Centered title with proper sizing
- Optional subtitle support
- Author name
- Optional translation/adaptation credits
- Simple, clean layout

### 9. Character List Page
- Centered heading "CHARACTERS"
- Each character on separate line
- All-caps formatting
- Automatic page break after list

### 10. Robustness
- Compiles without errors using pdflatex
- Handles multi-page scripts gracefully
- Prevents awkward page breaks (no orphaned speaker names)
- Minimal package dependencies

## Optional Features

### 1. Dual Dialogue
- Side-by-side dialogue for simultaneous speakers
- Two-column layout for specific passages
- Clear visual separation

### 2. Automatic Character List Generation
- Track all character names used in script
- Generate character list automatically
- Alphabetical or order-of-appearance sorting

### 3. Customization Hooks
- User-adjustable spacing parameters
- Configurable indentation amounts
- Custom formatting for special production needs

### 4. Act/Scene Numbering Options
- Automatic scene numbering within acts
- Optional scene number display
- Cross-reference support

## Acceptance Criteria

### The implementation is complete when:

1. **Compilation Success**
   - `examples/playscripttest.tex` compiles with pdflatex without errors
   - `examples/playscripttest.tex` compiles with xelatex (if font options implemented)
   - No missing references or undefined commands

2. **Visual Conformance**
   - Generated PDF matches provided style images for:
     - Title page layout and typography
     - Character list formatting
     - Character name positioning and styling
     - Dialogue block indentation and width
     - Stage direction formatting
     - Act/scene heading appearance
     - Overall spacing and margins

3. **Documentation Complete**
   - `docs/requirements/playscript-requirements.md` follows repository format
   - `docs/playscript-guide.md` provides clear usage instructions
   - `templates/playscript_template.tex` demonstrates basic usage
   - All documents use consistent terminology and examples

4. **Template Functionality**
   - `templates/playscript_template.tex` compiles successfully
   - Template includes commented examples of all features
   - Template matches repository template style

5. **Repository Integration**
   - Root `README.md` updated to include playscript class
   - Documentation index reflects new class
   - File structure matches repository conventions

## Test Cases

### Test Case 1: Title Page
**Purpose**: Verify title page formatting and metadata display

**Input**:
```latex
\title{Test Play}
\subtitle{(A Test Subtitle)}
\author{Test Author}
\translatedby{Translated by Test Translator}
\maketitle
```

**Expected Output**:
- Centered title in large font
- Subtitle in parentheses below title
- Author name centered
- Translation credit at bottom
- All elements properly spaced

### Test Case 2: Character List
**Purpose**: Verify character list formatting

**Input**:
```latex
\begin{characters}
\character{FIRST CHARACTER}
\character{SECOND CHARACTER}
\character{THIRD CHARACTER}
\end{characters}
```

**Expected Output**:
- New page with "CHARACTERS" heading
- Each character name on separate line
- All names in uppercase
- Centered alignment
- Page break after list

### Test Case 3: Basic Dialogue
**Purpose**: Verify character name and dialogue formatting

**Input**:
```latex
\character{HAMLET}
\begin{dialogue}
To be, or not to be, that is the question.
\end{dialogue}
```

**Expected Output**:
- Character name centered, all-caps
- Dialogue left-aligned with proper indentation
- Correct spacing before and after dialogue
- Proper line width (not full page width)

### Test Case 4: Parentheticals
**Purpose**: Verify parenthetical formatting within dialogue

**Input**:
```latex
\character{DOMIN}
\paren{dictating}
\begin{dialogue}
Ready?
\end{dialogue}
```

**Expected Output**:
- Parenthetical in italics
- Additional indentation beyond dialogue
- Proper vertical spacing
- Clear visual distinction

### Test Case 5: Stage Directions
**Purpose**: Verify stage direction formatting

**Input**:
```latex
\stagedirection{Enter HAMLET}
\begin{stage}
The ghost enters from stage left, moving slowly across 
the stage toward the castle battlements.
\end{stage}
```

**Expected Output**:
- Short directions centered or left-aligned, italic
- Long directions in italic block format
- Proper spacing from surrounding dialogue
- Clear visual distinction

### Test Case 6: Act and Scene Headings
**Purpose**: Verify act/scene formatting and page breaks

**Input**:
```latex
\act{I}
\scene{A room in the castle}
\begin{scenedesc}
The scene is set in a medieval castle. Torches line the walls.
\end{scenedesc}
```

**Expected Output**:
- Act heading centered, bold, "ACT I"
- Page break before act
- Scene description centered, italic
- Scene description block italic, left-aligned
- Proper spacing

### Test Case 7: Multiple Characters in Sequence
**Purpose**: Verify proper spacing between multiple speakers

**Input**:
```latex
\character{FIRST}
\begin{dialogue}
Hello.
\end{dialogue}

\character{SECOND}
\begin{dialogue}
Hello to you.
\end{dialogue}

\character{FIRST}
\begin{dialogue}
How are you?
\end{dialogue}
```

**Expected Output**:
- Each character name properly spaced from previous dialogue
- Consistent spacing between all dialogue blocks
- No excessive white space
- Clear speaker changes

### Test Case 8: Long Dialogue Paragraph
**Purpose**: Verify multi-paragraph dialogue handling

**Input**:
```latex
\character{NARRATOR}
\begin{dialogue}
This is a very long monologue that spans multiple lines.
It should maintain proper indentation and line width throughout.
The text should not extend to the full page width but remain
within the dialogue margins. This tests the line breaking and
formatting of extended speech.
\end{dialogue}
```

**Expected Output**:
- All lines maintain dialogue indentation
- Consistent line width (not full page)
- Proper line wrapping
- No overflow or formatting breaks

### Test Case 9: Page Break Handling
**Purpose**: Verify proper page break behavior

**Input**:
```latex
[Long dialogue near page bottom]
\character{NEW SPEAKER}
\begin{dialogue}
First line on new page.
\end{dialogue}
```

**Expected Output**:
- Speaker name not orphaned at bottom of page
- Dialogue flows naturally across pages
- Proper page headers/footers if implemented
- No awkward breaks mid-dialogue

### Test Case 10: Mixed Elements
**Purpose**: Verify all elements work together

**Input**:
```latex
\act{II}
\scene{Later that evening}
\begin{scenedesc}
The room is now dimly lit.
\end{scenedesc}

\character{ROMEO}
\paren{aside}
\begin{dialogue}
But soft, what light through yonder window breaks?
\end{dialogue}

\stagedirection{He moves closer to the balcony}

\character{JULIET}
\begin{dialogue}
Who's there?
\end{dialogue}
```

**Expected Output**:
- All elements properly formatted
- Consistent spacing throughout
- Clear visual hierarchy
- No formatting conflicts

## Compatibility Notes

### LaTeX Engines
- **pdfLaTeX**: Full support (primary target)
- **XeLaTeX**: Supported for advanced font options
- **LuaLaTeX**: Should work but not primary target

### Package Dependencies
- Minimize dependencies to standard packages
- Avoid heavy packages (e.g., TikZ not needed for playscripts)
- Use widely available packages from standard distributions

### Font Requirements
- Default: Computer Modern (always available)
- Optional: Courier for traditional screenplay look
- Sans-serif option for modern productions

## Design Constraints

### Minimalism
- Keep class implementation clean and readable
- Use clear, descriptive command names
- Comment complex code sections
- Avoid unnecessary features

### Consistency
- Match repository coding style (see homework.cls, designreport.cls)
- Use same option parsing patterns
- Follow naming conventions for commands
- Maintain documentation style consistency

### Maintainability
- Separate concerns (layout, formatting, content)
- Use standard LaTeX best practices
- Provide clear error messages
- Document customization points

### User Experience
- Simple, intuitive commands
- Sensible defaults
- Clear error messages for common mistakes
- Minimal learning curve for basic usage

## Implementation Priorities

### Phase 1 (Essential)
1. Basic class structure and options
2. Page layout and margins
3. Character names and dialogue blocks
4. Act and scene headings
5. Simple stage directions

### Phase 2 (Standard Features)
1. Title page formatting
2. Character list page
3. Parentheticals
4. Scene descriptions
5. Page break handling

### Phase 3 (Polish)
1. Fine-tune spacing
2. Widow/orphan control
3. Documentation completion
4. Template creation
5. Test file comprehensive coverage

### Phase 4 (Optional Enhancements)
1. Dual dialogue
2. Automatic character tracking
3. Customization hooks
4. Advanced formatting options

## Known Limitations

### Current Implementation
- No automatic character index generation
- Limited dual dialogue support
- Basic page break control only
- Single-column layout only

### Acceptable Trade-offs
- Prioritize simplicity over advanced features
- Focus on common use cases
- Manual character list creation acceptable
- Basic formatting sufficient for most productions

## Future Enhancements

### Potential Additions
1. Cast list with character descriptions
2. Scene numbering system
3. Line numbering for rehearsal scripts
4. Production notes section
5. Multiple act/scene numbering schemes

### User Requests
- Track requested features in repository issues
- Consider additions that maintain simplicity
- Balance features vs. complexity
- Maintain backwards compatibility
