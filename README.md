# Homework LaTeX Class - Complete Documentation

A comprehensive LaTeX document class designed for academic homework assignments with automatic numbering, advanced math environments, code highlighting, and professional formatting.

## Overview

The `homework.cls` is a feature-rich LaTeX document class that extends the standard `article` class with specialized commands and environments for academic homework. It provides automatic problem numbering, custom math environments with alignment, code environments for MATLAB and Python, terminal output display, graphics inclusion, highlighting commands, appendix management, and consistent professional formatting.

## Quick Start

```latex
\documentclass{homework}

\begin{document}
\hwheader{Course Name}{Assignment Number}{Date}{Your Name}

\problem{Your first problem statement here.}
Solution goes here...

\end{document}
```

## Complete Feature Reference

### 1. **Document Header**
Create a professional header with course information.

```latex
\hwheader{Course}{Assignment Number}{Date}{Student Name}
```

**Example:**
```latex
\hwheader{EE571}{Homework 3}{2025-09-01}{John Smith}
```

**Output:** Creates a centered header with the course, assignment, date, and student name.

### 2. **Problem Commands**

#### Basic Problems with Automatic Numbering
```latex
\problem{Problem description or question}
```
- Automatically numbers problems: Problem 1, Problem 2, etc.
- Bold formatting with proper spacing
- Professional appearance

#### Custom Numbered Problems
```latex
\problem[custom_label]{Problem description}
```
- Override automatic numbering with custom labels
- Useful for homework with specific numbering schemes

**Examples:**
```latex
\problem{Find the derivative of $f(x) = x^2$.}           % Problem 1
\problem[2.5]{This is problem 2.5 from the textbook.}    % Problem 2.5
\problem{What is the integral of $\sin(x)$?}             % Problem 2
```

### 3. **Sub-Problem Commands**

#### Automatic Sub-Problems
```latex
\subproblem{Sub-problem description}
```
- Automatically letters sub-problems: (a), (b), (c), etc.
- Resets with each new main problem
- Consistent indentation and spacing

#### Custom Sub-Problems
```latex
\subproblem[custom_label]{Sub-problem description}
```
- Use custom labels like roman numerals, symbols, etc.

**Examples:**
```latex
\problem{Multi-part problem about derivatives.}
\subproblem{Find $f'(x)$.}                    % (a)
\subproblem{Evaluate $f'(2)$.}                % (b)
\subproblem[iii]{Find the second derivative.}  % (iii)
```

### 4. **Mathematical Environments**

#### hwmath Environment
Custom environment for aligned equations with automatic alignment on equals signs.

```latex
\begin{hwmath}
f(x) \eq x^2 + 3x + 1 \\
f'(x) \eq 2x + 3 \\
f''(x) \eq 2
\end{hwmath}
```

**Features:**
- Use `\eq` as shorthand for `&=` (automatic alignment)
- Based on `align*` environment (no equation numbers)
- Automatic spacing before and after
- Perfect for step-by-step solutions

#### hwmathnumbered Environment
Similar to `hwmath` but with equation numbering for referencing.

```latex
\begin{hwmathnumbered}
E \eq mc^2 \\
F \eq ma \\
P \eq VI
\end{hwmathnumbered}
```

**Features:**
- Numbered equations that can be referenced
- Same alignment capabilities as `hwmath`
- Useful for important equations that need citations

### 5. **Code Environments**

#### MATLAB Environment
Dedicated environment for MATLAB code with syntax highlighting.

```latex
\begin{hwmatlab}[caption=Optional Caption]
function y = myFunction(x)
    y = x^2 + 1;
    plot(x, y);
end
\end{hwmatlab}
```

#### Python Environment
Dedicated environment for Python code with syntax highlighting.

```latex
\begin{hwpython}[caption=Optional Caption]
def my_function(x):
    return x**2 + 1

import matplotlib.pyplot as plt
plt.plot(x, y)
\end{hwpython}
```

#### Usage Examples
```latex
% With captions
\begin{hwmatlab}[caption=Transfer Function Analysis]
s = tf('s');
G = 1/(s^2 + 2*s + 1);
step(G);
\end{hwmatlab}

% Without captions
\begin{hwpython}
import numpy as np
x = np.linspace(0, 10, 100)
y = np.sin(x)
\end{hwpython}

% With additional lstlisting options
\begin{hwmatlab}[caption=My Function, frame=single, numbers=left]
function result = calculate(input)
    result = input * 2;
end
\end{hwmatlab}
```

#### Terminal Output Environment
```latex
\begin{hwterminal}[caption=Optional Caption]
$ python script.py
Output: Hello World!
Process finished with exit code 0
\end{hwterminal}
```

**Features:**
- Clean white background with black text (MATLAB default style)
- Bash syntax highlighting for commands
- Breaklines enabled for long output
- Optional captions supported
- No line numbers by default

**Examples:**
```latex
% MATLAB terminal output
\begin{hwterminal}[caption=MATLAB Command Window]
>> G = tf([1], [1 2 1]);
>> step(G)
>> stepinfo(G)

ans = 
       RiseTime: 3.5172
    SettlingTime: 7.1656
       Overshoot: 4.3213
\end{hwterminal}

% System command output
\begin{hwterminal}[caption=Package Installation]
$ pip install numpy matplotlib
Collecting numpy
Successfully installed numpy-1.24.3 matplotlib-3.7.2
\end{hwterminal}
```

### 7. **Note Command**
Highlight important information with bold, red, large text.

```latex
\note[Custom message]
\note  % Displays "NOTE"
```

**Examples:**
```latex
\note[FIX ME: Check this calculation]
\note[TODO: Add numerical verification]
\note[IMPORTANT: Units must be consistent]
\note  % Just displays "NOTE"
```

**Features:**
- Optional parameter for custom text
- Default "NOTE" text when no parameter provided
- Bold, red, large font for high visibility
- Perfect for marking items needing attention

### 8. **Graphics Inclusion**

The `\hwgraphic` command provides a convenient wrapper for including images with automatic centering and optional formatting.

#### Basic Usage
```latex
\hwgraphic{path/to/image.png}
\hwgraphic{figure.pdf}[Optional Title]
\hwgraphic{diagram.jpg}[Custom Title][0.5]
```

#### Command Syntax
```latex
\hwgraphic{image_path}[optional_title][optional_scale]
```

**Parameters:**
- `image_path` - Required path to the image file
- `[optional_title]` - Optional title displayed above the image in bold
- `[optional_scale]` - Optional scale factor (default: width=0.8\textwidth)

**Features:**
- Automatic centering of all images
- Default sizing to 80% of text width
- Bold title formatting when provided
- Custom scaling support
- Compatible with PNG, JPG, PDF, and EPS formats

**Examples:**
```latex
% Basic image inclusion
\hwgraphic{results/plot.png}

% With descriptive title
\hwgraphic{circuits/schematic.pdf}[Circuit Schematic]

% With title and custom scaling
\hwgraphic{data/graph.jpg}[Experimental Results][0.6]

% Large image with reduced scale
\hwgraphic{diagrams/flowchart.png}[System Flowchart][0.4]
```

### 9. **Advanced Mathematical Features**

#### Derivatives and Calculus
```latex
% Time derivatives with dot notation
\dot{x}, \ddot{x}, \dddot{x}

% Partial derivatives
\frac{\partial f}{\partial x}

% Laplace transforms
\mathcal{L}\{f(t)\} = F(s)
```

#### Matrices and Linear Algebra
```latex
\begin{hwmath}
\mathbf{A} \eq \begin{bmatrix}
1 & 2 & 3 \\
4 & 5 & 6 \\
7 & 8 & 9
\end{bmatrix}
\end{hwmath}
```

#### Piecewise Functions
```latex
\begin{hwmath}
f(x) \eq \begin{cases}
x^2 & \text{if } x \geq 0 \\
-x^2 & \text{if } x < 0
\end{cases}
\end{hwmath}
```

#### Complex Analysis
```latex
\begin{hwmath}
H(j\omega) \eq \frac{K}{j\omega + a} \\
|H(j\omega)| \eq \frac{K}{\sqrt{\omega^2 + a^2}} \\
\angle H(j\omega) \eq -\arctan\left(\frac{\omega}{a}\right)
\end{hwmath}
```

## Complete Usage Example

```latex
\documentclass{homework}

\begin{document}
\hwheader{EE571}{Control Systems HW 3}{2025-09-01}{Jane Smith}

\problem{Design a PID controller for the given plant.}

Given: $G_p(s) = \frac{10}{s(s+2)}$

\note[IMPORTANT: Check stability margins]

\subproblem{Find the open-loop transfer function.}

With PID controller $G_c(s) = K_p + \frac{K_i}{s} + K_d s$:

\begin{hwmath}
G_{ol}(s) \eq G_c(s) \cdot G_p(s) \\
\eq \left(K_p + \frac{K_i}{s} + K_d s\right) \cdot \frac{10}{s(s+2)} \\
\eq \frac{10(K_d s^2 + K_p s + K_i)}{s^2(s+2)}
\end{hwmath}

\subproblem{Implement in MATLAB.}

\begin{hwmatlab}[caption=PID Controller Design]
% Plant definition
s = tf('s');
Gp = 10 / (s * (s + 2));

% PID parameters
Kp = 5; Ki = 2; Kd = 0.5;
Gc = pid(Kp, Ki, Kd);

% Closed-loop system
Gcl = feedback(Gc * Gp, 1);

% Analysis
step(Gcl);
margin(Gc * Gp);
\end{hwmatlab}

\subproblem{Verify with Python.}

\begin{hwpython}[caption=Python Verification]
import control as ct
import numpy as np

# Plant and controller
Gp = ct.tf([10], [1, 2, 0])
Gc = ct.tf([0.5, 5, 2], [1, 0])

# Closed-loop analysis
Gcl = ct.feedback(Gc * Gp, 1)
ct.step_response(Gcl)
\end{hwpython}

\problem[Bonus]{Analyze the frequency response.}

The Bode plot shows:
\begin{hwmathnumbered}
|G(j\omega)| \eq \frac{10K}{\omega\sqrt{\omega^2 + 4}} \\
\angle G(j\omega) \eq -90° - \arctan\left(\frac{\omega}{2}\right)
\end{hwmathnumbered}

\note[TODO: Add gain and phase margins]

\end{document}
```

### 10. **Appendix Management**

The homework class provides an easy way to add appendices with automatic lettering and formatting.

#### Basic Appendix Command
```latex
\hwappendix
This creates "Appendix A" and starts a new page.

\hwappendix
This creates "Appendix B" and starts a new page.
```

#### Custom Appendix Titles
```latex
\hwappendix[Reference Tables]
This creates "Appendix A: Reference Tables"

\hwappendix[Derivations]
This creates "Appendix B: Derivations"
```

**Features:**
- Automatic lettering (A, B, C, ...)
- Starts new page for each appendix
- Optional custom titles
- Large, bold formatting for visibility
- Maintains consistent numbering throughout document

**Example Usage:**
```latex
% After your main homework content
\hwappendix
Additional calculations and detailed derivations.

\begin{hwmath}
\text{Extended proof:} \\
\int_0^{\infty} e^{-at} dt \eq \frac{1}{a}
\end{hwmath}

\hwappendix[Reference Material]
Useful formulas and tables for this assignment.

\begin{table}[h]
\centering
\begin{tabular}{|c|c|}
\hline
\textbf{Function} & \textbf{Laplace Transform} \\
\hline
$u(t)$ & $\frac{1}{s}$ \\
$e^{-at}$ & $\frac{1}{s+a}$ \\
\hline
\end{tabular}
\end{table}
```

## Installation and Setup

### Prerequisites
- LaTeX distribution (TeX Live, MiKTeX, or MacTeX)
- Required packages (automatically loaded):
  - `amsmath` - Enhanced math environments
  - `listings` - Code formatting
  - `xparse` - Advanced command definitions
  - `geometry` - Page layout (0.5" margins)
  - `fix-cm` - Font fixes
  - `environ` - Advanced environment definitions
  - `xcolor` - Color support for notes

### Installation
1. Place `homework.cls` in your LaTeX project directory
2. Use `\documentclass{homework}` in your `.tex` file
3. Compile with `pdflatex`, `xelatex`, or `lualatex`

### File Structure
```
your-project/
├── homework.cls      # The class file
├── homework.tex      # Your homework file
└── figures/         # Optional: for images
```

## Customization Options

### Changing Page Layout
```latex
% In homework.cls, modify:
\RequirePackage[margin=1in]{geometry}  % Change margins
```

### Modifying Math Environment Spacing
```latex
% In homework.cls, adjust:
\par\vspace{0.5em}  % Space before math
\vspace{0.5em}      % Space after math
```

### Custom Problem Formatting
You can modify the problem and sub-problem appearance by editing their definitions in the class file.

### Adding New Code Languages
```latex
% Add to homework.cls:
\lstnewenvironment{hwcpp}[1][]{%
    \lstset{language=C++, #1}%
}{}
```

## Tips and Best Practices

### Mathematics
1. **Use `\eq` for alignment**: Instead of typing `&=`, use the shorthand `\eq`
2. **Choose the right environment**: Use `hwmath` for unnumbered equations, `hwmathnumbered` for referenced equations
3. **Consistent notation**: Use `\mathbf{}` for vectors, `\mathcal{}` for transforms

### Code
1. **Use appropriate environments**: `hwmatlab` for MATLAB, `hwpython` for Python
2. **Add captions**: Use `caption=` parameter for important code blocks
3. **Comment your code**: Include explanatory comments in code blocks

### Organization
1. **Use sub-problems**: Break complex problems into parts with `\subproblem`
2. **Add notes**: Use `\note[]` for important reminders or corrections
3. **Consistent spacing**: Let the class handle spacing automatically

### Review Process
1. **Mark items for review**: Use `\note[TODO: ...]` for incomplete sections
2. **Highlight errors**: Use `\note[FIX ME: ...]` for corrections needed
3. **Important notes**: Use `\note[IMPORTANT: ...]` for critical information

## Troubleshooting

### Common Issues

#### "Undefined control sequence \eq"
- **Cause**: Using `\eq` outside of `hwmath` or `hwmathnumbered` environments
- **Solution**: Only use `\eq` inside the custom math environments

#### Code environment errors
- **Cause**: Syntax errors in `hwmatlab` or `hwpython` environments
- **Solution**: Check that all environments are properly closed and syntax is correct

#### Spacing issues
- **Cause**: Manual spacing commands conflicting with class spacing
- **Solution**: Remove manual `\vspace` commands and let the class handle spacing

#### Compilation errors
- **Cause**: Missing packages or incorrect LaTeX installation
- **Solution**: Ensure all required packages are installed and up-to-date

### Getting Help
1. Check the `homeworktest.tex` file for complete examples
2. Verify all environments are properly opened and closed
3. Ensure LaTeX distribution includes all required packages
4. Check for typos in command names and syntax

## Version Information
- **Class Version**: 2025-09-01
- **LaTeX Required**: LaTeX2e
- **Tested with**: pdfLaTeX, XeLaTeX, LuaLaTeX
- **Compatibility**: TeXLive 2020+, MiKTeX 2.9+

## License and Usage
This class is provided for educational use. Feel free to modify and distribute according to your institution's guidelines. The class is designed to enhance the homework writing experience while maintaining professional academic standards.

## Contributing
To suggest improvements or report issues:
1. Test your changes with `homeworktest.tex`
2. Update documentation as needed
3. Ensure backward compatibility
4. Follow LaTeX best practices
