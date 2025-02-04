# Determining the most frequently used font on the page

```js
const allElements = document.querySelectorAll('*');
const fontCounts = {};
allElements.forEach(element => {
  const computedStyle = window.getComputedStyle(element);
  const fontFamily = computedStyle['font-family'];
  if (fontFamily) {
    if (fontCounts[fontFamily]) {
      fontCounts[fontFamily]++;
    } else {
      fontCounts[fontFamily] = 1;
    }
  }
});
let mostUsedFont = '';
let maxCount = 0;
for (const font in fontCounts) {
  if (fontCounts[font] > maxCount) {
    maxCount = fontCounts[font];
    mostUsedFont = font;
  }
}
const data = {
  mostUsedFont: mostUsedFont,
  fontCounts: fontCounts
};
```
