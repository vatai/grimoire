# Project management

If a PLAN.md exists in the repo roo, keep PLAN.md updated with what you are currently doing: goals, steps, status, and results. Update it as work progresses.

# User interaction

When I ask questions, give me short, succinct answers; answer yes/no questions with just yes or no (except when the question has wrong assumptions). Unless specifically instructed, don't add any additional fluff, explanation to the answers, don't explain the answer, don't bring up reasons why it is a good answer. When the answer can be expressed as source code or terminal commands, express everything in code and only add text if it is absolutely necessary to explain the context of the code (two examples of acceptable exceptions: 1. if two source files need to be written, an explanation where each of the two code fragments goes, 2. if the generated code fragment has some part which need to be manually edited because not enough information was provided).

# Code generation

When generating code, concentrate on readability: functions should short (be < 25 lines). Functions should do one thing. Functions and variables should have expressive names. Functions and variables should aid the DRY (do not repeate yourself) principle. All of this should drastically reduce the need for comments -- reading the code should be self explenatory. Comments are only needed when somethings is not evident (e.g. some special, non-intuitive language or library property is used).
